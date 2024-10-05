GADGET.PrintName = "Hippocampus Stimulant"
GADGET.Description =
[["Are you sure this will work?!
Ha ha ha, I have no idea!"
Gain 1 additional experience every time you kill an enemy, 
kill an elite, kill a boss, or heal someone.]]
GADGET.Icon = "items/gadgets/cortex.png"
GADGET.Duration = 0
GADGET.Cooldown = 0
GADGET.Active = false
GADGET.Params = {
}
GADGET.Hooks = {}

if GetConVar("horde_enable_sandbox"):GetInt() == 0 and GetConVar("horde_enable_rank"):GetInt() == 1 then
	hook.Add("Horde_OnEnemyKilled", "Horde_GiveStimulant", function(victim, killer, wpn)
		if HORDE.current_wave <= 0 or GetConVar("sv_cheats"):GetInt() == 1 then return end
		if killer:IsPlayer() and killer:IsValid() and killer:Horde_GetClass() then
		if killer:Horde_GetGadget() ~= "gadget_hippocampus_stimulant" then return end
			local class_name = killer:Horde_GetCurrentSubclass()
			if killer:Horde_GetLevel(class_name) >= HORDE.max_level then return end
			if victim:GetVar("is_elite") then
				killer:Horde_SetExp(class_name, killer:Horde_GetExp(class_name) + 1)
			end
			if victim:GetVar("is_boss") then
				killer:Horde_SetExp(class_name, killer:Horde_GetExp(class_name) + 1)
			end
				killer:Horde_SetExp(class_name, killer:Horde_GetExp(class_name) + 1)
				HORDE:SaveRank(killer)
			end
      end)
  end


GADGET.Hooks.Horde_OnPlayerHeal = function(ply, healinfo)
local healer = healinfo:GetHealer()
	if GetConVar("horde_enable_sandbox"):GetInt() == 0 and GetConVar("horde_enable_rank"):GetInt() == 1 then
    if healer:IsPlayer() and healer:Horde_GetGadget() == "gadget_hippocampus_stimulant" then
	if healer:Horde_GetLevel(class_name) >= HORDE.max_level then return end
	local class_name = healer:Horde_GetClass().name
		healer:Horde_SetExp(class_name, healer:Horde_GetExp(class_name) + 1)
		HORDE:SaveRank(healer)
    end
	end
end
