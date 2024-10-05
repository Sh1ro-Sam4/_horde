MUTATION.PrintName = "Shockproof"
MUTATION.Description = "Tinted blue. \n50% damage reduction from non-physical damage. 50% increased health if not a boss. \nOnly randomly occurs starting from wave 6."
MUTATION.Wave = 6

MUTATION.Hooks = {}

MUTATION.Hooks.Horde_OnSetMutation = function(ent, mutation)
    if mutation == "shockproof" then
        local c = ent:GetColor()
        ent:SetColor(Color(41, 134, 204))
		if SERVER then
		if ent:IsNPC() and not ent:Horde_GetBossProperties() then
            ent:SetMaxHealth(ent:GetMaxHealth() * 1.25)
            ent:SetHealth(ent:GetMaxHealth() * 1.25)
        end
    end
end
end

hook.Add("EntityTakeDamage", "Horde_ShockproofTakeDamage", function (target, dmg)
    if not target:IsValid() then return end
    if target:IsNPC() and target:Horde_HasMutation("shockproof") and not (dmg:IsDamageType(DMG_BULLET) or dmg:IsDamageType(DMG_SNIPER) or dmg:IsDamageType(DMG_BUCKSHOT) or dmg:IsDamageType(DMG_CLUB) or dmg:IsDamageType(DMG_SLASH) or dmg:IsDamageType(DMG_GENERIC) or dmg:IsDamageType(DMG_CRUSH) or dmg:IsDamageType(DMG_SONIC) or dmg:IsDamageType(DMG_DIRECT)) then
	dmg:ScaleDamage(0.5)
end
end)

MUTATION.Hooks.Horde_OnUnsetMutation = function (ent, mutation)
    if not ent:IsValid() or mutation ~= "shockproof" then return end
	if SERVER then
	if ent:IsNPC() and not ent:Horde_GetBossProperties() then
ent:SetMaxHealth(ent:GetMaxHealth() / 1.25)
        end
    end
end
