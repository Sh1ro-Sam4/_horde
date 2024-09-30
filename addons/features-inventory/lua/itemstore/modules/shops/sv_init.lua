if not file.IsDir( "itemstore/shops", "DATA" ) then
	file.CreateDir( "itemstore/shops" )
end

function itemstore.shops.Save()
	local shops = {}

	for _, ent in ipairs( ents.FindByClass( "itemstore_npc_shop" ) ) do
		local data = {}

		data.Position = ent:GetPos()
		data.Angles = ent:GetAngles()
		data.Model = ent:GetModel()
		data.Title = ent:GetTitle()

		data.Width = ent.Container:GetWidth()
		data.Height = ent.Container:GetHeight()
		data.Pages = ent.Container:GetPages()

		data.Teams = ent.Teams

		data.Items = {}
		for k, v in pairs( ent.Container:GetItems() ) do
			data.Items[ k ] = { Class = v.Class, Data = v.Data }
		end

		table.insert( shops, data )
	end

	file.Write( "itemstore/shops/" .. game.GetMap() .. ".txt", util.TableToJSON( shops ) )
end

function itemstore.shops.Load()
	local shops = util.JSONToTable( file.Read( "itemstore/shops/" .. game.GetMap() .. ".txt" ) or "" )
	if not shops then return end

	for _, data in ipairs( shops ) do
		local ent = ents.Create( "itemstore_npc_shop" )

		ent:SetPos( data.Position )
		ent:SetAngles( data.Angles )

		ent:Spawn()

		local w = data.Width
		local h = data.Height
		local p = data.Pages

		local con = ent.Container
		con:SetWidth( w )
		con:SetHeight( h )
		con:SetPages( p )

		ent.Teams = data.Teams

		for k, v in pairs( data.Items ) do
			con:SetItem( k, itemstore.Item( v.Class, v.Data ) )
		end

		ent:SetTitle( data.Title )
		ent:SetModel( data.Model )		
	end
end

util.AddNetworkString( "ItemStoreOpenShop" )
util.AddNetworkString( "ItemStoreShopPurchase" )
util.AddNetworkString( "ItemStorePriceShopItem" )
util.AddNetworkString( "ItemStoreEditShopContainer" )
net.Receive( "ItemStoreShopPurchase", function( len, pl )
	local ent = net.ReadEntity()
	local slot = net.ReadUInt( 16 )

	if not IsValid( ent ) or not ent.IsShop then
		return end

	if ent.Teams and not table.HasValue( ent.Teams, team.GetName( pl:Team() ) ) then
		pl:ChatPrint( "This shop is limited to certain teams only, sorry!" ) return end

	local con = ent.Container
	if not con then return end

	local item = con:GetItem( slot )
	if not item then return end

	local price = item:GetData( "ShopPrice" )
	if not price then return end

	if itemstore.gamemodes.GetMoney( pl ) < price then
		pl:ChatPrint( "You can't afford this item." ) return end

	if not pl.Inventory:CanFit( item ) then
		pl:ChatPrint( "You have no room in your inventory for this item." ) return end

	if ent:GetClass() == "itemstore_npc_shop" then
		item = item:Copy()
	else
		con:SetItem( slot, nil )

		if IsValid( ent:Getowning_ent() ) then
			itemstore.gamemodes.SetMoney( ent:Getowning_ent(), itemstore.gamemodes.GetMoney( ent:Getowning_ent() ) + price )
			ent:Getowning_ent():ChatPrint( "Вы заработали " .. string.Comma( price ) .. "$ за продажу товаров." )
		end
	end

	pl.Inventory:AddItem( item )
	itemstore.gamemodes.SetMoney( pl, itemstore.gamemodes.GetMoney( pl ) - price )

	pl:ChatPrint( "Вы купили предмет, он появиться у вас в инвентаре." )
end )

net.Receive( "ItemStorePriceShopItem", function( len, pl )
	local ent = net.ReadEntity()
	local slot = net.ReadUInt( 16 )
	local price = net.ReadUInt( 32 )

	if not IsValid( ent ) or not ent.IsShop then return end

	ent:PriceItem( pl, slot, price )
	itemstore.shops.Save()	
end )

net.Receive( "ItemStoreEditShopContainer", function( len, pl )
	if not pl:IsSuperAdmin() then return end

	local ent = net.ReadEntity()
	if not IsValid( ent ) then return end

	ent.Container:Sync( pl )
	pl:OpenContainer( ent.Container:GetID(), "Shop Container" )
end )

hook.Add( "InitPostEntity", "ItemStoreShopsSpawn", function()
	itemstore.shops.Load()
end )