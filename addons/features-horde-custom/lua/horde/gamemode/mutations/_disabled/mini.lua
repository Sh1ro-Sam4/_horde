MUTATION.PrintName = "Mini"
MUTATION.Description = "50% decreased character size.\nTriples action speed. \n50% less damage and max health."

MUTATION.Hooks = {}

MUTATION.Hooks.Horde_OnSetMutation = function(ent, mutation)
    if mutation == "mini" then
	ent.Horde_Mutation_Mini = true
        if SERVER then
            ent:SetModelScale(math.min(2.5, math.max(0.5, ent:GetModelScale()) * 0.5))
            ent:SetMaxHealth(ent:GetMaxHealth() * 0.75)
            ent:SetHealth(ent:GetMaxHealth() * 0.75)

            if ent.AnimationPlaybackRate then
                ent.AnimationPlaybackRate = ent.AnimationPlaybackRate * 3
            else
                ent:SetPlaybackRate(ent:GetPlaybackRate() * 3)
            end
        end
    end
end

MUTATION.Hooks.EntityTakeDamage = function(ply, dmg)
    if dmg:GetAttacker():IsNPC() and dmg:GetAttacker():Horde_HasMutation("mini") then
        dmg:ScaleDamage(0.5)
    end
end

MUTATION.Hooks.Horde_OnUnsetMutation = function (ent, mutation)
    if not ent:IsValid() or mutation ~= "mini" then return end
    if SERVER then
        ent:SetMaxHealth(ent:GetMaxHealth() / 0.75)
    end
	if ent.AnimationPlaybackRate then
        ent.AnimationPlaybackRate = ent.AnimationPlaybackRate / 3
    else
        ent:SetPlaybackRate(ent:GetPlaybackRate() / 3)
    end
	ent.Horde_Mutation_Mini = nil
end
