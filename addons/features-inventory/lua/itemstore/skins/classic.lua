local SKIN = {}

SKIN.GradientUp = Material( "gui/gradient_up" )
SKIN.GradientDown = Material( "gui/gradient_down" )
SKIN.Blur = Material( "pp/blurscreen" )

function SKIN:PaintFrame( panel, w, h )
	self.Blur:SetFloat( "$blur", 2 )
	self.Blur:Recompute()
	render.UpdateScreenEffectTexture()

	local x, y = panel:LocalToScreen( 0, 0 )

	surface.SetDrawColor( 255, 255, 255 )
	surface.SetMaterial( self.Blur )
	surface.DrawTexturedRect( x * -1, y * -1, ScrW(), ScrH() )

	surface.SetDrawColor( itemstore.config.Colours.Lower )
	surface.DrawRect( 0, 0, w, h )

	surface.SetMaterial( self.GradientDown )
	surface.SetDrawColor( itemstore.config.Colours.Upper )
	surface.DrawTexturedRect( 0, 0, w, h )

	surface.SetDrawColor( itemstore.config.Colours.OuterBorder )
	surface.DrawOutlinedRect( 0, 0, w, h )

	surface.SetDrawColor( itemstore.config.Colours.InnerBorder )
	surface.DrawOutlinedRect( 1, 1, w - 2, h - 2 )

	surface.SetDrawColor( itemstore.config.Colours.TitleBackground )
	surface.DrawRect( 2, 2, w - 4 , 22 )
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
		surface.SetMaterial( self.GradientDown )
		surface.SetDrawColor( itemstore.config.Colours.Lower )
		surface.DrawTexturedRect( 2, 0, w - 5, h )
	else
		surface.SetMaterial( self.GradientUp )
		surface.SetDrawColor( itemstore.config.Colours.Upper )
		surface.DrawTexturedRect( 2, 0, w - 5, h )
	end
end

function SKIN:PaintPropertySheet( panel, w, h )
	surface.SetDrawColor( itemstore.config.Colours.Lower )
	surface.DrawRect( 0, 20, w, h )

	surface.SetMaterial( self.GradientDown )
	surface.SetDrawColor( itemstore.config.Colours.Upper )
	surface.DrawTexturedRect( 0, 20, w, h - 20 )

	surface.SetDrawColor( itemstore.config.Colours.OuterBorder )
	surface.DrawOutlinedRect( 0, 20, w, h - 20 )

	surface.SetDrawColor( itemstore.config.Colours.InnerBorder )
	surface.DrawOutlinedRect( 1, 21, w - 2, h - 22 )
end

derma.DefineSkin( "itemstore", "Skin for ItemStore", SKIN )
