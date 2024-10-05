GADGET.PrintName = "Heat Plating"
GADGET.Description = "20% increased Fire damage resistance. \nGain immunity to Ignite."
GADGET.Icon = "items/gadgets/heat_plating.png"
GADGET.Duration = 0
GADGET.Cooldown = 10
GADGET.Params = {
    [1] = {value = 0.20, percent = true},
}
GADGET.Hooks = {}

GADGET.Hooks.Horde_OnPlayerDamageTaken = function (ply, dmginfo, bonus)
    if ply:Horde_GetGadget() ~= "gadget_heat_plating_improved"  then return end
    if HORDE:IsFireDamage(dmginfo) then
        bonus.resistance = bonus.resistance + 0.20
    end
end

GADGET.Hooks.Horde_OnPlayerDebuffApply = function (ply, debuff, bonus)
	if ply:Horde_GetGadget() == "gadget_heat_plating_improved" and debuff == HORDE.Status_Ignite then
        bonus.apply = 0
        return true
		end
 end