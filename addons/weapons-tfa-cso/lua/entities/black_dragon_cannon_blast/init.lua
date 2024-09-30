if (SERVER) then
	AddCSLuaFile("cl_init.lua")
	AddCSLuaFile("shared.lua")
end

include("shared.lua")

ENT.FireAngle = Angle(0, 0, 0)
ENT.iDamage = 3500

function ENT:Initialize()
	self.FireAngle = self:GetOwner():EyeAngles()
	local owner = self:GetOwner()
	if(IsValid(self:GetOwner())) then
		local wep = self:GetOwner():GetActiveWeapon()
		if(IsValid(wep)) then
			if(wep.ProjectileDamage != nil) then
				self.iDamage = wep.ProjectileDamage
			end
		end
		local fVec = owner:GetPos() + owner:EyeAngles():Forward() * 256
		for k,v in pairs(ents.FindInSphere(fVec, 400)) do
			if(!IsValid(v)) then continue end
			if(v == self:GetOwner()) then continue end
			if(v:GetMaxHealth() <= 0) then continue end
			local d = DamageInfo()
				d:SetDamage(self.iDamage)
				d:SetAttacker(owner)
				d:SetInflictor(self:GetOwner():GetActiveWeapon())
				d:SetDamagePosition(v:GetPos() + Vector(0, 0, 30))
				local pushVec = (v:GetPos() - self:GetOwner():GetPos()):Angle():Forward() * ((v:GetPos():Distance(self:GetOwner():GetPos())) * 2)
				d:SetDamageForce(pushVec)
				d:SetDamageType(64)
			v:TakeDamageInfo(d)
		end
		for i = 24, 1, -1 do -- Now it's just effect
			local burst = ents.Create("dragon_cannon_flame")
				burst:SetPos(owner:GetShootPos() + self.FireAngle:Forward() * math.random(-150, 60))
				burst:SetVelocity(Angle(self.FireAngle.x, self.FireAngle.y + math.random(-35, 35), 0):Forward() * math.random(800, 1000))
				burst:SetAngles(self.FireAngle)
				burst:SetOwner(owner)
				burst:Spawn()
		end
	end
	self:Remove()
end

