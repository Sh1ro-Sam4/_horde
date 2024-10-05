PERK.PrintName = "Hypothermia"
PERK.Description = "Converts ballistic damage into Cold damage that builds up Frostbite. \nFrostbite slows down a target by 40%."
PERK.Icon = "materials/perks/brain_snap.png"
PERK.Params = {
    [1] = {value = 0.25, percent = true},
    [2] = {value = 0.20, percent = true},
	[3] = {value = 1},
}

PERK.Hooks = {}

PERK.Hooks.Horde_OnPlayerDamage = function (ply, npc, bonus, hitgroup, dmginfo)
    if not ply:Horde_GetPerk("shinigami_1_1")  then return end
if HORDE:IsBallisticDamage(dmginfo) then
        dmginfo:SetDamageType(DMG_REMOVENORAGDOLL)
    end
    npc:Horde_AddDebuffBuildup(HORDE.Status_Frostbite, dmginfo:GetDamage() * 0.25, ply, dmginfo:GetDamagePosition())
end

