hook.Add('PlayerButtonDown', 'shizlib-InventoryOpen', function(ply, key)
    if ply:IsValidPlayer() and key == KEY_I then
        ply:OpenContainer( ply.Inventory:GetID(), itemstore.Translate( "inventory" ), true )
    end
end)