local s = shizlib.surface.s
local DTR = shizlib.surface.DTR
local colors = CFG.skinColors

scoreboard = scoreboard or {}

function scoreboard.Open()
    if IsValid(scoreboard.fr) then scoreboard.fr:Remove() end
    
    local ply = LocalPlayer()

    local players = player.GetAll()
    table.sort(players, function(a, b)
        return(a:Frags() > b:Frags())
    end)

    scoreboard.fr = vgui.Create('DFrame')
    scoreboard.fr:SetTitle('')
    scoreboard.fr:SetDraggable(false)
    scoreboard.fr:SetSize(s(1920), s(1080))
    scoreboard.fr:SetPos(0, 0)
    scoreboard.fr:SetAlpha(0)
    scoreboard.fr:AlphaTo(255, .4, 0)
    scoreboard.fr:ShowCloseButton(false)
    function scoreboard.fr:Paint(w, h)
        draw.RoundedBox(0, 0, 0, w, h, ColorAlpha(colors.bg, 100))
        shizlib.surface.DrawPanelBlur(scoreboard.fr, 4)
        
        draw.SimpleText( ('%s - %s'):format(GetHostName(), translate.Get("Game_Difficulty_" .. HORDE.difficulty_text[HORDE.difficulty])), 'font.30', w/2, s(95), color_white, 1, 1)
    end

    local pnl = scoreboard.fr:Add('Panel')
    pnl:SetSize(s(1100), s(750))
    pnl:SetPos(s(360), s(190))

    local scroll = pnl:Add('DScrollPanel')
    scroll:Dock(FILL)

    for _, pl in SortedPairs(players) do
        local player_pnl = scroll:Add('DButton')
        player_pnl:Dock(TOP)
        player_pnl:DockMargin(0, 0, 0, s(4))
        player_pnl:SetTall(s(60))
        player_pnl:SetText('')
        function player_pnl:Paint(w, h)
            draw.RoundedBox(8, 0, 0, w, h, colors.hvr)
            if not pl:Alive() then
                draw.RoundedBox(8, 0, 0, w, h, ColorAlpha(colors.r, 50))
            end

            local subclass_name = HORDE.Class_Survivor
            if pl:Horde_GetCurrentSubclass() then 
                subclass_name = pl:Horde_GetCurrentSubclass()
            end
            local subclass = HORDE.subclasses[subclass_name]
            local class = translate.Get("Class_" .. subclass.PrintName) or subclass.PrintName

            if subclass then
                local mat = Material(subclass.Icon, "mips smooth")
                local rank = pl:Horde_GetRank(subclass.PrintName)
                local rank_level = pl:Horde_GetRankLevel(subclass.PrintName)
                DTR(s(320), s(5), s(50), s(50), HORDE.Rank_Colors[rank], mat)
                if rank == HORDE.Rank_Master then
                    draw.SimpleText(rank_level, "Trebuchet18", w * 0.2075, s(18), HORDE.Rank_Colors[rank], TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                else
                    if rank_level > 0 then
                        local star = Material("star.png", "mips smooth")
                        local y_pos = s(37)
                        for i = 0, rank_level - 1 do
                            DTR(s(310), y_pos, s(15), s(15), HORDE.Rank_Colors[rank], star)
                            y_pos = y_pos - s(10)
                        end
                    end
                end
            end

            local perks
            if HORDE.classes[subclass_name] then
                perks = HORDE.classes[subclass_name].perks
            else
                perks = HORDE.subclasses[subclass_name].Perks
            end

            local x = s(500)
            for perk_level, v in SortedPairs(perks) do
                local color = color_white
                if HORDE.current_wave < HORDE:Horde_GetWaveForPerk(perk_level) then 
                    color = Color(150,150,150)
                end
                if not pl.Horde_PerkChoices then
                    break
                end
                if (not subclass_name) or (not perk_level) or (not v.choices) then 
                    break
                end
                if (not pl.Horde_PerkChoices[subclass_name]) then break end

                local choice = v.choices[pl.Horde_PerkChoices[subclass_name][perk_level] or 1]
                local perk = HORDE.perks[choice]
                local icon = perk.Icon
                if icon then
                    local mat = Material(icon, "mips smooth")
                    DTR(x, s(5), s(50), s(50), color, mat)
                else
                    local mat = Material(HORDE.subclasses[subclass_name].Icon, "mips smooth")
                    surface.SetMaterial(mat)
                    surface.SetDrawColor(color)
                    surface.DrawTexturedRect(x, 2, 35, 35)
                end
                x = x + s(50)
            end

            local gadget = pl:Horde_GetGadget()
            if gadget then
                local mat = Material(HORDE.gadgets[gadget].Icon, "mips smooth")
                surface.SetMaterial(mat) -- Use our cached material
                if HORDE.gadgets[gadget].Active then
                    if HORDE.gadgets[gadget].Once then
                        surface.SetDrawColor(HORDE.color_gadget_once)
                    else
                        surface.SetDrawColor(HORDE.color_gadget_active)
                    end
                else
                    surface.SetDrawColor(color_white)
                end
                surface.DrawTexturedRect(s(660), s(-4), s(140), s(70))
            end

            local name = pl:LongName()

            draw.SimpleText(string.format( '%s', name ), 'font.22', s(60), s(5), color_white, 0, 0)
            draw.SimpleText(string.format( '%s', class ), 'font.22', s(380), h/2, color_white, 0, 1)
            draw.SimpleText(string.format( '%s$', pl:Horde_GetMoney() ), 'font.22', s(60), s(30), color_white, 0, 0)
            draw.SimpleText(string.format( '%s: %s', translate.Get("Scoreboard_Kill"), pl:Frags() ), 'font.22', w/1.3, h/2, color_white, 1, 1)
            draw.SimpleText(string.format( '%s: %s', translate.Get("Scoreboard_Ping"), pl:Ping() ), 'font.22', w-s(5), h/2, color_white, 2, 1)
        end
        function player_pnl:DoRightClick()
            local menu = DermaMenu()

            local profile = menu:AddOption('Открыть профиль', function() pl:ShowProfile() end)
            local steamid = menu:AddOption('Скопировать SteamID', function()
                SetClipboardText(pl:SteamID())
                chat.AddText(color_white, 'Текс скопирован в буфер обмена! Нажмите CTRL + V')
            end)
            local group = menu:AddOption(string.format('Привилегия: %s', pl:GetUserGroup()), function()
                SetClipboardText(pl:GetUserGroup())
                chat.AddText(color_white, 'Текст скопирован в буфер обмена! Нажмите CTRL + V')
            end)

            menu:Open()
        end

        local avatar = player_pnl:Add('SHZAvatarImage')
        avatar:SetPos(s(5), s(5))
        avatar:SetSize(s(50), s(50))
        avatar:SetSteamID(pl:SteamID64(), 256)
        avatar:SetVertices(40)
    end
end

function scoreboard.Close()
    if IsValid(scoreboard.fr) then
        scoreboard.fr:AlphaTo(0, .4, 0, function()
            if IsValid(scoreboard.fr) then scoreboard.fr:Remove() end
        end)
    end
end

hook.Add("Initialize", "ScoreboardInitialize", function()
    GAMEMODE.ScoreboardShow = nil 
    GAMEMODE.ScoreboardHide = nil
end)

hook.Add("ScoreboardShow", "ScoreboardShow", function()
    gui.EnableScreenClicker(true)
    scoreboard.Open()   
	
	return true
end)

hook.Add("ScoreboardHide", "ScoreboardHide", function() 
    if IsValid(scoreboard.fr) then
        gui.EnableScreenClicker(false)
    	scoreboard.Close()
    end
end)