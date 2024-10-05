GADGET.PrintName = "Instant Refill"
GADGET.Description = "Instantly reloads your current weapon and gives you ammo for all of your weapons. \nIf the weapon you're currently holding can't reload, \nthen an additional amount of ammo will be given instead."
GADGET.Icon = "items/gadgets/instant_refill.png"
GADGET.Droppable = true
GADGET.Once = true
GADGET.Cooldown = 0
GADGET.Active = true
GADGET.Params = {
    [1] = {value = 0.2, percent = true},
}
GADGET.Hooks = {}

GADGET.Hooks.Horde_UseActiveGadget = function (ply)
    if ply:Horde_GetGadget() ~= "gadget_instant_refill" then return end

sound.Play("refill_ping.wav", ply:GetPos())

        for _, wpn in pairs(ply:GetWeapons()) do
            local given = HORDE:GiveAmmo(ply, wpn, 1)
            given_ammo = given_ammo or given
        end
		
		if (ply:GetActiveWeapon():GetMaxClip1() <= 0) and (ply:GetActiveWeapon():GetMaxClip2() <= 0) then
		 for _, wpn in pairs(ply:GetWeapons()) do
            local given = HORDE:GiveAmmo(ply, wpn, 1)
            given_ammo = given_ammo or given
        end
		end
		
		if ply:GetActiveWeapon():GetMaxClip1() > 0 then
		ply:GetActiveWeapon():SetClip1(ply:GetActiveWeapon():GetMaxClip1())
		end
		
		if ply:GetActiveWeapon():GetMaxClip2() > 0 then
		ply:GetActiveWeapon():SetClip2(ply:GetActiveWeapon():GetMaxClip2())
		end


end
