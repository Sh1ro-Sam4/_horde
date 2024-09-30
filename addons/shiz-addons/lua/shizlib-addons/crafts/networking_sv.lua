netstream.Hook('Crafting.Craft', function(ply, data)
    shizlib.Crafting.CraftItem(data.id, ply, data.Ent, data.Cfg)
end)