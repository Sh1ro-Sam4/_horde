GADGET.PrintName = "Ultimate Shard"
GADGET.Description = "10% increase in speed, damage, and global resist for 30 seconds. \nAdditionally, heals for 20 health and removes all debuffs."
GADGET.Icon = "items/gadgets/ultimate_shard.png"
GADGET.Droppable = true
GADGET.Once = true
GADGET.Cooldown = 0
GADGET.Active = true
GADGET.Params = {
    [1] = {value = 0.2, percent = true},
}
GADGET.Hooks = {}

GADGET.Hooks.Horde_UseActiveGadget = function (ply)
    if ply:Horde_GetGadget() ~= "gadget_ultimate_shard" then return end
    ply.Horde_Has_Ultimate_Shard = true
    ply:Horde_SyncStatus(HORDE.Status_Ultimate_Shard, 1)
	
	sound.Play("items/medshot4.wav", ply:GetPos())
    local healinfo = HealInfo:New({amount=20, healer=ply})
    HORDE:OnPlayerHeal(ply, healinfo)

    for debuff, buildup in pairs(ply.Horde_Debuff_Buildup) do
        ply:Horde_RemoveDebuff(debuff)
        ply:Horde_ReduceDebuffBuildup(debuff, buildup)
    end
	
    timer.Simple(30, function ()
        if ply:IsValid() then
            ply.Horde_Has_Ultimate_Shard = nil
            ply:Horde_SyncStatus(HORDE.Status_Ultimate_Shard, 0)
        end
    end)
end

GADGET.Hooks.Horde_OnPlayerDamageTaken = function (ply, dmginfo, bonus)
    if ply.Horde_Has_Ultimate_Shard then
    bonus.resistance = bonus.resistance + 0.1
	end
end

GADGET.Hooks.Horde_OnPlayerDamage = function (ply, npc, bonus, hitgroup, dmginfo)
    if ply.Horde_Has_Ultimate_Shard then
        bonus.increase = bonus.increase + 0.1
    end
end

GADGET.Hooks.Horde_PlayerMoveBonus = function(ply, bonus_walk, bonus_run)
    if ply.Horde_Has_Ultimate_Shard then
        bonus_walk.increase = bonus_walk.increase + 0.1
        bonus_run.increase = bonus_run.increase + 0.1
    end
end

--HORDE:RegisterStatus("Ultimate_Shard", "materials/items/gadgets/ultimate_shard.png")