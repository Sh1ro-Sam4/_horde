PERK.PrintName = "Memento Mori"
PERK.Description = "25% boost in RPM. Press Shift + E to enter a rage mode. 10 second duration, \n20 second cooldown. While active, gain 50% crit chance and crits builds up Freeze. \nFreeze stuns a target for 5 seconds with an 8 second cooldown."
PERK.Icon = "materials/perks/decapitate.png"
PERK.Params = {
    [1] = {value = 0.25, percent = true},
    [2] = {value = 6},
}

PERK.Hooks = {}

PERK.Hooks.Horde_OnSetPerk = function(ply, perk)
    if SERVER and perk == "shinigami_3_2" then
        ply:Horde_SetPerkCooldown(30)
      net.Start("Horde_SyncActivePerk")
            net.WriteUInt(HORDE.Status_Gravity_Vacuum, 8)
            net.WriteUInt(1, 3)
        net.Send(ply)
    end
end

PERK.Hooks.Horde_OnUnsetPerk = function(ply, perk)
    if SERVER and perk == "shinigami_3_2" then
       net.Start("Horde_SyncActivePerk")
            net.WriteUInt(HORDE.Status_Gravity_Vacuum, 8)
            net.WriteUInt(0, 3)
        net.Send(ply)
    end
end


PERK.Hooks.Horde_UseActivePerk = function (ply)
    if not ply:Horde_GetPerk("shinigami_3_2") then return end

ply.Horde_MementoMori = true
sound.Play("horde/status/shock_trigger.ogg", ply:GetPos())
ply:ScreenFade(SCREENFADE.STAYOUT, Color(112, 77, 145, 50), 0.2, 5)

timer.Simple(10, function()
        if ply:IsValid() then 
		ply.Horde_MementoMori = nil 
		ply:ScreenFade(SCREENFADE.PURGE, Color(60, 60, 200, 0), 0.1, 0.1)
		end
    end)


end

PERK.Hooks.Horde_OnPlayerCriticalCheck = function (ply, npc, bonus, hitgroup, dmginfo, crit_bonus)
    if ply:Horde_GetPerk("shinigami_3_2") and ply.Horde_MementoMori then
        crit_bonus.add = crit_bonus.add + 0.5
    end
end

PERK.Hooks.Horde_OnPlayerCritical = function (ply, npc, bonus, hitgroup, dmginfo, crit_bonus)
    if ply:Horde_GetPerk("shinigami_3_2") and ply.Horde_MementoMori then
      npc:Horde_AddDebuffBuildup(HORDE.Status_Freeze, 1000, ply, dmginfo:GetDamagePosition())
   end
end

PERK.Hooks.M_Hook_Mult_RPM = function(wpn, data)
    local ply = wpn:GetOwner()
--	if wpn.ManualAction then return false end
    if IsValid(ply) and ply:IsPlayer() and ply:Horde_GetPerk("shinigami_3_2") then
        data.mult = (data.mult or 1) * 1.25
    end
end

