MUTATION.PrintName = "Flicker"
MUTATION.Description = "Tinted brown and randomly flickers. \n75% chance to dodge attacks, but only has 25% max health. \nOnly randomly occurs starting from wave 6."
MUTATION.Wave = 6

MUTATION.Hooks = {}

MUTATION.Hooks.Horde_OnSetMutation = function(ent, mutation)
    if mutation == "flicker" then
        local c = ent:GetColor()
        ent:SetColor(Color(128, 64, 0))
		ent:SetRenderFX(15)
		if SERVER then
		ent:SetMaxHealth(ent:GetMaxHealth() * 0.5)
            ent:SetHealth(ent:GetMaxHealth() * 0.5)
			end
    end
end

hook.Add("EntityTakeDamage", "Horde_FlickerTakeDamage", function (target, dmg)
    if not target:IsValid() then return end
    if target:IsNPC() and target:Horde_HasMutation("flicker") then
	local p = math.random()
	if p <= 0.75 then
	dmg:SetDamage(0)
	end
end
end)

MUTATION.Hooks.Horde_OnUnsetMutation = function (ent, mutation)
    if not ent:IsValid() or mutation ~= "flicker" then return end
	if SERVER then
        ent:SetMaxHealth(ent:GetMaxHealth() / 0.5)
    end
end