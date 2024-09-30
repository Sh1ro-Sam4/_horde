include( "sv_commands.lua" )

include( "shared.lua" )

include( "sv_data.lua" )
include( "sv_player.lua" )
--include( "sv_statistics.lua" )

AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "language.lua" )
AddCSLuaFile( "cl_player.lua" )
AddCSLuaFile( "containers.lua" )
AddCSLuaFile( "items.lua" )
AddCSLuaFile( "gamemodes.lua" )
AddCSLuaFile( "config.lua" )
AddCSLuaFile( "admin.lua" )
AddCSLuaFile( "trading.lua" )

AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "cl_gui.lua" )

AddCSLuaFile( "skins/" .. itemstore.config.Skin .. ".lua" )

for _, filename in ipairs( file.Find( "itemstore/vgui/*.lua", "LUA" ) ) do
	AddCSLuaFile( "itemstore/vgui/" .. filename )
end

if itemstore.config.AntiDupe then
	local meta = FindMetaTable( "Entity" )
	local oldRemove = meta.Remove

	function meta:Remove()
		if IsValid( self ) then
			self.__Deleted = true
		end
		
		oldRemove( self )
	end
end

function itemstore.Print( pl, text )
	if IsValid( pl ) then
		pl:PrintMessage( HUD_PRINTCONSOLE, text )
	else
		print( text )
	end
end

RunConsoleCommand( "lua_log_sv", 1 )

concommand.Add( "itemstore_support", function( pl, cmd, args )
	if IsValid( pl ) and not pl:IsSuperAdmin() then return end

	local function respond( str )
		if IsValid( pl ) and false then
			pl:PrintMessage( HUD_PRINTCONSOLE, str )
		else
			print( str )
		end
	end

	local token = args[ 1 ]
	if not token then
		respond( "Error: token not defined. Please create a support ticket and ask for one." )
		return
	end

	local user = IsValid( pl ) and pl:Name() .. " (" .. pl:SteamID() .. ")" or "Console"
	local ip, port = string.match( game.GetIPAddress(), "(%d.%d.%d.%d):(%d)" )
	local hostname = GetHostName()
	local ws_addons, legacy_addons = file.Find( "addons/*", "GAME" )
	local config = file.Read( "itemstore/config.lua", "LUA" ) or ""
	local errors = file.Read( "lua_errors_server.txt", "GAME" ) or ""

	respond( "Uploading support information..." )

	http.Post( "https://uselessghost.me/itemstore/support.php", {
		token = token,
		user = user,
		ip = ip,
		port = port,
		hostname = hostname,
		ws_addons = util.TableToJSON( ws_addons ),
		legacy_addons = util.TableToJSON( legacy_addons ),
		config = config,
		errors = errors,
	}, function( data )
		local json = util.JSONToTable( data )
		
		if not json then
			respond( "Error: Invalid data received." )
			respond( data )
			return
		end

		if json.success then
			respond( "Support information uploaded." )
		else
			respond( "Support information upload failed: " .. json.error )
		end
	end )
end )