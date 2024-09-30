hook.Add('PlayerDeath', 'Kill.Ach', function(vic, inflictor, ply)
    if IsValid(ply) and (ply:IsPlayer()) and (ply ~= vic) then
        shizlib.Achievements.Give(ply, '#kill')
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