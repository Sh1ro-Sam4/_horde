PERK.PrintName = "Harvest"
PERK.Description = "Kills release a damaging mist. \nMist deals damage equal to quintuple the max health of the target + 100."
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

PERK.Hooks.Horde_OnEnemyKilled = function(victim, killer, inflictor)
    if not victim:IsValid() or not victim:IsNPC() or not killer:IsPlayer() then return end
    if not killer:Horde_GetPerk("shinigami_4_1") then return end
	--if not victim:GetVar("is_elite") then return end
    if inflictor:IsNPC() then return end -- Prevent infinite chains
	local p = math.random()
        local dmg = (victim:GetMaxHealth() * 5) + 100
        local rad = 200
       local e = EffectData()
   local effectdata = EffectData()
    effectdata:SetOrigin(victim:GetPos())
   effectdata:SetRadius(200)
    util.Effect("heal_mist", effectdata)
    victim:EmitSound("arccw_go/smokegrenade/smoke_emit.wav", 90, 100, 1, CHAN_AUTO)
      util.BlastDamage(victim, killer, victim:GetPos(), rad, dmg)
	  end
	  
