itemstore.containers = {}
itemstore.containers.Active = {}

local Container = {}

AccessorFunc( Container, "Owner", "Owner" )
AccessorFunc( Container, "Suppressed", "Suppressed", FORCE_BOOL )
AccessorFunc( Container, "Width", "Width", FORCE_NUMBER )
AccessorFunc( Container, "Height", "Height", FORCE_NUMBER )
AccessorFunc( Container, "Pages", "Pages", FORCE_NUMBER )

function Container:GetID()
	return self.ID
end

function Container:IsValid()
	return self:GetID() and itemstore.containers.Active[ self:GetID() ] == self
end

function Container:Remove()
	itemstore.containers.Remove( self:GetID() )
end

function Container:GetPageSize()
	return self:GetWidth() * self:GetHeight()
end

function Container:GetPageFromSlot( slot )
	return math.ceil( slot / self:GetPageSize() )
end

function Container:GetSize()
	return self:GetPageSize() * self:GetPages()
end

function Container:CoordsToSlot( x, y, p )
	return ( ( p - 1 ) * self:GetPageSize() ) + ( ( y - 1 ) * self:GetWidth() + x )
end

function Container:GetItems()
	return self.Items
end

function Container:GetItem( slot )
	return self.Items[ slot ]
end

function Container:SetItem( slot, item )
	if item and not item:IsValid() then return end

	slot = math.floor( slot )

	if slot >= 1 and slot <= self:GetSize() then
		if self:RunCallbacks( "set", slot, item ) == false then return end

		self.Items[ slot ] = item

		if item then
			item.Container = self
			item.Slot = slot
		end

		if SERVER then self:QueueSync() end
	end
end

function Container:FirstEmptySlot()
	for i = 1, self:GetSize() do
		if not self:GetItem( i ) then
			return i
		end
	end

	return false
end

function Container:CanFit( item )
	for i = 1, self:GetSize() do
		local merge_item = self:GetItem( i )

		if merge_item and merge_item:CanMerge( item ) then
			return true
		end
	end

	return self:FirstEmptySlot() ~= false
end

function Container:AddItem( item, dontmerge )
	if not dontmerge then
		for i = 1, self:GetSize() do
			local merge_item = self:GetItem( i )

			if merge_item and merge_item:CanMerge( item ) then
				merge_item:Merge( item )
				self:QueueSync()

				return i, merge_item
			end
		end
	end

	local slot = self:FirstEmptySlot()

	if slot then
		self:SetItem( slot, item )
		return slot
	end

	return false
end

function Container:HasItem( item_class )
	for k, v in pairs( self:GetItems() ) do
		if v:GetClass() == item_class then
			return k
		end
	end

	return false
end

function Container:CountItems( item_class )
	local amount = 0

	for _, item in pairs( self:GetItems() ) do
		if item:GetClass() == item_class then
			amount = amount + item:GetAmount()
		end
	end

	return amount
end

-- 76561198068291318

function Container:TakeItems( item_class, amount )
	local amount_taken = 0

	self:Suppress( function()
		for k, v in pairs( self:GetItems() ) do
			if v:GetClass() == item_class then
				local amount_to_take = v:GetAmount()
				amount_to_take = math.Clamp( amount_to_take, 0, amount )

				v:SetAmount( v:GetAmount() - amount_to_take )

				if v:GetAmount() <= 0 then
					self:SetItem( k, nil )
				end

				amount_taken = amount_taken + amount_to_take
				amount = amount - amount_to_take
			end
		end

		return true
	end )

	return amount_taken
end

function Container:GetDefaultPermissions()
	return self.DefaultPermissions
end

function Container:GetPermissions( pl )
	return self.Permissions[ pl ] or self:GetDefaultPermissions()
end

function Container:SetDefaultPermissions( read, write )
	self.DefaultPermissions = { Read = read, Write = write }
end

function Container:SetPermissions( pl, read, write )
	self.Permissions[ pl ] = { Read = read, Write = write }
end

function Container:CanRead( pl, ... )
	local res = hook.Call( "ItemStoreCanRead", nil, self, pl, ... )
	if res ~= nil then
		return res
	end

	if self.Permissions[ pl ] then
		return self.Permissions[ pl ].Read
	end

	local res = self:RunCallbacks( "read", pl, ... )
	if res ~= nil then
		return res
	end

	return self.DefaultPermissions.Read
end

function Container:CanWrite( pl, action, ... )
	local res = hook.Call( "ItemStoreCanWrite", nil, self, pl, action, ... )
	if res ~= nil then
		return res
	end

	if self.Permissions[ pl ] then
		return self.Permissions[ pl ].Write
	end

	local res = self:RunCallbacks( "write", pl, action, ... )
	if res ~= nil then
		return res
	end

	return self.DefaultPermissions.Write
end

function Container:AddCallback( name, func )
	if not self.Callbacks[ name ] then
		self.Callbacks[ name ] = {}
	end

	return table.insert( self.Callbacks[ name ], func )
end

function Container:RemoveCallback( name, id )
	if self.Callbacks[ name ] then
		self.Callbacks[ name ][ id ] = nil
	end
end

function Container:RunCallbacks( name, ... )
	if self.Callbacks[ name ] then
		for _, func in pairs( self.Callbacks[ name ] ) do
			local res = func( self, ... )

			if res ~= nil then
				return res
			end
		end
	end
end

function Container:GetSyncTargets()
	players = {}

	for _, pl in ipairs( player.GetAll() ) do
		if self:CanRead( pl ) then
			table.insert( players, pl )
		end
	end

	return players
end

function Container:Suppress( func )
	self:SetSuppressed( true )
		local sync = func()
	self:SetSuppressed( false )

	if sync then self:QueueSync() end
end

function Container:QueueSync()
	self.ShouldSync = true
end

function Container:Sync( pl )
	if SERVER then itemstore.containers.Sync( self:GetID(), pl ) end
end

function itemstore.Container( w, h, pages, dontnetwork )
	local con = {
		ShouldSync = false,

		Width = w or 4,
		Height = h or 4,
		Pages = pages or 1,

		Owner = nil,
		Callbacks = {},
		Permissions = {},
		DefaultPermissions = { Read = false, Write = false },

		Items = {}
	}

	setmetatable( con, { __index = Container } )

	if not dontnetwork then
		con.ID = table.insert( itemstore.containers.Active, con )
		con:Sync()
	end

	return con
end

function itemstore.containers.Get( id )
	return itemstore.containers.Active[ id ]
end

function itemstore.containers.Remove( id )
	itemstore.containers.Active[ id ] = nil
end

if SERVER then
	AddCSLuaFile()

	util.AddNetworkString( "ItemStoreSync" )
	function itemstore.containers.Sync( id, pl )
		local con = itemstore.containers.Active[ id ]

		if not con then return end
		if con:GetSuppressed() then return end

		-- No longer using WriteTable! Net usage has been cut to less than half
		-- This is still pretty damn unoptimized though
		-- Ideally we send only the item that's changing...
		-- But unfortunately it's a bit more complicated than that due to
		-- an item's ability to modify other slots in a container
		net.Start( "ItemStoreSync" )
			net.WriteUInt( con:GetID(), 32 )

			net.WriteUInt( con:GetWidth(), 8 )
			net.WriteUInt( con:GetHeight(), 8 )
			net.WriteUInt( con:GetPages(), 8 )

			net.WriteUInt( table.Count( con.Items ), 8 )

			for k, v in pairs( con.Items ) do
				net.WriteUInt( k, 8 )

				local id = util.NetworkStringToID( v.Class )

				if id == 0 then
					if v.Class then
						error( string.format( "[ItemStore] Tried to send data for unnetworked item %s", v.Class ) )
					else
						error( "[ItemStore] Tried to send data for a classless item" )
					end
				end

				net.WriteUInt( id, 16 )
				v:WriteNetworkData()
			end
		net.Send( pl or con:GetSyncTargets() )
	end

	hook.Add( "Tick", "ItemStoreSyncContainers", function()
		for k, v in pairs( itemstore.containers.Active ) do
			if v.ShouldSync then
				v.ShouldSync = false
				v:Sync()
			end
		end
	end )
else
	itemstore.containers.Panels = {}

	function itemstore.containers.UpdatePanels( id )
		for k, v in pairs( itemstore.containers.Panels ) do
			if IsValid( v ) then
				if v:GetContainerID() == id then
					v:Refresh()
				end
			else
				itemstore.containers.Panels[ k ] = nil
			end
		end
	end

	net.Receive( "ItemStoreSync", function()
		local id = net.ReadUInt( 32 )
		local w, h = net.ReadUInt( 8 ), net.ReadUInt( 8 )
		local pages = net.ReadUInt( 8 )

		local con = itemstore.Container( w, h, pages, true )

		for i = 1, net.ReadUInt( 8 ) do
			local slot = net.ReadUInt( 8 )

			local class = util.NetworkIDToString( net.ReadUInt( 16 ) )
			local item = itemstore.Item( class )

			item:ReadNetworkData()

			con:SetItem( slot, item )
		end

		con.ID = id
		itemstore.containers.Active[ id ] = con

		itemstore.containers.UpdatePanels( id )
	end )
end
