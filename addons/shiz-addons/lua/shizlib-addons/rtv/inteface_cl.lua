local s = shizlib.surface.s
local DTR = shizlib.surface.DTR
local colors = CFG.skinColors

RTV = RTV or {}

local player_panel_h = s(150)
local w = s(1000)
local h = s(700)

local players_diff_votes = {}
local remaining_time = 60

net.Receive("Horde_VotemapSync", function (len)
    players_map_votes = net.ReadTable()
end)

net.Receive("Horde_VotediffSync", function (len)
    players_diff_votes = net.ReadTable()
end)

net.Receive("Horde_RemainingTime", function (len)
    remaining_time = net.ReadInt(8)
end)

local players_map_votes = {
    ['hr_desolate'] = 0,
    ['de_stad'] = 0,
    ['hr_bloodshellmail'] = 0,
}

RTV.create_player_panel = function (pnl, pos, ply, award, reason)
    local panel = vgui.Create("DPanel", pnl)
    panel:DockPadding(10, 10, 10, 10)
    panel:SetSize(w, player_panel_h)
    panel:SetPos(pos.x, pos.y)
    panel:SetBackgroundColor(HORDE.color_hollow)
    panel.Paint = function ()
        draw.RoundedBox(10, 2, 2, w / 2 - 4, player_panel_h - 4, colors.hvr)
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

RTV.map_btns = {}
RTV.create_map_panel = function(pnl, map)
    local vote_btn = vgui.Create("DButton", pnl)
    vote_btn:DockMargin(10, 5, 10, 5)
    vote_btn:SetSize(pnl:GetParent():GetWide(), 50)
    vote_btn:Dock(TOP)
    vote_btn:SetText('')
    function vote_btn:Votemap(vote_btn, map)
        for btn, _ in pairs(RTV.map_btns) do
            RTV.map_btns[btn] = 0
        end
        RTV.map_btns[vote_btn] = 1
        -- Send vote to server
        net.Start("Horde_Votemap")
        net.WriteString(map)
        net.SendToServer()
    end
    vote_btn.DoClick = function (self)
        self:Votemap(self, map)
        surface.PlaySound("UI/buttonclick.wav")
    end

    players_map_votes[map] = 0

    local name_label = vgui.Create("DLabel", vote_btn)
    name_label:Dock(LEFT)
    name_label:SetText("")
    name_label:SetSize(250, 80)
    name_label:SetColor(Color(255,255,255))
    name_label:SetFont("Content")
    name_label.Paint = function(self)
        draw.SimpleText(map, "Content", 10, 20, Color(255,255,255), TEXT_ALIGN_LEFT)
    end

    local count_label = vgui.Create("DLabel", vote_btn)
    count_label:Dock(RIGHT)
    count_label:SetSize(50, 80)
    count_label:SetColor(Color(255,255,255))
    count_label:SetFont("Content")
    count_label:SetText("")
    count_label.Paint = function ()
        if players_map_votes[map] then
            if (players_map_votes[map] <= 0) or vote_btn_hovered or (RTV.map_btns[vote_btn] == 1) then
                draw.SimpleText(tostring(players_map_votes[map]) .. "/" .. tostring(table.Count(player.GetAll())), "Content", 0, 20, Color(255,255,255))
            else
                draw.SimpleText(tostring(players_map_votes[map]) .. "/" .. tostring(table.Count(player.GetAll())), "Content", 0, 20, HORDE.color_crimson)
            end
        end
    end

    RTV.map_btns[vote_btn] = 0
end

RTV.diff_btns = {}
RTV.create_diff_panel = function(pnl, diff)
    local vote_btn = vgui.Create("DButton", pnl)
    local vote_btn_hovered = false
    vote_btn:DockMargin(10, 5, 10, 5)
    vote_btn:SetSize(pnl:GetParent():GetWide(), 50)
    vote_btn:Dock(TOP)
    vote_btn:SetText("")
    function vote_btn:Votediff(vote_btn, diff)
        for btn, _ in pairs(RTV.diff_btns) do
            RTV.diff_btns[btn] = 0
        end
        RTV.diff_btns[vote_btn] = 1
        -- Send vote to server
        net.Start("Horde_Votediff")
        net.WriteString(diff)
        net.SendToServer()
    end
    vote_btn.DoClick = function (self)
        self:Votediff(self, diff)
        surface.PlaySound("UI/buttonclick.wav")
    end
    players_diff_votes[diff] = 0
    local name_label = vgui.Create("DLabel", vote_btn)
    name_label:Dock(LEFT)
    name_label:SetText("")
    name_label:SetSize(250, 80)
    name_label:SetColor(Color(255,255,255))
    name_label:SetFont("Content")
    name_label.Paint = function ()
        if (players_diff_votes[diff] <= 0) or vote_btn_hovered or (RTV.diff_btns[vote_btn] == 1) then
            draw.SimpleText(translate.Get("Game_Difficulty_" .. diff), "Content", 10, 20, Color(255,255,255), TEXT_ALIGN_LEFT)
        else
            draw.SimpleText(translate.Get("Game_Difficulty_" .. diff), "Content", 10, 20, HORDE.color_crimson, TEXT_ALIGN_LEFT)
        end
    end

    local count_label = vgui.Create("DLabel", vote_btn)
    count_label:Dock(RIGHT)
    count_label:SetSize(50, 80)
    count_label:SetColor(Color(255,255,255))
    count_label:SetFont("Content")
    count_label:SetText("")
    count_label.Paint = function ()
        if players_diff_votes[diff] then
            if (players_diff_votes[diff] <= 0) or vote_btn_hovered or (RTV.diff_btns[vote_btn] == 1) then
                draw.SimpleText(tostring(players_diff_votes[diff]) .. "/" .. tostring(table.Count(player.GetAll())), "Content", 0, 20, Color(255,255,255))
            else
                draw.SimpleText(tostring(players_diff_votes[diff]) .. "/" .. tostring(table.Count(player.GetAll())), "Content", 0, 20, HORDE.color_crimson)
            end
        end
    end

    RTV.diff_btns[vote_btn] = 0
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
        'hr_bloodshellmail',
    }

    RTV.frame = vgui.Create('DPanel')
    RTV.frame:SetSize(s(1015), s(800))
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

    RTV.create_player_panel(lboard, {x=w/4, y=s(80)}, mvp, 'MVP', tostring(mvp_kills) .. " " .. translate.Get("Game_Kills") .. ", " .. tostring(mvp_damage) .. " " .. translate.Get("Game_Damage") .. " (" .. tostring(percentage) .. "%)")
    RTV.create_player_panel(lboard, {x=0, y=s(90) + player_panel_h}, damage_player, translate.Get("Game_Most_Damage_Dealt"), tostring(most_damage) .. " " .. translate.Get("Game_Damage"))
    RTV.create_player_panel(lboard, {x=w/2, y=s(90) + player_panel_h}, kills_player, translate.Get("Game_Most_Kills"), tostring(most_kills) .. " " .. translate.Get("Game_Kills"))
    RTV.create_player_panel(lboard, {x=0, y=s(90) + 2*player_panel_h}, damage_taken_player, translate.Get("Game_Most_Damage_Taken"), tostring(most_damage_taken) .. " " .. translate.Get("Game_Damage_Taken"))
    RTV.create_player_panel(lboard, {x=w/2, y=s(90) + 2*player_panel_h}, elite_kill_player, translate.Get("Game_Elite_Killer"), tostring(most_elite_kills) .. " " .. translate.Get("Game_Elite_Kills"))
    RTV.create_player_panel(lboard, {x=0, y=s(90) + 3*player_panel_h}, most_heal_player, translate.Get("Game_Most_Heal"), tostring(most_heal) .. " " .. translate.Get("Game_Healed"))
    RTV.create_player_panel(lboard, {x=w/2, y=s(90) + 3*player_panel_h}, headshot_player, translate.Get("Game_SharpShooter"), tostring(most_headshots) .. " " .. translate.Get("Game_Headshots"))

    dsheet:AddSheet(translate.Get('Game_Game_Summary'), lboard, 'icon16/gun.png')

    local map = dsheet:Add('Panel')
    local diffs = map:Add('Panel')
    diffs:Dock(LEFT)
    diffs:SetWide(s(300))

    RTV.create_diff_panel(diffs, "NORMAL")
    RTV.create_diff_panel(diffs, "HARD")
    RTV.create_diff_panel(diffs, "REALISM")
    RTV.create_diff_panel(diffs, "NIGHTMARE")
    RTV.create_diff_panel(diffs, "APOCALYPSE")

    for k, v in ipairs(maps) do
        if CFG.blacklistMap[v] then continue end
        RTV.create_map_panel(map, v)
    end
    
    dsheet:AddSheet(translate.Get("Game_Vote_Map"), map, 'icon16/gun.png')
end)

-- net.Receive('Horde_GameEnd', function()
--     timer.Simple(1, function()
--         if IsValid(RTV.to_remove) then RTV.to_remove:Remove() end
--     end)

--     local status = net.ReadString()

--     local mvp = net.ReadEntity()
--     local mvp_damage = net.ReadUInt(32)
--     local mvp_kills = net.ReadUInt(32)

--     local damage_player = net.ReadEntity()
--     local most_damage = net.ReadUInt(32)

--     local kills_player = net.ReadEntity()
--     local most_kills = net.ReadUInt(32)

--     local most_heal_player = net.ReadEntity()
--     local most_heal = net.ReadUInt(32)

--     local headshot_player = net.ReadEntity()
--     local most_headshots = net.ReadUInt(32)

--     local elite_kill_player = net.ReadEntity()
--     local most_elite_kills = net.ReadUInt(32)

--     local damage_taken_player = net.ReadEntity()
--     local most_damage_taken = net.ReadUInt(32)

--     local total_damage = net.ReadUInt(32)

--     local maps = net.ReadTable()

--     RTV.frame = vgui.Create('DPanel')
--     RTV.frame:SetSize(s(1015), s(800))
--     RTV.frame:Center()
--     RTV.frame:MakePopup()
    
--     local dsheet = RTV.frame:Add('DPropertySheet')
--     dsheet:Dock(FILL)

--     local lboard = dsheet:Add('Panel')
--     function lboard:Paint(w, h)
--         draw.SimpleText(translate.Get("Game_Result_" .. status) .. "! " .. game.GetMap() .. " - " .. translate.Get("Game_Difficulty_" .. HORDE.difficulty_text[HORDE.difficulty]), 'font.40', w/2, s(40), color_white, 1, 1)
--     end

--     RTV.create_player_panel(lboard, {x=w/4, y=s(80)}, mvp, 'MVP', tostring(mvp_kills) .. " " .. translate.Get("Game_Kills") .. ", " .. tostring(mvp_damage) .. " " .. translate.Get("Game_Damage") .. " (" .. tostring(percentage) .. "%)")
--     RTV.create_player_panel(lboard, {x=0, y=s(90) + player_panel_h}, damage_player, translate.Get("Game_Most_Damage_Dealt"), tostring(most_damage) .. " " .. translate.Get("Game_Damage"))
--     RTV.create_player_panel(lboard, {x=w/2, y=s(90) + player_panel_h}, kills_player, translate.Get("Game_Most_Kills"), tostring(most_kills) .. " " .. translate.Get("Game_Kills"))
--     RTV.create_player_panel(lboard, {x=0, y=s(90) + 2*player_panel_h}, damage_taken_player, translate.Get("Game_Most_Damage_Taken"), tostring(most_damage_taken) .. " " .. translate.Get("Game_Damage_Taken"))
--     RTV.create_player_panel(lboard, {x=w/2, y=s(90) + 2*player_panel_h}, elite_kill_player, translate.Get("Game_Elite_Killer"), tostring(most_elite_kills) .. " " .. translate.Get("Game_Elite_Kills"))
--     RTV.create_player_panel(lboard, {x=0, y=s(90) + 3*player_panel_h}, most_heal_player, translate.Get("Game_Most_Heal"), tostring(most_heal) .. " " .. translate.Get("Game_Healed"))
--     RTV.create_player_panel(lboard, {x=w/2, y=s(90) + 3*player_panel_h}, headshot_player, translate.Get("Game_SharpShooter"), tostring(most_headshots) .. " " .. translate.Get("Game_Headshots"))

--     dsheet:AddSheet(translate.Get('Game_Game_Summary'), lboard, 'icon16/gun.png')

--     local map = dsheet:Add('Panel')

--     local diffs = map:Add('Panel')
--     diffs:Dock(LEFT)
--     diffs:SetWide(s(300))

--     local scroll = map:Add('DScrollPanel')
--     scroll:Dock(FILL)

--     RTV.create_diff_panel(diffs, "NORMAL")
--     RTV.create_diff_panel(diffs, "HARD")
--     RTV.create_diff_panel(diffs, "REALISM")
--     RTV.create_diff_panel(diffs, "NIGHTMARE")
--     RTV.create_diff_panel(diffs, "APOCALYPSE")

--     for k, v in ipairs(maps) do
--         if CFG.blacklistMap[v] then continue end
--         RTV.create_map_panel(scroll, v)
--     end
    
--     dsheet:AddSheet(translate.Get("Game_Vote_Map"), map, 'icon16/gun.png')
-- end)