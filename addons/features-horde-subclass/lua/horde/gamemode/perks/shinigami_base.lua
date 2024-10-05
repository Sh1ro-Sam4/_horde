PERK.PrintName = "Shinigami Base"
PERK.Description =
[[
Shinigami is a subclass of Ghost with a greater focus of burst damage and headshots at the cost of having slower RPM and 
massively decreased damage on non-headshots to make up for its extreme damage output. 
Complexity: MEDIUM

{1} increased ballistic headshot damage. ({3} base, {4} per level, up to {5})
{1} multiplier to non-headshot ballistic damage. ({3} base, {4} per level, up to {5})
{1} multiplier to RPM. ({3} base, {4} per level, up to {5})

Execute enemies that have at least {8} health or lower. ({9} base, {4} per level, up to {10})
]]
PERK.Icon = "materials/subclasses/shinigami.png"
PERK.Params = {
    [1] = {percent = true, base = 0.5, level = 0.01, max = 0.75, classname = "Shinigami"},
	[2] = {percent = true, base = 0.5, level = 0.01, max = 0.75, classname = "Shinigami"},
	[3] = {value = 0.5, percent = true},
	[4] = {value = 0.01, percent = true},
	[5] = {value = 0.75, percent = true},
	[6] = {value = -0.01, percent = true},
	[7] = {value = 0.25, percent = true},
	[8] = {percent = true, base = 0.05, level = 0.01, max = 0.3, classname = "Shinigami"},
	[9] = {value = 0.1, percent = true},
	[10] = {value = 0.35, percent = true},
}
PERK.Hooks = {}

PERK.Hooks.Horde_PrecomputePerkLevelBonus = function (ply)
    if SERVER then
        ply:Horde_SetPerkLevelBonus("shinigami_base", math.min(0.25, 0.01 * ply:Horde_GetLevel("Shinigami")))
    end
end

PERK.Hooks.Horde_OnPlayerDamage = function (ply, npc, bonus, hitgroup, dmginfo)
    if not ply:Horde_GetPerk("shinigami_base")  then return end
 --   bonus.increase = bonus.increase + ply:Horde_GetPerkLevelBonus("shinigami_base")
	
	if hitgroup == HITGROUP_HEAD and (HORDE:IsBallisticDamage(dmginfo) or HORDE:IsColdDamage(dmginfo) or dmginfo:IsDamageType(DMG_DIRECT)) then
        bonus.increase = bonus.increase + (0.5 + ply:Horde_GetPerkLevelBonus("shinigami_base"))
		else
      if (HORDE:IsBallisticDamage(dmginfo) or HORDE:IsColdDamage(dmginfo) or dmginfo:IsDamageType(DMG_DIRECT)) then
       bonus.more = bonus.more * (0.5 + ply:Horde_GetPerkLevelBonus("shinigami_base"))
      end
    end
	
	if ply:Horde_GetPerk("shinigami_base") then
        local crit_rate = 0
        local crit_bonus = { increase = 0, more = 1, add = 0 }
        hook.Run("Horde_OnPlayerCriticalCheck", ply, npc, bonus, hitgroup, dmginfo, crit_bonus)
        crit_rate = (crit_rate + crit_bonus.add) * (1 + crit_bonus.increase) * crit_bonus.more
        local p = math.random()
        if p <= crit_rate then
            bonus.more = bonus.more * 1.5
            hook.Run("Horde_OnPlayerCritical", ply, npc, bonus, hitgroup, dmginfo)
            sound.Play("horde/player/crit.ogg", ply:GetPos())
        end
    end
end

PERK.Hooks.M_Hook_Mult_RPM = function(wpn, data)
    local ply = wpn:GetOwner()
--	if wpn.ManualAction then return false end
    if IsValid(ply) and ply:IsPlayer() and ply:Horde_GetPerk("shinigami_base") then
        data.mult = (data.mult or 1) * (0.5 + ply:Horde_GetPerkLevelBonus("shinigami_base"))
    end
end

PERK.Hooks.EntityTakeDamage = function(target, dmg)
    local attacker = dmg:GetAttacker()
	
    if not attacker:IsValid() or not attacker:IsPlayer() then return end
    if not attacker:Horde_GetPerk("shinigami_base") then return end
    if not target:IsNPC() then return end

local shi = (0.05 + attacker:Horde_GetPerkLevelBonus("shinigami_base"))

    if not target:GetNWEntity("HordeOwner"):IsPlayer() and (target:Health() <= shi * target:GetMaxHealth()) then
        dmg:SetDamage(shi * target:GetMaxHealth() + 1)
        dmg:SetDamageType(DMG_DIRECT)
    end
end
