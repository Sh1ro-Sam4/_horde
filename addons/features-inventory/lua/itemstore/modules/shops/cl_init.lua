function itemstore.shops.OpenShop( ent, con_id )
	local con = itemstore.containers.Get( con_id )

	if not IsValid( ent ) or not con then return end

	local p = vgui.Create( "ItemStoreShop" )
	p:SetEntity( ent )
	p:SetContainerID( con_id )
	p:SetSize( 600, 500 )
	p:Center()
	p:MakePopup()
end

function itemstore.shops.PriceItem( con_id, slot, price )
end

net.Receive( "ItemStoreOpenShop", function()
	itemstore.shops.OpenShop( net.ReadEntity(), net.ReadUInt( 32 ) )
end )

net.Receive( "ItemStorePriceShopItem", function()
	local ent = net.ReadEntity()
	local slot = net.ReadUInt( 32 )

	local title = "Продажа предмета"
	local message = "Укажите сумму для продажи!"
	local default = 100

	Derma_StringRequest( title, message, default, function( price )
		if not IsValid( ent ) then return end

		price = tonumber( price )

		if not price then
			return
		end

		net.Start( "ItemStorePriceShopItem" )
			net.WriteEntity( ent )
			net.WriteUInt( slot, 16)
			net.WriteUInt( price, 32 )
		net.SendToServer()
	end ):SetSkin( "shizlib" )
end )