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
        shizlib.Broadcast(Color(174,0,197), '[Kroject] ', table.Random(message_tbl))
    end)
else
    net.Receive('shizlib-Chat', function(len)
        chat.AddText(net.ReadColor(), net.ReadString(), color_white, net.ReadString())
    end)
end