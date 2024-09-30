-- DO NOT COPY THIS FILE WHEN MAKING NEW ITEMS.
-- Take one of the normal item lua files, and tweak its values instead.

AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.PrintName = "SupplyBase"
ENT.Category = "TFA CS:O"
ENT.Spawnable = false
ENT.AdminSpawnable = false
ENT.MyModel = "models/props_junk/PlasticCrate01a.mdl" -- model to use
ENT.MyModelScale = 1 -- model scale. 1 is normal size
ENT.ImpactSound = "Metal_Box.ImpactHard" -- physics impact sound
ENT.ShouldDrawShadow = true

ENT.Skin = 0 -- What skin to use? Model used must support skins!
ENT.RandomSkin = false -- Use a random skin instead of a preset skin?
ENT.RandomSkinMax = 1 -- Max skin index to use

ENT.GiveHealth = false -- give health?
ENT.HealthGiven = 25 -- health given if GiveHealth is true
ENT.HealthLimit = false -- limit max health this ent will give? if set, this will override player:GetMaxHealth()
ENT.HealthLimitMax = 100 -- if HealthLimit is true, limit health given to this value

ENT.GiveArmor = false -- give armor?
ENT.ArmorGiven = 25 -- Armor given if GiveArmor is true
ENT.ArmorLimit = false -- limit max armor this ent will give? if set, this will override player:GetMaxArmor()
ENT.ArmorLimitMax = 100 -- if ArmorLimit is true, limit armor given to this value

ENT.GiveAmmo = false -- give ammo?
ENT.AmmoMultiplier = 3 -- ammo to give if GiveAmmo is true

ENT.GiveRandomWeapon = false -- give a random weapon on use?
ENT.UseRandomWeaponTable = false -- use ENT.RandomWeaponTable instead of every category?
ENT.RandomWeaponTable = nil -- THIS IS A TABLE. classnames to use for giving random weapons. Only works if ENT.GiveRandomWeapon and ENT.UseRandomWeaponTable are true.
-- Example usage:
-- ENT.RandomWeaponTable = {"tfa_cso_guardian",
-- "tfa_cso_m95tiger",
-- "tfa_cso_laserfist",
-- "tfa_cso_paladin_v6",
-- "tfa_cso_rainbowkata",
-- "tfa_cso_dualsword_rb",
-- "tfa_cso_m249phoenix",
-- "tfa_cso_gungnir"
-- }
ENT.GiveRandomWeaponAmmo = false -- give ammo for the randomly acquired weapon?
ENT.GiveRandomWeaponAmmoMultiplier = 3 -- multiplier for ammo given
ENT.RandomWeaponCategories = nil -- THIS IS A TABLE. categories to look for when giving random weapons. Does nothing if ENT.UseRandomWeaponTable is true.
-- Example usage:
-- ENT.RandomWeaponCategories = {
--  "TFA CS:O Pistols",
--  "TFA CS:O SMGs",
--  "TFA CS:O Shotguns",
-- 	"TFA CS:O Rifles",
-- 	"TFA CS:O Sniper Rifles",
-- 	"TFA CS:O Machine Guns",
-- 	"TFA CS:O Equipment",
-- 	"TFA CS:O Melees"
-- }

ENT.GiveOnTouch = false -- give stuff if touched?

ENT.SpawnedSound = "common/null.wav" -- sound to play when spawned
ENT.UsedSound = "common/null.wav" -- sound to play when used

ENT.WasUsed = false -- was this used in some way (redeemed health, armor, ammo)? if true, delete itself after use. don't set this in your lua file.

local bad_Ammo_Types = {
    "janus_1",
    "janus_3",
    "janus_5",
    "janus_7",
    "janus_11",
    "BULLET_LANCER",
    "m2_missile",
    "mecha_mk3",
    "mecha_mk4",
    "xtracker_missile",
    "oz_grenade",
    "infernal_ball",
    "moon",
    "blackhole", 
    "Thanatos5_Grenade",
    "Thanatos1_Blade",
    "Thanatos3_Blade",
    "Thanatos7_Blade",
    "Thanatos11_Blade",
    "Blood Grenade",
    "Laserstorm_Alt",
    "white_tiger",
	"ironman_laser",
	"energy_cell",
	"cosmic_stone",
	"ghost_knight",
	"magic_heart",
	"keeper_alt",
	"electronv_alt",
	"laser_beam",
	"Aeolis_Flame",
	"stealth",
	"chameleon_stealth",
	"jetpack",
	"compressed_breath",
	"84mm_rocket",
	"heart",
	"Ignelium",
	"chameleon_stealth",
	"supreme_blackhole",
    "jetpackex",
    "bearjumpmk1",
    "bearjumpmk2",
    "bearjumpmk3",
    "Balrog11_Alt",	
	"",-- most weapons use a blank for ammotype when its not actually being used.
    " " -- ditto
}

function ENT:GetWeaponsFromCategory(category)
    local weaponsList = {}

    for _, weapon in pairs(list.Get("Weapon")) do
        if weapon.Category == category and weapon.Spawnable and !weapon.AdminOnly then
            table.insert(weaponsList, weapon.ClassName)
        end
    end

    return weaponsList
end

function ENT:SelectRandomWeapon(ply)
    local randomCategory = (self.UseRandomWeaponTable and "") or table.Random(self.RandomWeaponCategories)
    local weaponsList = (self.UseRandomWeaponTable and self.RandomWeaponTable) or self:GetWeaponsFromCategory(randomCategory)
    local randomWeapon = table.Random(weaponsList)

    if randomWeapon then
        if istable(randomWeapon) then -- LOL WORKAROUNDS LIKE THIS ARE HACKY
            ply:Give(table.Random(randomWeapon))
        else
            ply:Give(randomWeapon)
        end
        if self.GiveRandomWeaponAmmo then
            local weapon = ply:GetWeapon(randomWeapon)
            if !IsValid(weapon) then return end -- uh oh
            local ammo = weapon:GetPrimaryAmmoType()
            local ammo2 = weapon:GetSecondaryAmmoType()
            local maxclip = weapon:GetMaxClip1()
            local maxclipnew = math.Clamp(maxclip, 2, 2000) -- fixes weapons with -1 breaking the ammo logic

            if !table.HasValue(bad_Ammo_Types, game.GetAmmoName(ammo)) then
                ply:GiveAmmo(math.Clamp(maxclipnew * self.GiveRandomWeaponAmmoMultiplier, 10, 2000), ammo)
            end
            if !table.HasValue(bad_Ammo_Types, game.GetAmmoName(ammo2)) then
                ply:GiveAmmo(math.Clamp(4 * self.GiveRandomWeaponAmmoMultiplier, 10, 2000), ammo2)
            end
        end
        ply:SelectWeapon(randomWeapon)
    end
end

if SERVER then
    AddCSLuaFile()

    function ENT:Initialize()
        local model = self.MyModel
        self.Class = self:GetClass()
        self:SetModel(model)
        self:PhysicsInit(SOLID_VPHYSICS)
        self:SetMoveType(MOVETYPE_VPHYSICS)
        self:SetSolid(SOLID_VPHYSICS)
        self:DrawShadow(self.ShouldDrawShadow)
        self:SetCollisionGroup(COLLISION_GROUP_WEAPON)
        self:SetUseType(SIMPLE_USE)
        self:SetModelScale(self.MyModelScale, 0)

        if self.RandomSkin then
            self:SetSkin(math.random(0, self.RandomSkinMax))
        else
            self:SetSkin(self.Skin or 0)
        end


        if self.GiveOnTouch then
            self:SetTrigger(true)
        end

        if GetConVar( "sv_tfa_cso_supplybox_spawn_snd" ):GetBool() then
            self.Entity:EmitSound(self.SpawnedSound, 512)
        end

        local phys = self:GetPhysicsObject()
        if (phys:IsValid()) then
            phys:Wake()
        end
    end

    function ENT:PhysicsCollide(data, physobj)
        if (data.Speed > 60 and data.DeltaTime > 0.2) then
            self:EmitSound(self.ImpactSound)
        end
    end

    function ENT:Use(activator, caller)
        if IsValid(activator) and activator:IsPlayer() then
            self:GiveStuff(activator)
        end
    end

    function ENT:StartTouch(ent)
        if self.GiveOnTouch then
            self:GiveStuff(ent)
        end
    end

    function ENT:GiveStuff(activator)
        if !activator:IsPlayer() then return end -- not a player, do nothing
        if self.GiveAmmo then
            local wep = activator:GetActiveWeapon()
            if IsValid(wep) then -- weapon is valid
                local ammo = wep:GetPrimaryAmmoType()
                local ammo2 = wep:GetSecondaryAmmoType()
                local maxclip = wep:GetMaxClip1()
                local maxclipnew = math.Clamp(maxclip, 2, 2000) -- fixes weapons with -1 breaking the ammo logic

                if !table.HasValue(bad_Ammo_Types, game.GetAmmoName(ammo)) then
                    activator:GiveAmmo(math.Clamp(maxclipnew * self.AmmoMultiplier, 10, 2000), ammo)
                end
                if !table.HasValue(bad_Ammo_Types, game.GetAmmoName(ammo2)) then
                    activator:GiveAmmo(math.Clamp(4 * self.AmmoMultiplier, 10, 2000), ammo2)
                end
                self.WasUsed = true -- did something, flag for deletion
            end
        end
        if self.GiveHealth then
            if activator:Health() < ((self.HealthLimit and self.HealthLimitMax) or activator:GetMaxHealth()) then -- either injured or below the limit for this entity
                activator:SetHealth( math.min( ((self.HealthLimit and self.HealthLimitMax) or activator:GetMaxHealth()), activator:Health() + self.HealthGiven ) )
                self.WasUsed = true -- did something, flag for deletion
            end
        end
        if self.GiveArmor then
            if activator:Armor() < ((self.ArmorLimit and self.ArmorLimitMax) or activator:GetMaxArmor()) then -- either injured or below the limit for this entity
                activator:SetArmor( math.min( ((self.ArmorLimit and self.ArmorLimitMax) or activator:GetMaxArmor()), activator:Armor() + self.ArmorGiven ) )
                self.WasUsed = true -- did something, flag for deletion
            end
        end
        if self.GiveRandomWeapon then
            self:SelectRandomWeapon(activator)
            self.WasUsed = true -- did something, flag for deletion
        end
        if self.WasUsed then
            self.Entity:EmitSound(self.UsedSound, 64)
            SafeRemoveEntity(self)
        end
    end
end