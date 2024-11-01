hook.Add('PlayerButtonDown', 'shizlib-InventoryOpen', function(ply, key)
    if ply:IsValidPlayer() and key == KEY_I then
        ply:OpenContainer( ply.Inventory:GetID(), itemstore.Translate( "inventory" ), true )
    end
end)

local Player = FindMetaTable('Player')
function Player:SHZ_GiveItemstoreGift(waves, diff)
    if waves < 10 then return end
    local count = diff
    local id = self.Inventory:GetID()
    local con = itemstore.containers.Get( id )

    for i = 1, count + 1 do
        local entity = table.Random(CFG.dropOnDefeat)
        local data = {
            ['Model'] = shizlib.Resources[entity].model,
            ['Class'] = string.format('shizlib_resource_%s', entity),
            ['FPPOwnerID'] = self:SteamID(),
        }
        local item = itemstore.Item(string.format('shizlib_resource_%s', entity))
        item:SetModel(shizlib.Resources[entity].model)
        con:AddItem(item, true)
    end
end

shizlib.Accessory = shizlib.Accessory or {}

-- hook.Add('Think', 'shizlib-Accessory', function()
-- timer.Create('shizlib-Accessory', .3, 0, function()
--     for ply, info in pairs(shizlib.Accessory) do
--         local ed = EffectData()
--         ed:SetOrigin(ply:GetPos() + ply:OBBCenter()*1.7)
--         util.Effect(info, ed)
--     end
-- end)