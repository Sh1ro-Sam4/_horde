ENT.Type = "anim"
ENT.Base = "itemstore_box"

ENT.PrintName = "Large Box"
ENT.Category = "SHZ | ItemStore"

ENT.Spawnable = true
ENT.AdminOnly = true

if SERVER then
	AddCSLuaFile()

	ENT.DefaultHealth = 100
	ENT.Model = "models/props/cs_office/cardboard_box01.mdl"

	ENT.ContainerWidth = 6
	ENT.ContainerHeight = 2
	ENT.ContainerPages = 1
end
