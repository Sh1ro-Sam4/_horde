AddCSLuaFile()

ENT.Base 		= "base_gmodentity"
ENT.Type 		= "anim"
ENT.PrintName 	= "Spawned Weapon"

ENT.Model 		= "models/weapons/w_smg1.mdl"

ENT.WeaponClass = "weapon_smg1"

if CLIENT then return end

function ENT:Initialize()

	self.BaseClass:Initialize()

	self:SetModel(self.Model)

	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetCollisionGroup(COLLISION_GROUP_DEBRIS_TRIGGER)

	self:PhysWake()

	self:Activate()
	
	self:SetUseType(SIMPLE_USE)
	
end

function ENT:Use(activator, caller, usetype, value)
	local Class = self.WeaponClass
	local Wep = activator:GetWeapon(Class)
	print(Class)
	activator:Give(Class)

	self:Remove()

end
