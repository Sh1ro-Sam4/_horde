AddCSLuaFile()

ENT.Type = "anim"

ENT.Base = "base_gmodentity"
ENT.PrintName = ""
ENT.Spawnable = false

ENT.Author = "Jade"

ENT.AdminSpawnable = false
ENT.Angel = 0

if SERVER then 

	ENT.ActTime = nil
	ENT.LifeTime = nil
	ENT.dmg = nil
	ENT.velo = Vector(0, 0, 0)
	ENT.target = nil
	ENT.coloride = Color(0, 0, 0)
	ENT.Exploded = false

	function ENT:Initialize()
		self.Entity:SetModel("models/death sickle/light_sickle.mdl")

		self.Entity:PhysicsInit(SOLID_VPHYSICS)
		self.Entity:SetMoveType(MOVETYPE_VPHYSICS)
		self.Entity:SetSolid(SOLID_VPHYSICS)
		self.Entity:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
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
		self.ActTime = 6
		self.dmg = DamageInfo()
		self.dmg:SetDamage( 28.5 )
		self.dmg:SetDamageType( DMG_AIRBOAT )
		self.dmg:SetAttacker( self.Owner )
		self.dmg:SetInflictor( self.Entity )
	end

	function ENT:Touch( entity ) 
		if not entity:IsValid() then return end
		if entity == self.Owner then return end
		if self.Exploded == true then return end
		
		--if entity:IsValid() and entity != self:GetOwner() and !(entity:GetOwner():IsValid() and entity:GetOwner() == self:GetOwner()) then
		--print(entity)
		--entity:TakeDamageInfo( self.dmg )
		--self.ActTime = self.ActTime - 1
	
		--	if entity:GetOwner():IsValid() then
		--		if entity:GetOwner() ~= entity then
		--			entity:GetOwner():TakeDamageInfo(self.dmg)
					
		--		end
		--	end
		
		--end
		
		--if self.ActTime < 1 then
		--	self:Explosion()
		--end

	end
	
	function ENT:Think()
		if self.Exploded == false then
		if self.LifeTime < CurTime() then
			self:Explosion()
		end
		
		local fx = EffectData()
		fx:SetEntity(self.Owner)
		fx:SetOrigin(self.Entity:GetPos())
		fx:SetNormal(self.Entity:GetAngles():Forward())
		fx:SetColor(2)
		util.Effect("effect_sickleparts",fx)
		
		local velo = self.Entity:GetVelocity()
		
		local phys = self.Entity:GetPhysicsObject()
		if(phys:IsValid()) then 
			phys:SetVelocity(velo * 0.6)
		end
		
		local tr = {}
		tr.endpos = self:GetPos()
		tr.start = tr.endpos - self:GetVelocity()
		
		tr.filter = self
		tr.mask = MASK_SHOT_HULL
		local trace = util.TraceEntity( tr, self.Entity )
		
		local entity = trace.Entity
		
		if entity:IsValid() and entity != self:GetOwner() and !(entity:GetOwner():IsValid() and entity:GetOwner() == self:GetOwner()) then
		--print(entity)
		entity:TakeDamageInfo( self.dmg )
		self.ActTime = self.ActTime - 1
		
	
			if entity:GetOwner():IsValid() then
				if entity:GetOwner() ~= entity then
					entity:GetOwner():TakeDamageInfo(self.dmg)
					
				end
			end
		
		end
		
		if self.ActTime < 1 then
			self:Explosion()
		end
		end
	end
	
	function ENT:Explosion()
		if self.Exploded == false then
			self.Entity:Remove()
		end	
	end
end

if CLIENT then
	function ENT:Initialize()

	end

	function ENT:Draw()
		render.SuppressEngineLighting(true)
		--local modl = "waa"
		local angl = self.Entity:GetAngles()
		angl.p = self.Angel
		self.Entity:SetAngles( angl )
		self.Entity:DrawModel()
		--print(modl)
		
		self.Angel = self.Angel + 10
		render.SuppressEngineLighting(false)
	end

	function ENT:Think()
			local dlight = DynamicLight( self:EntIndex() )	
			if ( dlight ) then
				dlight.pos = self:GetPos()
				dlight.r = 128
				dlight.g = 0
				dlight.b = 255
				dlight.brightness = 5
				dlight.Decay = 700
				dlight.Size = 64
				dlight.DieTime = CurTime() + 0.1
			end
	end
end 