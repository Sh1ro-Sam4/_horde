if (SERVER) then
	AddCSLuaFile("cl_init.lua")
	AddCSLuaFile("shared.lua")
end

include("shared.lua")
ENT.MyModelScale = 0.75
ENT.Damage = 75
ENT.Radius = 128
function ENT:Initialize()
	self.Entity:SetModel("models/weapons/tfa_cso/w_petrol.mdl")
	self.Entity:PhysicsInit(SOLID_VPHYSICS)
	util.SpriteTrail(self, 0, Color(255,255,255), false, 7, 0.5, 0.5, 0.125, "trails/smoke.vmt")
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self.Entity:SetSolid(SOLID_VPHYSICS)
	self:SetCollisionGroup(COLLISION_GROUP_PROJECTILE)
	self:SetHealth(1)
	self:SetModelScale(self.MyModelScale,0)
	self.Entity:Ignite(10, 0)
	self.Entity:GetPhysicsObject():AddAngleVelocity(Vector(0, 0, 0))
	timer.Simple(10, function()
		if self:IsValid() then self:Remove() end
	end )
end

function ENT:Think()
	if self.Entity:WaterLevel() > 0 then self.Entity:Extinguish() end
end

function ENT:OnRemove()
	
	if self.Entity:WaterLevel() > 0 then return end
		
	for i=1,20 do
		
		local pos = self.Entity:GetPos() + Vector(math.random(-100, 100), math.random(-100, 100), 0)
		
		for _, c in pairs(ents.FindInSphere(pos, 8)) do
			if c:GetClass() == "env_fire" then return end
		end
		
		local explfire = ents.Create("env_fire")
		explfire:SetPos(pos)
		explfire:SetKeyValue("health", "20")
		explfire:SetKeyValue("firesize", "75")
		explfire:SetKeyValue("damagescale", "10")
		explfire:SetKeyValue("spawnflags", "2")
		explfire:Spawn()
		explfire:Fire("StartFire", "", 0)
		
		timer.Simple(60, function()
			if explfire:IsValid() then explfire:Remove() end
		end )
		
	end	
	
	for _, v in pairs(ents.FindInSphere(self.Entity:GetPos(), 100)) do
		if v:IsPlayer() or v:IsWorld() or v:IsWeapon() or not v:IsValid() then return end
		
		if string.find(v:GetClass(), "prop_") then
			local phys = v:GetPhysicsObject()
			if string.find(phys:GetMaterial(), "metal") then
				return
			end
		end
		
		v:Ignite(60, 100)
	end
	
end

function ENT:PhysicsCollide()
		local owent = self.Owner and self.Owner or self
		util.BlastDamage(self,owent,self:GetPos(),self.Radius,self.Damage)
		local fx = EffectData()
		fx:SetOrigin(self:GetPos())
		util.Effect("exp_petrol",fx)
		self:Remove()
end