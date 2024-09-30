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

    function Player:SendText(col1, name, msg)
        net.Start('shizlib-Chat')
        net.WriteColor(col1)
        net.WriteString(name)
        net.WriteString(msg)
        net.Send(self)
    end
else
    net.Receive('shizlib-Chat', function(len)
        chat.AddText(net.ReadColor(), net.ReadString(), color_white, net.ReadString())
    end)
end