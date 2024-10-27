SETTINGS = SETTINGS or {}

local s = shizlib.surface.s
local DTR = shizlib.surface.DTR
local colors = CFG.skinColors

local function openSettingsCategoryMenu(pnl, info)
    for k, v in SortedPairs(info) do
        if v.checkbox then
            local a = pnl:Add('DCheckBoxLabel')
            a:Dock(TOP)
            a:SetText(v.name)
            a:SetConVar(v.convar)
            a:SetValue(GetConVar(v.convar):GetInt())
        end
        if v.command then
            local a = pnl:Add('DButton')
            a:Dock(TOP)
            a:SetText(v.name)
            function a:DoClick()
                RunConsoleCommand(v.convar)
            end
        end
        -- if v.number then
        --     local a = pnl:Add('Panel')
        --     a:Dock(TOP)
        --     a:SetTall(s(25))

        --     a.lbl = a:Add('DLabel')
        --     a.lbl:SetText(v.name .. ' | НЕ РАБОТАЕТ!')
        --     a.lbl:SetFont('font.20')
        --     a.lbl:Dock(LEFT)
        --     a.lbl:DockMargin(0, 0, s(10), 0)
        --     a.lbl:SizeToContents()

        --     a.textEntry = a:Add('DTextEntry')
        --     local textEntry = a.textEntry
        --     textEntry:Dock(FILL)
        --     textEntry:SetNumeric(true)
        --     textEntry:SetValue(tonumber(GetConVar(v.convar):GetInt()))
        --     function textEntry:OnChange()
        --         GetConVar(v.convar):SetInt(self:GetValue())
        --     end
        -- end
    end
end

function SETTINGS.OpenGUI()
    SETTINGS.frame = vgui.Create('DFrame')

    local a = SETTINGS.frame
    a:SetSize(s(900), s(600))
    a:Center()
    a:MakePopup()
    a:SetTitle('Настройки')
    function a:Think()
        if input.IsKeyDown(KEY_ESCAPE) and self:IsKeyboardInputEnabled() then
            a:Remove()
        end
    end

    local under_scroll = a:Add('Panel')
    under_scroll:Dock(LEFT)
    under_scroll:SetWide(s(200))
    function under_scroll:Paint(w, h)
        draw.RoundedBoxEx(6, 0, 0, w, h, colors.hvr, true, false, true)
    end

    local scroll = under_scroll:Add('DScrollPanel')
    scroll:Dock(FILL)

    local pnl = a:Add('Panel')
    pnl:Dock(FILL)
    pnl:DockPadding(s(10), s(10), s(10), s(10))

    for name, info in SortedPairs(SETTINGS.Config) do
        local categoryBtn = scroll:Add('DButton')
        categoryBtn:Dock(TOP)
        categoryBtn:SetText(name)
        categoryBtn.Icon = info.Icon and info.Icon or nil
        function categoryBtn:Paint(w, h)
            local off = h > 20 and 2 or 1
            if self.Depressed then
                draw.RoundedBox(4, 0, off, w, h-off, colors.g)
                draw.RoundedBox(4, 0, off, w, h-off, colors.hvr)
            else
                draw.RoundedBox(4, 0, 0, w, h, ColorAlpha(colors.g, 150))
                draw.RoundedBox(4, 0, 0, w, h-off, colors.g)
            end
            if self.Icon then
                DTR(4, 4, self:GetTall()-8, self:GetTall()-8, colorsor_white, self.Icon)
            end
        end
        function categoryBtn:DoClick()
            pnl:Clear()

            openSettingsCategoryMenu(pnl, info)
        end
    end
end