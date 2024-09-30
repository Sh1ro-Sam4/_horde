local PANEL = {}

function PANEL:Init()
	self:SetSkin( "itemstore" )

	self.LeftContainer = vgui.Create( "ItemStoreContainer", self )
	self.RightContainer = vgui.Create( "ItemStoreContainer", self )

	self.LeftMoneyIcon = vgui.Create( "DImage", self )
	self.LeftMoneyIcon:SetImage( "icon16/money.png" )

	self.RightMoneyIcon = vgui.Create( "DImage", self )
	self.RightMoneyIcon:SetImage( "icon16/money.png" )

	self.LeftMoney = vgui.Create( "DTextEntry", self )
	self.LeftMoney.OnLoseFocus = function( money )
		net.Start( "ItemStoreTradeMoney" )
			net.WriteUInt( tonumber( money:GetText() ) or 0, 32 )
		net.SendToServer()
	end

	self.RightMoney = vgui.Create( "DLabel", self )
	self.RightMoney:SetText( "0" )

	self.LeftReady = vgui.Create( "DCheckBoxLabel", self )
	self.LeftReady:SetText( itemstore.Translate( "ready" ) )
	self.LeftReady.OnChange = function( ready )
		net.Start( "ItemStoreReadyTrade" )
			net.WriteBit( ready:GetChecked() )
		net.SendToServer()
	end

	self.RightReady = vgui.Create( "DLabel", self )
	self.RightReady:SetText( itemstore.Translate( "not_ready" ) )

	self.Accept = vgui.Create( "DButton", self )
	self.Accept:SetText( itemstore.Translate( "accept" ) )
	self.Accept:SetFont( "DermaLarge" )
	self.Accept:SetDisabled( true )
	self.Accept.DoClick = function()
		net.Start( "ItemStoreAcceptTrade" ) net.SendToServer()

		surface.PlaySound( "buttons/button9.wav" )
		self:Remove()
	end

	self.Chat = vgui.Create( "RichText", self )
	function self.Chat:Paint()
		draw.RoundedBox( 4, 0, 0, self:GetWide(), self:GetTall(), Color( 230, 230, 230 ) )
	end

	self.ChatEntry = vgui.Create( "DTextEntry", self )
	function self.ChatEntry:OnEnter()
		LocalPlayer().Trade:SendMessage( self:GetText() )

		self:SetText( "" )
		self:RequestFocus()
	end

	self.Inventory = vgui.Create( "ItemStoreContainerWindow" )
	self.Inventory:SetContainerID( LocalPlayer().InventoryID )
	self.Inventory:SetTitle( itemstore.Translate( "inventory" ) )
	self.Inventory:ShowCloseButton( false )
	self.Inventory:InvalidateLayout( true )
end

function PANEL:Think()
	self.BaseClass.Think( self )

	local x, y = self:GetPos()
	self.Inventory:SetPos( x + self:GetWide() / 2 - self.Inventory:GetWide() / 2, y + self:GetTall() + 5 )
end

function PANEL:ChatMessage( pl, message )
	if pl == LocalPlayer() then
		self.Chat:InsertColorChange( 255, 0, 0, 255 )
	else
		self.Chat:InsertColorChange( 0, 0, 255, 255 )
	end

	self.Chat:AppendText( pl:Name() )
	self.Chat:InsertColorChange( 100, 100, 100, 255 )
	self.Chat:AppendText( ": " .. message .. "\n" )
end

function PANEL:Refresh()
	local trade = LocalPlayer().Trade

	if trade then
		local ourside = LocalPlayer() == trade.Left.Player and trade.Left or trade.Right
		local otherside = LocalPlayer() == trade.Right.Player and trade.Left or trade.Right

		self:SetTitle( itemstore.Translate( "trading_with", otherside.Player:Name() ) )

		self.LeftContainer:SetContainerID( ourside.Container:GetID() )
		self.RightContainer:SetContainerID( otherside.Container:GetID() )

		self.LeftMoney:SetText( ourside.Money )
		self.RightMoney:SetText( otherside.Money )

		self.LeftReady:SetChecked( ourside.Ready )
		self.RightReady:SetText( otherside.Ready and itemstore.Translate( "ready" )
			or itemstore.Translate( "not_ready" ) )

		self.Accept:SetDisabled( not ( ourside.Ready and otherside.Ready ) )
	end
end

-- it's me, i'm coding hitler. this is the grave of so many brave
-- functions that went to war and died on my behalf.
function PANEL:PerformLayout()
	self.BaseClass.PerformLayout( self )

	self.LeftContainer:SetPos( 5, 33 )
	self.LeftContainer:SizeToContents()
	local left_w, left_h = self.LeftContainer:GetSize()

	self.RightContainer:SetPos( 5 + left_w + 24, 33 )
	self.RightContainer:SizeToContents()
	local right_w, right_h = self.RightContainer:GetSize()

	self.LeftMoneyIcon:SetPos( 5, 33 + left_h + 5 )
	self.LeftMoneyIcon:SetSize( 16, 16 )

	self.LeftMoney:SetPos( 5 + 16 + 5, 33 + left_h + 5 )
	self.LeftMoney:SetSize( left_w - 5 - 16 - 5, 16 )

	self.RightMoneyIcon:SetPos( 5 + right_w + 24, 33 + right_h + 5 )
	self.RightMoneyIcon:SetSize( 16, 16 )

	self.RightMoney:SetPos( 5 + left_w + 24 + 5 + 16 + 5, 33 + right_h + 5 )
	self.RightMoney:SetSize( right_w - 5 - 16 - 5, 16 )

	self.LeftReady:SetPos( 5, 33 + left_h + 5 + 16 + 5 )
	self.LeftReady:SizeToContents()

	self.RightReady:SetPos( 5 + left_w + 24, 33 + right_h + 5 + 16 + 5 )

	self.RightReady:SizeToContents()

	self.Accept:SetPos( 5, 33 + left_h + 5 + ( 16 + 5 ) * 2 )
	self.Accept:SetSize( 390, 37 )

	self.Chat:SetPos( 400, 27 )
	self.Chat:SetSize( 195, 220 )

	self.ChatEntry:SetPos( 400, 250 )
	self.ChatEntry:SetSize( 195, 25 )

	self:SetSize( 600, 280 )
end

function PANEL:OnRemove()
	net.Start( "ItemStoreCloseTrade" ) net.SendToServer()
	self.Inventory:Close()
end

vgui.Register( "ItemStoreTrade", PANEL, "DFrame" )
