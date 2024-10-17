local s = shizlib.surface.s
local DTR = shizlib.surface.DTR
local colors = CFG.skinColors
local surface = CLIENT and surface
local draw = CLIENT and draw
local draw_RoundedBox = CLIENT and draw.RoundedBox
local draw_RoundedBoxEx = CLIENT and draw.RoundedBoxEx
local draw_SimpleText = CLIENT and draw.SimpleText

local pmeta = FindMetaTable('Player')

function pmeta:IsTyping()
    return self:GetNWBool('IsTyping', false)
end

local function ToggleChat()
    net.Start('shizlib.ToggleChat')
        net.WriteBool(true)
    net.SendToServer()
end

hook.Add('StartChat', 'shizlib.chat.StartChat', ToggleChat)

hook.Add("FinishChat", "Debili", function()
    net.Start('shizlib.ToggleChat')
        net.WriteBool(false)
    net.SendToServer()
end)

local function o(x)
    return ScrW() / 1920 * x
end

local function p(y)
    return ScrH() / 1080 * y
end

function shizlib.Outlined(r, x, y, w, h, col, col2, shadow)
    draw.RoundedBox(r, x, y, w, h, col2)
    draw.RoundedBox(r, x + 1, y + 1, w - 2, h - 2, col)
end

function shizlib.ShadowText(t, f, x, y, col, ax, ay)
    draw.SimpleText(t, f, x + 1, y + 1, Color(0, 0, 0,200), ax or 0, ay or 0)
    draw.SimpleText(t, f, x, y, col or Color(255, 255, 255), ax or 0, ay or 0)
end

local mat_close = Material("shizlib_chat/close.png")    

surface.CreateFont('shizlib.Label', {
    font = 'Gotham',
    size = p(18),
    weight = 0,
    antialias = true,
    extended = true
})

surface.CreateFont('shizlib.Prefix', {
    font = 'Gotham',
    size = p(16),
    weight = 0,
    antialias = true,
    extended = true
})

surface.CreateFont('shizlib.TextEnter', {
    font = 'Gotham',
    size = p(20),
    weight = 0,
    antialias = true,
    extended = true
})

local PANEL = {}

function PANEL:Init()
    self:SetText('')
end

function PANEL:SetPrefix(text)
    self._Text = text
end

function PANEL:SetColor(col, col2)
    self._Color = col
    self._Color2 = col2
end

function PANEL:Paint(w, h)
    local colors = self._Color

    colors.a = 200

    draw.RoundedBox(8, 0, 0, w-o(2), h-p(2), colors or Color(255, 255, 255, 100))
    draw.SimpleText(self._Text, 'shizlib.Prefix', o(7), p(2), color_white or Color(255, 255, 255), 0, 0)
end

derma.DefineControl('shizlib.ChatPrefix', 'mrppr\'s Chat Prefix', PANEL, 'DButton')
PANEL = {}

function PANEL:Init()
    self:SetText('')
end

function PANEL:SetMCText(text)
    self._Text = text
end

function PANEL:SetColor(col)
    self._Color = col
end

function PANEL:SetUnderline(b)
    self._Underline = b
end

function PANEL:Paint(w, h)
    shizlib.ShadowText(self._Text, 'shizlib.Label', w/2, p(2), self._Color or Color(255, 255, 255), 1, 0)

    if self._Underline then
        draw.RoundedBox(0, 0, h - 4, w, 1, self._Color or Color(255, 255, 255))
    end
end

derma.DefineControl('shizlib.ChatLabel', 'mrppr\'s Chat Label (Button)', PANEL, 'DButton')
PANEL = {}

function PANEL:Init()
    self.Expire = SysTime() + 15
    self.Created = SysTime()
    self._Table = {}
    self._Msg = ''
end

local emojis = {}

local function AddDefaultEmojis(path)
    local files, _ = (file.Find(path .. '/*.png', 'GAME'))

    for k, v in ipairs(files) do
        local m = Material(path .. v, 'smooth mips')
        local prop = m:Width() / m:Height()
        local h = math.min(p(24), m:Height())
        local w = h * prop

        emojis[string.StripExtension(v)] = {
            mat = m,
            width = w,
            height = h
        }
    end
end

AddDefaultEmojis('materials/shizlib_chat/emojis/default/')

local patterns = {
    {
        pattern = '^(STEAM_[0-3]:[01]:%d+)',
        function(str)
            return {
                data = str,
                type = 'steamid',
                color = Color(231, 121, 18),
                copy = true
            }
        end
    },
    {
        pattern = '^(https?://(([%w_.~!*:@&+$/?%%#-]-)(%w[-.%w]*%.)(%w+)(:?)(%d*)(/?)([%w_.~!*:@&+$/?%%#=-]*)))',
        function(str)
            return {
                data = str,
                type = 'link',
                color = Color(162, 0, 255),
                underline = true
            }
        end
    },
    {
        pattern = '^:(.-):',
        function(str)
            return {
                data = str,
                type = 'emoji'
            }
        end
    }
}

local function parse(str)
    if #str == 1 then
        return {str}
    end

    local entities = {}
    local i = 1
    local lastMatchEnd = 0

    while i < #str do
        local finish
        local found = nil

        for k, v in pairs(patterns) do
            local _, e, r = str:find(v.pattern, i)

            if r then
                finish = e
                found = v[1](r)
                break
            end
        end

        if found then
            if lastMatchEnd ~= i - 1 then
                table.insert(entities, str:sub(lastMatchEnd + 1, i - 1))
            end

            table.insert(entities, found)
            lastMatchEnd = finish
            i = finish + 1
        else
            i = i + 1
        end
    end

    if lastMatchEnd < #str then
        table.insert(entities, str:sub(lastMatchEnd + 1, #str))
    end

    return entities
end

shizlib.prefixes = shizlib.prefixes or {}

local function addprefix(str, fancy, col, col2)
    shizlib.prefixes[str] = {
        name = fancy,
        color = col,
        color2 = col2
    }
end

local pink = Color(193,154,255)
local red = Color(255, 135, 135)
local green = Color(116,255,202)

net.Receive('shizlib.gangs.update_prefix', function()
    local ply = net.ReadEntity()

    if not IsValid(ply) then return end

    if ply:GetGang() and not shizlib.prefixes['['..ply:GetGang()..']'] then
        local orgcolor = ply:GetGangColor()

        orgcolor = Color(math.Clamp(orgcolor.r-50,0,255), math.Clamp(orgcolor.g-50,0,255), math.Clamp(orgcolor.b-50,0,255))

        shizlib.prefixes['['..ply:GetGang()..']'] = {
            name = ply:GetGang(),
            color = orgcolor,
            color2 = ply:GetGangColor()
        }
    end
end)

addprefix('[Радиовещание]', 'СМИ', Color(160, 96, 0), Color(255, 212, 142))
addprefix('(АЧИВКИ)', 'Достижения', Color(0, 56, 160), pink)
addprefix('(LUA)', 'LuaDev', Color(155, 0, 160), pink)
addprefix('[Промокод]', 'Промокод', Color(129, 104, 12), Color(255, 242, 121))
addprefix('[INFO]', 'INFO', Color(107, 107, 107), Color(214, 214, 214))
addprefix('|', 'System', Color(86,59,129), pink)

local function isprefix(str)
    str = string.Trim(str)

    return shizlib.prefixes[str] or false
end

function PANEL:AddMCText(args)
    surface.SetFont('shizlib.Label')

    for k, v in ipairs(args) do
        if istable(v) then
            table.insert(self._Table, v)
            continue
        end

        local text = v.IsPlayer and v:IsPlayer() and v:Nick() or v
        local expl = string.Explode(' ', text)

        if #expl > 1 then
            for i, t in ipairs(expl) do
                local ins = t
                table.insert(self._Table, string.Trim(ins))
                self._Msg = self._Msg .. string.Trim(ins)

                if i ~= #expl then
                    table.insert(self._Table, ' ')
                    self._Msg = self._Msg .. ' '
                end
            end
        else
            table.insert(self._Table, text)
            self._Msg = self._Msg .. text
        end
    end

    local x, y = 0, 0
    local col = Color(255, 255, 255)
    local w
    local prefixed = false
    local prefixed2 = false

    for k, v in ipairs(self._Table) do
        if istable(v) then
            col = v
            continue
        end

        local preftbl = isprefix(v)
        local message = self._Msg
        local prefix = string.match(message, "%[(.-)%]")
        if not prefix then
            prefix = string.match(message, "([^:]+):")
        else
            message = string.gsub(message, "%[(.-)%]", "")
        end
        local name = string.match(message, "%s*([^:]+)")

        if preftbl and not prefixed then
            local prefix = vgui.Create('shizlib.ChatPrefix', self)
            prefix:SetPrefix(preftbl.name)
            prefix:SetColor(preftbl.color, preftbl.color2)
            w = surface.GetTextSize(preftbl.name) + o(10)
            prefix:SetSize(w, p(24))
            prefix:SetPos(x, -p(24))
            prefix:MoveTo(x, y, 0.4, 0, 0.2)
            prefix:SetAlpha(0)
            prefix:AlphaTo(255,0.2,0)

            prefixed = true
            x = x + w
            continue
        end

        local name = string.match(message, "%s*([^:]+)")
        local GetPrefix = false
        local GetPrefixColor = true

        for _,n in ipairs(player.GetAll()) do
            if name == n:Name() then
                break 
            end
        end

        if GetPrefix and GetPrefixColor and not prefixed2 then 
            local prefix = vgui.Create('shizlib.ChatPrefix', self)
            prefix:SetPrefix(GetPrefix)
            prefix:SetColor(GetPrefixColor, GetPrefixColor)
            w = surface.GetTextSize(GetPrefix) + o(10)
            prefix:SetSize(w, p(24))
            prefix:SetPos(x, -p(24))
            prefix:MoveTo(x, y, 0.4, 0, 0.2)
            prefix:SetAlpha(0)
            prefix:AlphaTo(255,0.2,0)

            prefixed2 = true
            x = x + w

            continue
        end

        local parsing = parse(v)

        for _, msg_data in ipairs(parsing) do
            local emoji, lbl
            local emojit

            if istable(msg_data) and msg_data.type == 'emoji' then
                local tbl = emojis[msg_data.data]

                if tbl and tbl.mat then
                    emojit = tbl
                end
            end

            if emojit then
                emoji = vgui.Create('shizlib.ChatLabel', self)
                local ew, eh = p(24), p(24)
                emoji:SetSize(ew, eh)

                emoji.Paint = function(s, sw, sh)
                    surface.SetMaterial(emojit.mat)
                    surface.SetDrawColor(255, 255, 255, 255)
                    surface.DrawTexturedRect(0, 0, ew, eh)
                end

                emoji.DoRightClick = function(s)
                    SetClipboardText(self._Msg)
                end

                emoji:SetAlpha(0)
                emoji:AlphaTo(255, .5, 0)
                w = emojit.width
            else
                lbl = vgui.Create('shizlib.ChatLabel', self)
                lbl:SetMCText(istable(msg_data) and msg_data.data or msg_data)
                w = surface.GetTextSize(lbl._Text)
                lbl:SetSize(w, p(24))
                lbl:SetColor(col)

                lbl.DoRightClick = function(s)
                    SetClipboardText(self._Msg)
                end

                lbl:SetAlpha(0)
                lbl:AlphaTo(255, .5, 0)
            end

            if w > self:GetWide() - x then
                x = 0
                y = y + p(24)
                self:SetTall(y + p(24))
            end

            if emoji then
                emoji:SetPos(x, -p(24))
                emoji:MoveTo(x, y, 0.4, 0, 0.2)
            elseif lbl then
                lbl:SetPos(x, -p(24))
                lbl:MoveTo(x, y, 0.4, 0, 0.2)
            end

            if istable(msg_data) then
                if msg_data.color then
                    lbl:SetColor(msg_data.color)
                end

                if msg_data.type == 'link' then
                    lbl.DoClick = function(s)
                        gui.OpenURL(msg_data.data)
                    end
                end

                if msg_data.underline then
                    lbl:SetUnderline(true)
                end

                if msg_data.copy then
                    lbl.DoRightClick = function(s)
                        SetClipboardText(msg_data.data)
                    end
                end
            end

            x = x + w
        end
    end
end

function PANEL:Paint(w, h)
end

derma.DefineControl('shizlib.ChatLine', 'mrppr\'s Chat Frame', PANEL, 'DPanel')

PANEL = {}

local chatx, chaty = o(5), ScrH() - p(480)
local chatw, chath = o(600), p(330)

local TitleText = 'Pretty chat'

local global_w = CreateClientConVar('shizlib_chat_w', math.Round(chatw))
local global_h = CreateClientConVar('shizlib_chat_h', math.Round(chath))
local global_x = CreateClientConVar('shizlib_chat_x', math.Round(chatx))
local global_y = CreateClientConVar('shizlib_chat_y', math.Round(chaty))

function PANEL:Init()
    self:SetMinWidth( o(300) )
    self:SetMinHeight( p(200) )
    self:SetPos(global_x:GetInt(), global_y:GetInt())
    self:SetSize(global_w:GetInt(), global_h:GetInt())
    self:ShowCloseButton(false)
    self:SetDraggable( true )
    self:SetTitle('')
    self:SetKeyboardInputEnabled(false)
    self:SetSizable( true )
    self:SetScreenLock(true)
    self.History = {}
    self.AutoNames = {}
    self.CurrentAutoName = 0
    self.Paint = function(s, w, h)
        if self:IsKeyboardInputEnabled() then
            draw.RoundedBox(8, 0, 0, w, h, colors.bg)

            draw.RoundedBoxEx(8,0,0,w,shizlib.surface.s(40),colors.hvr,true,true,false,false)
            draw.RoundedBoxEx(8,0,h-shizlib.surface.s(40),w,shizlib.surface.s(40),colors.hvr,false,false,true,true)
        
            draw.SimpleText(TitleText, 'font.20', shizlib.surface.s(15), shizlib.surface.s(20), color_white, 0, 1)
        end

        if input.IsKeyDown(KEY_ESCAPE) and self:IsKeyboardInputEnabled() then
            shizlib.closeChatbox()
            -- gui.HideGameUI()
        end
    end

    local close = vgui.Create("DButton", self)
    close:SetSize(shizlib.surface.s(24), shizlib.surface.s(24))
    close:SetText("")
    close.DoClick = function()
        shizlib.closeChatbox()
    end

    close.Hover = 0
    close.Paint = function(self, w, h)
        if self:GetParent():IsKeyboardInputEnabled() then
            if self.Depressed then
                draw.RoundedBox(8, w/2-8, h/2-7, 16, 16, colors.r)
                if self.Hovered then
                    draw.SimpleText(utf8.char(0xf00d), 'shz-icons', w / 2, h / 2, Color(0,0,0, 120), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                end
            else
                draw.RoundedBox(8, w/2-8, h/2-7, 16, 16, colors.r_d)
                draw.RoundedBox(8, w/2-8, h/2-8, 16, 16, colors.r)
                if self.Hovered then
                    draw.SimpleText(utf8.char(0xf00d), 'shz-icons', w / 2, h / 2-1, Color(0,0,0, 120), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                end
            end
        end
    end

    function close:Think()
        self:SetPos(self:GetParent():GetWide()-shizlib.surface.s(32), shizlib.surface.s(8))
    end

    self.BottomPanel = vgui.Create('Panel', self)
    self.BottomPanel:Dock(BOTTOM)
    self.BottomPanel:SetTall(p(30))

    self.TextEntry = vgui.Create('DTextEntry', self.BottomPanel)
    self.TextEntry:Dock(FILL)
    self.TextEntry:SetDrawBorder(false)
    self.TextEntry:SetPaintBackground(false)
    self.TextEntry:SetFont('shizlib.TextEnter')
    self.TextEntry:SetTextColor(Color(255, 255, 255))
    self.TextEntry:SetCursorColor(Color(255, 255, 255))
    self.TextEntry:SetPlaceholderColor(Color(0, 0, 0))
    self.TextEntry:SetHighlightColor(Color(55, 55, 55, 200))
    self.TextEntry:SetDrawLanguageID( false )
    self.TextEntry.Paint = function(s, w, h)
        if self:IsKeyboardInputEnabled() then 
            draw.RoundedBox(8, 0, 0, w, h, colors.bg)

            s:DrawTextEntryText(Color(255, 255, 255), Color(0, 0, 0), Color(170, 170, 170))

            if (!s.AutoFillText) then return end

            surface.SetFont('shizlib.TextEnter')

            local x = surface.GetTextSize(s:GetValue())
            local w2, h2 = surface.GetTextSize(s.AutoFillText)

            surface.SetDrawColor(Color(14,144,217))
            surface.DrawRect(x+shizlib.surface.s(4), shizlib.surface.s(2), w2, h-shizlib.surface.s(4))
            surface.SetTextColor(Color(255,255,255))

            draw.SimpleText(s.AutoFillText, 'shizlib.TextEnter', x+shizlib.surface.s(2), h/2, color_white, 0, 1)
        end
    end

    self.TextEntry.OnEnter = function(s)
        if string.Trim( self:GetText() ) != '' then
            LocalPlayer():ConCommand( [[say ]] .. s:GetText() )
        end

        if (string.Trim(s:GetValue()) ~= '') then
            table.insert(self.History, 1, s:GetText())
        end

        s.historyPos = 0
        self.Scroll.VBar:AnimateTo(self.Scroll.pnlCanvas:GetTall(), 0.5, 0, 0.5)
    end

    self.TextEntry.CalculateAutoFill = function(s)
        local curSel = self.AutoNames[self.CurrentAutoName]
        table.Empty(self.AutoNames)
        local words = string.Explode(' ', s:GetValue())
        match = words[#words]

        if (not match or match == '') then
            self.CurrentAutoName = 0

            return
        end

        for k, v in ipairs(player.GetAll()) do
            if ((string.find(v:Name():lower(), match:lower(), 1, true) or -1) == 1) then
                if (curSel and curSel.SteamID == v:SteamID()) then
                    self.CurrentAutoName = #self.AutoNames + 1
                end

                self.AutoNames[#self.AutoNames + 1] = {
                    Name = v:Name(),
                    SteamID = v:SteamID()
                }
            end
        end
    end

    self.TextEntry.GetAutoFill = function(s, step)
        step = step or 0
        local words = string.Explode(' ', s:GetValue())
        match = words[#words]
        if (not match or match == '') then return end
        self.CurrentAutoName = self.CurrentAutoName + step

        if (not self.AutoNames[self.CurrentAutoName]) then
            self.CurrentAutoName = (self.CurrentAutoName <= 0 and #self.AutoNames) or 1
        end

        local fillData = self.AutoNames[self.CurrentAutoName]

        if (fillData) then
            fillData.CompleteString = utf8.sub(fillData.Name, utf8.len(match) + 1)
        end

        return fillData
    end

    self.TextEntry.DoAutoFill = function(s)
        local pl = s:GetAutoFill()
        if (not pl) then return end
        local words = string.Explode(' ', s:GetValue())
        match = words[#words]
        if (not match or match == '') then return end
        local pref = utf8.sub(s:GetValue(), 1, 1)
        local fillVal
        local firstargs = utf8.sub(s:GetValue(), 2, (string.find(s:GetValue(), ' ') or (utf8.len(s:GetValue()) + 2)) - 1)

        if (pref == '/' or pref == '!') and (firstargs == 'pm' or firstargs == 'hit' or firstargs == 'demote') and (firstargs ~= 'tellall') and (not ret) then
            fillVal = pl.SteamID
        else
            fillVal = pl.Name
        end

        s:SetText(utf8.sub(s:GetValue(), 1, -(utf8.len(match) + 1)) .. fillVal .. ' ')
    end

    self.TextEntry.historyPos = 0

    self.TextEntry.OnKeyCodeTyped = function(s, code)
        if (code == KEY_TAB) or ((code == KEY_RIGHT) and (s:GetCaretPos() == utf8.len(s:GetValue()))) then
            s:DoAutoFill()
            s:OnTextChanged()
            s:SetCaretPos(utf8.len(s:GetValue()))
        elseif (code == KEY_UP) then
            if (#self.AutoNames > 0) and self.GetAutoFill then
                local auto = self:GetAutoFill(1)

                if auto then
                    s.AutoFillText = auto and auto.CompleteString or nil
                end
            else
                if (self.History[s.historyPos + 1]) then
                    s.historyPos = s.historyPos + 1
                    s:SetText(self.History[s.historyPos])
                    s:SetCaretPos(utf8.len(s:GetValue()))
                end
            end
        elseif (code == KEY_DOWN) then
            if (#self.AutoNames > 0) and self.GetAutoFill then
                local auto = self:GetAutoFill(1)

                if auto then
                    s.AutoFillText = auto and auto.CompleteString or nil
                end
            else
                if (self.History[s.historyPos - 1] or s.historyPos - 1 == 0) then
                    s.historyPos = s.historyPos - 1
                    s:SetText(self.History[s.historyPos] or '')
                    s:SetCaretPos(utf8.len(s:GetValue()))
                end
            end
        elseif code == KEY_BACKQUOTE then
            -- gui.HideGameUI()
        elseif code == KEY_ENTER then
            if string.Trim(s:GetText()) ~= '' then
                if string.Trim( s:GetText() ) != '' then
                    LocalPlayer():ConCommand( [[say ]] .. s:GetText() )
                end

                if (string.Trim(s:GetValue()) ~= '') then
                    table.insert(self.History, 1, s:GetText())
                end

                s.historyPos = 0
                self.Scroll.VBar:AnimateTo(self.Scroll.pnlCanvas:GetTall(), 0.5, 0, 0.5)
            end

            shizlib.closeChatbox()
        end
    end

    self.TextEntry.OnLoseFocus = function(s)
        if (input.IsKeyDown(KEY_TAB)) then
            s:RequestFocus()
            s:SetCaretPos(utf8.len(s:GetText()))
        end
    end

    self.TextEntry.OnTextChanged = function(s)
        s:CalculateAutoFill()
        local auto = s:GetAutoFill()
        s.AutoFillText = auto and auto.CompleteString or nil

        if (s:AllowInput()) then
            s:SetValue(utf8.sub(s:GetValue(), 1, 160))
            s:SetCaretPos(160)
        end

        gamemode.Call('ChatTextChanged', s:GetValue())
    end

    self.TextEntry.AllowInput = function(s)
        if (utf8.len(s:GetValue()) >= 160) then
            surface.PlaySound('Resource/warning.wav')

            return true
        end
    end

    self.Emojis = vgui.Create('DButton', self.BottomPanel)
    self.Emojis:Dock(RIGHT)
    self.Emojis:SetWide(o(30))
    self.Emojis:DockMargin(o(5), 0, o(5), 0)
    self.Emojis:SetText('')
    self.Emojis.CurEmoji = table.Random(emojis)

    self.Emojis.Paint = function(s, w, h)
        local emojit = s.CurEmoji

        if emojit and emojit.mat then
            surface.SetMaterial(emojit.mat )
            surface.SetDrawColor(255, 255, 255, 255)
            surface.DrawTexturedRect(w/2-p(12), h/2-p(12), p(24), p(24))
        end
    end

    self.Emojis.OnCursorEntered = function(s)
        s.CurEmoji = table.Random(emojis)
    end

    self.Emojis.DoClick = function(s)
        if IsValid(self.EmojisPanel) then
            self.EmojisPanel:Remove()

            return
        end

        local sx, sy = input.GetCursorPos()

        self.EmojisPanel = vgui.Create('DFrame')
        self.EmojisPanel:ShowCloseButton(false)
        self.EmojisPanel:SetTitle('')
        self.EmojisPanel:SetSize(o(200), p(150))
        self.EmojisPanel:SetPos(math.Clamp(sx + 10, 0, ScrW()), math.Clamp(sy + 10, 0, ScrH()))
        self.EmojisPanel:SetScreenLock(true)
        self.EmojisPanel:MakePopup()

        self.EmojisPanel.Think = function(sp)
            local hov = vgui.GetHoveredPanel()

            if input.IsMouseDown(MOUSE_LEFT) and not hov or not self:IsKeyboardInputEnabled() then
                sp:Remove()
            end
        end

        self.EmojisPanel.Paint = function(sp, w, h)
            draw.RoundedBox(16, 0, 0, w, h, colors.bg)
        end

        self.EmojisPanel.Scroll = vgui.Create('DScrollPanel', self.EmojisPanel)
        self.EmojisPanel.Scroll:SetSize(o(190), p(140))
        self.EmojisPanel.Scroll:SetPos(o(5), p(5))

        local x, y = 0, 0
        self.EmojisPanel.Table = {}

        self.EmojisPanel.AddEmoji = function(sp, em, name)
            if x >= 5 then
                x = 0
                y = y + 1
            end

            if not sp.Table[name] then
                local cat = sp.Scroll:Add('DButton')
                cat:SetSize(o(143), o(32))

                if x ~= 0 and y ~= 0 then
                    y = y + 1
                end

                cat:SetPos(0, o(37) * y)
                cat:SetText('')

                cat.Paint = function(ep, w, h)
                    shizlib.ShadowText(name, 'shizlib.Label', w / 2, h / 2, Color(255, 255, 255), 1, 1)
                end

                x = 0
                y = y + 1
                sp.Table[name] = {}
            end

            local emojit = emojis[em]

            if emojit then
                local emoji = sp.Scroll:Add('DButton')
                emoji:SetSize(o(32), o(32))
                emoji:SetPos(o(37) * x, o(37) * y)
                emoji:SetText('')

                emoji.Paint = function(ep, w, h)
                    surface.SetMaterial(emojit.mat)
                    surface.SetDrawColor(255, 255, 255, 255)
                    local ew, eh = o(emojit.width), o(emojit.height)
                    surface.DrawTexturedRect(0, w / 2 - eh / 2, ew, eh)
                end

                emoji.DoClick = function()
                    self.TextEntry:SetText(self.TextEntry:GetText() .. ':' .. em .. ':')
                    self.TextEntry:SetCaretPos(utf8.len(self.TextEntry:GetText()))
                end

                sp.Table[name][em] = true
                x = x + 1
            end
        end

        local most_useful = {'thumbsdown', 'thumbsup', 'wave', 'middle_finger', 'ok_hand', 'point_left'}

        for k, v in pairs(most_useful) do
            self.EmojisPanel:AddEmoji(v, 'Популярные')
        end

        local other = {'yuffkaheart', 'angry', 'anguished', 'blush', 'astonished', 'clown_face', 'cold_face', 'cold_sweat', 'confounded', 'confused', 'drooling_face', 'cry', 'crying_cat_face', 'disappointed', 'dizzy_face', 'disappointed_relieved', 'exploding_head', 'eyes', 'expressionless', 'face_palm', 'face_vomiting', 'face_with_cowboy_hat', 'face_with_hand_over_mouth', 'face_with_head_bandage', 'face_with_monocle', 'face_with_raised_eyebrow', 'face_with_rolling_eyes', 'face_with_symbols_on_mouth', 'face_with_thermometer', 'fearful', 'flushed', 'frowning', 'grimacing', 'grin', 'grinning', 'hankey', 'heart_eyes', 'heart_eyes_cat', 'hot_face', 'hugging_face', 'hushed', 'imp', 'innocent', 'joy', 'joy_cat', 'kissing', 'kissing_cat', 'kissing_closed_eyes', 'kissing_heart', 'kissing_smiling_eyes', 'laughing', 'lying_face', 'mask', 'money_mouth_face', 'nauseated_face', 'nerd_face', 'neutral_face', 'no_mouth', 'open_mouth', 'pensive', 'persevere', 'partying_face', 'pleading_face', 'pouting_cat', 'rage', 'relaxed', 'relieved', 'rolling_on_the_floor_laughing', 'scream', 'scream_cat', 'shrug', 'shushing_face', 'skull', 'sleeping', 'sleepy', 'slightly_frowning_face', 'slightly_smiling_face', 'smile', 'smiley', 'smiley_cat', 'smile_cat', 'smiling_face_with_3_hearts', 'smiling_imp', 'smirk', 'smirk_cat', 'sneezing_face', 'sob', 'star_struck', 'stuck_out_tongue', 'stuck_out_tongue_closed_eyes', 'stuck_out_tongue_winking_eye', 'sunglasses', 'sweat', 'sweat_drops', 'sweat_smile', 'thinking_face', 'tired_face', 'triumph', 'unamused', 'upside_down_face', 'weary', 'wink', 'woozy_face', 'worried', 'yum', 'zipper_mouth_face', 'yawning_face', 'zany_face', 'thumbsdown', 'thumbsup', 'call_me_hand', 'clap', 'crossed_fingers', 'facepunch', 'fist', 'hand', 'handshake', 'i_love_you_hand_sign', 'left_facing_fist', 'right_facing_fist', 'middle_finger', 'muscle', 'ok_hand', 'open_hands', 'palms_up_together', 'pinching_hand', 'point_down', 'point_left', 'point_right', 'point_up', 'point_up_2', 'pray', 'raised_back_of_hand', 'raised_hands', 'raised_hand_with_fingers_splayed', 'the_horns', 'v', 'wave', 'x', 'cat', 'cat2', 'dog', 'dog2', 'orangutan', 'otter', 'shark', 'mouse', 'mouse2', 'rat', 'penguin', 'wolf', 'fox_face', 'snake', 'rooster', 'hamster', 'pig', 'apple', 'pancakes', 'birthday', 'beer', 'bread', 'wine_glass', 'pizza', 'tea', 'anger', 'balloon', 'beginner', 'bell', 'boom', 'calendar', 'camera', 'camera_with_flash', 'cherry_blossom', 'coffin', 'comet', 'crown', 'dagger_knife', 'dizzy', 'fallen_leaf', 'feet', 'fire', 'hibiscus', 'lock', 'unlock', 'loud_sound', 'mute', 'moyai', 'musical_note', 'no_bell', 'printer', 'rainbow', 'robot_face', 'rocket', 'shield', 'shopping_trolley', 'slot_machine', 'smoking', 'snowflake', 'soccer', 'sparkles', 'spider_web', 'star', 'sunny', 'tada', 'thunder_cloud_and_rain', 'tophat', 'tornado', 'umbrella', 'umbrella_with_rain_drops', 'waving_black_flag', 'zap', 'zzz', 'arrow_backward', 'arrow_down', 'arrow_down_small', 'arrow_forward', 'arrow_left', 'arrow_right', 'arrow_up', 'arrow_up_small', 'black_circle', 'black_heart', 'black_large_square', 'blue_heart', 'broken_heart', 'brown_heart', 'copyright', 'registered', 'green_heart', 'heart', 'heart_decoration', 'large_blue_circle', 'large_blue_diamond', 'large_blue_square', 'large_brown_circle', 'large_brown_square', 'large_green_circle', 'large_green_square', 'large_orange_circle', 'large_orange_diamond', 'large_orange_square', 'large_purple_circle', 'large_purple_square', 'large_red_square', 'large_yellow_circle', 'large_yellow_square', 'negative_squared_cross_mark', 'new', 'orange_heart', 'peace_symbol', 'no_entry', 'no_entry_sign', 'purple_heart', 'red_circle', 'signal_strength', 'top', 'underage', 'white_check_mark', 'white_circle', 'white_frowning_face', 'white_heart', 'white_large_square', 'yellow_heart'}

        for k, v in pairs(other) do
            self.EmojisPanel:AddEmoji(v, 'Остальное')
        end
    end

    self.Emojis:Hide()
    self.Send = vgui.Create('DButton', self.BottomPanel)
    self.Send:Dock(RIGHT)
    self.Send:SetWide(o(30))
    self.Send:DockMargin(o(5), 0, 0, 0)
    self.Send:SetText('')
    local send = Material('shizlib_chat/send.png', 'smooth')

    self.Send.Paint = function(s, w, h)
        local col = s.Hovered and color_white or colors.hvr
        surface.SetMaterial(send)
        surface.SetDrawColor(col)
        surface.DrawTexturedRect(w/2-p(10), h/2-p(10), p(20), p(20))
    end

    self.Send.DoClick = function(s)
        if string.Trim( s:GetText() ) != '' then
            LocalPlayer():ConCommand( [[say ]] .. s:GetText() )
        end

        if (string.Trim(self.TextEntry:GetValue()) ~= '') then
            table.insert(self.History, 1, s:GetText())
        end

        self.TextEntry.historyPos = 0
        self.Scroll.VBar:AnimateTo(self.Scroll.pnlCanvas:GetTall(), 0.5, 0, 0.5)
        self.TextEntry:SetText('')
    end

    self.Send:Hide()
    self.Scroll = vgui.Create('DScrollPanel', self)
    self.Scroll:Dock(FILL)
    self.Scroll:DockMargin(0, o(15), 0, o(10))
    self.Scroll.VBar:SetHideButtons(true)
    self.Scroll.VBar.Paint = function() end

    self.Scroll.VBar.btnGrip.Paint = function(s, w, h)
        if self:IsKeyboardInputEnabled() then
            draw.RoundedBox(shizlib.surface.s(8),0,0,w,h,colors.hvr)
        end
    end

    self.Scroll.AddMCText = function(s, args)
        local lbls = s.pnlCanvas:GetChildren()
        local l = lbls[#lbls]
        local h, y

        if l then
            _, h = l:GetSize()
            _, y = l:GetPos()
        else
            h = 0
            y = 0
        end

        local lbl = self.Scroll:Add('shizlib.ChatLine')
        lbl:SetSize(s:GetWide(), p(24))
        lbl:AddMCText(args)
        lbl:SetPos(0, y + h)

        if not self:IsKeyboardInputEnabled() or ((s.pnlCanvas:GetTall() - p(250)) - s.VBar:GetScroll()) < p(30) then
            s.VBar:AnimateTo(s.pnlCanvas:GetTall(), 0.5, 0, 0.5)
        end
    end

    self.Scroll.Paint = function(s, w, h) end

    self.Scroll.Think = function(s)
        local lbls = s.pnlCanvas:GetChildren()
        local count = #lbls

        for k, v in pairs(lbls) do
            if k < (count - 200) then
                local _, h = v:GetSize()

                for nk, nv in pairs(lbls) do
                    if k ~= nk then
                        local _, y = nv:GetPos()
                        nv:SetPos(0, y - h)
                    end
                end

                v:Remove()
                continue
            end

            if not v.Expire then continue end
            local _, y = v:GetPos()

            if s.VBar:GetScroll() - 30 > y then
                v:Hide()
                continue
            end

            if shizlib.ChatBox:IsKeyboardInputEnabled() then
                v:Show()
                continue
            end

            if v.Expire > SysTime() then
                v:Show()
            else
                v:Hide()
            end
        end
    end
end

function PANEL:OnRemove()
    LocalPlayer().ShowChat = false 
end

derma.DefineControl('shizlib.Chatbox', 'mrppr\'s Chatbox', PANEL, 'DFrame')

function shizlib.Create()
    if shizlib.ChatBox then
        shizlib.ChatBox:Remove()
    end

    shizlib.ChatBox = vgui.Create('shizlib.Chatbox')
end

hook.Add('PlayerBindPress', 'shizlib.PlayerBindPress', function(ply, bind, pressed)
    local bTeam

    if bind == 'messagemode' then
        bTeam = false
    elseif bind == 'messagemode2' then
        bTeam = true
    else
        return
    end

    shizlib.openChatbox(bTeam)

    return true
end)

function shizlib.openChatbox(bTeam)
    shizlib.ChatBox.Team = bTeam
    shizlib.ChatBox:MakePopup()
    shizlib.ChatBox.TextEntry:RequestFocus()
    shizlib.ChatBox.Emojis:Show()
    shizlib.ChatBox.Send:Show()
    shizlib.ChatBox.Scroll.VBar:SetScroll(shizlib.ChatBox.Scroll.pnlCanvas:GetTall())
    hook.Run('StartChat')

    LocalPlayer().ShowChat = true 
end

function shizlib.closeChatbox()
    shizlib.ChatBox:SetMouseInputEnabled(false)
    shizlib.ChatBox:SetKeyboardInputEnabled(false)
    shizlib.ChatBox.Emojis:Hide()
    shizlib.ChatBox.Send:Hide()
    shizlib.ChatBox.Scroll.VBar:SetScroll(shizlib.ChatBox.Scroll.pnlCanvas:GetTall())
    gui.EnableScreenClicker(false)
    hook.Run('FinishChat')
    shizlib.ChatBox.TextEntry:SetText('')
    shizlib.ChatBox.TextEntry.AutoFillText = nil
    hook.Run('ChatTextChanged', '')

    local x, y = shizlib.ChatBox:GetPos()
    local w, h = shizlib.ChatBox:GetWide(), shizlib.ChatBox:GetTall()

    global_x:SetInt(math.Round(x))
    global_y:SetInt(math.Round(y))
    global_w:SetInt(math.Round(w))
    global_h:SetInt(math.Round(h))

    LocalPlayer().ShowChat = false 
end

hook.Add('HUDShouldDraw', 'shizlib.HUDShouldDraw', function(name)
    if name == 'CHudChat' then return false end
end)

if not shizlib.Replaced then
    local oldAddText = chat.AddText

    function chat.AddText(...)
        local args = {...}

        shizlib.ChatBox.Scroll:AddMCText(args)
        oldAddText(...)
    end

    shizlib.Replaced = true
end

timer.Simple(.1, function()
    shizlib.Create()
end)

concommand.Add('shizlib_chat_reload', function(pl, cmd, args, argstr)
    shizlib.Create()
end)

hook.Remove('ChatText', 'RemoveJoinLeaveMsg', function(_, _, _, mode)
	if mode == 'joinleave' then return true end
end)

hook.Add('OnPauseMenuShow', 'shizlib-ClosePanelOnESC', function()
    if IsValid(shizlib.ChatBox) then
        return false
    end
end)