GADGET.PrintName = "Regen Shard"
GADGET.Description = "2% max health regen for 30 seconds."
GADGET.Icon = "items/gadgets/vitality_shard.png"
GADGET.Droppable = true
GADGET.Once = true
GADGET.Cooldown = 0
GADGET.Active = true
GADGET.Params = {
    [1] = {value = 0.2, percent = true},
}
GADGET.Hooks = {}

GADGET.Hooks.Horde_UseActiveGadget = function (ply)
    if ply:Horde_GetGadget() ~= "gadget_regen_shard" then return end
    ply.Horde_Has_Regen_Shard = true
    ply:Horde_SyncStatus(HORDE.Status_Agility_Shard, 1)
    timer.Simple(30, function ()
        if ply:IsValid() then
            ply.Horde_Has_Regen_Shard = nil
			ply:Horde_SetHealthRegenPercentage(0)
            ply:Horde_SyncStatus(HORDE.Status_Agility_Shard, 0)
        end
    end)
end

GADGET.Hooks.PlayerTick = function (ply, mv)
if SERVER then
	if ply.Horde_Has_Regen_Shard then
	ply:Horde_SetHealthRegenPercentage(0.02)
	end
end
end
