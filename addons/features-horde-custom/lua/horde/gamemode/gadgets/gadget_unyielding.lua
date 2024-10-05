GADGET.PrintName = "Unyielding"
GADGET.Description =
[[Caps damage received to 10 + 50% of your current health,
but 100% of damage received builds up Decay. 
Amount of Decay received is calculated before the damage cap.]]
GADGET.Icon = "items/gadgets/unyielding.png"
GADGET.Duration = 0
GADGET.Cooldown = 0
GADGET.Active = false
GADGET.Params = {
}
GADGET.Hooks = {}

GADGET.Hooks.Horde_OnPlayerDamageTakenPost = function (ply, dmginfo, bonus)
    if ply:Horde_GetGadget() ~= "gadget_unyielding"  then return end
		ply:Horde_AddDebuffBuildup(HORDE.Status_Decay, dmginfo:GetDamage(), dmginfo:GetAttacker())
	local maxhealth = ((ply:Health() * 0.5) + 10)
	if dmginfo:GetDamage() >= maxhealth then
    dmginfo:SetDamage(maxhealth)
	end
end