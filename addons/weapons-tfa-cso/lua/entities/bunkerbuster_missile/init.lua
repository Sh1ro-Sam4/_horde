if (SERVER) then
	AddCSLuaFile("cl_init.lua")
	AddCSLuaFile("shared.lua")
end

include("shared.lua")
ENT.KillTime = 0
ENT.NextSirenTime = 0
ENT.FirstMissile = false
ENT.Damage = (engine.ActiveGamemode() == "zombiesurvival" and 4250) or 3500
ENT.Radius = (engine.ActiveGamemode() == "zombiesurvival" and 768) or 512

function ENT:Initialize()
	self:SetModel("models/weapons/tfa_cso/bunkerbuster_missile.mdl")
	self:SetCollisionGroup(1)
	self:SetColor(Color(255, 255, 255, 255))
	self:SetAngles(Angle(90, 0, 0))
	self.KillTime = CurTime() + 10
	self:EmitSound("weapons/tfa_cso/bunker_buster/whistling"..math.random(1, 3)..".wav")
end

function ENT:Think()
	local owner = self:GetOwner()
	if(!IsValid(owner)) then self:Remove() end
	self:SetPos(self:GetPos() + self:GetAngles():Forward() * 64)

	if(self.TargetAxis:Distance(self:GetPos()) < 72) then
		local e = EffectData()
		if(self.FirstMissile) then
			sound.Play("weapons/tfa_cso/bunker_buster/exp1.wav", self.TargetAxis, 160, 100, 1)
		else
			sound.Play("weapons/tfa_cso/bunker_buster/exp2.wav", self.TargetAxis, 160, 100, 1)
		end
		e:SetOrigin(self.TargetAxis)

		local dmginfo = DamageInfo()
		dmginfo:SetAttacker(owner)
		dmginfo:SetInflictor(self)
		dmginfo:SetDamage(self.Damage)
		dmginfo:SetDamageType(DMG_BLAST)

		util.BlastDamageInfo(dmginfo, self.TargetAxis, self.Radius)

		-- util.BlastDamage(self, owner, self.TargetAxis, 512, 3500)

		util.Effect("exp_bunkerbuster", e)
		self:Remove()

		for k,v in pairs(ents.FindByClass("bunkerbuster_target")) do
			if(!IsValid(v)) then continue end
			local cPos = v:GetPos()
			cPos.z = self.TargetAxis.z
			if(cPos:Distance(self.TargetAxis) > 76) then continue end
			v:Remove()
		end

		for i = 1, 8 do
		local pos = self.TargetAxis + Vector(math.random(-128, 128), math.random(-128, 128), 0)
			local explfire = ents.Create("env_fire")
				explfire:SetPos(pos)
				explfire:SetKeyValue("firesize", "100")
				explfire:SetKeyValue("damagescale", "20")
				explfire:SetKeyValue("spawnflags", "2")
				explfire:Spawn()
				explfire:Fire("StartFire", "", 0)
		timer.Simple(10, function()
			if(!IsValid(explfire)) then return end
			explfire:Remove()
		end)
		end	
	end
	if(self.KillTime < CurTime()) then
		self:Remove()
	end
	self:NextThink(CurTime())
	return true
end

