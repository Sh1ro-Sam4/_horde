AddCSLuaFile()

ENT.Base = "cso_supplybox_base"

ENT.PrintName = "Health Pack"
ENT.Category = "TFA CS:O"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.MyModel = "models/tfa_cso/entities/medkit.mdl" -- model to use
ENT.MyModelScale = 0.5 -- model scale. 1 is normal size
ENT.ImpactSound = "Plastic_Box.ImpactSoft" -- physics impact sound
ENT.ShouldDrawShadow = true

ENT.GiveOnTouch = true -- give stuff if touched?
ENT.GiveHealth = true -- give health?
ENT.HealthGiven = 30 -- health to heal. caps to max health.
ENT.UsedSound = "entities/tfa_cso/medkit/pickup.wav" -- sound to play when used