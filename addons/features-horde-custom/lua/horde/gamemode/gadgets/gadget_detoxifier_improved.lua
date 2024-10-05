GADGET.PrintName = "Detoxifier"
GADGET.Description = "20% increased Poison damage resistance. \nGain immunity to Break."
GADGET.Icon = "items/gadgets/detoxifier.png"
GADGET.Duration = 0
GADGET.Cooldown = 10
GADGET.Params = {
    [1] = {value = 0.20, percent = true},
}
GADGET.Hooks = {}

GADGET.Hooks.Horde_OnPlayerDamageTaken = function (ply, dmginfo, bonus)
    if ply:Horde_GetGadget() ~= "gadget_detoxifier_improved"  then return end
    if HORDE:IsPoisonDamage(dmginfo) then
        bonus.resistance = bonus.resistance + 0.20
    end
end

GADGET.Hooks.Horde_OnPlayerDebuffApply = function (ply, debuff, bonus)
	if ply:Horde_GetGadget() == "gadget_detoxifier_improved" and debuff == HORDE.Status_Break then
        bonus.apply = 0
        return true
		end
 end
 