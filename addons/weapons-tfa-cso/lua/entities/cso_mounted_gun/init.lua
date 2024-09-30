if (SERVER) then
	AddCSLuaFile("cl_init.lua")
	AddCSLuaFile("shared.lua")
end

include("shared.lua")

ENT.CurrentUser = nil
ENT.LastOwner = nil
ENT.CurrentAmmo = 250
ENT.RegenTimer = 0
ENT.TimeToRegen = 0
ENT.ShouldRemoveUserWeapon = false
ENT.ShouldGiveUserWeapon = false
ENT.OriginalAngle = Angle(0, 0, 0)

function ENT:Initialize()
	self:SetModel("models/tfa_cso/emplacement/w_csomountgun.mdl")
	self:SetModelScale(1.2, 0)
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetCollisionGroup(15)

	local phys = self:GetPhysicsObject()
	self:SetCollisionGroup(15)
	if(IsValid(phys)) then
		phys:Wake()
		phys:EnableMotion(false)
	end 
	self:SetAngles(self:GetAngles() - Angle(0, 180, 0))
	timer.Simple(0.08, function() self.OriginalAngle = self:GetAngles() end)
end

function ENT:Think()
	if(self.CurrentAmmo < 250) then
		if(self.TimeToRegen < CurTime()) then
			if(self.RegenTimer < CurTime()) then
				self.CurrentAmmo = self.CurrentAmmo + 1
				self.RegenTimer = CurTime() + 0.33
			end
		end
	end
	if(IsValid(self.CurrentUser)) then
		local vAngle = self.CurrentUser:EyeAngles()
		local sAngle = self.OriginalAngle
		vAngle:Normalize()
		sAngle:Normalize()
		local diff = math.abs(math.abs(sAngle.y) - math.abs(vAngle.y))
		if(diff >= 90) then
			--self.CurrentUser:SetEyeAngles(LerpAngle(0.2, Angle(vAngle.x, vAngle.y, 0), Angle(vAngle.x, sAngle.y, 0)))
		end

		if(self.TimeToRegen < CurTime()) then
			if(IsValid(self.CurrentUser:GetActiveWeapon())) then
				if(self.CurrentUser:GetActiveWeapon():GetClass() == "tfa_cso_mountedgun") then
					self.CurrentUser:GetActiveWeapon():SetClip1(self.CurrentAmmo)
				end
			end
		end
		self.ShouldRemoveUserWeapon = true
		self:SetAngles(Angle(0, self.CurrentUser:EyeAngles().y * 0.8, 0))
		if(self.ShouldGiveUserWeapon) then
			self.CurrentUser:SetActiveWeapon(nil)
			self.CurrentUser:Give("tfa_cso_mountedgun")
			timer.Simple(0.1, function()
				if(!IsValid(self.CurrentUser)) then return end
				for k,v in pairs(self.CurrentUser:GetWeapons()) do
					if(!IsValid(v)) then continue end
					if(v:GetClass() != "tfa_cso_mountedgun") then continue end
					self.CurrentUser:SetActiveWeapon(v)
					v:SetClip1(self.CurrentAmmo)
				end
			end)
			self.ShouldGiveUserWeapon = false
			if(!self.CurrentUser:Alive()) then
				self.CurrentUser = nil
			end
		end
		if(!self.CurrentUser:Alive()) then
			self.CurrentUser:SetNWEntity("CSO_MountGun", Entity(0))
			self.CurrentUser = nil
		end
	else
		self.ShouldGiveUserWeapon = true
		if(self.ShouldRemoveUserWeapon) then
			self:SetAngles(self.OriginalAngle)
			if(IsValid(self.LastOwner)) then
				for k,v in pairs(self.LastOwner:GetWeapons()) do
					if(!IsValid(v)) then continue end
					if(v:GetClass() != "tfa_cso_mountedgun") then continue end
					v:Remove()
				end
				timer.Simple(0.07, function()
					self.LastOwner:SetNWEntity("CSO_MountGun", Entity(0))
				end)
			end
			self.ShouldRemoveUserWeapon = false
		end
	end
	self:NextThink(CurTime())
	return true
end

function ENT:OnRemove()
	if(IsValid(self.CurrentUser)) then
		for k,v in pairs(self.CurrentUser:GetWeapons()) do
			if(!IsValid(v)) then continue end
			if(v:GetClass() != "tfa_cso_mountedgun") then continue end
			v:Remove()
		end
		self.CurrentUser:SetNWEntity("CSO_MountGun", Entity(0))
	end
end

