local PROVIDER = PROVIDER

-- Edit this with your authentication details
local auth = {
	Host = "localhost",
	Port = 3306,
	Username = "root",
	Password = "",
	Database = "itemstore"
}

function PROVIDER:Log( text )
	print( "[ItemStore MySQL] " .. text )
	file.Append( "itemstore/mysql.txt", os.date( "[%c]" ) .. " " .. text .. "\r\n" )
end

function PROVIDER:OnConnected()
	self:Log( "Connection succesful!" )

	-- I know I shouldn't store Data as a plain JSON string but I'm concerned about performance here.
	self:Query( "CREATE TABLE IF NOT EXISTS Inventories( SteamID VARCHAR( 32 ) NOT NULL, Slot INT NOT NULL, Class VARCHAR( 255 ) NULL, Data BLOB NULL, PRIMARY KEY ( SteamID, Slot ) )" )
	self:Query( "CREATE TABLE IF NOT EXISTS Banks( SteamID VARCHAR( 32 ) NOT NULL, Slot INT NOT NULL, Class VARCHAR( 255 ) NULL, Data BLOB NULL, PRIMARY KEY ( SteamID, Slot ) )" )
end

function PROVIDER:OnError( err )
	self:Log( "Connection failed: " .. err )

	timer.Simple( 30, function()
		self:Initialize()
	end )
end

function PROVIDER:Initialize()
	require( "tmysql4" )
	assert( tmysql, "[ItemStore] TMySQL4 is not installed" )

	self:Log( "Connecting to database..." )

	local db, err = tmysql.initialize( auth.Host, auth.Username, auth.Password, auth.Database, auth.Port )

	if err then
		PROVIDER:OnError( err )
	else
		PROVIDER.Database = db
		PROVIDER:OnConnected()
	end
end

-- tmysql is so nice, no need for some stupid query buffer in case the database d/cs
function PROVIDER:Query( sql, params, success, fail )
	if not success then
		function success( data ) end
	end

	if not fail then
		function fail( err ) self:Log( "Query failed: " .. err ) end
	end

	if not self.Database then
		fail( "Database not initialized" )
		return
	end

	if params then
		for k, v in pairs( params ) do
			if type( v ) ~= "number" then
				v = self.Database:Escape( v )
				v = "'" .. v .. "'"
			end

			sql = string.gsub( sql, ":" .. k, v )
		end
	end

	self.Database:Query( sql, function( results )
		if results[ 1 ].status then
			success( results[ 1 ].data )
		else
			fail( results[ 1 ].error )
		end
	end )
end

function PROVIDER:LoadInventory( pl )
	local steamid = pl:SteamID64() or "0"

	self:Query( "SELECT * FROM Inventories WHERE SteamID = :1", { steamid }, function( data )
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

	for slot = 1, pl.Inventory:GetSize() do
		local item = pl.Inventory:GetItem( slot )

		if item then
			local class = item:GetClass()
			local data = util.TableToJSON( item.Data )

			self:Query( "REPLACE INTO Inventories( SteamID, Slot, Class, Data ) VALUES( :1, :2, :3, :4 )", { steamid, slot, class, data } )
		else
			self:Query( "REPLACE INTO Inventories( SteamID, Slot, Class, Data ) VALUES( :1, :2, NULL, NULL )", { steamid, slot } )
		end
	end
end

function PROVIDER:LoadBank( pl )
	local steamid = pl:SteamID64() or "0"

	self:Query( "SELECT * FROM Banks WHERE SteamID = :1", { steamid }, function( data )
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

	for slot = 1, pl.Bank:GetSize() do
		local item = pl.Bank:GetItem( slot )

		if item then
			local class = item:GetClass()
			local data = util.TableToJSON( item.Data )

			self:Query( "REPLACE INTO Banks( SteamID, Slot, Class, Data ) VALUES( :1, :2, :3, :4 )", { steamid, slot, class, data } )
		else
			self:Query( "REPLACE INTO Banks( SteamID, Slot, Class, Data ) VALUES( :1, :2, NULL, NULL )", { steamid, slot } )
		end
	end
end

function PROVIDER:Import( data )
	for k, v in pairs( data ) do
		self:Query( "DELETE FROM Inventories WHERE SteamID = :1", { k } )
		self:Query( "DELETE FROM Banks WHERE SteamID = :1", { k } )

		if v.Inventory then
			for slot, item in pairs( v.Inventory ) do
				if item then
					self:Query( "REPLACE INTO Inventories( SteamID, Slot, Class, Data ) VALUES( :1, :2, :3, :4 )", { k, slot, item.Class, util.TableToJSON( item.Data ) } )
				else
					self:Query( "REPLACE INTO Inventories( SteamID, Slot, Class, Data ) VALUES( :1, :2, :3, :4 )", { k, slot, item.Class, util.TableToJSON( item.Data ) } )
				end
			end
		end

		if v.Bank then
			for slot, item in pairs( v.Bank ) do
				if item then
					self:Query( "REPLACE INTO Banks( SteamID, Slot, Class, Data ) VALUES( :1, :2, :3, :4 )", { k, slot, item.Class, util.TableToJSON( item.Data ) } )
				else
					self:Query( "REPLACE INTO Banks( SteamID, Slot, Class, Data ) VALUES( :1, :2, :3, :4 )", { k, slot, item.Class, util.TableToJSON( item.Data ) } )
				end
			end
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

	self:Query( "SELECT * FROM Inventories", nil, function( data )
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

	self:Query( "SELECT * FROM Banks", nil, function( data )
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
