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
		self.dmg:SetDamage( 47.5 * 1.25 )
		self.dmg:SetDamageType( DMG_AIRBOAT )
		self.dmg:SetAttacker( self.Owner )
		self.dmg:SetInflictor( self.Entity )
	end

	function ENT:Touch( entity ) 
		if not entity:IsValid() then return end
		if entity == self.Owner then return end
		if self.Exploded == true then return end
		
		entity:TakeDamageInfo( self.dmg )
	
		if entity:GetOwner():IsValid() then
			if entity:GetOwner() ~= entity then
				entity:GetOwner():TakeDamageInfo(self.dmg)
			end
		end

				
		self:Explosion()

	end
	
	function ENT:PhysicsCollide()
	timer.Simple(0, function()
		self:Explosion()	
			end)
	end
	
	function ENT:Think()
		if self.Exploded == false then
		if self.LifeTime < CurTime() then
			self:Explosion()
		end
		
		local tr = {}
		
		tr.start = self:GetPos()
		tr.endpos = tr.start - self:GetVelocity()
		tr.filter = self
		tr.mask = MASK_SHOT_HULL
		tr.mins = Vector( -10, -10, -10 )
		tr.maxs = Vector( 10, 10, 10 )
		local trace = util.TraceHull(tr)
		
		local entity = trace.Entity
		
		if entity:IsValid() and entity != self:GetOwner() and !(entity:GetOwner():IsValid() and entity:GetOwner() == self:GetOwner()) then
		--print(entity)
		entity:TakeDamageInfo( self.dmg )
		self.ActTime = self.ActTime - 1
		local fx = EffectData()
		fx:SetEntity(self.Owner)
		fx:SetOrigin(self.Entity:GetPos())
		fx:SetColor(2)
		util.Effect("effect_terrasplode",fx)
	
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
		--if( game.SinglePlayer() or SERVER ) then
	self.Exploded = true
				local fx = EffectData()
	fx:SetEntity(self.Owner)
	fx:SetOrigin(self.Entity:GetPos())
	fx:SetColor(2)
	util.Effect("effect_terrasplode",fx)
	--util.BlastDamage(self, self.Owner, self.Entity:GetPos(), 15, 95 * 1.25)
	self.Entity:EmitSound("Terrahit")
	self:SetMoveType( MOVETYPE_NONE )
	self:SetSolid( SOLID_NONE )
		--end
	timer.Simple(1, function()
		self.Entity:Remove()
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

	end
end 