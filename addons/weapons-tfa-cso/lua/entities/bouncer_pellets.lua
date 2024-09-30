ENT.Type 			= "anim"
ENT.Base 			= "base_anim"
ENT.PrintName		= "Bouncer_Pellet"
ENT.Category		= "None"

ENT.Spawnable		= false
ENT.AdminSpawnable	= false

ENT.Damage = 15
ENT.KillTime = -1

if SERVER then

	AddCSLuaFile()

	function ENT:Initialize()
		self:SetModel("models/weapons/tfa_cso/bouncer_bullet.mdl") -- Temporary model
		self:SetModelScale(0.75, 0)
		self:SetSolid(SOLID_VPHYSICS)
		self:DrawShadow(true)
		self:SetCollisionGroup(0)
		local mn, mx = self:GetModelBounds()
		self:SetCollisionBounds(mn, mx)
		self:SetMoveType(MOVETYPE_FLY)
		self:PhysicsInit(SOLID_VPHYSICS)
		local phys = self:GetPhysicsObject()
		if(IsValid(phys)) then
			phys:Wake()
			phys:EnableGravity(false)
			phys:SetVelocity(self:GetAngles():Forward() * 5000)
		end
		util.SpriteTrail(self, 0, Color(105, 105, 255), false, 3, 1, 0.5, 0, "trails/plasma")
		self.KillTime = CurTime() + 10
	end

	ENT.CollidedCounter = 0
	ENT.MaximumCollide = 3

	function ENT:PhysicsCollide(data, physobj)
		local owner = self:GetOwner()
		local cls = ""
		local collider = data.HitEntity
		sound.Play("physics/concrete/concrete_impact_bullet"..math.random(1, 4)..".wav", data.HitPos, 70, 100, 1)
		if(IsValid(collider) && collider != owner && IsValid(owner)) then
			cls = collider:GetClass()
			local d = DamageInfo()
				d:SetDamage(self.HitDamage)
				d:SetDamageType(2)
				d:SetDamagePosition(data.HitPos)
				d:SetAttacker(owner)
				d:SetInflictor(owner:GetActiveWeapon())
			collider:TakeDamageInfo(d)
		end
		if(!IsValid(collider) && cls != "bouncer_pellets") then
			self.CollidedCounter = self.CollidedCounter + 1
		end
		if(self.CollidedCounter > self.MaximumCollide) then
			self:Remove()
		end
	end
	
	function ENT:Think()
		if(self.KillTime < CurTime()) then self:Remove() end
		self:NextThink(CurTime())
		if(self:GetVelocity():Length2D() < 3500) then
			self:GetPhysicsObject():SetVelocity(self:GetVelocity() + self:GetVelocity() * 0.3)
		end
		return true
	end

end

if(CLIENT)then
	function ENT:Draw()
		self:DrawModel()
	end
end