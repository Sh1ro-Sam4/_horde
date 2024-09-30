local PANEL = {}

AccessorFunc( PANEL, "Item", "Item" )
AccessorFunc( PANEL, "Entity", "Entity" )
AccessorFunc( PANEL, "SlotID", "SlotID" )

function PANEL:Init()
	self.Slot = vgui.Create( "ItemStoreSlot", self )
	
	self.Name = vgui.Create( "DLabel", self )
	self.Name:SetFont( "DermaDefaultBold" )
	self.Name:SetColor( Color( 255, 255, 255 ) )
	
	self.Description = vgui.Create( "DLabel", self )
	
	self.Purchase = vgui.Create( "DButton", self )

	function self.Purchase.DoClick( b )
		net.Start( "ItemStoreShopPurchase" )
			net.WriteEntity( self:GetEntity() )
			net.WriteUInt( self:GetSlotID(), 16 )
		net.SendToServer()
	end
end

function PANEL:PerformLayout()
	local size = self:GetTall() - 10
	self.Slot:SetSize( size, size )
	self.Slot:SetPos( 5, 5 )
	
	self.Name:SetPos( 5 + size + 10, 5 )

	self.Description:SetPos( 5 + size + 10, 20 )

	self.Purchase:SetPos( self:GetWide() - self.Purchase:GetWide() - 5, self:GetTall() - self.Purchase:GetTall() - 5 )
	self.Purchase:SetSize( 125, 25 )
	
	local item = self:GetItem()
	if not item then return end

	self.Slot:SetItem( item )
	self.Slot:Refresh()
	
	self.Name:SetText( item:GetName() )

	if item:GetAmount() > 1 then
		self.Name:SetText( self.Name:GetText() .. " x" .. item:GetAmount() )
	end

	if item:GetData( "ShopPrice" ) then
		self.Purchase:SetText( "Купить ($" .. item:GetData( "ShopPrice" ) .. ")" )
		self.Purchase:SetDisabled( false )
	else
		self.Purchase:SetText( "Покупка" )
		self.Purchase:SetDisabled( true )
	end

	self.Name:SizeToContents()
	
	self.Description:SetText( item:GetDescription() )
	self.Description:SizeToContents()
end

function PANEL:Paint()
	surface.SetDrawColor( Color( 0, 0, 0, 150 ) )
	surface.DrawRect( 0, 0, self:GetWide(), self:GetTall() )
end

vgui.Register( "ItemStoreShopItem", PANEL )