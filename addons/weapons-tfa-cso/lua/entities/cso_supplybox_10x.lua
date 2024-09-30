AddCSLuaFile()

ENT.Base = "cso_supplybox_base"

ENT.PrintName = "Supply Box x10"
ENT.Category = "TFA CS:O"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.MyModel = "models/tfa_cso/entities/supplybox_hs.mdl"
ENT.ImpactSound = "Metal_Box.ImpactHard"
ENT.ShouldDrawShadow = true

ENT.GiveAmmo = true -- give ammo?
ENT.AmmoMultiplier = 10 -- ammo to give if GiveAmmo is true
ENT.GiveOnTouch = false -- give stuff if touched?
ENT.SpawnedSound = "entities/tfa_cso/supply_box/spawn.wav" -- sound to play when spawned
ENT.UsedSound = "entities/tfa_cso/supply_box/pickup.wav" -- sound to play when used

--- Health

ENT.GiveHealth = true -- give health?
ENT.HealthGiven = 100 -- health given if GiveHealth is true
ENT.HealthLimit = false -- limit max health this ent will give? if set, this will override player:GetMaxHealth()
ENT.HealthLimitMax = 100 -- if HealthLimit is true, limit health given to this value

--- Armor

ENT.GiveArmor = true -- give armor?
ENT.ArmorGiven = 100 -- Armor given if GiveArmor is true
ENT.ArmorLimit = false -- limit max armor this ent will give? if set, this will override player:GetMaxArmor()
ENT.ArmorLimitMax = 100 -- if ArmorLimit is true, limit armor given to this value