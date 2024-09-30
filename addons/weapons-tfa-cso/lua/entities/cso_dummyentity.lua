-- This is not a usable entity, it's a fake entity to make guns shoot nothing.

ENT.Type 			= "anim"
ENT.Base 			= "base_anim"
ENT.PrintName		= "NULL"
ENT.Category		= "None"

ENT.Spawnable		= false
ENT.AdminSpawnable	= false


if SERVER then
	AddCSLuaFile()
	function ENT:Initialize()
		self:Remove()
	end
end