if (SERVER) then
	AddCSLuaFile("cl_init.lua")
	AddCSLuaFile("shared.lua")
end

include("shared.lua")

ENT.ColorAlpha = 255
ENT.KillTime = 0
ENT.FireTime = 0
ENT.NextSound = 0
ENT.AttackTime = 0

function ENT:Initialize()
	self:SetModel("models/weapons/tfa_cso/w_cannonexdragon.mdl")
	self:PhysicsInit(SOLID_BBOX)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetCollisionGroup(1)
	self:SetMoveType(MOVETYPE_NOCLIP)
	self:SetColor(Color(255, 255, 255, 255))
	self:SetRenderMode(RENDERMODE_TRANSCOLOR)
	self:ResetSequenceInfo()
	self:SetSequence(0)
	self.AttackTime = CurTime() + 8
	self.KillTime = CurTime() + 9
end

function ENT:Think()
	local owner = self:GetOwner()
	if(IsValid(owner)) then
		if(self.KillTime < CurTime()) then
			if(owner:KeyDown(IN_ATTACK)) then
				self:Remove()
			end
		end
		local pos = owner:GetPos() + Angle(-85, owner:EyeAngles().y - 180, 0):Forward() * 100
		self:SetPos(pos)
		self:SetAngles(Angle(0, owner:EyeAngles().y, 0))
		if(self.FireTime < CurTime() && self.AttackTime > CurTime()) then
			if(self.NextSound < CurTime()) then
				self:EmitSound("weapons/tfa_cso/cannonex/cannonex_dragon_ice.wav", 50, 100, 1)
				self.NextSound = CurTime() + 0.4
			end	
			local f = ents.Create("dragonflame")
			f:SetPos(self:GetPos())
			f:SetVelocity(Angle(10, self:GetAngles().y + math.random(-5, 5), 0):Forward() * 500)
			f:SetOwner(owner)
			f:Spawn()
			self.FireTime = CurTime() + 0.08
		end
	else
		self:Remove()
	end
	self:NextThink(CurTime())
	return true
end

