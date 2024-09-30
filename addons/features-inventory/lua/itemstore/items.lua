itemstore.items = {}
itemstore.items.Registered = {}
itemstore.items.Pickups = {}

local Item = {}
Item.Name = "Invalid Item"
--Item.Description = "Invalid Description"
Item.Model = "models/error.mdl"
--Item.Skin = 0
--Item.Color = nil
--Item.Material = nil
Item.HighlightColor = itemstore.config.HighlightColours.Other

Item.Stackable = false
Item.Amount = 1
Item.MaxStack = itemstore.config.MaxStack
Item.DropStack = false

Item.DontNetwork = {}

function Item:GetClass()
	return self.Class
end

function Item:IsValid()
	return true
end

function Item:Run( func_name, ... )
	local func = self[ func_name ]
	
	if type( func ) ~= "function" then return end

	return func( self, ... )
end

function Item:Load()
end

function Item:Initialize()
end

function Item:GetContainer()
	local con = self.Container
	if not con then return end

	local slot = self.Slot
	if not slot then return end

	if con:GetItem( slot ) == self then return self.Container end
end

function Item:GetSlot()
	local con = self.Container
	if not con then return end

	local slot = self.Slot
	if not slot then return end

	if con:GetItem( slot ) == self then return self.Slot end
end

function Item:Copy()
	return itemstore.Item( self:GetClass(), table.Copy( self.Data ) )
end

function Item:RegisterPickup( ent_class )
	itemstore.items.Pickups[ ent_class ] = self:GetClass()
end

function Item:GetData( key, default )
	return self.Data[ key ] == nil and default or self.Data[ key ]
end

function Item:SetData( key, value )
	self.Data[ key ] = value
end

function Item:CreateMutator( key, default )
	self[ "Set" .. key ] = function( self, value )
		self:SetData( key, value )
	end

	self[ "Get" .. key ] = function( self, default )
		return self:GetData( key, default or self[ key ] )
	end
end

Item:CreateMutator( "Name" )
Item:CreateMutator( "Description" )
Item:CreateMutator( "Model" )
Item:CreateMutator( "Material" )
Item:CreateMutator( "Skin" )
Item:CreateMutator( "Color" )
Item:CreateMutator( "MaxStack" )
Item:CreateMutator( "Amount" )

function Item:GetStaticName()
	return self.StaticName or self.Name
end

function Item:Pickup( pl, con, slot, ent )
end

function Item:Drop( pl, con, slot, ent )
end

function Item:Destroy( pl, con, slot )
end

function Item:TakeOne()
	self:SetAmount( self:GetAmount() - 1 )

	if self:GetAmount() <= 0 then
		return true
	end

	return false
end

function Item:CanPickup()
	return true
end

function Item:CanUseWith( item )
	return false
end

function Item:CanMerge( item )
	return self.Stackable and item.Stackable and self:GetClass() == item:GetClass()
		and ( self:GetAmount() + item:GetAmount() ) <= self:GetMaxStack()
end

function Item:Merge( item )
	self:SetAmount( self:GetAmount() + item:GetAmount() )
end

function Item:CanSplit( amount )
	return self.Stackable and self:GetAmount() > amount
end

function Item:Split( amount )
	self:SetAmount( self:GetAmount() - amount )

	local item = self:Copy()
	item:SetAmount( amount )

	return item
end

function Item:FormatAmount()
	return "x" .. self:GetAmount()
end

function Item:CreateEntity( pos )
	local ent = ents.Create( "itemstore_item" )
	ent:SetPos( pos )
	self:LoadData( ent )
	ent:Spawn()

	return ent
end

function Item:SaveData( ent )
end

function Item:LoadData( ent )
	ent:SetItem( self )
end

function Item:WriteNetworkData()
	local data = {}
	
	for k, v in pairs( self.Data ) do
		if not self.DontNetwork[ k ] then data[ k ] = v end
	end

	net.WriteUInt( table.Count( data ), 8 )
	
	for k, v in pairs( data ) do
		net.WriteString( k )
		net.WriteType( v )
	end
end

function Item:ReadNetworkData()
	for i = 1, net.ReadUInt( 8 ) do
		self:SetData( net.ReadString(), net.ReadType() )
	end
end

function Item:PreRender( ent )
end

function Item:PostRender( ent )
end

function itemstore.Item( class_name, data )
	local class = itemstore.items.Registered[ class_name ]

	if class then
		local item = {
			Class = class_name,
			Data = data or {}
		}

		setmetatable( item, { __index = class } )

		item:Initialize()

		return item
	end
end

function itemstore.items.Get( class )
	return itemstore.items.Registered[ class ]
end

function itemstore.items.Exists( class )
	return itemstore.items.Registered[ class ] ~= nil
end

function itemstore.items.Register( tab )
	if SERVER then util.AddNetworkString( tab.Class ) end
	itemstore.items.Registered[ tab.Class ] = tab
end

function itemstore.items.Load()
	for _, filename in ipairs( file.Find( "itemstore/items/*.lua", "LUA" ) ) do
		local name = string.match( filename, "^(.+).lua$" )

		if name then
			ITEM = setmetatable( {}, { __index = Item } )
			ITEM.Class = name

			if SERVER then AddCSLuaFile( "itemstore/items/" .. filename ) end
			include( "itemstore/items/" .. filename )

			itemstore.items.Register( ITEM )

			ITEM = nil
		end
	end

	for k, v in pairs( itemstore.config.CustomItems ) do
		local ITEM = setmetatable( {}, { __index = Item } )

		ITEM.Class = k
		ITEM.Name = v[ 1 ]
		ITEM.Description = v[ 2 ]
		ITEM.Stackable = v[ 3 ]
		ITEM.HighlightColor = v[ 4 ]
		ITEM.Base = "base_auto"

		itemstore.items.Register( ITEM )
	end

	for k, v in pairs( shizlib.Resources ) do
		local ITEM = setmetatable( {}, { __index = Item } )
		ITEM.Class = 'shizlib_resource_' .. string.Replace( string.lower( k ), " ", "" )
		ITEM.Name = v.name and v.name or 'nil'
		ITEM.Description = v.description and v.description or ''
		ITEM.Stackable = true
		ITEM.HighlightColor = v.color and v.color or itemstore.config.HighlightColours.Resources
		ITEM.Base = "base_auto"
		itemstore.items.Register( ITEM )
	end

	for _, item in pairs( itemstore.items.Registered ) do
		if item.Base then
			local base = itemstore.items.Get( item.Base )

			if base then
				setmetatable( item, { __index = base } )
			else
				ErrorNoHalt( "[ItemStore] " .. item.Class .. " tried to derive from non-existent base " .. item.Base )
			end
		end
	end

	for _, item in pairs( itemstore.items.Registered ) do
		item:Load()
	end
end
itemstore.items.Load()
