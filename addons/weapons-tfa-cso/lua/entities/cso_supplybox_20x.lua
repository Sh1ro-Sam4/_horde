AddCSLuaFile()

ENT.Base = "cso_supplybox_base"

ENT.PrintName = "Luxury Supply Box x20"
ENT.Category = "TFA CS:O"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.AdminOnly = true
ENT.MyModel = "models/tfa_cso/entities/box_renewal01.mdl"
ENT.ImpactSound = "Metal_Box.ImpactHard"
ENT.ShouldDrawShadow = true

ENT.GiveAmmo = true -- give ammo?
ENT.AmmoMultiplier = 20 -- ammo to give if GiveAmmo is true
ENT.GiveOnTouch = false -- give stuff if touched?
ENT.SpawnedSound = "entities/tfa_cso/supply_box/spawn.wav" -- sound to play when spawned
ENT.UsedSound = "entities/tfa_cso/supply_box/pickup.wav" -- sound to play when used

--- Health

ENT.GiveHealth = true -- give health?
ENT.HealthGiven = 1000 -- health given if GiveHealth is true
ENT.HealthLimit = true -- limit max health this ent will give? if set, this will override player:GetMaxHealth()
ENT.HealthLimitMax = 1000 -- if HealthLimit is true, limit health given to this value

--- Armor

ENT.GiveArmor = true -- give armor?
ENT.ArmorGiven = 100 -- Armor given if GiveArmor is true
ENT.ArmorLimit = false -- limit max armor this ent will give? if set, this will override player:GetMaxArmor()
ENT.ArmorLimitMax = 100 -- if ArmorLimit is true, limit armor given to this value

