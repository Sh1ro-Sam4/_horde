GADGET.PrintName = "Pyromania"
GADGET.Description =
[[Dealing fire damage will heal you for 1 health.
Cannot heal from self-damage.
Converts fire damage received into Physical damage.]]
GADGET.Icon = "items/gadgets/barbeque.png"
GADGET.Duration = 0
GADGET.Cooldown = 0
GADGET.Active = false
GADGET.Params = {
}
GADGET.Hooks = {}

GADGET.Hooks.Horde_OnPlayerDamagePost = function (ply, npc, bonus, hitgroup, dmginfo)

-- was going to adjust this but I gave up on it lol

    if ply:Horde_GetGadget() ~= "gadget_pyromania"  then return end
	if HORDE:IsFireDamage(dmginfo) and not npc:IsPlayer() then
        local leech = math.min(1, dmginfo:GetDamage() * 1)
        HORDE:SelfHeal(ply, leech)
		end
end