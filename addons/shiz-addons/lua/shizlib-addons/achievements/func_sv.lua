hook.Add('PlayerButtonDown', 'F4Press', function(ply, key)
    if ply:IsValidPlayer() and key == KEY_F4 then
        shizlib.Achievements.Give(ply, '#f4_open')
    end
end)

hook.Add('OnNPCKilled', 'Kill.Ach', function(npc, att, inf)
    if att:IsValidPlayer() then
        shizlib.Achievements.Give(att, '#kill', 1)
        shizlib.Achievements.Give(att, '#monster', 1)
    end
end)

hook.Add('PlayerDeath',  'Death.Ach', function(ply, _, __)
    if IsValid(ply) and (ply:IsPlayer()) and (ply ~= vic) then
        shizlib.Achievements.Give(ply, '#death')
    end
end)

hook.Add('shizlib:purchaseSeller', 'Purchase.Ach', function(ply)
    shizlib.Achievements.Give(ply, '#purchase')
end)

hook.Add('shizlib:crafting', 'Purchase.Ach', function(ply)
    shizlib.Achievements.Give(ply, '#craft')
end)

hook.Add('shizlib:accessoryEquip', 'Accessory.Ach', function(ply)
    shizlib.Achievements.Give(ply, '#accessory')
end)

netstream.Hook('shizlib.Achievements.Query', function(ply, data)
    local tbl = {}

    if not data.pl:IsValidPlayer() or not data.pl.Achs then return end

    local i = 0
    for k, v in pairs(data.pl.Achs) do
        tbl[i] = shizlib.Achievements.CFG[k]
        i = i + 1
    end

    netstream.Start(ply, 'shizlib.Achievements.Query', {achs = tbl, pl = data.pl})
end)