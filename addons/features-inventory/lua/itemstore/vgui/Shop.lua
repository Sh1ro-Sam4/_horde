local PANEL = {}

AccessorFunc( PANEL, "Entity", "Entity" )

function PANEL:Init()
	self:SetTitle( "Вы хотели, что-то купить?" )
	self:SetSkin( "shizlib" )

	self.Scroll = vgui.Create( "DScrollPanel", self )
	self.Scroll:Dock( FILL )
	
	self.Layout = vgui.Create( "DListLayout", self.Scroll )
	self.Layout:Dock( FILL )

	table.insert( itemstore.containers.Panels, self )
end

function PANEL:SetContainerID( id )
	self.ContainerID = id
	self:Refresh()
end

function PANEL:GetContainerID()
	return self.ContainerID
end

function PANEL:AddItem( item, slot )
	local p = self.Layout:Add( "ItemStoreShopItem" )
	
	p:SetTall( 60 )
	p:SetItem( item )
	p:SetSlotID( slot )
	p:SetEntity( self:GetEntity() )
	p:DockMargin( 0, 0, 0, 1 )
	
	return p
end

function PANEL:Refresh()
	local con = itemstore.containers.Get( self:GetContainerID() )
	if not con then return end

	self.Layout:Clear()

	for k, v in pairs( con:GetItems() ) do
 		self:AddItem( v, k )
 	end
end

vgui.Register( "ItemStoreShop", PANEL, "DFrame" )