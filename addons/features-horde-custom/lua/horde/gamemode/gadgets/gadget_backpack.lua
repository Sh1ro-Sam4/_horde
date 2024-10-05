GADGET.PrintName = "Backpack"
GADGET.Description = "+5 to maximum weight. \nCan be re-used if you need to fix your max weight."
GADGET.Icon = "items/gadgets/backpack.png"
GADGET.Duration = 0
GADGET.Active = true
GADGET.Duration = 1
GADGET.Cooldown = 1
--GADGET.Params = {
  --  [1] = {value = 5},
--}
GADGET.Hooks = {}

GADGET.Hooks.Horde_OnSetGadget = function(ply, gadget)
    if ply:Horde_GetGadget() ~= "gadget_backpack" then return end
	if SERVER then
	if ply:Horde_GetPerk("heavy_floating_carrier") then
        ply:Horde_SetMaxWeight(HORDE.max_weight + 10)
		elseif ply:Horde_GetPerk("samurai_resolution") then
		ply:Horde_SetMaxWeight(12)
		else
		ply:Horde_SetMaxWeight(HORDE.max_weight + 5)
		end
    end
	end

GADGET.Hooks.Horde_OnUnsetGadget = function(ply, gadget)
    if ply:Horde_GetGadget() ~= "gadget_backpack" then return end
	if SERVER then
	if ply:Horde_GetPerk("heavy_floating_carrier") then
        ply:Horde_SetMaxWeight(HORDE.max_weight + 5)
		ply.Horde_BackpackMax = nil
		elseif ply:Horde_GetPerk("samurai_resolution") then
		ply:Horde_SetMaxWeight(7)
		ply.Horde_BackpackMax = nil
		else
		ply:Horde_SetMaxWeight(HORDE.max_weight)
		ply.Horde_BackpackMax = nil
		end
		end
    end
	
	GADGET.Hooks.Horde_UseActiveGadget = function (ply)
    if CLIENT then return end
    if ply:Horde_GetGadget() ~= "gadget_backpack" then return end
	
	if SERVER then
	if ply:Horde_GetPerk("heavy_floating_carrier") then
        ply:Horde_SetMaxWeight(HORDE.max_weight + 10)
		ply.Horde_BackpackMax = true
		elseif ply:Horde_GetPerk("samurai_resolution") then
		ply:Horde_SetMaxWeight(12)
		ply.Horde_BackpackMax = true
		else
		ply:Horde_SetMaxWeight(HORDE.max_weight + 5)
		ply.Horde_BackpackMax = nil
		end
    end
	
	end
	