if (SERVER) then
	AddCSLuaFile("cl_init.lua")
	AddCSLuaFile("shared.lua")
end

include("shared.lua")

ENT.AimTarget = nil
ENT.AimDST = 0
ENT.TargetWasValid = false
ENT.BlastDamage = 700
ENT.HGroup = 0

function ENT:Initialize()
	self:PhysicsInit(SOLID_BBOX)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetCollisionGroup(1)
	self:SetMoveType(MOVETYPE_NOCLIP)
	self:SetColor(Color(255, 255, 255, 255))
	self:SetRenderMode(RENDERMODE_TRANSCOLOR)
	self:SetModel("models/weapons/tfa_cso/w_xtracker_missile.mdl")
end

function ENT:Think()
	local owner = self:GetOwner()
	if(!IsValid(owner)) then self:Remove() end
	if(self.HGroup == 1) then
		self.BlastDamage = 700 * 2
	end
	if(self.HGroup >= 4 && self.HGroup <= 7) then
		self.BlastDamage = 700 * 0.5
	end
	local dmginfo = DamageInfo()
	dmginfo:SetAttacker(owner)
	dmginfo:SetInflictor(self)
	dmginfo:SetDamage(self.BlastDamage)
	dmginfo:SetDamageType(DMG_BLAST)
	dmginfo:SetDamagePosition(self:GetPos())
	if(IsValid(self.AimTarget)) then
		local mins, maxs = self.AimTarget:GetCollisionBounds()
		local vAng = ((self.AimTarget:GetPos() + Vector(0, 0, maxs.z / 2)) - self:GetPos()):Angle()
		self.AimDST = self.AimDST + 1
		self:SetAngles(vAng)
		self:SetPos(self:GetPos() + self:GetAngles():Forward() * self.AimDST)
		self.TargetWasValid = true
		if(self:GetPos():Distance((self.AimTarget:GetPos() + Vector(0, 0, maxs.z / 2))) < 64) then
			local e = EffectData()
				e:SetOrigin(self:GetPos())
			util.Effect("Explosion", e)
			util.BlastDamageInfo(dmginfo, self:GetPos(), 128)
			-- util.BlastDamage(owner, owner, self:GetPos(), 128, self.BlastDamage)
			self:Remove()
		end
	else
		if(self.TargetWasValid) then -- Remove if target was dead / invalid
			local e = EffectData()
				e:SetOrigin(self:GetPos())
				e:SetMagnitude(3)
				e:SetScale(2)
				e:SetNormal(Vector(0, 0, 1))
			util.Effect("ElectricSpark", e)
			self:Remove()
		else
			self.AimDST = self.AimDST + 2
			local fPos = owner:GetEyeTrace().HitPos
			local vPos = (fPos - self:GetPos()):Angle():Forward() * self.AimDST
			self:SetPos(self:GetPos() + vPos)
			if(fPos:Distance(self:GetPos()) < 64) then
				local e = EffectData()
				e:SetOrigin(self:GetPos())
				util.Effect("Explosion", e)
				util.BlastDamageInfo(dmginfo, self:GetPos(), 128)
				-- util.BlastDamage(owner, owner, self:GetPos(), 128, self.BlastDamage)
			self:Remove()
			end
			for k,v in pairs(ents.GetAll()) do
				if(!IsValid(v)) then continue end
				if(!v:IsPlayer() && !v:IsNPC()) then continue end
				if(v == owner) then continue end
				local mins, maxs = v:GetCollisionBounds()
				local tr = {
					start = self:GetPos(),
					endpos = v:GetPos() + Vector(0, 0, maxs.z / 2),
					filter = {v, self},
				}
				local ret = util.TraceLine(tr)
				if(ret.Fraction != 1) then continue end
				self.AimTarget = v
			end
		end
	end

	self:NextThink(CurTime())
	return true
end

