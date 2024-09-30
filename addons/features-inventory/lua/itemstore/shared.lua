itemstore.Version = "3.0"
itemstore.About = string.format( [[ItemStore v%s

Authored solely by UselessGhost
http://steamcommunity.com/id/uselessghost
]], itemstore.Version )

MsgC( color_white, "ItemStore", Color( 100, 200, 255 ), " ", itemstore.Version, " ", Color( 200, 200, 200 ), "coded by ", Color( 255, 150, 150 ), "UselessGhost", "\n" )

concommand.Add( "itemstore_about", function()
	MsgC( color_white, itemstore.About )
end )

itemstore.config = {}

function itemstore.config.Verify( setting, correct_type )
	if type( itemstore.config[ setting ] ) ~= correct_type then
		ErrorNoHalt( string.format( "[ItemStore] Configuration error: %s is %s, should be %s.", setting, var_type, correct_type ) )
		--include( "config_default.lua" )

		return false
	end

	return true
end

include( "config.lua" )

itemstore.config.Verify( "MaxStack", "number" )
itemstore.config.Verify( "DataProvider", "string" )
itemstore.config.Verify( "GamemodeProvider", "string" )
itemstore.config.Verify( "Language", "string" )
itemstore.config.Verify( "ContextInventory", "boolean" )
itemstore.config.Verify( "ContextInventoryPosition", "string" )
itemstore.config.Verify( "InvholsterTakesAmmo", "boolean" )
itemstore.config.Verify( "PickupsGotoBank", "boolean" )
itemstore.config.Verify( "AntiDupe", "boolean" )
itemstore.config.Verify( "InventorySizes", "table" )
itemstore.config.Verify( "BankSizes", "table" )
itemstore.config.Verify( "PickupDistance", "number" )
itemstore.config.Verify( "PickupKey", "number" )
itemstore.config.Verify( "Colours", "table" )
itemstore.config.Verify( "DisabledItems", "table" )
itemstore.config.Verify( "CustomItems", "table" )
itemstore.config.Verify( "IgnoreOwner", "boolean" )
itemstore.config.Verify( "Skin", "string" )
itemstore.config.Verify( "SplitWeaponAmmo", "boolean" )
itemstore.config.Verify( "MigrateOldData", "boolean" )
itemstore.config.Verify( "EnableInvholster", "boolean" )
itemstore.config.Verify( "LimitToJobs", "table" )
itemstore.config.Verify( "HighlightStyle", "string" )
itemstore.config.Verify( "HighlightColours", "table" )

include( "language.lua" )
include( "gamemodes.lua" )
include( "items.lua" )
include( "containers.lua" )
include( "trading.lua" )
include( "admin.lua" )

local _, dirs = file.Find( "itemstore/modules/*", "LUA" )
for _, mod in ipairs( dirs ) do
	MsgC( color_white, string.format( "Loading ItemStore module: %s\n", mod ) )

	local path = "itemstore/modules/" .. mod

	for _, filename in ipairs( file.Find( path .. "/*.lua", "LUA" ) ) do
		if not string.match( filename, "^sv_.+%.lua$" ) then
			AddCSLuaFile( path .. "/" .. filename )
		end
	end

	local sv_init = path .. "/sv_init.lua"
	local cl_init = path .. "/cl_init.lua"
	local shared = path .. "/shared.lua"

	if file.Exists( shared, "LUA" ) then
		include( shared )
	end

	if SERVER and file.Exists( sv_init, "LUA" ) then
		include( sv_init )
	end

	if CLIENT and file.Exists( cl_init, "LUA" ) then
		include( cl_init )
	end
end

local teams = nil
local meta = FindMetaTable( "Player" )

function meta:CanUseInventory()
	if self:IsAdmin() then return true end -- always allow admins to access their inventories
	if not self:Alive() then return false end -- using your inventory while dead can be a bit exploitable

	if #itemstore.config.LimitToJobs > 0 then
		-- process this into an associative table for faster lookups
		if not teams then
			teams = {}

			for k, v in pairs( itemstore.config.LimitToJobs ) do
				teams[ v ] = true
			end
		end

		if not teams[ self:Team() ] then
			return false
		end
	end

	return true
end