kate.AddCommand('Help', function(pl)
    -- pl:PrintMessage(HUD_PRINTTALK, "'!ready' - Get ready")
    -- pl:PrintMessage(HUD_PRINTTALK, "'!shop' - Open shop")
    -- pl:PrintMessage(HUD_PRINTTALK, "'!drop' - Drop weapon")
    -- pl:PrintMessage(HUD_PRINTTALK, "'!throwmoney <amount>' - Drop money")
    -- pl:PrintMessage(HUD_PRINTTALK, "'!rtv' -Initiate a map change vote")
end)
:SetFlag('help')

kate.AddCommand('Start', function(pl)
    -- Start(pl)
end)
:SetFlag('start')

kate.AddCommand('Ready', function(pl)
    -- Ready(pl)
end)
:SetFlag('ready')

kate.AddCommand('End', function(pl)
    -- End(pl)
end)
:SetFlag('end')

kate.AddCommand('ItemConfig', function(pl)
    -- ItemConfig(pl)
end)
:SetFlag('itemconfig')

kate.AddCommand('EnemyConfig', function(pl)
    -- EnemyConfig(pl)
end)
:SetFlag('enemyconfig')

kate.AddCommand('ClassConfig', function(pl)
    -- ClassConfig(pl)
end)
:SetFlag('classconfig')

kate.AddCommand('MapConfig', function(pl)
    -- MapConfig(pl)
end)
:SetFlag('mapconfig')

kate.AddCommand('Drop', function(pl)
    -- if pl:GetActiveWeapon() and pl:GetActiveWeapon():IsValid() and pl:GetActiveWeapon().Base == "horde_spell_weapon_base" then
    --     return
    -- end
    -- pl:DropWeapon()
end)
:SetFlag('drop')

kate.AddCommand('ThrowMoney', function(pl, amount)
    -- if not amount then return end
    -- pl:Horde_DropMoney(amount)
end)
:SetFlag('dropmoney')
:AddAlias('dropmoney')
-- :AddParam('NUMBER', true)

kate.AddCommand('RTV', function(pl)
    -- HORDE.VoteChangeMap(pl)
end)
:SetFlag('rtv')

kate.AddCommand('Stats', function(pl)
    -- StatsMenu(pl)
end)
:SetFlag('stats')