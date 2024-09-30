local PROVIDER = PROVIDER

-- Edit this with your authentication details
local auth = {
	Host = "localhost",
	Port = 3306,
	Username = "root",
	Password = "",
	Database = "itemstore"
}

local INVENTORY_DB = "Inventories"
local BANK_DB = "Banks"
local DEBUG = false

function PROVIDER:Log( text )
	print( "[ItemStore MySQL] " .. text )
	file.Append( "itemstore/mysql.txt", os.date( "[%c]" ) .. " " .. text .. "\r\n" )
end

function PROVIDER:CreateTable( name, columns, primary )
	self:Log( "Creating tables.." )

	local sql  = "CREATE TABLE IF NOT EXISTS `" .. name .. "`("

	for k, v in ipairs( columns ) do
		sql = sql .. v

		if k ~= #columns then
			sql = sql .. ", "
		end
	end

	if primary then
		sql = sql .. ", PRIMARY KEY ( " .. primary .. " )"
	end

	sql = sql .. " )"

	return self:Query( sql )
end

function PROVIDER:OnConnected( db )
	self.Database = db

	self:Log( "Connection succesful!" )

	local columns = {
		"`SteamID` VARCHAR( 32 ) NOT NULL",
		"`Slot` INT NOT NULL",
		"`Class` VARCHAR( 255 ) NULL",
		"`Data` BLOB NULL",
	}

	local primary = "`SteamID`, `Slot`"

	self:CreateTable( INVENTORY_DB, columns, primary )
	self:CreateTable( BANK_DB, columns, primary )

	self:RunQueue()
	-- I know I shouldn't store Data as a plain JSON string but I'm concerned about performance here.
	--self:Query( "CREATE TABLE IF NOT EXISTS Inventories( SteamID VARCHAR( 32 ) NOT NULL, Slot INT NOT NULL, Class VARCHAR( 255 ) NULL, Data BLOB NULL, PRIMARY KEY ( SteamID, Slot ) )" )
	--self:Query( "CREATE TABLE IF NOT EXISTS Banks( SteamID VARCHAR( 32 ) NOT NULL, Slot INT NOT NULL, Class VARCHAR( 255 ) NULL, Data BLOB NULL, PRIMARY KEY ( SteamID, Slot ) )" )
end

function PROVIDER:OnError( err )
	self:Log( "Connection failed: " .. err )
	self:Log( "Retrying in 30 seconds: " .. err )

	timer.Simple( 30, function()
		self:Initialize()
	end )
end

function PROVIDER:Initialize()
	require( "mysqloo" )
	assert( mysqloo, "[ItemStore] MySQLoo is not installed" )

	self:Log( "Connecting to database..." )

	local db = mysqloo.connect( auth.Host, auth.Username, auth.Password, auth.Database, auth.Port )

	db.onConnected = function( db )
		self:OnConnected( db )
	end

	db.onConnectionFailed = function( db, err )
		self:OnError( err )
	end

	db:connect()
end

function PROVIDER:Escape( str )
	return self.Database:escape( str )
end

PROVIDER.QueuedQueries = {}

function PROVIDER:RunQueue()
	if not self.Database then return end

	for k, v in ipairs( self.QueuedQueries ) do
		self:Query( unpack( v ) )
	end

	self.QueuedQueries = {}
end

function PROVIDER:Query( sql, params, success, fail )
	if not success then
		local success = function() end
	end

	if not fail then
		local fail = function( q, err )
			self:Log( "Query failed: " .. err )
		end
	end

	if not self.Database then
		if DEBUG then
			self:Log( "Database not connected yet, queueing query: " .. sql )
		end

		-- wait for connection if we don't have a db yet
		-- mysqloo docs say this should work anyways but :escape() will fail if not connected
		table.insert( self.QueuedQueries, { sql, params, success, fail } )
		return
	end

	if params then
		for k, v in pairs( params ) do
			if type( v ) ~= "number" then
				v = self:Escape( v )
				v = "\"" .. v .. "\""
			end

			sql = string.gsub( sql, ":" .. k, v )
		end
	end

	if DEBUG then
		self:Log( "Starting query: " .. sql )
	end

	local q = self.Database:query( sql )

	q.onSuccess = success
	q.onError = fail

	q:start()
end

function PROVIDER:LoadInventory( pl )
	local steamid = pl:SteamID64() or "0"

	local sql  = "SELECT * FROM `" .. INVENTORY_DB .. "`"
	sql = sql .. " WHERE `SteamID` = :1"

	local params = { steamid }

	self:Query( sql, params, function( q, data )
		if not IsValid( pl ) then return end

		for _, v in ipairs( data ) do
			local slot = v.Slot

			if v.Class then
				local class = v.Class
				local data = util.JSONToTable( v.Data )

				pl.Inventory:SetItem( slot, itemstore.Item( class, data ) )
			end
		end

		pl.InventoryLoaded = true
	end )
end

function PROVIDER:SaveInventory( pl )
	local steamid = pl:SteamID64() or "0"

	local sql  = "REPLACE INTO `" .. INVENTORY_DB .. "`"
	sql = sql .. "( `SteamID`, `Slot`, `Class`, `Data` )"
	sql = sql .. " VALUES"

	local params = {}
	params[ "steamid" ] = steamid

	for slot = 1, pl.Inventory:GetSize() do
		local item = pl.Inventory:GetItem( slot )

		sql = sql .. "( "
		sql = sql .. " :steamid,"
		sql = sql .. " " .. slot .. "," -- no need to escape here since it's a number

		if item then
			sql = sql .. " :item_" .. slot .. "_class,"
			sql = sql .. " :item_" .. slot .. "_data"

			params[ "item_" .. slot .. "_class" ] = item:GetClass()
			params[ "item_" .. slot .. "_data" ] = util.TableToJSON( item.Data )
		else
			sql = sql .. " NULL,"
			sql = sql .. " NULL"
		end

		sql = sql .. " )"

		if slot ~= pl.Inventory:GetSize() then
			sql = sql .. ","
		end
	end

	self:Query( sql, params )
end

function PROVIDER:LoadBank( pl )
	local steamid = pl:SteamID64() or "0"

	local sql  = "SELECT * FROM `" .. BANK_DB .. "`"
	sql = sql .. " WHERE `SteamID` = :1"

	local params = { steamid }

	self:Query( sql, params, function( q, data )
		if not IsValid( pl ) then return end

		for _, v in ipairs( data ) do
			local slot = v.Slot

			if v.Class then
				local class = v.Class
				local data = util.JSONToTable( v.Data )

				pl.Bank:SetItem( slot, itemstore.Item( class, data ) )
			end
		end

		pl.BankLoaded = true
	end )
end

function PROVIDER:SaveBank( pl )
	local steamid = pl:SteamID64() or "0"

	local params = {}
	params[ "steamid" ] = steamid

	local sql  = "REPLACE INTO `" .. BANK_DB .. "`"
	sql = sql .. "( `SteamID`, `Slot`, `Class`, `Data` )"
	sql = sql .. " VALUES"

	for slot = 1, pl.Bank:GetSize() do
		local item = pl.Bank:GetItem( slot )

		sql = sql .. "( "
		sql = sql .. " :steamid,"
		sql = sql .. " " .. slot .. "," -- no need to escape here since it's a number

		if item then
			sql = sql .. " :item_" .. slot .. "_class,"
			sql = sql .. " :item_" .. slot .. "_data"

			params[ "item_" .. slot .. "_class" ] = item:GetClass()
			params[ "item_" .. slot .. "_data" ] = util.TableToJSON( item.Data )
		else
			sql = sql .. " NULL,"
			sql = sql .. " NULL"
		end

		sql = sql .. " )"

		if slot ~= pl.Bank:GetSize() then
			sql = sql .. ","
		end
	end

	self:Query( sql, params )
end

function PROVIDER:Import( data )
	for k, v in pairs( data ) do
		self:Query( "DELETE FROM `" .. INVENTORY_DB .. "` WHERE SteamID = :1", { k } )
		self:Query( "DELETE FROM `" .. BANK_DB .. "` WHERE SteamID = :1", { k } )

		if v.Inventory and table.Count( v.Inventory ) > 0 then
			local sql  = "REPLACE INTO `" .. INVENTORY_DB .. "`"
			sql = sql .. "( `SteamID`, `Slot`, `Class`, `Data` )"
			sql = sql .. " VALUES"

			local params = {}
			params[ "steamid" ] = k

			for slot, item in pairs( v.Inventory ) do
				sql = sql .. "( "
				sql = sql .. " :steamid,"
				sql = sql .. " " .. tonumber( slot ) .. ","

				if item then
					sql = sql .. " :item_" .. slot .. "_class,"
					sql = sql .. " :item_" .. slot .. "_data"

					params[ "item_" .. slot .. "_class" ] = item.Class
					params[ "item_" .. slot .. "_data" ] = util.TableToJSON( item.Data )
				else
					sql = sql .. " NULL,"
					sql = sql .. " NULL"
				end

				sql = sql .. " ),"
			end

			sql = string.TrimRight( sql, "," )

			self:Query( sql, params )

			--for slot, item in pairs( v.Inventory ) do
			--	if item then
			--		self:Query( "REPLACE INTO Inventories( SteamID, Slot, Class, Data ) VALUES( :1, :2, :3, :4 )", { k, slot, item.Class, util.TableToJSON( item.Data ) } )
			--	else
			--		self:Query( "REPLACE INTO Inventories( SteamID, Slot, Class, Data ) VALUES( :1, :2, :3, :4 )", { k, slot, item.Class, util.TableToJSON( item.Data ) } )
			--	end
			--end
		end

		if v.Bank and table.Count( v.Bank ) > 0 then
			local sql  = "REPLACE INTO `" .. BANK_DB .. "`"
			sql = sql .. "( `SteamID`, `Slot`, `Class`, `Data` )"
			sql = sql .. " VALUES"

			local params = {}
			params[ "steamid" ] = k

			for slot, item in pairs( v.Bank ) do
				sql = sql .. "( "
				sql = sql .. " :steamid,"
				sql = sql .. " " .. tonumber( slot ) .. ","

				if item then
					sql = sql .. " :item_" .. slot .. "_class,"
					sql = sql .. " :item_" .. slot .. "_data"

					params[ "item_" .. slot .. "_class" ] = item.Class
					params[ "item_" .. slot .. "_data" ] = util.TableToJSON( item.Data )
				else
					sql = sql .. " NULL,"
					sql = sql .. " NULL"
				end

				sql = sql .. " ),"
			end

			sql = string.TrimRight( sql, "," )

			self:Query( sql, params )

			--if v.Bank then
			--	for slot, item in pairs( v.Bank ) do
			--		if item then
			--			self:Query( "REPLACE INTO Banks( SteamID, Slot, Class, Data ) VALUES( :1, :2, :3, :4 )", { k, slot, item.Class, util.TableToJSON( item.Data ) } )
			--		else
			--			self:Query( "REPLACE INTO Banks( SteamID, Slot, Class, Data ) VALUES( :1, :2, :3, :4 )", { k, slot, item.Class, util.TableToJSON( item.Data ) } )
			--		end
			--	end
			--end
		end
	end

	return true
end

function PROVIDER:Export( filename )
	local export = {}

	local inventory_loaded = false
	local bank_loaded = false

	local function FinishExport( export )
		file.Write( filename, util.TableToJSON( export ) )
	end

	local sql = "SELECT * FROM `" ..  INVENTORY_DB .. "`"

	self:Query( sql, nil, function( q, data )
		for _, row in ipairs( data ) do
			if not ( export[ row.SteamID ] ) then
				export[ row.SteamID ] = {}
			end

			if not ( export[ row.SteamID ].Inventory ) then
				export[ row.SteamID ].Inventory = {}
			end

			if row.Class then
				export[ row.SteamID ].Inventory[ row.Slot ] = { Class = row.Class, Data = util.JSONToTable( row.Data ) }
			end
		end

		inventory_loaded = true

		if inventory_loaded and bank_loaded then
			FinishExport( export )
		end
	end )

	local sql = "SELECT * FROM `" .. BANK_DB .. "`"

	self:Query( sql, nil, function( q, data )
		for _, row in ipairs( data ) do
			if not ( export[ row.SteamID ] ) then
				export[ row.SteamID ] = {}
			end

			if not ( export[ row.SteamID ].Bank ) then
				export[ row.SteamID ].Bank = {}
			end

			if row.Class then
				export[ row.SteamID ].Bank[ row.Slot ] = { Class = row.Class, Data = util.JSONToTable( row.Data ) }
			end
		end

		bank_loaded = true

		if inventory_loaded and bank_loaded then
			FinishExport( export )
		end
	end )
end
