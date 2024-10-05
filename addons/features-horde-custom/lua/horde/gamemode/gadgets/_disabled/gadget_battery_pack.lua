GADGET.PrintName = "Battery Pack"
GADGET.Description =
[[25% of healing given is converted into armor.]]
GADGET.Icon = "items/gadgets/steroid.png"
GADGET.Duration = 5
GADGET.Cooldown = 10
GADGET.Active = false
GADGET.Params = {
    [1] = {value = 0.25, percent = true},
}
GADGET.Hooks = {}

GADGET.Hooks.Horde_OnPlayerHeal = function(ply, healinfo)
    local healer = healinfo:GetHealer()
	local armorheal = healinfo:GetHealAmount() * 0.25
    if healer:IsPlayer() and healer:Horde_GetGadget() == "gadget_battery_pack" then
		ply:SetArmor(math.min(ply:GetMaxArmor(),ply:Armor()+armorheal))
    end
end