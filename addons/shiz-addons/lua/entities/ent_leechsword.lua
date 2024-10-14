AddCSLuaFile()

ENT.Type = "anim"

ENT.Base = "base_gmodentity"
ENT.PrintName = ""
ENT.Spawnable = false

ENT.Author = "Jade"

ENT.AdminSpawnable = false

if SERVER then 

	ENT.ActTime = nil
	ENT.LifeTime = nil
	ENT.dmg = nil
	ENT.velo = Vector(0, 0, 0)
	ENT.target = nil
	ENT.coloride = Color(0, 0, 0)
	ENT.Exploded = false

	function ENT:Initialize()
		self.Entity:SetModel("models/props_junk/watermelon01.mdl")

		self.Entity:PhysicsInit(SOLID_VPHYSICS)
		self.Entity:SetMoveType(MOVETYPE_VPHYSICS)
		self.Entity:SetSolid(SOLID_VPHYSICS)
		self.Entity:SetCollisionGroup(COLLISION_GROUP_DEBRIS)
		self.Entity:SetTrigger( true )
		self.Entity:DrawShadow( false )



		local phys = self.Entity:GetPhysicsObject()
		if(phys:IsValid()) then 
			--phys:SetMaterial( "gmod_bouncy" )
			phys:SetMass( 100 )
			phys:EnableDrag( false )
			phys:SetDragCoefficient( 0 )
			phys:EnableGravity( false )
			phys:Wake() 
		end
		self.LifeTime = CurTime() + 3
		self.ActTime = 3
		self.dmg = DamageInfo()
		self.dmg:SetDamage( 475 * 1.25 )
		self.dmg:SetDamageType( DMG_AIRBOAT )
		self.dmg:SetAttacker( self.Owner )
		self.dmg:SetInflictor( self.Entity )
	end

	function ENT:Touch( entity ) 
		if not entity:IsValid() then return end
		
		if self.Exploded == true then return end
		if entity == self.Owner then self:Explosion() end
		

	end
	
	function ENT:GetHeadPos(ent)
    local model = ent:GetModel() or ""
    if model:find("crow") or model:find("seagull") or model:find("pigeon") then
        return ent:LocalToWorld(ent:OBBCenter() + Vector(0,0,-5))
    elseif ent:GetAttachment(ent:LookupAttachment("eyes")) ~= nil then
        return ent:GetAttachment(ent:LookupAttachment("eyes")).Pos
    else
        return ent:LocalToWorld(ent:OBBCenter())
    end
	end
	
	function ENT:Think()
		
		local phys = self.Entity:GetPhysicsObject()
		if(phys:IsValid()) then 
			if self.target != nil then
				if self.target:IsValid() then --and self.target:Health() > 0 then
					local aimvecc = self:GetHeadPos(self.target) - self:GetPos()
					phys:AddVelocity(self.Entity:GetVelocity() * -0.9 + aimvecc:GetNormalized() * 1000)
				else
					self.target = nil
				end
			end
		end
	end
	
	function ENT:Explosion()
	if self.Exploded == false then
		--if( game.SinglePlayer() or SERVER ) then
	self.Exploded = true
	--util.BlastDamage(self, self.Owner, self.Entity:GetPos(), 15, 95 * 1.25)
	self:SetMoveType( MOVETYPE_NONE )
	self:SetSolid( SOLID_NONE )
		--end
	timer.Simple(1, function() if IsValid(self.Entity) then
		self.Entity:Remove()
		end
	end)
	end	
	end
end

if CLIENT then
	function ENT:Initialize()

	end

	function ENT:Draw()
		--render.SuppressEngineLighting(true)
		--self.Entity:DrawModel()
		--render.SuppressEngineLighting(false)
	end

	function ENT:Think()
			local dlight = DynamicLight( self:EntIndex() )	
			if ( dlight ) then
				dlight.pos = self:GetPos()
				dlight.r = 255
				dlight.g = 0
				dlight.b = 0
				dlight.brightness = 5
				dlight.Decay = 700
				dlight.Size = 64
				dlight.DieTime = CurTime() + 0.1
			end
	end
end 