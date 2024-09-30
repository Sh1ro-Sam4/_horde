local SKIN = {}

local col = CFG.theme
SKIN.GradientUp = Material( "gui/gradient_up" )
SKIN.GradientDown = Material( "gui/gradient_down" )
SKIN.Blur = Material( "pp/blurscreen" )

function SKIN:PaintFrame( panel, w, h )
	-- self.Blur:SetFloat( "$blur", 8 )
	-- self.Blur:Recompute()
	-- render.UpdateScreenEffectTexture()

	-- local x, y = panel:LocalToScreen( 0, 0 )

	-- surface.SetDrawColor( 255, 255, 255 )
	-- surface.SetMaterial( self.Blur )
	-- surface.DrawTexturedRect( x * -1, y * -1, ScrW(), ScrH() )

	-- surface.SetDrawColor( Color( 30, 30, 30, 200 ) )
	-- surface.DrawRect( 0, 22, w, h - 22 )

	-- surface.SetDrawColor( Color( 44, 62, 80 ) )
	-- surface.DrawRect( 0, 0, w, 22 )
	draw.RoundedBox(8, 0, 0, w, h, ColorAlpha(col.bg, 200))
    draw.RoundedBoxEx(8, 0, 0, w, 22, col.hvr, true, true, false, false)
end

function SKIN:PaintButton( panel, w, h )
	surface.SetDrawColor( Color( 200, 200, 200 ) )
	surface.DrawRect( 0, 0, w, h )

	if not panel.Disabled then
		surface.SetMaterial( panel.Depressed and self.GradientUp or self.GradientDown )
		surface.SetDrawColor( panel.Hovered and Color( 240, 240, 240 ) or Color( 230, 230, 230 ) )
		surface.DrawTexturedRect( 0, 0, w, h )
	end

	surface.SetDrawColor( Color( 0, 0, 0, 150 ) )
	surface.DrawOutlinedRect( 0, 0, w, h )
end

function SKIN:PaintTab( panel, w, h )
	if panel:IsActive() then
		draw.RoundedBoxEx( 2, 2, 0, w - 5, h - 8, Color( 0, 0, 0, 200 ),
			true, true, false, false )
	else
		draw.RoundedBoxEx( 2, 2, 0, w - 5, h, Color( 0, 0, 0, 150 ),
			true, true, false, false )
	end
end

function SKIN:PaintPropertySheet( panel, w, h )
	surface.SetDrawColor( Color( 0, 0, 0, 200 ) )
	surface.DrawRect( 0, 20, w, h )
end

function SKIN:PaintCategoryList( panel, w, h )
end

function SKIN:PaintCollapsibleCategory( panel, w, h )
	surface.SetDrawColor( Color( 0, 0, 0, 150 ) )
	surface.DrawRect( 0, 0, w, 20 )

	surface.SetDrawColor( Color( 0, 0, 0, 150 ) )
	surface.DrawRect( 0, 0, w, h )
end

function SKIN:PaintWindowCloseButton( a, w, h )
	if not a.hvrStatus then a.hvrStatus = 0 end
	if a:IsHovered() then
		a.hvrStatus = (a.hvrStatus + .05) > 1 and 1 or a.hvrStatus + .05
	else
		a.hvrStatus = (a.hvrStatus + .05) < 0 and 0 or a.hvrStatus - .05
	end
	draw.RoundedBox(4, 0, 3, w, 18, col.focus)
	draw.RoundedBox(4, 0, 3, w * a.hvrStatus, 18, col.accent)
	draw.SimpleText(utf8.char(0x274C), 'shz-frame-close', w/2, h/2, Color(255*a.hvrStatus,255*a.hvrStatus,255*a.hvrStatus), 1, 1)
	-- local col = Color( 0, 0, 0, 50 )

	-- if not panel:GetDisabled() and panel.Hovered then
	-- 	if panel:IsDown() then
	-- 		col = Color( 192, 57, 43 )
	-- 	else
	-- 		col = Color( 231, 76, 60 )
	-- 	end
	-- end

	-- draw.RoundedBoxEx( 4, 0, 2, w, 18, col, true, true, true, true )
	-- draw.SimpleText( "r", "Marlett", w / 2, 11, color_white,
	-- 	TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
end

function SKIN:PaintWindowMaximizeButton( panel, w, h )
	if panel:GetDisabled() then return end

	local col = Color( 0, 0, 0, 50 )

	if panel.Hovered then
		if panel:IsDown() then
			col = Color( 41, 128, 185 )
		else
			col = Color( 52, 152, 219 )
		end
	end

	draw.RoundedBoxEx( 4, 0, 2, w, 18, col, false, false, false, false )
	draw.SimpleText( "1", "Marlett", w / 2, 11, color_white,
		TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
end

function SKIN:PaintWindowMinimizeButton( panel, w, h )
	if true then return end

	local col = Color( 0, 0, 0, 50 )

	if panel.Hovered then
		if panel:IsDown() then
			col = Color( 41, 128, 185 )
		else
			col = Color( 52, 152, 219 )
		end
	end

	draw.RoundedBoxEx( 4, 0, 2, w, 18, col, true, false, true, false )
	draw.SimpleText( "0", "Marlett", w / 2, 11, color_white,
		TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
end

derma.DefineSkin( "itemstore", "Flat skin for ItemStore", SKIN )
