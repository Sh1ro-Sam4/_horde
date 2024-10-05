MUTATION.PrintName = "Puncture"
MUTATION.Description = "Tinted purple. \nDamage ignores resistances and builds up Break. \nOnly randomly occurs starting from wave 8."
MUTATION.Wave = 8

MUTATION.Hooks = {}

MUTATION.Hooks.Horde_OnSetMutation = function(ent, mutation)
    if mutation == "puncture" then
        local c = ent:GetColor()
        ent:SetColor(Color(164, 0, 164))
    end
end

MUTATION.Hooks.Horde_OnPlayerDamageTaken = function(ply, dmg, bonus)
    if dmg:GetAttacker():IsNPC() and dmg:GetAttacker():Horde_HasMutation("puncture") and not dmg:IsDamageType(DMG_DIRECT) then
        dmg:SetDamageType(DMG_DIRECT)
		ply:Horde_AddDebuffBuildup(HORDE.Status_Break, dmg:GetDamage() * 2)
    end	
end

MUTATION.Hooks.Horde_OnUnsetMutation = function (ent, mutation)
if not ent:IsValid() or mutation ~= "puncture" then return end
end
