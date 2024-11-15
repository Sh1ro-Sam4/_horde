-- local ply = Player(118)

-- local id = ply.Inventory:GetID()
-- local con = itemstore.containers.Get( id )

-- local ent = ents.Create('base_accessory')
-- ent:SetPos(ply:GetPos())
-- ent:Spawn()
-- ent:Activate()
-- ent:SetID('santapenguin')
-- ent:SetModel(SH_ACC.List[ent:GetID()].mdl)

-- ply:PickupItem(ent)

hook.Add('PlayerSay', 'shz-UsergroupRainbowNick', function(ply, text)
    if ply:GetUserGroup() == 'founder' then
        shizlib.Broadcast(Color(0, 0, 0, 0), ply:Name(), ': ' .. text)
        return ''
    end
end)