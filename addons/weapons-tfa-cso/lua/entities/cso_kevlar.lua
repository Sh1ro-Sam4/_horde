AddCSLuaFile()

ENT.Base = "cso_supplybox_base"

ENT.PrintName = "Kevlar Vest"
ENT.Category = "TFA CS:O"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.MyModel = "models/tfa_cso/entities/kevlar_vest.mdl" -- model to use
ENT.MyModelScale = 1 -- model scale. 1 is normal size
ENT.ImpactSound = "Plastic_Box.ImpactSoft" -- physics impact sound
ENT.ShouldDrawShadow = true

ENT.GiveOnTouch = true -- give stuff if touched?
ENT.GiveArmor = true -- give armor?
ENT.ArmorGiven = 75 -- Armor given if GiveArmor is true
ENT.ArmorLimit = true -- limit max armor this ent will give? if set, this will override player:GetMaxArmor()
ENT.ArmorLimitMax = 75 -- if ArmorLimit is true, limit armor given to this value

ENT.UsedSound = "entities/tfa_cso/kevlar_vest/pickup.wav" -- sound to play when used