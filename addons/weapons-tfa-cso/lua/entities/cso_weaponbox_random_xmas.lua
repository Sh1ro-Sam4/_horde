AddCSLuaFile()

ENT.Base = "cso_supplybox_base"

ENT.PrintName = "Christmas Weapon Box (XMAS Weapons)"
ENT.Category = "TFA CS:O Random Weapons"
ENT.Spawnable = true
-- ENT.MyModel = "models/tfa_cso/entities/z4box.mdl"
ENT.MyModel = "models/tfa_cso/entities/supplybox_xmas.mdl"
ENT.ImpactSound = "Plastic_Box.ImpactSoft"
ENT.ShouldDrawShadow = true

ENT.GiveOnTouch = false -- give stuff if touched?
ENT.SpawnedSound = "entities/tfa_cso/supply_box/spawn.wav" -- sound to play when spawned
ENT.UsedSound = "entities/tfa_cso/supply_box/pickup.wav" -- sound to play when used

ENT.GiveRandomWeapon = true -- give a random weapon on use?
ENT.UseRandomWeaponTable = true -- use ENT.RandomWeaponTable instead of every category?
ENT.RandomWeaponTable = { -- THIS IS A TABLE. classnames to use for giving random weapons. Only works if ENT.GiveRandomWeapon and ENT.UseRandomWeaponTable are true.
 "tfa_cso_m95_xmas",
 "tfa_cso_m134_xmas",
 "tfa_cso_m1887_xmas",
 "tfa_cso_mg3_xmas",
 "tfa_cso_mg36_xmas",
 "tfa_cso_tomahawk_xmas"
}

ENT.GiveRandomWeaponAmmo = true -- give ammo for the randomly acquired weapon?
ENT.GiveRandomWeaponAmmoMultiplier = 3 -- multiplier for ammo given