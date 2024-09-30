if (SERVER) then
	AddCSLuaFile("cl_init.lua")
	AddCSLuaFile("shared.lua")
end

include("shared.lua")
ENT.KillTime = 0
ENT.NextSirenTime = 0

function ENT:Initialize()
	self:SetCollisionGroup(1)
	self:SetColor(Color(255, 255, 255, 255))
	self:SetModel("models/effects/tfa_cso/bunkerbuster_target.mdl")
	self.KillTime = CurTime() + 50
	self:DrawShadow(false)
end

function ENT:Think()
	self:SetAngles(self:GetAngles() + Angle(0, 1, 0))
	if(self.NextSirenTime < CurTime()) then
		self:EmitSound("weapons/tfa_cso/bunker_buster/target_siren.wav")
		self.NextSirenTime = CurTime() + 0.5
	end
	if(self.KillTime < CurTime()) then
		self:Remove()
	end
	self:NextThink(CurTime())
	return true
end

