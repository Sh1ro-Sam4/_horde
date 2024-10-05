PERK.PrintName = "Psychopomp"
PERK.Description = "Restore 1 ammo from reserve on headshot. \nAdds 25% crit chance. \nCrits deal 50% extra damage."
PERK.Icon = "materials/perks/necromancer/necromastery.png"
PERK.Params = {
    [1] = {value = 1, percent = true},
    [2] = {value = 0.25, percent = true},
	[3] = {value = 0.5, percent = true},
}

PERK.Hooks = {}

PERK.Hooks.Hook_BulletHit = function(wpn, data)
    local attacker = wpn:GetOwner()
	if SERVER and IsValid(attacker) and attacker:IsPlayer()
            and attacker:Horde_GetPerk("shinigami_1_2") and data.tr.HitGroup == HITGROUP_HEAD then
        wpn:RestoreAmmo(1)
		end
end

PERK.Hooks.Horde_OnPlayerCriticalCheck = function (ply, npc, bonus, hitgroup, dmginfo, crit_bonus)
    if ply:Horde_GetPerk("shinigami_1_2") then
        crit_bonus.add = crit_bonus.add + 0.25
    end
end