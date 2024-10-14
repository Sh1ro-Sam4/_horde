AddCSLuaFile()
SWEP.Category					= "Terraria"
SWEP.Author						= "Jade"
SWEP.Base						= "weapon_base"
SWEP.PrintName					= "Terra Blade (Enraged)"
SWEP.Instructions				= ""

SWEP.ViewModel 					= "models/weapons/c_emptycrowbar.mdl"
SWEP.ViewModelFlip				= false
SWEP.ShowWorldModel				= false
SWEP.WorldModel					= "models/terra blade/terra_blade.mdl"
SWEP.ViewModelFOV 				= 54
SWEP.UseHands					= true

SWEP.Weight						= 1
SWEP.AutoSwitchTo				= true
SWEP.AutoSwitchFrom				= false

SWEP.DrawAmmo					= false
SWEP.DrawCrosshair				= true

SWEP.Slot						= 0
SWEP.SlotPos					= 0

SWEP.Spawnable					= true
SWEP.AdminSpawnable				= true
SWEP.AdminOnly = true

SWEP.Primary.Automatic			= true
SWEP.Primary.Damage				= 47.5
SWEP.Primary.Range				= 85
SWEP.Primary.Delay				= 0.24
SWEP.Primary.MissSound			= Sound("MonadoSlash")
SWEP.Primary.HitSound			= Sound("MonadoHit")

SWEP.Secondary.Automatic		= false

SWEP.Aimbot = {}
SWEP.Aimbot.Target 				= nil
SWEP.Aimbot.DeathSequences = {
    ["models/barnacle.mdl"]            = {4,15},
    ["models/antlion_guard.mdl"]    = {44},
    ["models/hunter.mdl"]            = {124,125,126,127,128},
}

SWEP.VElements = {
	["element_name"] = { type = "Model", model = "models/terra blade/terra_blade.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(11.947, 3.635, -1.558), angle = Angle(-139.092, 164.804, -10.52), size = Vector(1, 1, 1), color = Color(255, 0, 0, 255), surpresslightning = true, material = "", skin = 0, bodygroup = {} }
}
SWEP.WElements = {
	["element_name"] = { type = "Model", model = "models/terra blade/terra_blade.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(11.947, 4.675, -1.558), angle = Angle(-139.092, 162.468, -3.507), size = Vector(1, 1.08, 1), color = Color(255, 0, 0, 255), surpresslightning = true, material = "", skin = 0, bodygroup = {} }
}

function SWEP:EntityFaceFront(ent, ang)

	local angle = self.Owner:EyeAngles().y - ( ent:GetPos() - self.Owner:GetPos() ):Angle().y
	
	if angle < -180 then angle = 360 + angle end
	if angle <= ang and angle >= -ang then return true end

	return false
end

function SWEP:GetHeadPos(ent)
    local model = ent:GetModel() or ""
    if model:find("crow") or model:find("seagull") or model:find("pigeon") then
        return ent:LocalToWorld(ent:OBBCenter() + Vector(0,0,-5))
    elseif ent:GetAttachment(ent:LookupAttachment("eyes")) ~= nil then
        return ent:GetAttachment(ent:LookupAttachment("eyes")).Pos
    else
        return ent:LocalToWorld(ent:OBBCenter())
    end
end

function SWEP:CheckTarget(ent)
	
    if ent:IsPlayer() then
        if !ent:IsValid() then return false end
        if ent:Health() < 1 then return false end
        if ent == self.Owner then return false end   
		local angle = self.Owner:EyeAngles().y - ( ent:GetPos() - self.Owner:GetPos() ):Angle().y
		if angle < -180 then angle = 360 + angle end
		if not (angle <= 90 and angle >= -90) then return false end
        return true
    end
    if ent:IsNPC() then
        if ent:GetMoveType() == 0 then return false end
        if table.HasValue(self.Aimbot.DeathSequences[string.lower(ent:GetModel() or "")] or {},ent:GetSequence()) then return false end
		local angle = self.Owner:EyeAngles().y - ( ent:GetPos() - self.Owner:GetPos() ):Angle().y
		if angle < -180 then angle = 360 + angle end
		if not (angle <= 90 and angle >= -90) then return false end
        return true
    end
    return false
end

function SWEP:GetTargets()
    local tbl = {}
    for k,ent in pairs(ents.GetAll()) do
        if self:CheckTarget(ent) == true then
            table.insert(tbl,ent)
        end
    end
    return tbl
end

function SWEP:GetClosestTarget()
    local pos = self.Owner:GetPos()
    local ang = self.Owner:GetAimVector()
    local closest = {0,0}
    for k,ent in pairs(self:GetTargets()) do
        local diff = (ent:GetPos()-pos)
		diff:Normalize()
        diff = diff - ang
        diff = diff:Length()
        diff = math.abs(diff)
        if (diff < closest[2]) or (closest[1] == 0) then
            closest = {ent,diff}
        end
    end
	if closest[2]<0.5 then
		return closest[1]
	end
end

function SWEP:PrimaryAttack()

	local ent = self:GetClosestTarget()
	self.Aimbot.Target = ent ~= 0 and ent or nil
		
	local aimed = 0
		
	local aimvec = self.Owner:GetAimVector()
	local tr = util.TraceLine( {
		start = self.Owner:GetShootPos(),
		endpos = self.Owner:GetShootPos() + aimvec * 10000,
		filter = self.Owner,
		mask = MASK_PLAYERSOLID,
	} )
		
	if IsValid(tr.Entity) and not (tr.Entity:GetClass() == "ent_enragesword") then
		self.Aimbot.Target = tr.Entity
		aimed = 1
	end
	
	if self.Aimbot.Target ~= nil then
			aimed = 1
			--self.Owner:SetEyeAngles((aimvec+aimvac*7000):Angle())
	end

	self.Weapon:SetNextPrimaryFire(CurTime() + self.Primary.Delay)
	self.Owner:SetAnimation( PLAYER_ATTACK1 )

	local tr = {}
	tr.start = self.Owner:GetShootPos()
		
	local pents = ents.FindInSphere(tr.start, self.Primary.Range * 50)
	local hitted = false
		
	local dmginfo = DamageInfo()
	dmginfo:SetAttacker( self.Owner )
	dmginfo:SetInflictor( self )
	dmginfo:SetDamage(self.Primary.Damage / 10)
	self.Weapon:EmitSound("Terraslash")
		
	for k, v in pairs(pents) do
		if v ~= self and v ~= self.Owner and IsValid(v) and self:EntityFaceFront( v, 35 ) and self.Owner:GetPos() ~= v:GetPos() and (v:IsPlayer() or v:IsNPC()) then
				
			hitted = true
			dmginfo:SetDamageForce( ( v:GetPos() - self.Owner:GetPos() ):GetNormalized() * 10000 )
			if SERVER then
				
				v:TakeDamageInfo( dmginfo )
				self.Owner:SetHealth(self.Owner:Health() + dmginfo:GetDamage())
				local spell = ents.Create("ent_leechsword")
				local firvec = Vector(0, 0, 1)
				spell:SetAngles(firvec:Angle())
				local pos = v:GetPos()
				spell:SetPos(pos)

				spell:SetOwner(self.Owner)
				spell:SetPhysicsAttacker(self.Owner)
				spell:Spawn()
				spell:Activate()
				spell:SetColor( Color(255, 255, 255, 255))
				spell.target = self.Owner
				util.SpriteTrail( spell.Entity, 2, Color( 255, 22, 22 ), false, 20, 0, 0.7, 1 / ( 50 + 1 ) * 0.5, "trails/laser.vmt" )
				local phys = spell:GetPhysicsObject()
				phys:SetVelocity(Vector(math.random(-200,200),math.random(-200,200),math.random(-200,200)))
			end
			if v:GetPhysicsObject():IsValid() then
				v:GetPhysicsObject():ApplyForceCenter( ( v:GetPos() - self.Owner:GetPos() ):GetNormalized() * 10000 )
			end
		end
	end
		
	tr.endpos = self.Owner:GetShootPos() + ( self.Owner:GetAimVector() * self.Primary.Range)
	tr.filter = self.Owner
	tr.mask = MASK_SHOT
	local trace = util.TraceLine( tr )
	
	--if trace.Hit then
	--	timer.Simple(trace.Fraction, function()
	--		if IsValid(self) then
	--			local fx = EffectData()
	--			fx:SetEntity(self.Owner)
	--			fx:SetOrigin(trace.HitPos)
	--			fx:SetColor(2)
	--			util.Effect("effect_danmaku_impact2",fx)
	--			util.BlastDamage(self, self.Owner, trace.HitPos, 15, 95 * 1.25)
	--		end
	--	end)
	--end
	
	if trace.Hit and !hitted then
		bullet = {}
		bullet.Num    = 1
		bullet.Src    = self.Owner:GetShootPos()
		bullet.Dir    = self.Owner:GetAimVector()
		bullet.Spread = Vector(0, 0, 0)
		bullet.Tracer = 0
		bullet.Force  = 100
		bullet.Damage = self.Primary.Damage
		self.Owner:FireBullets(bullet)
		self.Weapon:SendWeaponAnim(ACT_VM_HITKILL) 
	else
		self.Weapon:SendWeaponAnim(ACT_VM_MISSCENTER) 
	end
	if SERVER then
		local spell = ents.Create("ent_enragesword")
		local firvec = self.Owner:GetAimVector()
		spell:SetAngles(firvec:Angle())
		local pos = self.Owner:GetShootPos()
		pos = pos + self.Owner:GetAimVector() * 25 + self.Owner:GetRight() * 10
		pos = pos + self.Owner:GetUp() * -6
		spell:SetPos(pos)

		spell:SetOwner(self.Owner)
		spell:SetPhysicsAttacker(self.Owner)
		spell:Spawn()
		spell:Activate()
		spell:SetColor( Color(255, 0, 0, 255))
		if aimed == 1 then
			--print(self.Aimbot.Target)
			spell.target = self.Aimbot.Target
		end
		util.SpriteTrail( spell.Entity, 2, Color( 255, 22, 22 ), false, 100, 0, 0.7, 1 / ( 50 + 1 ) * 0.5, "trails/laser.vmt" )
		local phys = spell:GetPhysicsObject()
		phys:SetVelocity(self.Owner:GetAimVector() * 3000 + Vector(math.random(-200,200),math.random(-200,200),math.random(-200,200)))
	end
end

function SWEP:CanSecondaryAttack()
	return false
end

function SWEP:Reload()
end

function SWEP:DoImpactEffect( tr, dmgtype )
    return true;
end

/********************************************************
	SWEP Construction Kit base code
		Created by Clavus
	Available for public use, thread at:
	   facepunch.com/threads/1032378
	   
	   
	DESCRIPTION:
		This script is meant for experienced scripters 
		that KNOW WHAT THEY ARE DOING. Don't come to me 
		with basic Lua questions.
		
		Just copy into your SWEP or SWEP base of choice
		and merge with your own code.
		
		The SWEP.VElements, SWEP.WElements and
		SWEP.ViewModelBoneMods tables are all optional
		and only have to be visible to the client.
********************************************************/

function SWEP:Initialize()
	self:SetHoldType("melee")	

	// other initialize code goes here

	if CLIENT then
	
		// Create a new table for every weapon instance
		self.VElements = table.FullCopy( self.VElements )
		self.WElements = table.FullCopy( self.WElements )
		self.ViewModelBoneMods = table.FullCopy( self.ViewModelBoneMods )

		self:CreateModels(self.VElements) // create viewmodels
		self:CreateModels(self.WElements) // create worldmodels
		
		// init view model bone build function
		if IsValid(self.Owner) then
			local vm = self.Owner:GetViewModel()
			if IsValid(vm) then
				self:ResetBonePositions(vm)
				
				// Init viewmodel visibility
				if (self.ShowViewModel == nil or self.ShowViewModel) then
					vm:SetColor(Color(255,255,255,255))
				else
					// we set the alpha to 1 instead of 0 because else ViewModelDrawn stops being called
					vm:SetColor(Color(255,255,255,1))
					// ^ stopped working in GMod 13 because you have to do Entity:SetRenderMode(1) for translucency to kick in
					// however for some reason the view model resets to render mode 0 every frame so we just apply a debug material to prevent it from drawing
					vm:SetMaterial("Debug/hsv")			
				end
			end
		end
		
	end

end

function SWEP:Holster()
	
	if CLIENT and IsValid(self.Owner) then
		local vm = self.Owner:GetViewModel()
		if IsValid(vm) then
			self:ResetBonePositions(vm)
		end
	end
	
	return true
end

function SWEP:OnRemove()
	self:Holster()
end

function SWEP:OnDrop()
	self:Remove()
end


if CLIENT then

	SWEP.vRenderOrder = nil
	function SWEP:ViewModelDrawn()
		
		local vm = self.Owner:GetViewModel()
		if !IsValid(vm) then return end
		
		if (!self.VElements) then return end
		
		self:UpdateBonePositions(vm)

		if (!self.vRenderOrder) then
			
			// we build a render order because sprites need to be drawn after models
			self.vRenderOrder = {}

			for k, v in pairs( self.VElements ) do
				if (v.type == "Model") then
					table.insert(self.vRenderOrder, 1, k)
				elseif (v.type == "Sprite" or v.type == "Quad") then
					table.insert(self.vRenderOrder, k)
				end
			end
			
		end

		for k, name in ipairs( self.vRenderOrder ) do
		
			local v = self.VElements[name]
			if (!v) then self.vRenderOrder = nil break end
			if (v.hide) then continue end
			
			local model = v.modelEnt
			local sprite = v.spriteMaterial
			
			if (!v.bone) then continue end
			
			local pos, ang = self:GetBoneOrientation( self.VElements, v, vm )
			
			if (!pos) then continue end
			
			if (v.type == "Model" and IsValid(model)) then

				model:SetPos(pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z )
				ang:RotateAroundAxis(ang:Up(), v.angle.y)
				ang:RotateAroundAxis(ang:Right(), v.angle.p)
				ang:RotateAroundAxis(ang:Forward(), v.angle.r)

				model:SetAngles(ang)
				//model:SetModelScale(v.size)
				local matrix = Matrix()
				matrix:Scale(v.size)
				model:EnableMatrix( "RenderMultiply", matrix )
				
				if (v.material == "") then
					model:SetMaterial("")
				elseif (model:GetMaterial() != v.material) then
					model:SetMaterial( v.material )
				end
				
				if (v.skin and v.skin != model:GetSkin()) then
					model:SetSkin(v.skin)
				end
				
				if (v.bodygroup) then
					for k, v in pairs( v.bodygroup ) do
						if (model:GetBodygroup(k) != v) then
							model:SetBodygroup(k, v)
						end
					end
				end
				
				if (v.surpresslightning) then
					render.SuppressEngineLighting(true)
				end
				
				render.SetColorModulation(v.color.r/255, v.color.g/255, v.color.b/255)
				render.SetBlend(v.color.a/255)
				model:DrawModel()
				render.SetBlend(1)
				render.SetColorModulation(1, 1, 1)
				
				if (v.surpresslightning) then
					render.SuppressEngineLighting(false)
				end
				
			elseif (v.type == "Sprite" and sprite) then
				
				local drawpos = pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z
				render.SetMaterial(sprite)
				render.DrawSprite(drawpos, v.size.x, v.size.y, v.color)
				
			elseif (v.type == "Quad" and v.draw_func) then
				
				local drawpos = pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z
				ang:RotateAroundAxis(ang:Up(), v.angle.y)
				ang:RotateAroundAxis(ang:Right(), v.angle.p)
				ang:RotateAroundAxis(ang:Forward(), v.angle.r)
				
				cam.Start3D2D(drawpos, ang, v.size)
					v.draw_func( self )
				cam.End3D2D()

			end
			
		end
		
	end

	SWEP.wRenderOrder = nil
	function SWEP:DrawWorldModel()
		
		if (self.ShowWorldModel == nil or self.ShowWorldModel) then
			self:DrawModel()
		end
		
		if (!self.WElements) then return end
		
		if (!self.wRenderOrder) then

			self.wRenderOrder = {}

			for k, v in pairs( self.WElements ) do
				if (v.type == "Model") then
					table.insert(self.wRenderOrder, 1, k)
				elseif (v.type == "Sprite" or v.type == "Quad") then
					table.insert(self.wRenderOrder, k)
				end
			end

		end
		
		if (IsValid(self.Owner)) then
			bone_ent = self.Owner
		else
			// when the weapon is dropped
			bone_ent = self
		end
		
		for k, name in pairs( self.wRenderOrder ) do
		
			local v = self.WElements[name]
			if (!v) then self.wRenderOrder = nil break end
			if (v.hide) then continue end
			
			local pos, ang
			
			if (v.bone) then
				pos, ang = self:GetBoneOrientation( self.WElements, v, bone_ent )
			else
				pos, ang = self:GetBoneOrientation( self.WElements, v, bone_ent, "ValveBiped.Bip01_R_Hand" )
			end
			
			if (!pos) then continue end
			
			local model = v.modelEnt
			local sprite = v.spriteMaterial
			
			if (v.type == "Model" and IsValid(model)) then

				model:SetPos(pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z )
				ang:RotateAroundAxis(ang:Up(), v.angle.y)
				ang:RotateAroundAxis(ang:Right(), v.angle.p)
				ang:RotateAroundAxis(ang:Forward(), v.angle.r)

				model:SetAngles(ang)
				//model:SetModelScale(v.size)
				local matrix = Matrix()
				matrix:Scale(v.size)
				model:EnableMatrix( "RenderMultiply", matrix )
				
				if (v.material == "") then
					model:SetMaterial("")
				elseif (model:GetMaterial() != v.material) then
					model:SetMaterial( v.material )
				end
				
				if (v.skin and v.skin != model:GetSkin()) then
					model:SetSkin(v.skin)
				end
				
				if (v.bodygroup) then
					for k, v in pairs( v.bodygroup ) do
						if (model:GetBodygroup(k) != v) then
							model:SetBodygroup(k, v)
						end
					end
				end
				
				if (v.surpresslightning) then
					render.SuppressEngineLighting(true)
				end
				
				render.SetColorModulation(v.color.r/255, v.color.g/255, v.color.b/255)
				render.SetBlend(v.color.a/255)
				model:DrawModel()
				render.SetBlend(1)
				render.SetColorModulation(1, 1, 1)
				
				if (v.surpresslightning) then
					render.SuppressEngineLighting(false)
				end
				
			elseif (v.type == "Sprite" and sprite) then
				
				local drawpos = pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z
				render.SetMaterial(sprite)
				render.DrawSprite(drawpos, v.size.x, v.size.y, v.color)
				
			elseif (v.type == "Quad" and v.draw_func) then
				
				local drawpos = pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z
				ang:RotateAroundAxis(ang:Up(), v.angle.y)
				ang:RotateAroundAxis(ang:Right(), v.angle.p)
				ang:RotateAroundAxis(ang:Forward(), v.angle.r)
				
				cam.Start3D2D(drawpos, ang, v.size)
					v.draw_func( self )
				cam.End3D2D()

			end
			
		end
		
	end

	function SWEP:GetBoneOrientation( basetab, tab, ent, bone_override )
		
		local bone, pos, ang
		if (tab.rel and tab.rel != "") then
			
			local v = basetab[tab.rel]
			
			if (!v) then return end
			
			// Technically, if there exists an element with the same name as a bone
			// you can get in an infinite loop. Let's just hope nobody's that stupid.
			pos, ang = self:GetBoneOrientation( basetab, v, ent )
			
			if (!pos) then return end
			
			pos = pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z
			ang:RotateAroundAxis(ang:Up(), v.angle.y)
			ang:RotateAroundAxis(ang:Right(), v.angle.p)
			ang:RotateAroundAxis(ang:Forward(), v.angle.r)
				
		else
		
			bone = ent:LookupBone(bone_override or tab.bone)

			if (!bone) then return end
			
			pos, ang = Vector(0,0,0), Angle(0,0,0)
			local m = ent:GetBoneMatrix(bone)
			if (m) then
				pos, ang = m:GetTranslation(), m:GetAngles()
			end
			
			if (IsValid(self.Owner) and self.Owner:IsPlayer() and 
				ent == self.Owner:GetViewModel() and self.ViewModelFlip) then
				ang.r = -ang.r // Fixes mirrored models
			end
		
		end
		
		return pos, ang
	end

	function SWEP:CreateModels( tab )

		if (!tab) then return end

		// Create the clientside models here because Garry says we can't do it in the render hook
		for k, v in pairs( tab ) do
			if (v.type == "Model" and v.model and v.model != "" and (!IsValid(v.modelEnt) or v.createdModel != v.model) and 
					string.find(v.model, ".mdl") and file.Exists (v.model, "GAME") ) then
				
				v.modelEnt = ClientsideModel(v.model, RENDER_GROUP_VIEW_MODEL_OPAQUE)
				if (IsValid(v.modelEnt)) then
					v.modelEnt:SetPos(self:GetPos())
					v.modelEnt:SetAngles(self:GetAngles())
					v.modelEnt:SetParent(self)
					v.modelEnt:SetNoDraw(true)
					v.createdModel = v.model
				else
					v.modelEnt = nil
				end
				
			elseif (v.type == "Sprite" and v.sprite and v.sprite != "" and (!v.spriteMaterial or v.createdSprite != v.sprite) 
				and file.Exists ("materials/"..v.sprite..".vmt", "GAME")) then
				
				local name = v.sprite.."-"
				local params = { ["$basetexture"] = v.sprite }
				// make sure we create a unique name based on the selected options
				local tocheck = { "nocull", "additive", "vertexalpha", "vertexcolor", "ignorez" }
				for i, j in pairs( tocheck ) do
					if (v[j]) then
						params["$"..j] = 1
						name = name.."1"
					else
						name = name.."0"
					end
				end

				v.createdSprite = v.sprite
				v.spriteMaterial = CreateMaterial(name,"UnlitGeneric",params)
				
			end
		end
		
	end
	
	local allbones
	local hasGarryFixedBoneScalingYet = false

	function SWEP:UpdateBonePositions(vm)
		
		if self.ViewModelBoneMods then
			
			if (!vm:GetBoneCount()) then return end
			
			// !! WORKAROUND !! //
			// We need to check all model names :/
			local loopthrough = self.ViewModelBoneMods
			if (!hasGarryFixedBoneScalingYet) then
				allbones = {}
				for i=0, vm:GetBoneCount() do
					local bonename = vm:GetBoneName(i)
					if (self.ViewModelBoneMods[bonename]) then 
						allbones[bonename] = self.ViewModelBoneMods[bonename]
					else
						allbones[bonename] = { 
							scale = Vector(1,1,1),
							pos = Vector(0,0,0),
							angle = Angle(0,0,0)
						}
					end
				end
				
				loopthrough = allbones
			end
			// !! ----------- !! //
			
			for k, v in pairs( loopthrough ) do
				local bone = vm:LookupBone(k)
				if (!bone) then continue end
				
				// !! WORKAROUND !! //
				local s = Vector(v.scale.x,v.scale.y,v.scale.z)
				local p = Vector(v.pos.x,v.pos.y,v.pos.z)
				local ms = Vector(1,1,1)
				if (!hasGarryFixedBoneScalingYet) then
					local cur = vm:GetBoneParent(bone)
					while(cur >= 0) do
						local pscale = loopthrough[vm:GetBoneName(cur)].scale
						ms = ms * pscale
						cur = vm:GetBoneParent(cur)
					end
				end
				
				s = s * ms
				// !! ----------- !! //
				
				if vm:GetManipulateBoneScale(bone) != s then
					vm:ManipulateBoneScale( bone, s )
				end
				if vm:GetManipulateBoneAngles(bone) != v.angle then
					vm:ManipulateBoneAngles( bone, v.angle )
				end
				if vm:GetManipulateBonePosition(bone) != p then
					vm:ManipulateBonePosition( bone, p )
				end
			end
		else
			self:ResetBonePositions(vm)
		end
		   
	end
	 
	function SWEP:ResetBonePositions(vm)
		
		if (!vm:GetBoneCount()) then return end
		for i=0, vm:GetBoneCount() do
			vm:ManipulateBoneScale( i, Vector(1, 1, 1) )
			vm:ManipulateBoneAngles( i, Angle(0, 0, 0) )
			vm:ManipulateBonePosition( i, Vector(0, 0, 0) )
		end
		
	end

	/**************************
		Global utility code
	**************************/

	// Fully copies the table, meaning all tables inside this table are copied too and so on (normal table.Copy copies only their reference).
	// Does not copy entities of course, only copies their reference.
	// WARNING: do not use on tables that contain themselves somewhere down the line or you'll get an infinite loop
	function table.FullCopy( tab )

		if (!tab) then return nil end
		
		local res = {}
		for k, v in pairs( tab ) do
			if (type(v) == "table") then
				res[k] = table.FullCopy(v) // recursion ho!
			elseif (type(v) == "Vector") then
				res[k] = Vector(v.x, v.y, v.z)
			elseif (type(v) == "Angle") then
				res[k] = Angle(v.p, v.y, v.r)
			else
				res[k] = v
			end
		end
		
		return res
		
	end
	
end