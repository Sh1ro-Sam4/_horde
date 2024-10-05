PERK.PrintName = "Custom Spells"
PERK.Description = "Dummy perk that sets up effects for custom spells. \nDoes not do anything."
PERK.Icon = "materials/perks/seismic_wave.png"
PERK.Params = {
    [1] = {value = 0.3, percent = true},
}

-- set up custom effects for new spectres

if SERVER then

function HORDE:RaiseCustomSpectre(ply, param, p2)
    local level = ply:Horde_GetSpellUpgrade("raise_phantasm")
    local p = {level = level}
    hook.Run("Horde_OnRaiseSpectre", ply, p)
    local spectres_count = 0
    if ply.Horde_drop_entities["npc_vj_horde_phantasm"] then
        spectres_count = spectres_count + ply.Horde_drop_entities["npc_vj_horde_phantasm"]
    end
    if ply.Horde_drop_entities["npc_vj_horde_shadow_weeper"] then
        if param and param.weeper_spectre and ply.Horde_drop_entities["npc_vj_horde_shadow_weeper"] >= 1 then
            return true
        end
        spectres_count = spectres_count + ply.Horde_drop_entities["npc_vj_horde_shadow_weeper"]
    end
	if ply.Horde_drop_entities["npc_vj_horde_shadow_gonarch"] then
        if param and param.gonarch_spectre and ply.Horde_drop_entities["npc_vj_horde_shadow_gonarch"] >= 1 then
            return true
        end
        spectres_count = spectres_count + ply.Horde_drop_entities["npc_vj_horde_shadow_gonarch"]
    end
    if spectres_count >= ply.Horde_Spectre_Max_Count then
        return true
    end
    ply:EmitSound("horde/spells/raise.ogg")
    local ent
    if param and param.weeper_spectre then
        ent = ents.Create("npc_vj_horde_shadow_weeper")
    else
	if param and param.gonarch_spectre then
		ent = ents.Create("npc_vj_horde_shadow_gonarch")
	else
        ent = ents.Create("npc_vj_horde_phantasm")
    end
	end
    ent.properties = p
    local pos = ply:GetPos()
    local dir = (ply:GetEyeTrace().HitPos - pos)
    dir:Normalize()
    local drop_pos = pos + dir * 50
    drop_pos.z = pos.z + 24
    ent:SetPos(drop_pos)
    if p2 then
        ent:SetPos(p2)
    end
    ent:SetAngles(Angle(0, ply:GetAngles().y, 0))
    ply:Horde_AddDropEntity(ent:GetClass(), ent)
    ent:SetNWEntity("HordeOwner", ply)
    ent:Spawn()

    timer.Simple(0.1, function ()
        if param and param.greater_phantasm then
            ent:Horde_SetGreaterPhantasm()
        end
        ent:AddRelationship("player D_LI 99")
        ent:AddRelationship("ally D_LI 99")
        if HORDE.items["npc_vj_horde_vortigaunt"] then
            ent:AddRelationship("npc_vj_horde_vortigaunt D_LI 99")
        end
        if HORDE.items["npc_vj_horde_combat_bot"] then
            ent:AddRelationship("npc_vj_horde_combat_bot D_LI 99")
        end
        if HORDE.items["npc_turret_floor"] then
            ent:AddRelationship("npc_turret_floor D_LI 99")
        end
        if HORDE.items["npc_manhack"] then
            ent:AddRelationship("npc_manhack D_LI 99")
        end
    end)

    -- Special case for turrets
    local id = ent:GetCreationID()
    ent:SetCollisionGroup(COLLISION_GROUP_PASSABLE_DOOR)

    -- Count Minions
    ply:Horde_SetMinionCount(ply:Horde_GetMinionCount() + 1)

    ent:CallOnRemove("Horde_EntityRemoved", function()
        if ent:IsValid() and ply:IsValid() then
            timer.Remove("Horde_MinionCollision" .. ent:GetCreationID())
            ply:Horde_RemoveDropEntity(ent:GetClass(), ent:GetCreationID())
            ply:Horde_SyncEconomy()
            ply:Horde_SetMinionCount(ply:Horde_GetMinionCount() - 1)
        end
    end)
end

function HORDE:RemoveCustomSpectres(ply)
    if HORDE.player_drop_entities[ply:SteamID()] then
        for id, ent in pairs(HORDE.player_drop_entities[ply:SteamID()]) do
            if ent:IsNPC() and (ent:GetClass() == "npc_vj_horde_phantasm" or ent:GetClass() == "npc_vj_horde_shadow_weeper") then
                ent:Remove()
            end
        end
    end
end

end
