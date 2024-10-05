GADGET.PrintName = "Resistance Shard"
GADGET.Description = "20% increased global resist for 30 seconds."
GADGET.Icon = "items/gadgets/resistance_shard.png"
GADGET.Droppable = true
GADGET.Once = true
GADGET.Cooldown = 0
GADGET.Active = true
GADGET.Params = {
    [1] = {value = 0.2, percent = true},
}
GADGET.Hooks = {}

GADGET.Hooks.Horde_UseActiveGadget = function (ply)
    if ply:Horde_GetGadget() ~= "gadget_resistance_shard" then return end
    ply.Horde_Has_Resistance_Shard = true
    ply:Horde_SyncStatus(HORDE.Status_Resist_Shard, 1)
    timer.Simple(30, function ()
        if ply:IsValid() then
            ply.Horde_Has_Resistance_Shard = nil
            ply:Horde_SyncStatus(HORDE.Status_Resist_Shard, 0)
        end
    end)
end

GADGET.Hooks.Horde_OnPlayerDamageTaken = function (ply, dmginfo, bonus)
    if ply.Horde_Has_Resistance_Shard then
    bonus.resistance = bonus.resistance + 0.2
	end
end