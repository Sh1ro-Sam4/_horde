GADGET.PrintName = "Hippocampus Stimulant Debug"
GADGET.Description =
[[A modified version of Hippocampus Stimulant that gives you 100000 exp
instead of the usual amount. Useful for testing level up rewards.
Only works in Sandbox mode.]]
GADGET.Icon = "items/gadgets/cortex.png"
GADGET.Duration = 0
GADGET.Cooldown = 0
GADGET.Active = false
GADGET.Params = {
}
GADGET.Hooks = {}

if GetConVar("horde_enable_sandbox"):GetInt() == 1 and GetConVar("horde_enable_rank"):GetInt() == 1 then
	hook.Add("Horde_OnEnemyKilled", "Horde_GiveStimulantDebug", function(victim, killer, wpn)
		if HORDE.current_wave <= 0 then return end
		if killer:IsPlayer() and killer:IsValid() and killer:Horde_GetClass() then
		if killer:Horde_GetGadget() ~= "gadget_hippocampus_stimulant_debug" then return end
			local class_name = killer:Horde_GetCurrentSubclass()
			if killer:Horde_GetLevel(class_name) >= HORDE.max_level then return end
			if victim:GetVar("is_elite") then
				killer:Horde_SetExp(class_name, killer:Horde_GetExp(class_name) + 100000)
			end
			if victim:GetVar("is_boss") then
				killer:Horde_SetExp(class_name, killer:Horde_GetExp(class_name) + 100000)
			end
				killer:Horde_SetExp(class_name, killer:Horde_GetExp(class_name) + 100000)
				HORDE:SaveRank(killer)
			end
      end)
  end

GADGET.Hooks.Horde_OnPlayerHeal = function(ply, healinfo)
if GetConVar("horde_enable_sandbox"):GetInt() == 1 and GetConVar("horde_enable_rank"):GetInt() == 1 then
local healer = healinfo:GetHealer()
    if healer:IsPlayer() and healer:Horde_GetGadget() == "gadget_hippocampus_stimulant_debug" then
	if healer:Horde_GetLevel(class_name) >= HORDE.max_level then return end
	local class_name = healer:Horde_GetClass().name
		healer:Horde_SetExp(class_name, healer:Horde_GetExp(class_name) + 100000)
		HORDE:SaveRank(healer)
		end
    end
end
