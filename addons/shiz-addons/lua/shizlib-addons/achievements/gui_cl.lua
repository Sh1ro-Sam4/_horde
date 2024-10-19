shizlib.Achievements = shizlib.Achievements or {}

local s = shizlib.surface.s
local DTR = shizlib.surface.DTR
local colors = CFG.skinColors

function shizlib.Achievements.Open(tbl)
    shizlib.Achievements.fr = vgui.Create('DFrame')
    shizlib.Achievements.fr:SetSize(s(450), s(120))
    shizlib.Achievements.fr:SetPos(s(-450), s(50))
    shizlib.Achievements.fr:SetTitle(tbl.name)
    shizlib.Achievements.fr:MoveTo(s(0), s(50), .4, 0, -1, function()
        surface.PlaySound(CFG.skinSound['achievements'])
        timer.Simple(7, function()
            if IsValid(shizlib.Achievements.fr) then
                shizlib.Achievements.fr:MoveTo(s(-450), s(50), .4, 0, -1, function()
                    shizlib.Achievements.fr:Close()
                end)
            end
        end)
    end)
    
    local pnl = shizlib.Achievements.fr:Add('Panel')
    pnl:Dock(FILL)
    function pnl:Paint(w, h)
        shizlib.surface.DrawRightRect(s(35), s(35), s(50), s(50), color_white, Material(tbl.icon))
        -- DTR(s(10), s(10), s(50), s(50), color_white, Material(tbl.icon))
    end

    local lbl =  shizlib.Achievements.fr:Add('DLabel')
    lbl:SetText(tbl.description)
    lbl:SetFont('font.20')
    lbl:SetTextColor(color_white) 
    lbl:Dock(FILL)
    lbl:DockMargin(s(10),s(10),s(10),s(10))
end

netstream.Hook('shizlib.Achievements',function(data)
    shizlib.Achievements.Open(data)
end)

shizlib.getURLMaterial('https://i.imgur.com/MnjGHpQ.png') // #death
shizlib.getURLMaterial('https://i.imgur.com/yqBVB77.png') // #kill
shizlib.getURLMaterial('https://i.imgur.com/doXsoqb.png') // #accessory
shizlib.getURLMaterial('https://i.imgur.com/zAaFDcH.png') // #craft
shizlib.getURLMaterial('https://i.imgur.com/lNDK0ML.png') // #purchase

--[[Achievements Menu]]--

function shizlib.Achievements.QueryToAchievementsList(ply)
    if ply:IsValidPlayer() then
        netstream.Start('shizlib.Achievements.Query', {pl = ply})
    end
end

netstream.Hook('shizlib.Achievements.Query', function(data)
    local achs_tbl = data.achs
    local pl = data.pl

    shizlib.Achievements.ListMenu = vgui.Create('DFrame')
    local fr = shizlib.Achievements.ListMenu

    fr:SetSize(s(900), s(600))
    fr:Center()
    fr:SetTitle( ('Достижения - %s'):format(pl:Name()) )
    fr:MakePopup()
    fr.Player = data.pl
    fr.AchsTable = achs_tbl

    fr.ScrollPanel = fr:Add('DScrollPanel')
    fr.ScrollPanel:Dock(FILL)

    fr.AchsPanelList = {}
    local i = 0
    for k, v in SortedPairs(achs_tbl) do
        fr.AchsPanelList[i] = fr.ScrollPanel:Add('Panel')
        local pnl = fr.AchsPanelList[i]
        pnl:Dock(TOP)
        pnl:SetTall(s(60))
        pnl:DockMargin(0, 0, 0, s(2))
        function pnl:Paint(w, h)
            draw.RoundedBox(4, 0, 0, w, h, colors.hvr)
            DTR(s(4), s(4), s(52), s(52), color_white, Material(v.icon))
            draw.SimpleText(v.name, 'font.30', s(60), s(4), color_white, 0, 0)
            draw.SimpleText(v.description, 'font.24', s(60), s(34), color_white, 0, 0)
        end
        
        i = i + 1
    end
end)

/*
    Thirdperson
*/

DarkRP = DarkRP or {}

local function toggleThirdPerson()
    DarkRP.thirdPersonEnabled = not DarkRP.thirdPersonEnabled
end

concommand.Add('shizlib_thirdp', function()
    toggleThirdPerson()
end)

hook.Add("PlayerButtonUp", "dThirdPerson_keyBind", function(player, buttonId)
    if not IsFirstTimePredicted() then return end
    if player ~= LocalPlayer() then return end
    if buttonId ~= KEY_T then return end
    if gui.IsGameUIVisible() then return end
    if player:IsTyping() then return end
    if player.cdThirdPersonText then return end
    if input.LookupBinding('shizlib_thirdp') then return end
    chat.AddText(Color(122,185,4), '============================================')
    chat.AddText(color_white, 'Кажется вы нажали на "T" и попытались включить 3-е лицо')
    chat.AddText(color_white, 'Третье лицо переехало в консольную команду "shizlib_thirdp"')
    chat.AddText(color_white, 'Что-бы настроить бинд откройте консоль и напишите')
    chat.AddText(color_white, 'bind ', Color(122,185,4), '[KEY]', color_white, ' "shizlib_thirdp"')
    chat.AddText(Color(122,185,4), '============================================')
    player.cdThirdPersonText = true
end)

hook.Add("CalcView", "thirdPersonView", function(client, position, angles, fov, znear, zfar)
    if not DarkRP.thirdPersonEnabled then return end
    local distance = 70
    local delvar = 15

    local traceData = {
        start = position,
        endpos = position - angles:Forward() * distance + ((angles:Right() * distance) / delvar),
        filter = LocalPlayer()
    }

    local trace = util.TraceLine(traceData)
    local newDistance = trace.HitPos:Distance(position)

    local newDistance_2 = util.TraceLine({
        start = position,
        endpos = position - angles:Forward() * distance + ((-angles:Right() * distance) / delvar),
        filter = LocalPlayer()
    }).HitPos:Distance(position)

    local newDistance_3 = util.TraceLine({
        start = position,
        endpos = position - angles:Forward() * distance + ((angles:Up() * distance) / delvar),
        filter = LocalPlayer()
    }).HitPos:Distance(position)

    local newDistance_4 = util.TraceLine({
        start = position,
        endpos = position - angles:Forward() * distance + ((-angles:Up() * distance) / delvar),
        filter = LocalPlayer()
    }).HitPos:Distance(position)

    if newDistance < distance - 1 then
        distance = newDistance - 3
    end

    if newDistance_2 < distance - 1 then
        distance = newDistance_2 - 3
    end

    if newDistance_3 < distance - 1 then
        distance = newDistance_2 - 13
    end

    if newDistance_4 < distance - 1 then
        distance = newDistance_2 - 13
    end

    return {
        origin = position - angles:Forward() * distance + ((angles:Right()) / delvar),
        angles = angles,
        fov = fov,
        filter = LocalPlayer(),
        drawviewer = true,
        znear = nearZ,
        zfar = farZ
    }
end)