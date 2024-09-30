ENT.Type = "anim"
ENT.Base = "itemstore_box"

ENT.PrintName = "Huge Box"
ENT.Category = "SHZ | ItemStore"

ENT.Spawnable = true
ENT.AdminOnly = true

if SERVER then
	AddCSLuaFile()

	ENT.DefaultHealth = 100
	ENT.Model = "models/props_junk/garbage_bag001a.mdl"

	ENT.ContainerWidth = 2
	ENT.ContainerHeight = 2
	ENT.ContainerPages = 1
end
