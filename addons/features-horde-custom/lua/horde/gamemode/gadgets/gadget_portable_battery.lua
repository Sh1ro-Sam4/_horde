GADGET.PrintName = "Portable Battery"
GADGET.Description = "Grants 25 armor upon use."
GADGET.Icon = "items/gadgets/portable_battery.png"
GADGET.Droppable = true
GADGET.Once = true
GADGET.Cooldown = 0
GADGET.Active = true
GADGET.Params = {
    [1] = {value = 0.2, percent = true},
}
GADGET.Hooks = {}

GADGET.Hooks.Horde_UseActiveGadget = function (ply)
    if ply:Horde_GetGadget() ~= "gadget_portable_battery" then return end
	local battery = 25
	sound.Play("items/battery_pickup.wav", ply:GetPos())
  ply:SetArmor(math.min(ply:GetMaxArmor(), ply:Armor() + battery ))
end