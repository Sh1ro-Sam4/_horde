AddCSLuaFile()

ENT.Base = "cso_supplybox_base"

ENT.PrintName = "Halloween Weapon Box"
ENT.Category = "TFA CS:O Random Weapons"
ENT.Spawnable = true
-- ENT.MyModel = "models/tfa_cso/entities/z4box.mdl"
ENT.MyModel = "models/tfa_cso/entities/supplybox_halloween.mdl"
ENT.ImpactSound = "Plastic_Box.ImpactSoft"
ENT.ShouldDrawShadow = true

ENT.GiveOnTouch = false -- give stuff if touched?
ENT.SpawnedSound = "entities/tfa_cso/supply_box/spawn.wav" -- sound to play when spawned
ENT.UsedSound = "entities/tfa_cso/supply_box/pickup.wav" -- sound to play when used

ENT.GiveRandomWeapon = true -- give a random weapon on use?
ENT.UseRandomWeaponTable = true -- use ENT.RandomWeaponTable instead of every category?
ENT.RandomWeaponTable = { -- THIS IS A TABLE. classnames to use for giving random weapons. Only works if ENT.GiveRandomWeapon and ENT.UseRandomWeaponTable are true.
'tfa_cso_gungnirex',
'tfa_cso_dreadnova',
'tfa_cso_voidpistolex',
'tfa_cso_jetgunex',
'tfa_cso_chameleongun',
'tfa_cso_paladin',
'tfa_cso_plasmagun',
'tfa_cso_laserfist',
'tfa_cso_bouncer',
'tfa_cso_savery',
'tfa_cso_thunderbolt',
}

ENT.GiveRandomWeaponAmmo = true -- give ammo for the randomly acquired weapon?
ENT.GiveRandomWeaponAmmoMultiplier = 3 -- multiplier for ammo given