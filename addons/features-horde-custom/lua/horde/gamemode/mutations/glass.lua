MUTATION.PrintName = "Glass"
MUTATION.Description = "Material set to glass. \n50% increase in damage dealt and 25% increase in damage taken if not a boss. If a boss, then 25% damage boost instead. \nDamage inflicts Bleeding. Only randomly occurs starting from wave 6."
MUTATION.Wave = 6

MUTATION.Hooks = {}

MUTATION.Hooks.Horde_OnSetMutation = function(ent, mutation)
    if mutation == "glass" then
		ent:SetMaterial("models/shadertest/shader5")
    end
end

MUTATION.Hooks.Horde_OnPlayerDamageTaken = function(ply, dmg, bonus)
    if dmg:GetAttacker():IsNPC() and dmg:GetAttacker():Horde_HasMutation("glass") then
		ply:Horde_AddDebuffBuildup(HORDE.Status_Bleeding, dmg:GetDamage() * 2)
		if not dmg:GetAttacker():Horde_GetBossProperties() then
		dmg:ScaleDamage(1.5)
		else
		dmg:ScaleDamage(1.25)
    end	
end
end

hook.Add("EntityTakeDamage", "Horde_GlassTakeDamage", function (target, dmg)
    if not target:IsValid() then return end
    if target:IsNPC() and target:Horde_HasMutation("glass") then
	if not target:Horde_GetBossProperties() then
		dmg:ScaleDamage(1.25)
		else
		dmg:ScaleDamage(1)
	end
end
end)

MUTATION.Hooks.Horde_OnUnsetMutation = function (ent, mutation)
    if not ent:IsValid() or mutation ~= "glass" then return end
end
