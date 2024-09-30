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
        draw.RoundedBox(0, 0, 0, w, h, ColorAlpha(colors.hvr, 100))
        shizlib.surface.DrawPanelBlur(scoreboard.fr, 4)
    end

    local pnl = scoreboard.fr:Add('Panel')
    pnl:SetSize(s(900), s(750))
    pnl:SetPos(s(460), s(190))
    function pnl:Paint(w, h)
        draw.RoundedBox(8, 0, 0, w, h, ColorAlpha(colors.bg, 150))
    end

    local scroll = pnl:Add('DScrollPanel')
    scroll:Dock(FILL)

    for _, pl in SortedPairs(players) do
        local player_pnl = scroll:Add('DButton')
        player_pnl:Dock(TOP)
        player_pnl:DockMargin(0, 0, 0, s(4))
        player_pnl:SetTall(s(40))
        player_pnl:SetText('')
        player_pnl.Size = s(40)
        function player_pnl:Paint(w, h)
            draw.RoundedBox(8, 0, 0, w, h, colors.hvr)
            draw.RoundedBox(8, 0, 0, w, s(40), colors.hvr)

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
                surface.SetMaterial(mat)
                surface.SetDrawColor(HORDE.Rank_Colors[rank])
                surface.DrawTexturedRect(w * 0.18, s(2), s(38), s(38))
                if rank == HORDE.Rank_Master then
                    draw.SimpleText(rank_level, "Trebuchet18", w * 0.2075, 12, HORDE.Rank_Colors[rank], TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                else
                    if rank_level > 0 then
                        local star = Material("star.png", "mips smooth")
                        surface.SetMaterial(star)
                        local y_pos = s(26)
                        for i = 0, rank_level - 1 do
                            surface.DrawTexturedRect(w * 0.17, y_pos, s(10), s(10))
                            y_pos = y_pos - s(7)
                        end
                    end
                end
            end

            local name = pl:LongName()

            draw.SimpleText(string.format( '%s', name ), 'font.22', s(40), s(20), color_white, 0, 1)
            draw.SimpleText(string.format( '%s', class ), 'font.22', w*0.225, s(20), color_white, 0, 1)
            draw.SimpleText(string.format( '%s$', pl:Horde_GetMoney() ), 'font.22', w/2.3, s(20), color_white, 1, 1)
            draw.SimpleText(string.format( '%s: %s', translate.Get("Scoreboard_Kill"), pl:Frags() ), 'font.22', w/1.3, s(20), color_white, 1, 1)
            draw.SimpleText(string.format( '%s: %s', translate.Get("Scoreboard_Ping"), pl:Ping() ), 'font.22', w-s(5), s(20), color_white, 2, 1)

            /*
                Open Desc
            */
            draw.SimpleText(string.format( 'Привилегия: %s', pl:GetUserGroup() ), 'font.22', s(5), s(40), color_white, 0, 0)
            -- draw.SimpleText(string.format( 'Наигранное время: %s', shizlib.surface.FormatTime(pl:GetPlaytime() or 0) ), 'font.22', s(5), s(60), color_white, 0, 0)
        end
        function player_pnl:PerformLayout()
            self:SetSize(self:GetWide(), self.Size)
        end
        function player_pnl:OpenInfo( val )
            if val then
                self.CurSize = s(100)
            else
                self.CurSize = s(40)
            end
            self.Open = val
        end
        player_pnl:OpenInfo( false )
        function player_pnl:Think()
            if self.Size ~= self.CurSize then
                self.Size = math.Approach( self.Size, self.CurSize, (math.abs( self.Size - self.CurSize ) + 1) * 10 * FrameTime() )
                self:PerformLayout()
            end
        end
        function player_pnl:DoClick()
            surface.PlaySound(self.Open and 'ui/buttonclickrelease.wav' or 'ui/buttonclick.wav')
            self:OpenInfo(not self.Open)
        end

        local avatar = player_pnl:Add('SHZAvatarImage')
        avatar:SetPos(s(5), s(5))
        avatar:SetSize(s(30), s(30))
        avatar:SetSteamID(pl:SteamID64(), 128)
        avatar:SetVertices(90)

        local profile = player_pnl:Add('DButton')
        profile:SetText('Профиль')
        profile:SetPos(s(350), s(45))
        profile:SetSize(s(150), s(25))
        function profile:DoClick()
            pl:ShowProfile()
        end

        local steamid = player_pnl:Add('DButton')
        steamid:SetText('SteamID')
        steamid:SetPos(s(350), s(75))
        steamid:SetSize(s(150), s(25))
        function steamid:DoClick()
            SetClipboardText(pl:SteamID())
            chat.AddText(color_white, 'SteamID скопирован в буфер обмена! Нажмите CTRL + V')
        end
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