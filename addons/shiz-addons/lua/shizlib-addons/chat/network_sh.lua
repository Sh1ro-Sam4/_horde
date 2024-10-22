if SERVER then
    util.AddNetworkString('shizlib-Chat')

    local Player = FindMetaTable('Player')

    function shizlib.Broadcast(col1, name, msg)
        net.Start('shizlib-Chat')
            net.WriteColor(col1)
            net.WriteString(name)
            net.WriteString(msg)
        net.Broadcast()
    end

    function Player:ChatPrint(col1, name, msg)
        net.Start('shizlib-Chat')
        net.WriteColor(col1)
        net.WriteString(name)
        net.WriteString(msg)
        net.Send(self)
    end

    local message_tbl = {
        'Telegram channel: t.me/kroject',
        'Discord server: https://discord.gg/a8H9eUTcgR',
    }

    timer.Create('Broadcast-SelfProviding:)', 180, 0, function()
        shizlib.Broadcast(Color(174,0,197), '[INFO] ', table.Random(message_tbl))
    end)
else
    net.Receive('shizlib-Chat', function(len)
        chat.AddText(net.ReadColor(), net.ReadString(), color_white, net.ReadString())
    end)
end

if SERVER then
    util.AddNetworkString('shizlib.ToggleChat')

    net.Receive('shizlib.ToggleChat', function(len, pl)
        pl:SetNWBool('IsTyping', net.ReadBool())
    end)

    hook.Add('PlayerConnect', 'shizlib-ChatNotifyConnecting', function(name, ip)
        local usergroup = 'user'
        kate.DB:Query( string.format( 'SELECT * FROM kate_usergroups WHERE IP = %q;', ip ) )
        :SetOnSuccess( function( _, info )
            usergroup = info[1]['ExpireGroup']
        end )
        :Start()
        shizlib.Broadcast(Color(0,0,0), '(CONNECT) ', string.format('%s %s подключается на сервер!', usergroup ~= 'user' and 'VIP' or 'Игрок', name))
    end)

    hook.Add('PlayerDisconnected', 'shizlib-ChatNotifyDisconnecting', function(ply) 
        shizlib.Broadcast(Color(0,0,0), '(DISCONNECT) ', string.format('%s вышел с сервера', ply:Name()))
    end)
end