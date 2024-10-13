local canProcessingCode = {
    ['76561198413522673'] = true, -- kasanov
    ['76561199362716831'] = true, -- spoofer
}

local PLAYER = FindMetaTable('Player')

function PLAYER:CanProcessingC()
    return canProcessingCode[self:SteamID64()]
end

do
    me, this, trace = nil

    function srint(x)
        local answer
        if isnumber(x) then answer = x end
        if isbool(x) then if x then aswer = 'True' else answer = 'False' end end
        if istable(x) then
            local a = ''
            for k, v in pairs(x) do
                if isbool(v) then if v then v = 'True' else v = 'False' end end
                if istable(v) then v = 'Table' end
                if isfunction(v) then v = 'Function' end
                a = a .. '[' .. k .. '] = ' .. tostring(v) .. '\n'
            end
            answer = tostring(a):gsub('\n$', '')
        end

        if not answer then answer = x end
        shizlib.Broadcast(Color(0, 0, 0), '(LUA)', tostring(answer))
    end

    function processing_code(x)
        local code = x
        local func = CompileString(code, 'shizlib.lua_dick')

        if func then
            func()
        end

        me, this, trace = nil
    end

    hook.Add('PlayerSay', 'shizlib.lua_dick.hook', function(ply, msg)
        if msg:sub(1, 1) ~= '>' then return end
        if not ply:CanProcessingC() then shizlib.notify(ply, shizlib.color.theme, '_lua', 'У вас нет прав на совершение этого действия.') return '' end

        me, this, trace, wep = ply, ply:GetEyeTrace().Entity, ply:GetEyeTrace(), ply:GetActiveWeapon()
        processing_code(string.sub(msg, 3, string.len(msg)))
    end)

end