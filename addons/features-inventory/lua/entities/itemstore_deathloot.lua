ENT.Type = "anim"
ENT.Base = "itemstore_box"

ENT.PrintName = "Сумка после смерти"
ENT.Category = "SHZ | ItemStore"

ENT.Spawnable = false
ENT.AdminOnly = false

if SERVER then
	AddCSLuaFile()

	ENT.DefaultHealth = 100
	ENT.Model = "models/props_c17/SuitCase_Passenger_Physics.mdl"

	ENT.ContainerWidth = 6
	ENT.ContainerHeight = 4
	ENT.ContainerPages = 1

	ENT.Timeout = 0

	function ENT:Think()
		if self.Timeout < CurTime() then self:Remove() end
	end
end
