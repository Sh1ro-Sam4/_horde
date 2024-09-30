local PANEL = {}

function PANEL:Init()
	self:SetSkin( "itemstore" )
	self:SetTitle( itemstore.Translate( "trade_request" ) )

	self:ShowCloseButton( false )

	self.Label = vgui.Create( "DLabel", self )

	self.Accept = vgui.Create( "DButton", self )
	self.Accept:SetText( itemstore.Translate( "accept" ) )

	function self.Accept.DoClick()
		itemstore.trading.Panel = vgui.Create( "ItemStoreTrade" )
		itemstore.trading.Panel:Refresh()
		itemstore.trading.Panel:Center()
		itemstore.trading.Panel:MakePopup()

		self:Remove()
	end

	self.Deny = vgui.Create( "DButton", self )
	self.Deny:SetText( itemstore.Translate( "deny" ) )
	
	function self.Deny.DoClick()
		net.Start( "ItemStoreCloseTrade" ) net.SendToServer()
		self:Remove()
	end
end

function PANEL:Refresh()
	self.Label:SetText( itemstore.Translate( "wants_to_trade",
		LocalPlayer().Trade.Left.Player:Name() ) )
end

function PANEL:PerformLayout()
	self.BaseClass.PerformLayout( self )

	self.Label:SizeToContents()
	self.Label:SetPos( self:GetWide() / 2 - self.Label:GetWide() / 2, 30 )

	self.Accept:SetSize( 75, 30 )
	self.Accept:SetPos( self:GetWide() / 2 - self.Accept:GetWide() - 15, self:GetTall() / 2 + 10 )

	self.Deny:SetSize( 75, 30 )
	self.Deny:SetPos( self:GetWide() / 2 + 15, self:GetTall() / 2 + 10 )
end

vgui.Register( "ItemStoreTradeRequest", PANEL, "DFrame" )
