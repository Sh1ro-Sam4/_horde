if (SERVER) then
	AddCSLuaFile("cl_init.lua")
	AddCSLuaFile("shared.lua")
end

include("shared.lua")
ENT.NextSirenTime = 0
ENT.TargetList = {}
ENT.sAlpha = 255
ENT.StartFade = false
ENT.ePos = Vector(0, 0, 0)

function ENT:Initialize()
	self:SetModel("models/tfa_cso/entities/b52.mdl")
	self:SetModelScale(3, 0)
	self:SetCollisionGroup(1)
	self:SetRenderMode(RENDERGROUP_TRANSLUCENT)
	self:SetColor(Color(255, 255, 255, 255))
end

function ENT:Think()
	if(!IsValid(self:GetOwner())) then self:Remove() end
	local cPos = self:GetPos()
	cPos.z = 0
	for k,v in next, self.TargetList do
		if(cPos:Distance(v[1]) > 128 || v[2]) then continue end
		local m = ents.Create("bunkerbuster_missile")
			m:SetPos(v[1] + Vector(0, 0, self:GetPos().z))
			m:Spawn()
			local tr = {
				start = v[1] + Vector(0, 0, self:GetPos().z),
				endpos = v[1] - Vector(0, 0, 1024000000),
				filter = {self, m},
				mask = MASK_SHOT,
			}
			local ret = util.TraceLine(tr).HitPos
			m.TargetAxis = ret
			m:SetOwner(self:GetOwner())
			if(k == 1) then
				m.FirstMissile = true
			end
		v[2] = true
	end
	if(cPos:Distance(self.ePos) < 128) then
		self.StartFade = true
	end
	self:SetPos(self:GetPos() + self:GetAngles():Forward() * 32)
	self:NextThink(CurTime())
	if(self.sAlpha <= 0) then
		self:Remove()
	end
	if(self.StartFade) then
		self.sAlpha = math.Clamp(self.sAlpha - 3, 0, 255)
	end
	self:SetColor(Color(255, 255, 255, self.sAlpha))
	return true
end

