itemstore.trading = {}

local Trade = {}

function Trade:GetSide( pl )
	if self.Right.Player == pl then
		return self.Right
	elseif self.Left.Player == pl then
		return self.Left
	end
end

function Trade:SetMoneyOffer( pl, offer )
	local side = self:GetSide( pl )

	if side then
		side.Money = math.Clamp( offer, 0, itemstore.gamemodes.GetMoney( pl ) )
		if SERVER then self:Sync() end
	end
end

function Trade:GetMoneyOffer( pl )
	local side = self:GetSide( pl )

	if side then
		return side.Money
	end
end

function Trade:SetReady( pl, ready )
	local side = self:GetSide( pl )

	if side then
		side.Ready = ready
		if SERVER then self:Sync() end
	end
end

function Trade:GetReady( pl )
	local side = self:GetSide( pl )

	if side then
		return side.Ready
	end
end

function Trade:IsReady()
	return self.Left.Ready and self.Right.Ready
end


if SERVER then
	util.AddNetworkString( "ItemStoreTrade" )
	function Trade:Sync()
		net.Start( "ItemStoreTrade" )
			net.WriteEntity( self.Left.Player )
			net.WriteUInt( self.Left.Money, 32 )
			net.WriteUInt( self.Left.Container:GetID(), 32 )
			net.WriteBit( self.Left.Ready )

			net.WriteEntity( self.Right.Player )
			net.WriteUInt( self.Right.Money, 32 )
			net.WriteUInt( self.Right.Container:GetID(), 32 )
			net.WriteBit( self.Right.Ready )
		net.Send( { self.Left.Player, self.Right.Player } )
	end

	util.AddNetworkString( "ItemStoreCloseTrade" )
	function Trade:Close()
		if IsValid( self.Left.Player ) then
			for k, v in pairs( self.Left.Container:GetItems() ) do
				self.Left.Player.Inventory:AddItem( v )
			end			
		end

		itemstore.containers.Remove( self.Left.Container:GetID() )

		if IsValid( self.Right.Player ) then
			for k, v in pairs( self.Right.Container:GetItems() ) do
				self.Right.Player.Inventory:AddItem( v )
			end
		end

		itemstore.containers.Remove( self.Right.Container:GetID() )

		self.Left.Player.Trade = nil
		self.Right.Player.Trade = nil

		net.Start( "ItemStoreCloseTrade" )
		net.Send( { self.Left.Player, self.Right.Player } )
	end

	function Trade:Accept()
		if not self:IsReady() then return end

		if IsValid( self.Left.Player ) and IsValid( self.Right.Player ) then
			local leftmoney = itemstore.gamemodes.GetMoney( self.Left.Player )
			local rightmoney = itemstore.gamemodes.GetMoney( self.Right.Player )

			if leftmoney >= self.Left.Money and rightmoney >= self.Right.Money then
				for k, v in pairs( self.Left.Container:GetItems() ) do
					self.Left.Container:SetItem( k, nil )
					self.Right.Player.Inventory:AddItem( v )
				end

				for k, v in pairs( self.Right.Container:GetItems() ) do
					self.Right.Container:SetItem( k, nil )
					self.Left.Player.Inventory:AddItem( v )
				end

				itemstore.gamemodes.GiveMoney( self.Left.Player, -self.Left.Money )
				itemstore.gamemodes.GiveMoney( self.Left.Player, self.Right.Money )

				itemstore.gamemodes.GiveMoney( self.Right.Player, self.Left.Money )
				itemstore.gamemodes.GiveMoney( self.Right.Player, -self.Right.Money )
			else
				self.Left.Player:ChatPrint( itemstore.Translate( "trade_failed" ) )
				self.Right.Player:ChatPrint( itemstore.Translate( "trade_failed" ) )
			end
		end

		self:Close()
	end

	util.AddNetworkString( "ItemStoreTradeMessage" )
	function Trade:Message( pl, message )
		net.Start( "ItemStoreTradeMessage" )
			net.WriteEntity( pl )
			net.WriteString( message )
		net.Send( { self.Left.Player, self.Right.Player } )
	end
else
	function Trade:SendMessage( message )
		net.Start( "ItemStoreTradeMessage" )
			net.WriteString( message )
		net.SendToServer()
	end
end

function itemstore.Trade( left, right, con_left, con_right )
	local trade = {
		Left = {
			Player = left,
			Money = 0,
			Container = con_left or itemstore.Container( 4, 3, 1 ),
			Ready = false
		},

		Right = {
			Player = right,
			Money = 0,
			Container = con_right or itemstore.Container( 4, 3, 1 ),
			Ready = false
		}
	}

	setmetatable( trade, { __index = Trade } )

	left.Trade = trade
	right.Trade = trade

	if SERVER then
		trade.Left.Container:SetPermissions( left, true, true )
		trade.Left.Container:SetPermissions( right, true, false )

		trade.Left.Container:AddCallback( "set", function( slot, item )
			trade:SetReady( trade.Left.Player, false )
			trade:SetReady( trade.Right.Player, false )
		end )

		trade.Left.Container:Sync()

		trade.Right.Container:SetPermissions( left, true, false )
		trade.Right.Container:SetPermissions( right, true, true )

		trade.Right.Container:AddCallback( "set", function( slot, item )
			trade:SetReady( trade.Left.Player, false )
			trade:SetReady( trade.Right.Player, false )
		end )

		trade.Right.Container:Sync()		

		trade:Sync()
	end

	return trade
end

if SERVER then
	--[[
	util.AddNetworkString( "ItemStoreStartTrade" )
	net.Receive( "ItemStoreStartTrade", function( len, pl )
		local partner = net.ReadEntity()

		if not  IsValid( partner ) or not partner:IsPlayer() then
			itemstore.Trade( pl, partner )
		end
	end )
	]]

	util.AddNetworkString( "ItemStoreReadyTrade" )
	net.Receive( "ItemStoreReadyTrade", function( len, pl )
		if pl.Trade then
			pl.Trade:SetReady( pl, net.ReadBit() == 1 )
		end
	end )

	util.AddNetworkString( "ItemStoreAcceptTrade" )
	net.Receive( "ItemStoreAcceptTrade", function( len, pl )
		if pl.Trade then
			pl.Trade:Accept()
		end
	end )

	util.AddNetworkString( "ItemStoreCloseTrade" )
	net.Receive( "ItemStoreCloseTrade", function( len, pl )
		if pl.Trade then
			pl.Trade:Close()
		end
	end )

	util.AddNetworkString( "ItemStoreTradeMoney" )
	net.Receive( "ItemStoreTradeMoney", function( len, pl )
		if pl.Trade then
			pl.Trade:SetMoneyOffer( pl, net.ReadUInt( 32 ) )
		end
	end )

	util.AddNetworkString( "ItemStoreTradeMessage" )
	net.Receive( "ItemStoreTradeMessage", function( len, pl )
		if pl.Trade then
			pl.Trade:Message( pl, net.ReadString() )
		end
	end )
else
	itemstore.trading.Panel = nil

	net.Receive( "ItemStoreTrade", function()
		left_pl = net.ReadEntity()
		left_money = net.ReadUInt( 32 )
		left_con = itemstore.containers.Get( net.ReadUInt( 32 ) )
		left_ready = net.ReadBit() == 1

		right_pl = net.ReadEntity()
		right_money = net.ReadUInt( 32 )
		right_con = itemstore.containers.Get( net.ReadUInt( 32 ) )
		right_ready = net.ReadBit() == 1

		local trade = itemstore.Trade( left_pl, right_pl, left_con, right_con )

		trade.Left.Money = left_money
		trade.Left.Ready = left_ready

		trade.Right.Money = right_money
		trade.Right.Ready = right_ready

		LocalPlayer().Trade = trade

		if not IsValid( itemstore.trading.Panel ) then
			if trade.Left.Player == LocalPlayer() then
				itemstore.trading.Panel = vgui.Create( "ItemStoreTrade" )
				itemstore.trading.Panel:Center()
				itemstore.trading.Panel:MakePopup()
			else
				itemstore.trading.Panel = vgui.Create( "ItemStoreTradeRequest" )
				itemstore.trading.Panel:SetSize( 200, 100 )
				itemstore.trading.Panel:SetPos( ScrW() - itemstore.trading.Panel:GetWide(), 0 )
			end
		end

		itemstore.trading.Panel:Refresh()
	end )

	net.Receive( "ItemStoreCloseTrade", function()
		LocalPlayer().Trade = nil

		if IsValid( itemstore.trading.Panel ) then
			itemstore.trading.Panel:Close()
		end
	end )

	net.Receive( "ItemStoreTradeMessage", function()
		if IsValid( itemstore.trading.Panel ) then
			itemstore.trading.Panel:ChatMessage( net.ReadEntity(), net.ReadString() )
		end
	end )
end
