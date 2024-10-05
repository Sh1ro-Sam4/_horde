PERK.PrintName = "Wither"
PERK.Description = "Gain 25% crit chance. Crits deal 1% to 8% of the target's health as bonus damage."
PERK.Icon = "materials/perks/seismic_wave.png"
PERK.Params = {
    [1] = {value = 0.1, percent = true},
    [2] = {value = 0.25, percent = true},
}

PERK.Hooks = {}

PERK.Hooks.Horde_OnPlayerCriticalCheck = function (ply, npc, bonus, hitgroup, dmginfo, crit_bonus)
    if ply:Horde_GetPerk("shinigami_4_2") then
        crit_bonus.add = crit_bonus.add + 0.25
    end
end

PERK.Hooks.Horde_OnPlayerCritical = function (ply, npc, bonus, hitgroup, dmginfo, crit_bonus)
    if ply:Horde_GetPerk("shinigami_4_2") then
      bonus.post_add = npc:Health() * math.min(0.08, dmginfo:GetDamage() / 2000)
   end
end