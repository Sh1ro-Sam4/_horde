GADGET.PrintName = "Idol of Greed"
GADGET.Description = "Spend $500 cash to activate. \nWhile active, all of your kills will drop cash equal to $50 + 50% of the enemy's kill reward."
GADGET.Icon = "items/gadgets/idol_of_greed.png"
GADGET.Duration = 30
GADGET.Cooldown = 30
GADGET.Active = true
GADGET.Params = {
    [1] = {value = 0.25, percent = true},
    [2] = {value = 0.25, percent = true},
    [3] = {value = 0.25, percent = true},
}
GADGET.Hooks = {}

GADGET.Hooks.Horde_UseActiveGadget = function (ply)
    if CLIENT then return end
    if ply:Horde_GetGadget() ~= "gadget_idol_of_greed" then	return end
	if ply:Horde_GetMoney() < 500 then 
		ply:Horde_SetGadgetCooldown(0)
	return end
	ply:Horde_AddMoney(-500)
    ply:Horde_SyncEconomy()
	sound.Play("satan_laugh.wav", ply:GetPos())
    ply.Horde_GreedIdol = true
  --  ply:ScreenFade(SCREENFADE.IN, Color(253, 248, 50, 32), 0.1, 10)
  ply:Horde_SyncStatus(HORDE.Status_Idol_Of_Greed, 1)
	ply:Horde_SetGadgetCooldown(30)
    timer.Simple(30, function()
        if ply:IsValid() then 
		ply.Horde_GreedIdol = nil 
		ply:Horde_SyncStatus(HORDE.Status_Idol_Of_Greed, 0)
		end
    end)
end

GADGET.Hooks.Horde_OnNPCKilled = function(victim, killer, reward)
    if not killer.Horde_GreedIdol then return end
        local money = ents.Create("horde_money")
        local pos = victim:GetPos()
        local drop_pos = pos
        drop_pos.z = pos.z + 15
        money:SetPos(drop_pos)
        money:DropToFloor()
        money:SetMoney(50 + (HORDE.kill_reward_base * 0.5))
        money:Spawn()
    end
	