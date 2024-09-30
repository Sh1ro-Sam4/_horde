
AddCSLuaFile()

ENT.Base = "cso_supplybox_base"

ENT.PrintName = "LMG/HMG Weapon Box"
ENT.Category = "TFA CS:O Random Weapons"
ENT.Spawnable = true

-- ENT.MyModel = "models/tfa_cso/entities/z4box.mdl"
ENT.MyModel = "models/tfa_cso/entities/supplybox_hs.mdl"
ENT.ImpactSound = "Metal_Box.ImpactHard"
ENT.ShouldDrawShadow = true

ENT.GiveOnTouch = false -- give stuff if touched?
ENT.SpawnedSound = "entities/tfa_cso/supply_box/spawn.wav" -- sound to play when spawned
ENT.UsedSound = "entities/tfa_cso/supply_box/pickup.wav" -- sound to play when used

ENT.GiveRandomWeapon = true -- give a random weapon on use?

ENT.GiveRandomWeaponAmmo = true -- give ammo for the randomly acquired weapon?
ENT.GiveRandomWeaponAmmoMultiplier = 3 -- multiplier for ammo given
ENT.RandomWeaponCategories = {
	"TFA CS:O Machine Guns"
}