MUTATION.PrintName = "Wall"
MUTATION.Description = "Material set to brick. 50% decrease in physical damage taken, \nbut 50% increase in blast and ice damage taken if not a boss. \nBosses only get 25% physical resist but no Blast and Cold weakness. Only randomly occurs starting from wave 6."
MUTATION.Wave = 6

MUTATION.Hooks = {}

MUTATION.Hooks.Horde_OnSetMutation = function(ent, mutation)
    if mutation == "wall" then
		ent:SetMaterial("brick/brick_model")
    end
end

hook.Add("EntityTakeDamage", "Horde_WallTakeDamage", function (target, dmg)
    if not target:IsValid() then return end
    if target:IsNPC() and target:Horde_HasMutation("wall") and (dmg:IsDamageType(DMG_BULLET) or dmg:IsDamageType(DMG_SNIPER) or dmg:IsDamageType(DMG_BUCKSHOT) or dmg:IsDamageType(DMG_CLUB) or dmg:IsDamageType(DMG_SLASH) or dmg:IsDamageType(DMG_GENERIC) or dmg:IsDamageType(DMG_CRUSH) or dmg:IsDamageType(DMG_SONIC)) then
if not target:Horde_GetBossProperties() then
	dmg:ScaleDamage(0.5)
	else
	dmg:ScaleDamage(0.75)
end
end
    if target:IsNPC() and target:Horde_HasMutation("wall") and not target:Horde_GetBossProperties() and (dmg:IsDamageType(DMG_BLAST) or dmg:IsDamageType(DMG_MISSILEDEFENSE) or dmg:IsDamageType(DMG_REMOVENORAGDOLL)) then
	dmg:ScaleDamage(1.5)
end
end)

MUTATION.Hooks.Horde_OnUnsetMutation = function (ent, mutation)
    if not ent:IsValid() or mutation ~= "wall" then return end
end