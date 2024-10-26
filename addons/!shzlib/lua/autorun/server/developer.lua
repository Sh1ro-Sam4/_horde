hook.Add('KeyPress', 'shizlib-doubleJump', function(ply, key)
    if not ply:IsValidPlayer() then return end
    if not CFG.djump[ply:GetUserGroup()] then return end

    -- if not ply:IsSuperAdmin() then return end

    if not ply.dJump or ply:IsOnGround() then ply.dJump = 0 end
    
    if key ~= 2 then return end

    if ply.dJump >= 2 then return end

    ply.dJump = ply.dJump + 1
    if ply.dJump >= 2 then
        local vel = Vector(0, 0, ply:GetVelocity().z * -1)
        vel = vel + Vector(0, 0, 300)

        ply:SetVelocity(vel)
    end
end)

hook.Add('PlayerSpawn', 'shizlib-premiumKit', function(ply)
    if CFG.canHook[ply:GetUserGroup()] then
        timer.Simple(.1, function()
            ply:Give('weapon_grapplehook')
        end)
    end
end)

hook.Add('InitPostEntity', 'shizlib-HordeBlacklistMap', function()
    HORDE.map_blacklist = CFG.blacklistMap

    HORDE.map_whitelist = {}
    HORDE.map_blacklist = {
        'cs_assault',
        'cs_compound',
        'cs_havana',
        'cs_italy',
        'cs_militia',
        'cs_office',
        'de_aztec',
        'de_cbble',
        'de_chateau',
        'de_dust',
        'de_dust2',
        'de_inferno',
        'de_nuke',
        'de_piranesi',
        'de_port',
        'de_prodigy',
        'de_tides',
        'de_train',
        'test_hardware',
        'test_speakers',
    }

    function HORDE:GetNextMaps()
        local map_list = {}

        -- If there is a whitelist, only use maps in the whitelist.
        HORDE:GetMapWhitelist()
        if HORDE.map_whitelist and not table.IsEmpty(HORDE.map_whitelist) then
            return HORDE.map_whitelist
        end

        HORDE:GetMapBlacklist()
        local maps = file.Find( "maps/*.bsp", "GAME")
        for _, map in ipairs( maps ) do
            map = map:sub(1, -5)
            for _, blacklist_map in pairs(CFG.blacklistMap) do
                if map == blacklist_map then goto cont end
            end
            table.insert(map_list, map)
            ::cont::
        end
        
        return map_list
    end

    local Player = FindMetaTable('Player')

    function Player:Horde_SetExp(class_name, exp)
        if SERVER then
        end
        if not self:IsValid() then return end
        if not self.Horde_Exps then self.Horde_Exps = {} end
        if not class_name then return end
        -- exp = exp + 3
        exp = exp
        self.Horde_Exps[class_name] = exp
        local level = self:Horde_GetLevel(class_name)
        if exp >= HORDE:GetExpToNextLevel(level + 1) then
            self:Horde_SetLevel(class_name, level + 1)
            self.Horde_Exps[class_name] = 0
        end
    end

    -- HORDE:CreateEnemy('Psycho Zombie', 'npc_cs_pczombie', 1, 1, false, .5, 1, 1, 1)
    -- HORDE:CreateEnemy('Doctor Zombie', 'npc_cs_zombeheal', 1, 1, false, .5, 1, 1, 1)

    -- HORDE:CreateEnemy('Heavy Zombie', 'npc_cs_fatzombie', 1, 2, false, .5, 1, 1, 1)
    -- HORDE:CreateEnemy('Light Zombie', 'npc_cs_spezombie', 1, 2, false, .5, 1, 1, 1)
    -- HORDE:CreateEnemy('Heavy Zombie Master', 'npc_cs_heavm', 1, 2, false, .5, 1, 1, 1)
    -- HORDE:CreateEnemy('Psycho Zombie', 'npc_cs_pczombie', 1, 2, false, .5, 1, 1, 1)
    -- HORDE:CreateEnemy('Doctor Zombie', 'npc_cs_zombeheal', 1, 2, false, .5, 1, 1, 1)

    -- HORDE:CreateEnemy('Deimos', 'npc_cs_deimos', 1, 3, true, 1, 1, 1, 1)
    -- HORDE:CreateEnemy('Heavy Zombie', 'npc_cs_fatzombie', 1, 3, false, .5, 1, 1, 1)
    -- HORDE:CreateEnemy('Light Zombie', 'npc_cs_spezombie', 1, 3, false, .5, 1, 1, 1)
    -- HORDE:CreateEnemy('Heavy Zombie Master', 'npc_cs_heavm', 1, 3, false, .5, 1, 1, 1)
    -- HORDE:CreateEnemy('Psycho Zombie', 'npc_cs_pczombie', 1, 3, false, .5, 1, 1, 1)
    -- HORDE:CreateEnemy('Doctor Zombie', 'npc_cs_zombeheal', 1, 3, false, .5, 1, 1, 1)

    -- HORDE:CreateEnemy('Deimos', 'npc_cs_deimos', 1, 4, true, .5, 1, 1, 1)
    -- HORDE:CreateEnemy('Heavy Zombie', 'npc_cs_fatzombie', 1, 4, false, .5, 1, 1, 1)
    -- HORDE:CreateEnemy('Light Zombie', 'npc_cs_spezombie', 1, 4, false, .5, 1, 1, 1)
    -- HORDE:CreateEnemy('Heavy Zombie Master', 'npc_cs_heavm', 1, 4, false, .5, 1, 1, 1)
    -- HORDE:CreateEnemy('Psycho Zombie', 'npc_cs_pczombie', 1, 4, false, .5, 1, 1, 1)
    -- HORDE:CreateEnemy('Doctor Zombie', 'npc_cs_zombeheal', 1, 4, false, .5, 1, 1, 1)

    -- HORDE:CreateEnemy('Deimos', 'npc_cs_deimos', 1, 6, true, .5, .33, 1, 1)
    -- HORDE:CreateEnemy('Heavy Zombie', 'npc_cs_fatzombie', 1, 6, false, .5, 1, 1, 1)
    -- HORDE:CreateEnemy('Light Zombie', 'npc_cs_spezombie', 1, 6, false, .5, 1, 1, 1)
    -- HORDE:CreateEnemy('Heavy Zombie Master', 'npc_cs_heavm', 1, 6, false, .5, 1, 1, 1)
    -- HORDE:CreateEnemy('Psycho Zombie', 'npc_cs_pczombie', 1, 6, false, .5, 1, 1, 1)
    -- HORDE:CreateEnemy('Doctor Zombie', 'npc_cs_zombeheal', 1, 6, false, .5, 1, 1, 1)

    -- HORDE:CreateEnemy('Deimos', 'npc_cs_deimos', 1, 7, true, .5, .33, 1, 1)
    -- HORDE:CreateEnemy('Heavy Zombie', 'npc_cs_fatzombie', 1, 7, false, .5, 1, 1, 1)
    -- HORDE:CreateEnemy('Light Zombie', 'npc_cs_spezombie', 1, 7, false, .5, 1, 1, 1)
    -- HORDE:CreateEnemy('Heavy Zombie Master', 'npc_cs_heavm', 1, 7, false, .5, 1, 1, 1)
    -- HORDE:CreateEnemy('Psycho Zombie', 'npc_cs_pczombie', 1, 7, false, .5, 1, 1, 1)
    -- HORDE:CreateEnemy('Doctor Zombie', 'npc_cs_zombeheal', 1, 7, false, .5, 1, 1, 1)

    -- HORDE:CreateEnemy('Deimos', 'npc_cs_deimos', 1, 8, true, .5, .33, 1, 1)
    -- HORDE:CreateEnemy('Heavy Zombie', 'npc_cs_fatzombie', 1, 8, false, .5, 1, 1, 1)
    -- HORDE:CreateEnemy('Light Zombie', 'npc_cs_spezombie', 1, 8, false, .5, 1, 1, 1)
    -- HORDE:CreateEnemy('Heavy Zombie Master', 'npc_cs_heavm', 1, 8, false, .5, 1, 1, 1)
    -- HORDE:CreateEnemy('Psycho Zombie', 'npc_cs_pczombie', 1, 8, false, .5, 1, 1, 1)
    -- HORDE:CreateEnemy('Doctor Zombie', 'npc_cs_zombeheal', 1, 8, false, .5, 1, 1, 1)

    -- HORDE:CreateEnemy('Deimos', 'npc_cs_deimos', 1, 9, true, .5, .33, 1, 1)
    -- HORDE:CreateEnemy('Heavy Zombie', 'npc_cs_fatzombie', 1, 9, false, .5, 1, 1, 1)
    -- HORDE:CreateEnemy('Light Zombie', 'npc_cs_spezombie', 1, 9, false, .5, 1, 1, 1)
    -- HORDE:CreateEnemy('Heavy Zombie Master', 'npc_cs_heavm', 1, 9, false, .5, 1, 1, 1)
    -- HORDE:CreateEnemy('Psycho Zombie', 'npc_cs_pczombie', 1, 9, false, .5, 1, 1, 1)
    -- HORDE:CreateEnemy('Doctor Zombie', 'npc_cs_zombeheal', 1, 9, false, .5, 1, 1, 1)

    -- HORDE:CreateEnemy('Deimos', 'npc_cs_deimos', 1, 10, true, .5, .33, 1, 1)
    -- HORDE:CreateEnemy('Heavy Zombie', 'npc_cs_fatzombie', 1, 10, false, .5, 1, 1, 1)
    -- HORDE:CreateEnemy('Light Zombie', 'npc_cs_spezombie', 1, 10, false, .5, 1, 1, 1)
    -- HORDE:CreateEnemy('Heavy Zombie Master', 'npc_cs_heavm', 1, 10, false, .5, 1, 1, 1)
    -- HORDE:CreateEnemy('Psycho Zombie', 'npc_cs_pczombie', 1, 10, false, .5, 1, 1, 1)
    -- HORDE:CreateEnemy('Doctor Zombie', 'npc_cs_zombeheal', 1, 10, false, .5, 1, 1, 1)

    -- HORDE:NormalizeEnemiesWeight()
end)