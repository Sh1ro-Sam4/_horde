-- CreateClientConVar('shizlib_blur', '1', true, true)

-- if CFG.disabledModules.skin then return end

-- local surface = surface
-- local draw = draw
-- local Color = Color

-- CFG.theme = {}
-- local col = CFG.theme

-- col.b = col.b or Color(65,132,209, 255)
-- col.y = col.y or Color(240,202,77, 255)
-- col.r = col.r or Color(222,91,73, 255)
-- col.g = col.g or Color(182,176,155, 255)
-- col.o = col.o or Color(170,119,102, 255)

-- col.bg = col.bg or Color(217,211,187, 255)

-- col.bg95 = col.bg95 or Color(col.bg.r, col.bg.g, col.bg.b, 240)
-- col.bg60 = col.bg60 or Color(col.bg.r, col.bg.g, col.bg.b, 150)
-- col.bg50 = col.bg50 or Color(col.bg.r/2, col.bg.g/2, col.bg.b/2, 255)

-- col.bg_d = col.bg_d or Color(col.bg.r * 0.75, col.bg.g * 0.75, col.bg.b * 0.75, 255)
-- col.bg_l = col.bg_l or Color(col.bg.r * 1.25, col.bg.g * 1.25, col.bg.b * 1.25, 255)
-- col.bg_grey = col.bg_grey or Color(180,180,180, 255)
-- col.g_d = col.g_d or Color(col.g.r * 0.75, col.g.g * 0.75, col.g.b * 0.75, 255)
-- col.r_d = col.r_d or Color(col.r.r * 0.75, col.r.g * 0.75, col.r.b * 0.75, 255)

-- col.hvr = col.hvr or Color(0,0,0, 50)
-- col.dsb = col.dsb or Color(255,255,255, 50)

-- col.hvrBut = col.hvrBut or Color(67, 64, 56, 255)

-- local toBg, toBgTime = col.bg, 1
-- local toG, toGTime = col.g, 1

-- local function updateColors()

-- 	local colBg, colG = col.bg, col.g
-- 	if colBg == toBg and colG == toG then
-- 		return hook.Remove('Think', 'shizlib.theme')
-- 	end

-- 	-- Update colBg
-- 	local ft = FrameTime()
-- 	colBg.r = shizlib.math.lerp(colBg.r, toBg.r, ft / toBgTime, 0, 255)
-- 	colBg.g = shizlib.math.lerp(colBg.g, toBg.g, ft / toBgTime, 0, 255)
-- 	colBg.b = shizlib.math.lerp(colBg.b, toBg.b, ft / toBgTime, 0, 255)
-- 	local r, g, b = colBg.r, colBg.g, colBg.b
-- 	col.bg = colBg
-- 	col.bg95 = ColorAlpha(colBg, 241)
-- 	col.bg60 = ColorAlpha(colBg, 150)
-- 	col.bg50 = Color(r / 2, g / 2, b / 2, 255)
-- 	col.bg_d = Color(r * 0.75, g * 0.75, b * 0.75, 255)
-- 	col.bg_l = Color(r * 1.25, g * 1.25, b * 1.25, 255)

-- 	-- Update colG
-- 	colG.r = shizlib.math.lerp(colG.r, toG.r, ft / toGTime, 0, 255)
-- 	colG.g = shizlib.math.lerp(colG.g, toG.g, ft / toGTime, 0, 255)
-- 	colG.b = shizlib.math.lerp(colG.b, toG.b, ft / toGTime, 0, 255)
-- 	r, g, b = colG.r, colG.g, colG.b
-- 	col.g = colG
-- 	col.g_d = Color(r * 0.75, g * 0.75, b * 0.75)
-- end

-- function shizlib.changeSkinColor(bgColor, gColor, delta)
-- 	if not IsColor(bgColor) and not IsColor(gColor) then return end

-- 	delta = delta or 1
-- 	toBg, toBgTime = bgColor or toBg, delta
-- 	toG, toGTime = gColor or toG, delta
-- 	hook.Add('Think', 'shizlib.theme', updateColors)
-- end

-- surface.CreateFont('shz-icon', {
--     font = 'FontAwesome',
-- 	extended = true,
-- 	size = 13,
-- 	weight = 400,
-- })

-- local SKIN = {}
-- SKIN.PrintName = 'SHZ Derma Skin'
-- SKIN.Author = 'kasanov'

-- SKIN.fontFrame = 'DermaDefault'
-- SKIN.fontTab = 'DermaDefault'
-- SKIN.fontCategoryHeader = 'TabLarge'

-- SKIN.GwenTexture = Material( 'gwenskin/GModDefault.png' )

-- SKIN.Shadow = GWEN.CreateTextureBorder(448, 0, 31, 31, 8, 8, 8, 8)
-- SKIN.colShiz = col

-- SKIN.bg_color					= Color(101, 100, 105, 255)
-- SKIN.bg_color_sleep				= Color(70, 70, 70, 255)
-- SKIN.bg_color_dark				= Color(55, 57, 61, 255)
-- SKIN.bg_color_bright			= Color(220, 220, 220, 255)
-- SKIN.frame_border				= Color(50, 50, 50, 255)

-- SKIN.control_color				= Color(120, 120, 120, 255)
-- SKIN.control_color_highlight	= Color(150, 150, 150, 255)
-- SKIN.control_color_active		= Color(110, 150, 250, 255)
-- SKIN.control_color_bright		= Color(255, 200, 100, 255)
-- SKIN.control_color_dark			= Color(100, 100, 100, 255)

-- SKIN.bg_alt1					= Color(50, 50, 50, 255)
-- SKIN.bg_alt2					= Color(55, 55, 55, 255)

-- SKIN.listview_hover				= Color(70, 70, 70, 255)
-- SKIN.listview_selected			= Color(100, 170, 220, 255)
-- SKIN.combobox_selected			= SKIN.listview_selected

-- SKIN.text_bright				= Color(255, 255, 255, 255)
-- SKIN.text_normal				= Color(180, 180, 180, 255)
-- SKIN.text_dark					= Color(255, 255, 255, 255)
-- SKIN.text_highlight				= Color(255, 20, 20, 255)

-- SKIN.panel_transback			= Color(255, 255, 255, 50)
-- SKIN.tooltip					= Color(255, 245, 175, 255)
-- SKIN.colPropertySheet			= Color(170, 170, 170, 255)

-- SKIN.colTab						= SKIN.colPropertySheet
-- SKIN.colTabInactive				= Color(140, 140, 140, 255)
-- SKIN.colTabShadow				= Color(0, 0, 0, 170)
-- SKIN.colTabText					= Color(255, 255, 255, 255)
-- SKIN.colTabTextInactive			= Color(0, 0, 0, 200)

-- SKIN.colCollapsibleCategory		= Color(255, 255, 255, 20)

-- SKIN.colCategoryText			= Color(255, 255, 255, 255)
-- SKIN.colCategoryTextInactive	= Color(200, 200, 200, 255)

-- SKIN.colNumberWangBG			= Color(255, 240, 150, 255)
-- SKIN.colTextEntryBG				= col.bg
-- SKIN.colTextEntryBorder			= Color(20, 20, 20, 255)
-- SKIN.colTextEntryText			= Color(30, 30, 30, 255)
-- SKIN.colTextEntryTextHighlight	= col.o
-- SKIN.colTextEntryTextCursor		= Color(30, 30, 30, 255)
-- SKIN.colTextEntryTextPlaceholder= Color(100, 100, 100, 100)

-- SKIN.colMenuBG					= col.bg
-- SKIN.colMenuBorder				= col.o

-- SKIN.colButtonText				= Color(255, 255, 255, 255)
-- SKIN.colButtonTextDisabled		= Color(255, 255, 255, 55)
-- SKIN.colButtonBorder			= Color(20, 20, 20, 255)
-- SKIN.colButtonBorderHighlight	= Color(255, 255, 255, 50)
-- SKIN.colButtonBorderShadow		= Color(0, 0, 0, 100)

-- SKIN.Colours = {}

-- SKIN.Colours.Button = {}
-- SKIN.Colours.Button.Disabled = Color(0,0,0,100)
-- SKIN.Colours.Button.Down = Color(180,180,180,255)
-- SKIN.Colours.Button.Hover = Color(255,255,255,255)
-- SKIN.Colours.Button.Normal = Color(255,255,255,255)

-- SKIN.Colours.Category = {}
-- SKIN.Colours.Category.Header = Color(255,255,255,255)
-- SKIN.Colours.Category.Header_Closed = Color(255,255,255,150)
-- SKIN.Colours.Category.Line = {}
-- SKIN.Colours.Category.Line.Button = Color(255,255,255,0)
-- SKIN.Colours.Category.Line.Button_Hover = Color(0,0,0,8)
-- SKIN.Colours.Category.Line.Button_Selected = Color(255,216,0,255)
-- SKIN.Colours.Category.Line.Text = Color(200,200,200,255)
-- SKIN.Colours.Category.Line.Text_Hover = Color(255,255,255,255)
-- SKIN.Colours.Category.Line.Text_Selected = Color(255,255,255,255)
-- SKIN.Colours.Category.LineAlt = {}
-- SKIN.Colours.Category.LineAlt.Button = Color(0,0,0,26)
-- SKIN.Colours.Category.LineAlt.Button_Hover = Color(0,0,0,32)
-- SKIN.Colours.Category.LineAlt.Button_Selected = Color(255,216,0,255)
-- SKIN.Colours.Category.LineAlt.Text = Color(200,200,200,255)
-- SKIN.Colours.Category.LineAlt.Text_Hover = Color(255,255,255,255)
-- SKIN.Colours.Category.LineAlt.Text_Selected = Color(255,255,255,255)

-- SKIN.Colours.Label = {}
-- SKIN.Colours.Label.Bright = Color(255,255,255,255)
-- SKIN.Colours.Label.Dark = Color(255,255,255,255)
-- SKIN.Colours.Label.Default = Color(255,255,255,255)
-- SKIN.Colours.Label.Highlight = Color(255,0,0,255)

-- SKIN.Colours.Properties = {}
-- SKIN.Colours.Properties.Border = col.bg
-- SKIN.Colours.Properties.Column_Hover = Color(118,199,255,59)
-- SKIN.Colours.Properties.Column_Normal = Color(255,255,255,0)
-- SKIN.Colours.Properties.Column_Selected = Color(118,199,255,255)
-- SKIN.Colours.Properties.Label_Hover = Color(50,50,50,255)
-- SKIN.Colours.Properties.Label_Normal = Color(0,0,0,255)
-- SKIN.Colours.Properties.Label_Selected = Color(0,0,0,255)
-- SKIN.Colours.Properties.Line_Hover = Color(156,156,156,255)
-- SKIN.Colours.Properties.Line_Normal = Color(156,156,156,255)
-- SKIN.Colours.Properties.Line_Selected = Color(156,156,156,255)
-- SKIN.Colours.Properties.Title = Color(255,255,255,255)

-- SKIN.Colours.Tab = {}
-- SKIN.Colours.Tab.Active = {}
-- SKIN.Colours.Tab.Active.Disabled = Color(233,233,233,204)
-- SKIN.Colours.Tab.Active.Down = Color(255,255,255,255)
-- SKIN.Colours.Tab.Active.Hover = Color(255,255,255,255)
-- SKIN.Colours.Tab.Active.Normal = Color(255,255,255,255)
-- SKIN.Colours.Tab.Inactive = {}
-- SKIN.Colours.Tab.Inactive.Disabled = Color(210,210,210,204)
-- SKIN.Colours.Tab.Inactive.Down = Color(255,255,255,255)
-- SKIN.Colours.Tab.Inactive.Hover = Color(249,249,249,153)
-- SKIN.Colours.Tab.Inactive.Normal = Color(255,255,255,102)

-- SKIN.Colours.TooltipText = Color(255,255,255,255)

-- SKIN.Colours.Tree = {}
-- SKIN.Colours.Tree.Hover = col.g
-- SKIN.Colours.Tree.Normal = color_white
-- SKIN.Colours.Tree.Lines = Color(255,255,255, 35)
-- SKIN.Colours.Tree.Selected = color_white

-- SKIN.Colours.Window = {}
-- SKIN.Colours.Window.TitleActive = Color(255,255,255,204)
-- SKIN.Colours.Window.TitleInactive = Color(255,255,255,92)

-- SKIN.Colours.TooltipText = Color(255,255,255,255)

-- local function shadow(x, y, w, h)
--     SKIN.Shadow(x, y, w, h)
-- end

-- function SKIN:PaintPanel(pnl, w, h)

--     if not pnl.m_bBackground then return end

--     draw.RoundedBox(4, 0, 0, w, h, col.bg_d)
--     draw.RoundedBox(4, 1, 1, w-2, h-2, col.bg60)

-- end

-- function SKIN:PaintFrame(pnl, w, h)

--     DisableClipping( true )
--     shadow(-4, -4, w+8, h+8)
--     DisableClipping( false )

--     draw.RoundedBox(4, 0, 0, w, h, col.bg)
-- 	surface.SetDrawColor(Color(0,0,0, 150))
-- 	surface.SetMaterial(Material('vgui/gradient-d'))
-- 	surface.DrawTexturedRect(0, 0, w, h)
--     draw.RoundedBox(4, 0, 0, w, 24, Color(0,0,0, 80))

-- end

-- function SKIN:PaintButton(pnl, w, h)

--     if not pnl.m_bBackground then return end
-- 	if not pnl.hvrStatus then pnl.hvrStatus = 0 end

--     -- local off = h > 20 and 2 or 1
--     -- if pnl.Depressed then
--     --     draw.RoundedBox(4, 0, off, w, h-off, col.g)
--     --     draw.RoundedBox(4, 0, off, w, h-off, col.hvr)
--     -- else
--     --     draw.RoundedBox(4, 0, off, w, h, col.g_d)
--     --     draw.RoundedBox(4, 0, off, w, h-off, col.g)
--     --     if pnl.Disabled then
--     --         draw.RoundedBox(4, 0, 0, w, h, col.dsb)
--     --     elseif pnl.Hovered then
--     --         draw.RoundedBox(4, 0, 0, w, h, col.hvr)
--     --     end
--     -- end

-- 	if pnl:IsHovered() then
-- 		pnl.hvrStatus = pnl.hvrStatus + .05
-- 	else
-- 		pnl.hvrStatus = pnl.hvrStatus - .05
-- 	end

-- 	draw.RoundedBox(4, 0, 0, w, h, col.g)
-- 	draw.RoundedBox(4, 0, 0, w * pnl.hvrStatus, h, col.hvrBut)
	
-- end

-- function SKIN:PaintWindowCloseButton(pnl, w, h)

--     if ply.Disabled then return end

--     if pnl.Depressed then
--         draw.RoundedBox(4, w/2-8, h/2-7, 16, 16, col.r)
--         if pnl.Hovered then
--             draw.SimpleText(utf8.char(0x274C), 'shz-icon', w/2, h/2, Color(0,0,0, 120), 1, 1)
--         end
--     else
--         draw.RoundedBox(4, w/2-8, h/2-7, 16, 16, col.r_d)
-- 		draw.RoundedBox(4, w/2-8, h/2-8, 16, 16, col.r)
-- 		if pnl.Hovered then
-- 			draw.SimpleText(utf8.char(0x274C), 'shz-icon', w / 2, h / 2-1, Color(0,0,0, 120), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
-- 		end
--     end
-- end

-- function SKIN:PaintWindowMaximizeButton(pnl, w, h) end
-- function SKIN:PaintWindowMinimizeButton(pnl, w, h) end

-- function SKIN:PaintExpandButton( pnl, w, h )

-- 	if pnl:GetExpanded() then
-- 		draw.SimpleText(utf8.char(0xf111), 'shz-icon', w/2, h/2, color_black, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
-- 		draw.SimpleText(utf8.char(0xf056), 'shz-icon', w/2, h/2, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
-- 	else
-- 		draw.SimpleText(utf8.char(0xf111), 'shz-icon', w/2, h/2, col.bg, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
-- 		draw.SimpleText(utf8.char(0xf055), 'shz-icon', w/2, h/2, Color(255,255,255, 80), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
-- 	end

-- end

-- function SKIN:PaintComboDownArrow( pnl, w, h )

-- 	draw.SimpleText(utf8.char(0xf078), 'shz-icon', w/2, h/2, Color(0,0,0, 120), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

-- end

-- function SKIN:PaintComboBox( pnl, w, h )

-- 	if pnl:GetDisabled() then
-- 		draw.RoundedBox(4, 0, 0, w, h, Color(255,255,255, 100))
-- 	elseif pnl:HasFocus() then
-- 		draw.RoundedBox(4, 0, 0, w, h, col.y)
-- 	elseif pnl.Depressed or pnl:IsMenuOpen() then
-- 		draw.RoundedBox(4, 0, 0, w, h, col.y)
-- 	else
-- 		draw.RoundedBox(4, 0, 0, w, h, color_white)
-- 	end

-- 	if not pnl.m_TextColorSet then
-- 		pnl:SetTextColor(Color(30,30,30))
-- 		pnl.m_TextColorSet = true
-- 	end

-- end



-- local skin = derma.GetNamedSkin('shizlib')
-- if skin then
--     for k, v in pairs(SKIN) do skin[k] = v end
-- else
--     derma.DefineSkin('shizlib', 'shizoid skin', SKIN)
-- end

-- hook.Add('ForceDermaSkin', 'shiz-skin',function()
--     return 'shizlib'
-- end)