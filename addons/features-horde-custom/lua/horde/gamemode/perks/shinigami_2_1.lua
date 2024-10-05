PERK.PrintName = "Algor Mortis"
PERK.Description = "Gain immunity to Cold damage. Cold damage received will heal you instead. \nTaking damage releases a frost nova that blocks damage received \nand deals ice damage. 10 second cooldown."
PERK.Icon = "materials/perks/necromancer/void_field.png"
PERK.Params = {
    [1] = {value = 8},
    [2] = {value = 0.25, percent = true},
}

PERK.Hooks = {}

PERK.Hooks.Horde_OnPlayerDamageTaken = function (ply, dmginfo, bonus)
    if not ply:Horde_GetPerk("shinigami_2_1")  then return end
    if dmginfo:GetDamageType() == DMG_COLD or dmginfo:GetDamageType() == DMG_REMOVENORAGDOLL then
        bonus.resistance = bonus.resistance + 1.00
        if dmginfo:GetDamage() > 0 and dmginfo:GetDamage() * 0.06 then
            HORDE:OnPlayerHeal(ply, HealInfo:New({amount=math.max(1,dmginfo:GetDamage() * 0.06), healer=ply}))
        end
    end
end

PERK.Hooks.Horde_OnPlayerDebuffApply = function (ply, debuff, bonus)
    if ply:Horde_GetPerk("shinigami_2_1") and debuff == HORDE.Status_Frostbite then
        bonus.apply = 0
        return true
    end
end

--PERK.Hooks.PlayerHurt = function(victim, attacker, healthRemaining, damageTaken)
  --  if not victim:Horde_GetPerk("shinigami_2_1")  then return end
  --  if ( attacker:IsNPC() ) and victim:Horde_GetAlgorMortis() == 1 then
	--	--attacker:Horde_AddDebuffBuildup(HORDE.Status_Freeze, 1000)
	--	attacker:Horde_AddFreezeEffect(1000)	
  --  end
--end

PERK.Hooks.Horde_OnSetPerk = function(ply, perk)
    if SERVER and perk == "shinigami_2_1" then
        ply:Horde_SetAlgorMortisEnabled(true)
        ply:Horde_AddAlgorMortis()
    end
end
 
PERK.Hooks.Horde_OnUnsetPerk = function(ply, perk)
    if SERVER and perk == "shinigami_2_1" then
        ply:Horde_SetAlgorMortisEnabled(nil)
        ply:Horde_RemoveAlgorMortis()
        timer.Remove("Horde_RestockAlgorMortis" .. ply:SteamID())
    end
end

local plymeta = FindMetaTable("Player")

function plymeta:Horde_AddAlgorMortis()
    if self.Horde_AlgorMortis == 1 then return end

    self.Horde_AlgorMortis = 1
    net.Start("Horde_SyncStatus")
        net.WriteUInt(HORDE.Status_EntropyShield, 8)
        net.WriteUInt(1, 8)
    net.Send(self)
end

function plymeta:Horde_RemoveAlgorMortis()
    if not self:IsValid() then return end
    if self.Horde_AlgorMortis == 0 then return end
    self.Horde_AlgorMortis = 0
    net.Start("Horde_SyncStatus")
        net.WriteUInt(HORDE.Status_EntropyShield, 8)
        net.WriteUInt(0, 8)
    net.Send(self)
end

function plymeta:Horde_GetAlgorMortis()
    return self.Horde_AlgorMortis or 0
end

function plymeta:Horde_SetAlgorMortisEnabled(enabled)
    self.Horde_AlgorMortisEnabled = enabled
end

function plymeta:Horde_GetAlgorMortisEnabled()
    return self.Horde_AlgorMortisEnabled or nil
end

hook.Add("Horde_OnPlayerDamageTaken", "Horde_AlgorMortisDamage", function (ply, dmginfo, bonus, silent)
    if silent then return end
    if ply:IsValid() and ply:Horde_GetAlgorMortisEnabled() and ply:Horde_GetAlgorMortis() == 1 and dmginfo:GetAttacker() ~= ply then
        bonus.resistance = 1
        local dmg = DamageInfo()
        dmg:SetAttacker(ply)
        dmg:SetInflictor(ply)
        dmg:SetDamageType(DMG_REMOVENORAGDOLL)
        dmg:SetDamage(250)
--		dmg:Horde_AddDebuffBuildup(HORDE.Status_Freeze, dmginfo:GetDamage() / 1.5, ply, dmginfo:GetDamagePosition())
        util.BlastDamageInfo(dmg, ply:GetPos(), 150)
        ply:Horde_RemoveAlgorMortis()
        timer.Remove("Horde_RestockAlgorMortis" .. ply:SteamID())
        timer.Create("Horde_RestockAlgorMortis" .. ply:SteamID(), 10, 1, function ()
            ply:Horde_AddAlgorMortis()
        end)
    end
end)


hook.Add("Horde_ResetStatus", "Horde_AlgorMortisReset", function(ply)
    ply.Horde_AlgorMortis = 0
    ply.Horde_AlgorMortisEnabled = nil
end)