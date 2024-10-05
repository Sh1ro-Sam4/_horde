PERK.PrintName = "Putrefaction"
PERK.Description = "Damage removes Fume and Nemesis mutations. \nHeadshots build up Shock. \nShock causes the target to take 25% more damage as a flat multiplier."
PERK.Icon = "materials/perks/psycho/disembowel.png"
PERK.Params = {
    [1] = {value = 6},
}

PERK.Hooks = {}

PERK.Hooks.Horde_OnPlayerDamage = function (ply, npc, bonus, hitgroup, dmginfo)
    if not ply:Horde_GetPerk("shinigami_2_2") then return end
	

       
	   if npc:Horde_HasMutation("fume") then
            npc.Horde_Mutation["fume"] = nil
            npc.Horde_Mutation_Fume = nil
        end
		
		if npc:Horde_HasMutation("nemesis") then
            npc.Horde_Mutation["nemesis"] = nil
            npc.Horde_Mutation_Nemesis = nil
        end
		
	
    if hitgroup == HITGROUP_HEAD then
        npc:Horde_AddDebuffBuildup(HORDE.Status_Shock, dmginfo:GetDamage() * 0.3, ply, dmginfo:GetDamagePosition())
    end
end
