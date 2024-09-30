CHAT = CHAT or {}

if not _chatAddText then
    _chatAddText = chat.AddText
end

local s = shizlib.surface.s
local DTR = shizlib.surface.DTR
local colors = CFG.theme
local surface = CLIENT and surface
local draw = CLIENT and draw
local draw_RoundedBox = CLIENT and draw.RoundedBox
local draw_RoundedBoxEx = CLIENT and draw.RoundedBoxEx
local draw_SimpleText = CLIENT and draw.SimpleText

function CHAT.Init()
    CHAT.fr = vgui.Create('DFrame')
    CHAT.fr:SetVisible(false)
    CHAT.fr:SetPos(s(100), s(640))
    CHAT.fr:SetSize(s(600), s(300))
    CHAT.fr:ShowCloseButton(false)
    CHAT.fr:SetDraggable(true)
    CHAT.fr:SetTitle('Pretty Chating')
    -- function CHAT.fr:Paint(w, h)
    --     draw_RoundedBox(8, 0, 0, w, h, colors.bg)
    --     draw_RoundedBoxEx(8, 0, 0, w, s(24), colors.hvr, true, true)
    --     draw_SimpleText('Pretty Chating?', 'font.24', s(8), s(12), color_white, 0, 1)
    -- end
    local keypressed = true
    function CHAT.fr:Think()
        if input.IsButtonDown(KEY_ESCAPE) then
            keypressed = true
        else
            keypressed = false
        end
        if input.IsButtonDown(KEY_ESCAPE) and keypressed then
            CHAT.ChangeVisible(false)
            gui.HideGameUI()
        end
    end

    CHAT.richText = CHAT.fr:Add('RichText')
    CHAT.richText:Dock(FILL)
    CHAT.richText:DockMargin(s(5), s(5), s(5), s(40))
    CHAT.richText:SetVerticalScrollbarEnabled(true)
    function CHAT.richText:Paint(w, h)
        self:DrawTextEntryText(Color(25, 25, 25), Color(25, 25, 25), Color(25, 25, 25))
        self:SetFontInternal('font.20')
    end

    CHAT.textBox = CHAT.fr:Add('DTextEntry')
    CHAT.textBox:SetPos(s(5), CHAT.fr:GetTall() - s(35))
    CHAT.textBox:SetSize(CHAT.fr:GetWide() - s(10), s(30))
    CHAT.textBox:SetTextColor(color_black)

    function CHAT.textBox:OnKeyCodeTyped(code)
        if code == KEY_ESCAPE then
            CHAT.ChangeVisible(false)
            gui.HideGameUI()
        elseif code == KEY_ENTER then

            if string.Trim( self:GetText() ) != '' then
                LocalPlayer():ConCommand( [[say ]] .. self:GetText() )
            end
            self:SetText('')

            -- CHAT.ChangeVisible()
        elseif code == KEY_TAB then
            self:SetText( autotypePlayerName( self:GetText() ) );

            timer.Simple(.002, function() self:RequestFocus() end)
        end
    end
    function CHAT.textBox:OnTextChanged()
        if self and self.GetText then 
			gamemode.Call('ChatTextChanged', self:GetText() or '')
		end
    end
end

function autotypePlayerName( str )
    local LastWord = string.match( str, '%a+$' );

    if (LastWord == nil) then
        return str;
    end

    playerlist = player.GetAll()
    for k, v in pairs( playerlist ) do
        local nickname = v:Nick()
        if string.len(LastWord) < string.len(nickname) && string.find( string.lower(nickname), string.lower(LastWord) ) == 1 then
            str = string.sub( str, 1, (string.len(LastWord) * -1) - 1)
            str = str .. nickname
            return str
        end
    end

    return str;
end

function CHAT.ChangeVisible( bool )
    if not IsValid(CHAT.fr) then return end

    CHAT.fr:SetMouseInputEnabled(bool)
    CHAT.fr:SetKeyboardInputEnabled(bool)
    gui.EnableScreenClicker(bool)
    CHAT.fr:SetVerticalScrollbarEnabled(true)
    CHAT.fr:SetVisible(bool)

    if bool then
        CHAT.fr:MakePopup()
        CHAT.textBox:RequestFocus()
        CHAT.textBox:SetText('')

        gamemode.Call('StartChat')

    end
end

function appendToChat(obj)
    if not IsValid(CHAT.richText) then return end
    if type(obj) == 'table' then
        CHAT.richText:InsertColorChange( obj.r, obj.g, obj.b, 255 );
    elseif type(obj) == 'string' then
        CHAT.richText:AppendText(obj);
    end
end

function chat.AddText(...)
    local args = {...}
    
    appendToChat('\n');

    for _, obj in pairs( args ) do
        if type(obj) == 'table' or type(obj) == 'string' then
            appendToChat(obj);
        elseif obj:IsPlayer() then
            local col = GAMEMODE:GetTeamColor(obj);
            appendToChat(col);
            appendToChat(obj:Nick());
        end
    end

    _chatAddText(...);
    
end

hook.Add('InitPostEntity', 'shizlib-chatInit', function()
    timer.Simple(1, function()
        CHAT.Init()
    end)
end)

hook.Add('PlayerBindPress', 'overrideChatbind', function( ply, bind, pressed )
    if bind ~= 'messagemode' and bind ~= 'messagemode2' then return end

    CHAT.ChangeVisible(true)
    return true
end)

hook.Add('HUDShouldDraw', 'noMoreDefault', function(name)
    if name == 'CHudChat' then return false end
end)

hook.Add('ChatText', 'serverNotifications', function(index, name, text, type)
	if type == 'joinleave' or type == 'none' then
		appendToChat('\n' .. text)
	end
end)

concommand.Add('shizlib_reloadchat', function()
    CHAT.Init()
end)