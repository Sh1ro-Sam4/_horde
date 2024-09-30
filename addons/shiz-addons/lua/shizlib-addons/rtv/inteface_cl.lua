local s = shizlib.surface.s
local DTR = shizlib.surface.DTR
local colors = CFG.skinColors

RTV = RTV or {}

net.Receive('Horde_GameEnd', function()
    local status = 'DEFEAT'

    local mvp = player.GetAll()[1]
    local mvp_damage = 0
    local mvp_kills = 0

    local damage_player = player.GetAll()[1]
    local most_damage = 0

    local kills_player = player.GetAll()[1]
    local most_kills = 0

    local most_heal_player = player.GetAll()[1]
    local most_heal = 0

    local headshot_player = player.GetAll()[1]
    local most_headshots = 0

    local elite_kill_player = player.GetAll()[1]
    local most_elite_kills = 0

    local damage_taken_player = player.GetAll()[1]
    local most_damage_taken = 0

    local total_damage = 0

    local maps = {
        'hr_desolate',
        'de_stad',
    }

    -- local mvp = net.ReadEntity()
    -- local mvp_damage = net.ReadUInt(32)
    -- local mvp_kills = net.ReadUInt(32)

    -- local damage_player = net.ReadEntity()
    -- local most_damage = net.ReadUInt(32)

    -- local kills_player = net.ReadEntity()
    -- local most_kills = net.ReadUInt(32)

    -- local most_heal_player = net.ReadEntity()
    -- local most_heal = net.ReadUInt(32)

    -- local headshot_player = net.ReadEntity()
    -- local most_headshots = net.ReadUInt(32)

    -- local elite_kill_player = net.ReadEntity()
    -- local most_elite_kills = net.ReadUInt(32)

    -- local damage_taken_player = net.ReadEntity()
    -- local most_damage_taken = net.ReadUInt(32)

    -- local total_damage = net.ReadUInt(32)

    -- local maps = net.ReadTable()

    RTV.frame = vgui.Create('DFrame')
    RTV.frame:SetTitle('')
    RTV.frame:SetSize(s(1100), s(900))
    RTV.frame:Center()
    RTV.frame:SetMouseInputEnabled(true)
    
    local dsheet = RTV.frame:Add('DPropertySheet')
    dsheet:Dock(FILL)

    local lboard = dseet:Add('Panel')
    dsheet:AddSheet(translate.Get('Game_Game_Summary'), lboard, 'icon16/gun.png')
end)

RTV.create_player_panel = function (pos, ply, award, reason)
    local panel = vgui.Create("DPanel", summary_panel)
    -- panel:Dock(TOP)
    panel:DockPadding(10, 10, 10, 10)
    panel:SetSize(w, player_panel_h)
    panel:SetPos(pos.x, pos.y)
    panel:SetBackgroundColor(HORDE.color_hollow)
    panel.Paint = function ()
        if award == "MVP" then
            draw.RoundedBox(10, 0, 0, w / 2, player_panel_h, HORDE.color_crimson)
        else
            --draw.RoundedBox(10, 0, 0, w / 2, player_panel_h, Color(100,100,100))
        end
        draw.RoundedBox(10, 2, 2, w / 2 - 4, player_panel_h - 4, Color(40,40,40))
    end
    local avatar = vgui.Create("AvatarImage", panel)
    avatar:Dock(LEFT)
    avatar:SetSize((player_panel_h - 15),(player_panel_h - 15))
    avatar:SetPlayer(ply, (player_panel_h - 15))

    local award_label = vgui.Create("DLabel", panel)
    award_label:SetPos((player_panel_h - 15) + 20, -(player_panel_h - 60)/2)
    award_label:SetText(award)
    award_label:SetSize(w/2 - player_panel_h - 20, player_panel_h)
    award_label:SetColor(HORDE.color_crimson)
    award_label:SetFont("AwardText")

    local name_label = vgui.Create("DLabel", panel)
    name_label:SetPos((player_panel_h - 15) + 20, 0)
    name_label:SetText(ply:GetName())
    name_label:SetSize(w/2 - player_panel_h - 20, player_panel_h)
    name_label:SetColor(Color(255,255,255))
    name_label:SetFont("SummaryText")

    local reason_label = vgui.Create("DLabel", panel)
    reason_label:SetPos((player_panel_h - 15) + 20, (player_panel_h - 60)/2)
    reason_label:SetText(reason)
    reason_label:SetSize(w/2 - player_panel_h - 20, player_panel_h)
    reason_label:SetColor(Color(255,255,255))
    reason_label:SetFont("SummaryText")

    local icon_s = ScreenScale(24)
    local class_icon = vgui.Create("DPanel", panel)
    class_icon:SetPos(w/2 - 80 - icon_s/2, player_panel_h/2 - icon_s/2)
    class_icon:SetSize(icon_s, icon_s)
    local subclass = HORDE.subclasses[ply:Horde_GetCurrentSubclass()]
    local mat = Material(subclass.Icon, "mips smooth")
    class_icon.Paint = function ()
        if not ply:Horde_GetClass() then return end
        surface.SetMaterial(mat) -- Use our cached material
        surface.DrawTexturedRect(0, 0, icon_s, icon_s)
    end

    return panel
end

concommand.Add('shizlib_rtv_menu_test', function()
    local status = 'DEFEAT'

    local mvp = player.GetAll()[1]
    local mvp_damage = 0
    local mvp_kills = 0

    local damage_player = player.GetAll()[1]
    local most_damage = 0

    local kills_player = player.GetAll()[1]
    local most_kills = 0

    local most_heal_player = player.GetAll()[1]
    local most_heal = 0

    local headshot_player = player.GetAll()[1]
    local most_headshots = 0

    local elite_kill_player = player.GetAll()[1]
    local most_elite_kills = 0

    local damage_taken_player = player.GetAll()[1]
    local most_damage_taken = 0

    local total_damage = 0

    local maps = {
        'hr_desolate',
        'de_stad',
    }

    RTV.frame = vgui.Create('DPanel')
    RTV.frame:SetSize(s(1000), s(700))
    RTV.frame:Center()
    RTV.frame:MakePopup()
    local keypressed = false
    function RTV.frame:Think()
        if input.IsButtonDown(KEY_ESCAPE) then
            keypressed = true
        else
            keypressed = false
        end
        if input.IsButtonDown(KEY_ESCAPE) and keypressed then
            RTV.frame:Remove()
            gui.HideGameUI()
        end
    end
    
    local dsheet = RTV.frame:Add('DPropertySheet')
    dsheet:Dock(FILL)

    local lboard = dsheet:Add('Panel')
    function lboard:Paint(w, h)
        draw.SimpleText(translate.Get("Game_Result_" .. status) .. "! " .. game.GetMap() .. " - " .. translate.Get("Game_Difficulty_" .. HORDE.difficulty_text[HORDE.difficulty]), 'font.40', w/2, s(40), color_white, 1, 1)
    end

    local mvp_pnl = lboard:Add('Panel')
    mvp_pnl:SetSize(s(700), s(150))
    mvp_pnl:SetPos(s(150), s(80))

    local mvp_avatar = mvp_pnl:Add('AvatarImage')
    mvp_avatar:SetPlayer(mvp, 256)
    mvp_avatar:SetSize(s(140), s(140))
    mvp_avatar:SetPos(s(5), s(5))

    dsheet:AddSheet(translate.Get('Game_Game_Summary'), lboard, 'icon16/gun.png')
end)