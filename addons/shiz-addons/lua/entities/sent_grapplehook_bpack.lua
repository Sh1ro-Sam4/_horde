AddCSLuaFile()

if SERVER then
	resource.AddFile( "materials/entities/sent_grapplehook_bpack.png" )
end

--[[
	An entity that allows you to fire a grapple hook and automatically reel to it by holding the button
	Like the jetpack, this works even when the player dies while using it.
	
	Right now the hook is fired once and then the hook has a simulated travel time from 0 up to 4 seconds,
	by calculating the time fraction I draw the fancy rope effects and it's pretty smooth
	once the traveltime expires the player is pulled and shit starts to happen
	
	What I want to do is actually simulate the hook like an actual projectile, but we'd need interpolation to draw smoothly
	The plus side would be that gravity can affect it, and we can simulate the return easily instead of the hacky mess I'm doing right now
]]

DEFINE_BASECLASS( "base_predictedent" )

ENT.Spawnable = true
ENT.PrintName = "Grappling hook Belt"

local renderedChainTexture = 0
local chainmodel = nil

if CLIENT then
	ENT.CableMaterial = Material( "cable/cable2" )
	
	
	ENT.ChainTexture = GetRenderTarget( "ChainTexture" , 512 , 512 , false )

	ENT.ChainMaterial = CreateMaterial( "ChainMaterial" , 
	"UnlitGeneric" , 
	{
		["$basetexture"] = "cable/cable2",	
		["$vertexcolor"] = 1,
		["$vertexalpha"] = 1,
	})
	
	AccessorFunc( ENT , "NextHookPreview" , "NextHookPreview" )
	AccessorFunc( ENT , "HookPreviewTrace" , "HookPreviewTrace" )
else
	ENT.ShowPickupNotice = true
end

ENT.MinBounds = Vector( -8.3 , -7.8 , 0 )
ENT.MaxBounds = Vector( 10 , 8 , 4.5 )

ENT.HookMaxTime = 4	--max time in seconds the hook needs to reach the maxrange
ENT.HookMaxRange = 10000
ENT.HookHullMins = Vector( -2 , -2 , -2 )
ENT.HookHullMaxs = ENT.HookHullMins * -1
ENT.HookCableSize = 1
ENT.HookSize = 3

ENT.AttachmentInfo = {
	BoneName = "ValveBiped.Bip01_Spine1",
	OffsetVec = Vector( 0 , 2.5 , 0 ),
	OffsetAng = Angle( 0 , 90 , -90 ),
}

ENT.HookAttachmentInfo = {
	OffsetVec = Vector( 8.3 , 0 , 2.4 ),
	OffsetAng = angle_zero,
}

sound.Add( {
	name = "grapplehook.hit",
	channel = CHAN_BODY,
	volume = 1,
	level = 75,
	pitch = 115,
	sound = ")npc/roller/blade_cut.wav"
})

sound.Add( {
	name = "grapplehook.launch",
	channel = CHAN_WEAPON,
	volume = 1,
	level = 75,
	pitch = 150,
	--pitch = 180,
	sound = ")weapons/crossbow/fire1.wav"
	--sound = ")weapons/ar2/npc_ar2_altfire.wav" --this one is also nice
	--sound = "ambient/machines/catapult_throw.wav" --too annoying
})

sound.Add( {
	name = "grapplehook.reelsound",
	channel = CHAN_ITEM,
	volume = 0.7,
	level = 75,
	sound = "^vehicles/digger_grinder_loop1.wav"
})

sound.Add( {
	name = "grapplehook.chainreelsound",
	channel = CHAN_WEAPON,
	volume = 0.7,
	level = 75,
	sound = "^physics/metal/metal_chainlink_scrape_rough_loop1.wav"
})

sound.Add( {
	name = "grapplehook.shootrope",
	channel = CHAN_ITEM,
	volume = 0.7,
	level = 75,
	sound = "^weapons/tripwire/ropeshoot.wav",
})

function ENT:SpawnFunction( ply, tr, ClassName )

	if not tr.Hit then return end

	local SpawnPos = tr.HitPos + tr.HitNormal * 36

	local ent = ents.Create( ClassName )
	ent:SetSlotName( ClassName )	--this is the best place to set the slot, don't modify it dynamically ingame
	ent:SetPos( SpawnPos )
	ent:Spawn()
	return ent

end

function ENT:Initialize()
	BaseClass.Initialize( self )
	if SERVER then
		self:SetModel( "models/props_phx/wheels/magnetic_small.mdl" )
		
		self:SetPullMode( 1 )
		self:SetPullSpeed( 2000 )
		self:SetEntityPullForce( 500 )
		self:SetKey( KEY_G )	--the starting key to trigger us
		self:InitPhysics()
		self:SetCollisionGroup(COLLISION_GROUP_PASSABLE_DOOR)
		self:SetHookMissed( false )
		self:SetNextFire( CurTime() + 1 )
		self:SetAttachTime( CurTime() )
		self:SetAttachStart( CurTime() )
		self:SetAttachedTo( vector_origin )
		self:SetGrappleNormal( vector_origin )
		self:SetIsAttached( false )
		self:SetAttachSoundPlayed( false )
		self:SetAttachedEntity( NULL )
		self:Detach()
	else
		self.CSModels = {}
		self.CSModels.Hook = {}
		self:SetNextHookPreview( 0 )
		self:SetHookPreviewTrace( nil )
	end
end

function ENT:SetupDataTables()
	BaseClass.SetupDataTables( self )
	
	self:DefineNWVar( "Float" , "AttachTime" )
	self:DefineNWVar( "Float" , "AttachStart" )
	self:DefineNWVar( "Float" , "PullSpeed" , true , "Pull speed" , 0 , 3500 )
	self:DefineNWVar( "Float" , "GrappleFraction" )
	--self:DefineNWVar( "Float" , "GrappleLength" )
	self:DefineNWVar( "Float" , "GrappleFractionBeforeReturn" )
	self:DefineNWVar( "Float" , "EntityPullForce" , true , "Entity Pull Force" , 0 , 1000 ) --we're not gonna scale the pull force by the entity scale or anything of the sorts, we'll just use a plain value
	
	self:DefineNWVar( "Int" , "PullMode" ) --, true , "Pull mode" , 1 , 4 )
	
	self:DefineNWVar( "Vector" , "AttachedTo" )
	self:DefineNWVar( "Vector" , "GrappleNormal" )
	
	self:DefineNWVar( "Bool" , "IsAttached" )
	self:DefineNWVar( "Bool" , "AttachSoundPlayed" )
	self:DefineNWVar( "Bool" , "HookMissed" )
	self:DefineNWVar( "Bool" , "UseChainRope" , true, "Use Chain" )
	self:DefineNWVar( "Bool" , "CanPullEntities" , true , "Can Pull Entities" )
	
	self:DefineNWVar( "Entity" , "HookHelper" )
	self:DefineNWVar( "Entity" , "AttachedEntity" )
end


function ENT:Think()
	self:HandleHookHelper( false )
	
	if not self:IsCarried() then
		self:HandleHook( false )
		self:HandleDetach( false )
		self:HandleSounds( false )
	end
	
	if CLIENT then
		self:HandleModels()
		self:HandleHookPreview()
	end
	
	
	return BaseClass.Think( self )
end

function ENT:Detach( forced )
	self:SetHookMissed( true )
	self:SetIsAttached( false )
	self:SetAttachTime( CurTime() )
	self:SetAttachedEntity( NULL )
	
	local returntime = 0.25--Lerp( self:GetGrappleFraction() , 0 , self.HookMaxTime )
	self:SetAttachStart( CurTime() + returntime )
	self:SetNextFire( CurTime() + returntime )
	self:SetAttachSoundPlayed( false )
end

function ENT:HandleHookHelper( predicted )
	
	if CLIENT then
			
		return
	end
	
	if IsValid( self:GetHookHelper() ) then
		return
	end
	
	local hh = ents.Create( "sent_grapplehook_hookhelper" )
	
	if not IsValid( hh ) then
		return
	end
	
	hh:SetParent( self )
	hh:Spawn()
	
	self:SetHookHelper( hh )
end

function ENT:HandleDetach( predicted , mv )
	
	if CLIENT and not predicted then
		return
	end
	
	--sets the grapple fraction to how much the grapple actually traveled
	if self:GetAttachedTo() ~= vector_origin then
		
		local travelfraction = math.Clamp( math.TimeFraction( self:GetAttachStart() , self:GetAttachTime() , CurTime() ) , 0 , 1 )
		
		if not self:GetIsAttached() and self:GetGrappleFractionBeforeReturn() ~= 0 then
			travelfraction = Lerp( travelfraction , 0 , self:GetGrappleFractionBeforeReturn() )
		end
		
		self:SetGrappleFraction( travelfraction )
		
		if self:GetIsAttached() then
			self:SetGrappleFractionBeforeReturn( travelfraction )
		end
		
	end
	
	if self:GetIsAttached() then
		
		if self:GetAttachTime() < CurTime() and self:GetHookMissed() then
			self:Detach()
			return
		end
		
		
		if self:GetAttachedEntity() ~= NULL then
		--check the entity's physobj, if it was unfrozen even for a frame, detach us
			
		end
		
		if self:ShouldStopPulling( mv ) then
			self:Detach()
			return
		end
	end
end

function ENT:IsRopeObstructed()
	--local result = self:DoHookTrace( true )
	return false
end



function ENT:HandleSounds( predicted )
	if self:GetIsAttached() then
		if self:GetAttachTime() < CurTime() and not self:GetHookMissed() then
			
			if not self:GetAttachSoundPlayed() then
				
				--play the hit sound only the controlling player and one on the world position
				
				if IsValid( self:GetControllingPlayer() ) then
					self:EmitPESound( "grapplehook.hit" , nil , nil , nil , CHAN_BODY , predicted , self:GetControllingPlayer() )
				end
				
				if IsFirstTimePredicted() then
					local e = EffectData()
					e:SetOrigin( self:GetAttachedTo() - self:GetDirection() * -1 )
					e:SetStart( self:GetAttachedTo() )
					e:SetSurfaceProp( 48 )	--idk, I just took it from flatgrass's wall
					e:SetDamageType( DMG_BULLET )
					e:SetHitBox( 0 )
					--TODO: do this on the attached entity if it's valid instead
					if CLIENT then
						e:SetEntity( game.GetWorld() )
					else
						e:SetEntIndex( 0 )
					end
					util.Effect( "Impact", e )
				end
				
				if SERVER then
					self:EmitPESound( "grapplehook.hit" , nil , nil , nil , CHAN_BODY , self:IsCarried() , self:GetControllingPlayer() , self:GetAttachedTo() )
				end
				
				self:SetAttachSoundPlayed( true )
			end
		end
	end
end

function ENT:HandleLoopingSounds()
	if not self.LaunchSound then
		self.LaunchSound = CreateSound( self , "grapplehook.shootrope" )
	end
	
	if not self.ReelSound then
		self.ReelSound = CreateSound( self , "grapplehook.reelsound" )
	end
	
	if not self.ChainReelSound then
		self.ChainReelSound = CreateSound( self , "grapplehook.chainreelsound" )
	end
	
	if self:GetGrappleFraction() > 0 then
		if self:GetAttachTime() < CurTime() then	
			local reelpitch = 200
			
			--when not attached we want the pitch to increase more when we're close to 0
			if not self:GetIsAttached() then
				reelpitch = reelpitch + Lerp( self:GetGrappleFraction() , 55 , 20 )
			end
			
			self.ReelSound:PlayEx( 0.3 , reelpitch )
			
			if self:GetUseChainRope() then
				reelpitch = 100 + Lerp( self:GetGrappleFraction() , 55 , 20 )
				self.ChainReelSound:PlayEx( 1 , reelpitch )
			else
				self.ChainReelSound:Stop()
			end
			
			self.LaunchSound:Stop()
		else
			self.LaunchSound:PlayEx( 1 , 100 )
			
			if self:GetUseChainRope() then
				self.ChainReelSound:PlayEx( 1 , 100 )
			else
				self.ChainReelSound:Stop()
			end
		end
	else
		self.LaunchSound:Stop()
		self.ReelSound:Stop()
		self.ChainReelSound:Stop()
	end
end

function ENT:HandleHook( predicted , ply , mv , usercmd )
	if CLIENT and not predicted then
		return
	end
	
	if self:IsKeyDown( mv ) then
		if self:GetNextFire() <= CurTime() then
			self:FireHook()
		end
	end
end

function ENT:PredictedSetupMove( owner , mv , usercmd )
	self:HandleHook( true , owner , mv , usercmd )
end

function ENT:PredictedMove( owner , mv )
	if self:CanPull( mv ) then

		owner:SetGroundEntity( NULL )
		--[[

		if self:GetPullMode() == 2 then
			mv:SetVelocity( self:GetDirection() * self:GetPullSpeed() )
		elseif self:GetPullMode() == 3 then
			local currenthooklength = Lerp( self:GetGrappleFraction() , 0 , self.HookMaxRange )
			local curdistance = ( self:GetAttachedTo() - self:GetControllingPlayer():EyePos() ):Length()
			if curdistance > currenthooklength then
				mv:SetVelocity( mv:GetVelocity() + self:GetDirection() * mv:GetVelocity():Length() * 0.5 )
			end
		
		elseif self:GetPullMode() == 4 then
			local eye_pos = self:GetControllingPlayer():EyePos()

			local dist = ( self:GetAttachedTo() - eye_pos ):Length()

			if dist > self:GetGrappleLength() then
				local dir = ( self:GetAttachedTo() - eye_pos ):GetNormalized() -- Direction from player to hook

				mv:SetVelocity( mv:GetVelocity() + dir * (dist - self:GetGrappleLength()) ) -- Translate velocity to be within distance of hook
			end
		else
		]]
			mv:SetVelocity( mv:GetVelocity() + self:GetDirection() * self:GetPullSpeed() * FrameTime() )
		--end
	end
end

function ENT:PredictedThink( owner , mv )
	self:HandleDetach( true , mv )
	self:HandleSounds( true )
end

function ENT:IsHookActive()
	return self:GetGrappleFraction() ~= 0
end

function ENT:FireHook()
	if self:GetIsAttached() then
		return
	end
	
	self:SetNextFire( CurTime() + 0.1 )
	
	if SERVER and IsValid( self:GetControllingPlayer() ) then
		self:GetControllingPlayer():LagCompensation( true )
	end
	
	local result = self:DoHookTrace()
	
	if SERVER and IsValid( self:GetControllingPlayer() ) then
		self:GetControllingPlayer():LagCompensation( false )
	end
	
	--[[
		so, here's the thing
		even if we miss the hook, aka we hit the sky, we still want a "hitpos", but we'll mark that hook as missed, which will make it autodetach when reaching the distance
	]]
	
	local timetoreach = Lerp( result.Fraction , 0 , self.HookMaxTime )
	--not result.HitSky and result.Hit and not result.HitNoDraw
	self:SetHookMissed( result.HitSky or not result.Hit or result.HitNoDraw )
	self:SetAttachedEntity( result.Entity )
	self:SetAttachedTo( result.HitPos )
	self:SetAttachTime( CurTime() + timetoreach )
	self:SetAttachStart( CurTime() )
	self:SetIsAttached( true )
	self:SetGrappleNormal( self:GetDirection() )
	self:SetGrappleFraction( result.Fraction )
	--self:SetGrappleLength( ( self:GetAttachedTo() - self:GetControllingPlayer():EyePos() ):Length() )
	self:EmitPESound( "grapplehook.launch" , nil , nil , nil , CHAN_WEAPON , true )
end

function ENT:GetDirection()
	if not self:IsCarried() then
		return ( self:GetAttachedTo() - self:GetPos() ):GetNormalized()
	end
	return ( self:GetAttachedTo() - self:GetControllingPlayer():EyePos() ):GetNormalized()
end

--TODO: if we attach to an entity, we should also store it in a dtvar so we constantly check if it's physobj was removed (or even just the entity itself)
function ENT:HookTraceFilter( ent )
	
	if not IsValid( ent ) then
		return
	end
	
	if ent == game.GetWorld() then
		return true
	end
	
	if ent:IsPlayer() or ent:IsNPC() or ent:IsRagdoll() or ent:GetClass() == "sent_grapplehook_bpack" then
		return false
	end
	
	--this is where the prediction error will happen
	--this is kind of lame, since we're assuming we might hit its physobj rather than other ones, but that's why we also filter out ragdolls I guess
	--also filter out clientside only or serverside only entities that have physics
	local physobj = ent:GetPhysicsObject()
	if ent:EntIndex() ~= -1 and IsValid( physobj ) and not physobj:IsMotionEnabled() then
		return true
	end
	
	return false
end

function ENT:DoHookTrace( checkdetach )
	local startpos = self:GetPos()
	local normal = self:GetForward()
	
	if not self:IsCarried() then
		local hookpos , hookang = self:GetHookAttachment()
		startpos = hookpos
		normal = hookang:Forward()
	end
	
	if checkdetach then
		normal = self:GetDirection()
	end
	
	local endpos = startpos + normal * self.HookMaxRange
	
	if IsValid( self:GetControllingPlayer() ) then
		if not checkdetach then
			normal = self:GetControllingPlayer():GetAimVector()
		end
		startpos = self:GetControllingPlayer():EyePos()
		endpos = startpos + normal * self.HookMaxRange
	end
	
	--[[
		even if we only see that entity serverside and we attach to it, the prediction error will have no impact on movement whatsoever, since we have a
		delay anyway
		
		you might see the hook stutter a bit, but it's better than being limited by brushes only
	]]
	
	local tr = {
		filter = function( filterent ) 
			return self:HookTraceFilter( filterent )
		end,
		mask = MASK_SOLID,	--anything that is solid can stop the trace
		start = startpos,
		endpos = endpos,
		mins = self.HookHullMins,
		maxs = self.HookHullMaxs
	}
	
	return util.TraceHull( tr )
end

function ENT:ShouldStopPulling( mv )
	return not self:IsKeyDown( mv )
end

function ENT:CanPull( mv )
	return self:GetIsAttached() and self:GetAttachTime() < CurTime() and not self:ShouldStopPulling( mv )
end

function ENT:OnRemove()
	if CLIENT then
		self:RemoveModels()
		
		if self.LaunchSound then
			self.LaunchSound:Stop()
			self.LaunchSound = nil
		else
			self:StopSound( "grapplehook.shootrope" )
		end
		
		if self.ReelSound then
			self.ReelSound:Stop()
			self.ReelSound = nil
		else
			self:StopSound( "grapplehook.reelsound" )
		end
		
		if self.ChainReelSound then
			self.ChainReelSound:Stop()
			self.ChainReelSound = nil
		else
			self:StopSound( "grapplehook.chainreelsound" )
		end
		
	else
		if IsValid( self:GetHookHelper() ) then
			self:GetHookHelper():Remove()
		end
	end
	
	BaseClass.OnRemove( self )
end

function ENT:GetHookAttachment()
	return LocalToWorld( self.HookAttachmentInfo.OffsetVec , self.HookAttachmentInfo.OffsetAng , self:GetPos() , self:GetAngles() )
end

if SERVER then

	function ENT:OnAttach( ply )
	end
	
	function ENT:OnDrop( ply , forced )
		
	end
	
	function ENT:OnInitPhysics( physobj )
		self:StartMotionController()
	end

	function ENT:OnRemovePhysics()
		self:StopMotionController()
	end
	
	function ENT:PhysicsSimulate( physobj , delta )
		
		if self:GetIsAttached() and not self:GetBeingHeld() and self:CanPull() then
			physobj:Wake()
			local force = self:GetDirection() * self:GetPullSpeed()
			--TODO: add angular force to the actual point where the cable is attached to this entity, rather than floating around
			local angular = vector_origin
			--TODO: don't we have to multiply by delta or some shit?
			return angular , force * physobj:GetMass() , SIM_GLOBAL_FORCE
		end
		
	end
	
	function ENT:OnTakeDamage( dmginfo )
		if not self:IsCarried() then
			
			if dmginfo:IsDamageType( DMG_CLUB ) then
				self:SetKeyPressed( not self:GetKeyPressed() )
				if IsValid( self:GetPhysicsObject() ) then
					self:GetPhysicsObject():EnableMotion( true )
				end
			else
				--only take physics damage from damage types that don't whack the button
				if IsValid( self:GetPhysicsObject() ) then
					self:TakePhysicsDamage( dmginfo )
				end
			end
		end
	end
else
	
	function ENT:HandleModels()
		--create all the models, use EnableMatrix to setup the offsets because it's easier and faster than doing that everytime, at least in this static case
		--we might have to do it dynamically on the hook if I want to do some fancy animations, but considering it's small and you barely see it, it's not worth it
		
		if not IsValid( self.CSModels["bodybase"] ) then
			
			local bodybasematrix = Matrix()
			bodybasematrix:Scale( Vector( 0.25 , 0.25 , 0.5 ) )
			
			self.CSModels["bodybase"] = ClientsideModel( "models/props_lab/teleportring.mdl" )
			self.CSModels["bodybase"]:SetNoDraw( true )
			self.CSModels["bodybase"]:EnableMatrix( "RenderMultiply" , bodybasematrix )
			
		end
		
		if not IsValid( self.CSModels["backbodybase"] ) then
			local backbasematrix = Matrix()
			backbasematrix:Scale( Vector( 0.25 , 0.25 , 0.5 ) )
			backbasematrix:SetAngles( Angle( 0 , 180 , 0 ) )
			
			self.CSModels["backbodybase"] = ClientsideModel( "models/props_lab/teleportring.mdl" )
			self.CSModels["backbodybase"]:SetNoDraw( true )
			self.CSModels["backbodybase"]:EnableMatrix( "RenderMultiply" , backbasematrix )
		end
		
				
		if not IsValid( self.CSModels.Hook["hook"] ) then
			local hookmatrix = Matrix()
			hookmatrix:SetAngles( Angle( 90 , 0 , 0 ) )
			hookmatrix:Scale( Vector( 1 , 1 , 0.1 ) / 4 * self.HookSize )

			self.CSModels.Hook["hook"] = ClientsideModel( "models/props_lab/jar01b.mdl" )
			self.CSModels.Hook["hook"]:SetNoDraw( true )
			self.CSModels.Hook["hook"]:EnableMatrix( "RenderMultiply" , hookmatrix )
		end
		
		--yes this is lame, yes I don't care
		
		if not IsValid( self.CSModels.Hook["hookgibleft"] ) then
			local hookgibmatrixleft = Matrix()
			hookgibmatrixleft:SetScale( Vector( 1 , 1 , 1 ) / 6 * self.HookSize )
			hookgibmatrixleft:SetAngles( Angle( -45 + 90 , 0 , 90 ) )
			hookgibmatrixleft:SetTranslation( Vector( 0.5 , 0 , -1 ) * self.HookSize )
			self.CSModels.Hook["hookgibleft"] = ClientsideModel( "models/Gibs/manhack_gib05.mdl" )
			self.CSModels.Hook["hookgibleft"]:SetNoDraw( true )
			self.CSModels.Hook["hookgibleft"]:EnableMatrix( "RenderMultiply" , hookgibmatrixleft )
		end
		
		if not IsValid( self.CSModels.Hook["hookgibright"] ) then
			local hookgibmatrixright = Matrix()
			hookgibmatrixright:SetScale( Vector( 1 , 1 , 1 ) / 6 * self.HookSize )
			hookgibmatrixright:SetAngles( Angle( 0 , -45 , 0 ) )
			hookgibmatrixright:SetTranslation( Vector( 0.5 , -1 , 0 ) * self.HookSize )
			self.CSModels.Hook["hookgibright"] = ClientsideModel( "models/Gibs/manhack_gib05.mdl" )
			self.CSModels.Hook["hookgibright"]:SetNoDraw( true )
			self.CSModels.Hook["hookgibright"]:EnableMatrix( "RenderMultiply" , hookgibmatrixright )
		end
		
		if not IsValid( self.CSModels.Hook["hookgibup"] ) then
			local hookgibmatrixup = Matrix()
			hookgibmatrixup:SetScale( Vector( 1 , 1 , 1 ) / 6 * self.HookSize )
			hookgibmatrixup:SetAngles( Angle( -45 , 0 , -90 ) )
			hookgibmatrixup:SetTranslation( Vector( 0.5, 0 , 1 ) * self.HookSize )
			self.CSModels.Hook["hookgibup"] = ClientsideModel( "models/Gibs/manhack_gib05.mdl" )
			self.CSModels.Hook["hookgibup"]:SetNoDraw( true )
			self.CSModels.Hook["hookgibup"]:EnableMatrix( "RenderMultiply" , hookgibmatrixup )
		end
		
		if not IsValid( self.CSModels.Hook["hookgibdown"] ) then
			local hookgibmatrixdown = Matrix()
			hookgibmatrixdown:SetScale( Vector( 1 , 1 , 1 ) / 6 * self.HookSize )
			hookgibmatrixdown:SetAngles( Angle( 0 , 90 - 45 , 180 ) )
			hookgibmatrixdown:SetTranslation( Vector( 0.5, 1 , 0 ) * self.HookSize )
			self.CSModels.Hook["hookgibdown"] = ClientsideModel( "models/Gibs/manhack_gib05.mdl" )
			self.CSModels.Hook["hookgibdown"]:SetNoDraw( true )
			self.CSModels.Hook["hookgibdown"]:EnableMatrix( "RenderMultiply" , hookgibmatrixdown )
		end
	end
	
	function ENT:RemoveModels()
		--really can't be arsed to make a DeepRemove function
		for i , v in pairs( self.CSModels ) do
			if IsValid( v ) then
				v:Remove()
			end
		end
		
		for i , v in pairs( self.CSModels.Hook ) do
			if IsValid( v ) then
				v:Remove()
			end
		end
	end
	
	function ENT:HandleHookPreview()
		--only when equipped
		if not self:IsCarried() then
			return
		end
		
		if self:GetNextHookPreview() < UnPredictedCurTime() then
			local tr = self:DoHookTrace()
			
			self:SetHookPreviewTrace( tr )
			self:SetNextHookPreview( UnPredictedCurTime() + 0.05 )
		end
	end
	
	--draws the rope and grapple
	
	function ENT:DrawGrapple( flags )
		if renderedChainTexture == 0 then
			renderedChainTexture = false
		end
		
		
		local cablesize = self.HookCableSize
		
		local startgrapplepos , startgrappleang = self:GetHookAttachment()
		
		local endgrapplepos = startgrapplepos
		local endgrappleang = startgrappleang
		
		--the "Local" player is carrying this, so draw the hook a bit below his head and not the position of his actual thirdperson model
		if self:IsCarriedByLocalPlayer( true ) and not self:ShouldDrawLocalPlayer( true ) then
			local eyepos = self:GetControllingPlayer():EyePos()
			local aimvecang = self:GetControllingPlayer():EyeAngles()
			startgrapplepos = eyepos + aimvecang:Up() * - 30
		end
		
		--other players don't need your fancy ass swirling rope, maybe they would like to, but the fps drop wouldn't be nice, so let's just leave it at that
		local dosway = self:IsCarriedByLocalPlayer( true ) and self:GetIsAttached() and not self:GetUseChainRope()
		local travelfraction = self:GetGrappleFraction()
		
		if travelfraction ~= 0 then
			endgrappleang = self:GetGrappleNormal():Angle()
			endgrapplepos = LerpVector( travelfraction , startgrapplepos , self:GetAttachedTo() )
			
			local length = ( endgrapplepos - startgrapplepos ):Length()
			
			if not self:GetUseChainRope() then
				render.SetMaterial( self.CableMaterial )
			else
				render.SetMaterial( self.ChainMaterial )
			end
			
			--only do this expensive rendering when carried by the local player
			if dosway then
				
				local swayamount = Lerp( travelfraction , 4 * cablesize , 0 )	--bigger cable = bigger sway
				
				local lengthfraction = length / self.HookMaxRange
				
				local ang = ( endgrapplepos - startgrapplepos ):Angle()
				local swayres = math.floor( Lerp( lengthfraction , 64 , 16 ) )	--number of segments to use for the swayamount
				
				--fancy, not entirely realistic and kind of expensive due to the garbage collection on vectors I guess?
				
				render.StartBeam( swayres + 2 )
				
					render.AddBeam( startgrapplepos , cablesize , 2 , color_white )
					
					for i = 1 , swayres do
						
						local frac = i / ( swayres - 1 )
						
						local curendpos = Lerp( frac , startgrapplepos , endgrapplepos )
						
						local t = UnPredictedCurTime() * 25 + 50 * frac
						
						local swayvec = Vector( 0 , 0 , 0 )
						
						--TODO: individual checks for when returning and shooting?
						
						swayvec:Add( ang:Right() * math.sin( t ) * swayamount )
						
						swayvec:Add( ang:Up() * math.cos( t ) * swayamount )
						
						render.AddBeam( curendpos + swayvec , cablesize , 3 , color_white )
						
					end
					
					render.AddBeam( endgrapplepos , cablesize , 3 , color_white )
					
				render.EndBeam()
			
			else
			
				if not self:GetUseChainRope() then
					render.StartBeam( 2 )
						render.AddBeam( startgrapplepos , cablesize , 2 , color_white )
						render.AddBeam( endgrapplepos , cablesize , 3 , color_white )
					render.EndBeam()
				else
					render.StartBeam( 2 )
						render.AddBeam( startgrapplepos , cablesize * 20 , length * 0.05 , color_white )
						render.AddBeam( endgrapplepos , cablesize * 20 , 0 , color_white )
					render.EndBeam()
				end
				
			end
		
		
		end
		
		self:DrawHook( endgrapplepos , endgrappleang , flags )
			
	end
	
	--draws the hook at the given position
	function ENT:DrawHook( pos , ang , flags )
		
		if not self.CSModels then
			return
		end
		
		for i , v in pairs( self.CSModels.Hook ) do
			if IsValid( v ) then
				v:SetPos( pos )
				v:SetAngles( ang )
				v:SetupBones()
				v:DrawModel( flags )
			end
		end

	end
	
	function ENT:Draw( flags )
		local pos , ang = self:GetCustomParentOrigin()
		
		--even though the calcabsoluteposition hook should already prevent this, it doesn't on other players
		--might as well not give it the benefit of the doubt in the first place
		if pos and ang then
			self:SetPos( pos )
			self:SetAngles( ang )
			self:SetupBones()
		end

		self:DrawCSModel( self:GetPos() , self:GetAngles() , flags )
		
		if not self:IsHookActive() then
			local hpos , hang = self:GetHookAttachment()
			self:DrawHook( hpos , hang )
		end
	end
	
	function ENT:DrawCSModel( pos , ang , flags )
		for i , v in pairs( self.CSModels ) do
			if IsValid( v ) then	--we may encounter nested tables but it doesn't matter because they don't have .IsValid
				v:SetPos( pos )
				v:SetAngles( ang )
				v:SetupBones()
				v:DrawModel( flags )
			end
		end

	end
	
	function ENT:DrawPreview()
		--don't draw if we're still attached
		if self:IsHookActive() then
			return
		end
		
		local tr = self:GetHookPreviewTrace()
		if tr then
			
			
			if tr.Hit then
				self:DrawHook( tr.HitPos , tr.Normal:Angle() )
			end
			
		end
	end
	
	function ENT:DrawFirstPerson( ply , vm )
		--self:DrawPreview()
	end
	
	
	local grapplehooktable = ENT
	
	hook.Add( "PostRender" , "RenderChainTextureOnce" , function()
		local ENT = grapplehooktable
		
		--only start rendering after the entity has been spawned the first time
		if renderedChainTexture or renderedChainTexture == 0 then
			return
		end
		
		if not IsValid( chainmodel ) then
			chainmodel = ClientsideModel( "models/props_c17/utilityconnecter005.mdl" )
			chainmodel:SetNoDraw( true )
			chainmodel:SetModelScale( 0.5 , 0 )
			chainmodel:Spawn()
			chainmodel.Length = 11 * 0.5
		end
		
		local oldrt = render.GetRenderTarget()
		local scrw , scrh = ScrW() , ScrH()
		render.SetRenderTarget( ENT.ChainTexture )
		render.ClearDepth()
		render.Clear( 0 , 0 , 0 , 0 )
		render.SetViewPort( 0 , 0 , ENT.ChainTexture:Width() , ENT.ChainTexture:Height() )
			
		cam.Start3D( vector_origin - Vector( 0 , 11 , -1.2 ) , Angle( 0 , 90 , 0 ) , 90 , 0 , 0 , ENT.ChainTexture:Width() , ENT.ChainTexture:Height() , nil , nil )
			render.SuppressEngineLighting( true )
			render.SetLightingOrigin( vector_origin )
			render.ResetModelLighting( 1 , 1 , 1 )
			render.SetColorModulation( 1 , 1 , 1 )
			
			render.SetWriteDepthToDestAlpha( false )
			
			local pointa = Vector( 0 , 0 , -10 )
			local pointb = Vector( 0 , 0 , 10 )
			
			if IsValid( chainmodel ) then
				local direction = ( pointb - pointa ):GetNormalized()
				local chainlength = ( pointb - pointa ):Length()
				local subd = chainlength / chainmodel.Length
				
				local ang = direction:Angle()
				ang.p = 0
				ang.r = direction:Angle().p
				ang:RotateAroundAxis( Vector( 0 , 0 , -1 ) , -90 )
				
				for i = 0 , math.Round( subd ) do
					local p , a = LocalToWorld( Vector( 0 , -chainmodel.Length * i , 0 ) , angle_zero or angle_zero , pointa , ang )
					
					if i % 2 == 0 then
						local __
						__ , a = LocalToWorld( Vector( 0 , -chainmodel.Length * i , 0 ) , Angle( 90 , 0 , 0 ) , pointa , ang )
					end
					
					chainmodel:SetPos( p )
					chainmodel:SetAngles( a )
					chainmodel:SetupBones()
					chainmodel:DrawModel()
				end
			end
			
			render.SuppressEngineLighting( false )
		
		cam.End3D()
		
		render.SetRenderTarget( oldrt )
		render.SetViewPort( 0 , 0 , scrw , scrh )
		
		if IsValid( chainmodel ) then
			chainmodel:Remove()
		end
		
		ENT.ChainMaterial:SetTexture( "$basetexture" , ENT.ChainTexture )
		renderedChainTexture = true
	end)
	
end