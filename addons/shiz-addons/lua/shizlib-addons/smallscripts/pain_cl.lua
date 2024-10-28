net.Receive('Pain', function()
    time = net.ReadFloat()
    local tm = CurTime() + time + 0.1
    debuff = net.ReadString()

    hook.Add('HUDPaint', 'painPaint', function()
        if debuff == 'шок' then
            shizlib.draw.ShadowText('Болевой шок ' .. (math.Clamp(math.Round(tm - CurTime(), 1), 0.1, 0.9)), 'font.20', 'font.20', ScrW() * 0.5, ScrH() * 0.4, color_white, 0.5, 0)
        elseif debuff == 'нога' then
            shizlib.draw.ShadowText('Перелом ' .. (math.Clamp(math.Round(tm - CurTime(), 1), 0.1, 5)), 'font.20', 'font.20', ScrW() * 0.5, ScrH() * 0.35, color_white, 0.5, 0)
        end
    end)

    if debuff == 'шок' then
        hook.Add('Think', 'painThink', function()
            local ang = LocalPlayer():EyeAngles()
            LocalPlayer():SetEyeAngles(ang + Angle(math.random(-1, 1), math.random(-1, 1), 0))
        end)
    end

    timer.Simple(time, function()
        hook.Remove('Think', 'painThink')
        hook.Remove('HUDPaint', 'painPaint')
        time = nil
        tm = nil
        debuff = nil
    end)
end)