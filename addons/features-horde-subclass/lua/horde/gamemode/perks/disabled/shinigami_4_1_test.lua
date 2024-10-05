PERK.PrintName = "Harvest"
PERK.Description = "Cold damage deals splash damage."
PERK.Icon = "materials/perks/coup.png"
PERK.Params = {
    [1] = {value = 10},
    [2] = {value = 0.25, percent = true},
	[3] = {value = 1},
	[4] = {value = 0.01, percent = true},
	[5] = {value = 0.08, percent = true},
	[6] = {value = 5},
	[7] = {value = 0.01, percent = true},
	[8] = {value = 0.04, percent = true},
	[9] = {value = 3},
}

PERK.Hooks = {}

PERK.Hooks.PostEntityTakeDamage = function (ent, dmginfo, took)
    local inflictor = dmginfo:GetInflictor()
    if inflictor:IsNPC() then return end
    local attacker = dmginfo:GetAttacker()
    local dmgtype = dmginfo:GetDamageType()
    if took and ent:IsNPC() and attacker:IsPlayer() and attacker:Horde_GetPerk("shinigami_4_1") and (dmgtype == DMG_REMOVENORAGDOLL or dmgtype == DMG_DIRECT) then
        --local e = EffectData()
        --e:SetOrigin(ent:GetPos())
        --util.Effect("Explosion", e)
        --util.BlastDamage(victim, killer, victim:GetPos(), rad, dmg)
        local dmg = DamageInfo()
        dmg:SetAttacker(attacker)
        dmg:SetInflictor(ent)
        dmg:SetDamageType(dmginfo:GetDamageType())
        dmg:SetDamage(dmginfo:GetDamage() / 2)
        dmg:SetDamageForce(Vector(0,0,0))
        dmg:SetDamageCustom(HORDE.DMG_SPLASH)
        util.BlastDamageInfo(dmg, ent:GetPos(), 140)
    end
end

