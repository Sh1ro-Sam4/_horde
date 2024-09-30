local PANEL = {}

AccessorFunc( PANEL, "Entity", "Entity" )

function PANEL:Init()
	self:SetTitle( "Edit Shop" )
	self:SetSkin( "itemstore" )
	self:SetSize( 250, 500 )
	
	self.Panel = vgui.Create( "DPanel", self )
	self.Panel:Dock( FILL )
	self.Panel:DockPadding( 5, 5, 5, 5 )

	self.NameLabel = vgui.Create( "DLabel", self.Panel )
	self.NameLabel:Dock( TOP )
	self.NameLabel:SetText( "Name" )
	self.NameLabel:SetDark( true )

	self.Name = vgui.Create( "DTextEntry", self.Panel )
	self.Name:Dock( TOP )
	self.Name:DockMargin( 0, 0, 0, 2 )
	self.Name:SetText( "NPC Shop" )

	self.WidthLabel = vgui.Create( "DLabel", self.Panel )
	self.WidthLabel:Dock( TOP )
	self.WidthLabel:SetText( "Width" )
	self.WidthLabel:SetDark( true )

	self.Width = vgui.Create( "DNumberWang", self.Panel )
	self.Width:Dock( TOP )
	self.Width:DockMargin( 0, 0, 0, 2 )	
	self.Width:SetMin( 1 )
	self.Width:SetMax( 32 )
	self.Width:SetDecimals( 0 )
	self.Width:SetValue( 4 )

	self.HeightLabel = vgui.Create( "DLabel", self.Panel )
	self.HeightLabel:Dock( TOP )
	self.HeightLabel:SetText( "Height" )
	self.HeightLabel:SetDark( true )

	self.Height = vgui.Create( "DNumberWang", self.Panel )
	self.Height:Dock( TOP )
	self.Height:DockMargin( 0, 0, 0, 2 )	
	self.Height:SetMin( 1 )
	self.Height:SetMax( 32 )
	self.Height:SetDecimals( 0 )
	self.Height:SetValue( 4 )

	self.PagesLabel = vgui.Create( "DLabel", self.Panel )
	self.PagesLabel:Dock( TOP )
	self.PagesLabel:SetText( "Pages" )
	self.PagesLabel:SetDark( true )

	self.Pages = vgui.Create( "DNumberWang", self.Panel )
	self.Pages:Dock( TOP )
	self.Pages:DockMargin( 0, 0, 0, 2 )	
	self.Pages:SetMin( 1 )
	self.Pages:SetMax( 32 )
	self.Pages:SetDecimals( 0 )
	self.Pages:SetValue( 1 )

	self.ModelLabel = vgui.Create( "DLabel", self.Panel )
	self.ModelLabel:Dock( TOP )
	self.ModelLabel:SetText( "Model" )
	self.ModelLabel:SetDark( true )

	self.Model = vgui.Create( "DTextEntry", self.Panel )
	self.Model:Dock( TOP )
	self.Model:DockMargin( 0, 0, 0, 2 )	
	self.Model:SetText( "models/Humans/Group03/Female_01.mdl" )

	self.TeamListLabel = vgui.Create( "DLabel", self.Panel )
	self.TeamListLabel:Dock( TOP )
	self.TeamListLabel:SetText( "Teams (leave empty for none)" )
	self.TeamListLabel:SetDark( true )

	self.TeamList = vgui.Create( "DListView", self.Panel )
	self.TeamList:Dock( FILL )
	self.TeamList:DockMargin( 0, 0, 0, 2 )	
	self.TeamList:AddColumn( "Team" )

	function self.TeamList.OnRowSelected( _, row )
		self.TeamList:RemoveLine( row )
	end

	self.TeamSelector = vgui.Create( "DComboBox", self.Panel )
	self.TeamSelector:Dock( BOTTOM )

	for _, team in pairs( team.GetAllTeams() ) do
		self.TeamSelector:AddChoice( team.Name )
	end

	function self.TeamSelector.OnSelect( _, i, value )
		self.TeamList:AddLine( value )
	end

	self.Accept = vgui.Create( "DButton", self )
	self.Accept:Dock( BOTTOM )
	self.Accept:DockMargin( 0, 5, 0, 0 )
	self.Accept:SetText( "Edit Shop" )
	self.Accept:SetIcon( "icon16/pencil.png" )
	function self.Accept.DoClick()
		net.Start( "ItemStoreEditShop" )
			net.WriteEntity( self:GetEntity() )
			net.WriteString( self:GetName() )
			net.WriteUInt( self:GetWidth(), 8 )
			net.WriteUInt( self:GetHeight(), 8 )
			net.WriteUInt( self:GetPages(), 8 )
			net.WriteString( self:GetModel() )

			net.WriteUInt( #self:GetTeams(), 8 )
			for k, v in ipairs( self:GetTeams() ) do
				net.WriteString( v )
			end
		net.SendToServer()
	end

	self.EditContainer = vgui.Create( "DButton", self )
	self.EditContainer:Dock( BOTTOM )
	self.EditContainer:DockMargin( 0, 5, 0, 0 )
	self.EditContainer:SetText( "Edit Shop Container" )
	self.EditContainer:SetIcon( "icon16/box.png" )
	function self.EditContainer.DoClick()
		net.Start( "ItemStoreEditShopContainer" )
			net.WriteEntity( self:GetEntity() )
		net.SendToServer()
	end

	for k, v in ipairs( self.Panel:GetChildren() ) do
		v:SetZPos( k )
	end
end

function PANEL:GetName()
	return self.Name:GetText()
end

function PANEL:SetName( name )
	self.Name:SetText( name )
end

function PANEL:GetWidth()
	return self.Width:GetValue()
end

function PANEL:SetWidth( w )
	self.Width:SetValue( w )
end

function PANEL:GetHeight()
	return self.Height:GetValue()
end

function PANEL:SetHeight( h )
	self.Height:SetValue( h )
end

function PANEL:GetPages()
	return self.Pages:GetValue()
end

function PANEL:SetPages( p )
	self.Pages:SetValue( p )
end

function PANEL:GetModel()
	return self.Model:GetValue()
end

function PANEL:SetModel( model )
	self.Model:SetText( model )
end

function PANEL:GetTeams()
	local teams = {}

	for k, v in ipairs( self.TeamList:GetLines() ) do
		teams[ k ] = v:GetValue( 1 )
	end

	return teams
end

function PANEL:SetTeams( teams )
	self.TeamList:Clear()

	for k, v in ipairs( teams ) do
		self.TeamList:AddLine( v )
	end
end

vgui.Register( "ItemStoreShopEditor", PANEL, "DFrame" )
