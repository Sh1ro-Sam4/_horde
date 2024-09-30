if (SERVER) then
	AddCSLuaFile("cl_init.lua")
	AddCSLuaFile("shared.lua")
end

include("shared.lua")

ENT.ColorAlpha = 255
ENT.KillTime = 0

function ENT:Initialize()
	self:SetModel("models/effects/tfa_cso/ef_swordbombard_slashb.mdl")
	self:PhysicsInit(SOLID_BBOX)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetCollisionGroup(0)
	self:SetColor(Color(255, 255, 255, 255))
	self:SetRenderMode(RENDERMODE_TRANSCOLOR)
	self:PhysicsInitBox(Vector(-50, -50, -10), Vector(50, 50, 10), "default")
	local phys = self:GetPhysicsObject()
	if(IsValid(phys)) then
		phys:Wake()
		self:PhysWake()
	end
	self.KillTime = CurTime() + 0.12
	timer.Simple(0.0, function() self:SetMoveType(MOVETYPE_NOCLIP) end)
end

function ENT:Think()
	self:SetColor(Color(255, 255, 255, self.ColorAlpha))
	if(!self:IsInWorld()) then self:Remove() end
	if(self.KillTime < CurTime()) then
		self.ColorAlpha = math.Clamp(self.ColorAlpha - 25, 0, 255)
		if(self.ColorAlpha <= 0) then
			self:Remove()
		end
	end
	local owner = self:GetOwner()
	for k,v in pairs(ents.FindInSphere(self:GetPos(), 86)) do
		if(!IsValid(v)) then continue end
		if(v:Health() <= 0) then continue end
		if(owner == v) then continue end
		local d = DamageInfo()
			d:SetDamage(700)
			if(IsValid(owner)) then
				d:SetAttacker(owner)
				d:SetInflictor(owner)
			else
				d:SetAttacker(self)
				d:SetInflictor(self)
			end
			d:SetDamageType(4)
			d:SetDamageForce(self:GetAngles():Forward() * 12000)
			d:SetDamagePosition(v:GetPos())
		v:TakeDamageInfo(d)
	end
	self:NextThink(CurTime())
	return true
end

