PERK.PrintName = "Chilblains"
PERK.Description = "Cold damage ignores enemy Cold damage resistance. \nCold damage builds up Bleed. \n20% Cold damage boost."
PERK.Icon = "materials/perks/specops/smokescreen.png"
PERK.Params = {
    [1] = {value = 2},
    [2] = {value = 0.15, percent = true},
	[3] = {value = 0.25, percent = true},
	[4] = {value = 25},
}

PERK.Hooks = {}

PERK.Hooks.Horde_OnPlayerDamage = function (ply, npc, bonus, hitgroup, dmginfo)
    if not ply:Horde_GetPerk("shinigami_3_1")  then return end
	if HORDE:IsColdDamage(dmginfo) then
        bonus.increase = bonus.increase + 0.2
    end
end

PERK.Hooks.Horde_OnPlayerDamagePost = function (ply, npc, bonus, hitgroup, dmginfo)
    if not ply:Horde_GetPerk("shinigami_3_1")  then return end
	
	if HORDE:IsColdDamage(dmginfo) then
        npc:Horde_AddDebuffBuildup(HORDE.Status_Bleeding, dmginfo:GetDamage() * 0.1, ply, dmginfo:GetDamagePosition())
    end
	
	if HORDE:IsColdDamage(dmginfo) then
    dmginfo:SetDamageType(DMG_DIRECT)
	end
end

