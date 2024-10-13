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
end)

-- timer.Create('goida', 3, 0, function()
--     for _, ply in ipairs(player.GetAll()) do
--         ply:Say('ИНФЕКЦИЯ ГОЙДА')
--     end
-- end)

-- local ply = Player(19)

-- local entity = '3dglasses'

-- local ent = ents.Create('base_accessory')
-- ent:SetPos(ply:GetPos())
-- ent:Spawn()
-- ent:Activate()
-- ent:SetID(entity)
-- ent:SetModel(SH_ACC.List[ent:GetID()].mdl)

-- ply:PickupItem(ent)