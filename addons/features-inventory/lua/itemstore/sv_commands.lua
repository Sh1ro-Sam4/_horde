itemstore.Commands = {}

function itemstore.AddCommand( cmd, callback )
	itemstore.Commands[ cmd ] = callback
end

function itemstore.RunCommand( pl, cmd, args )
	local func = itemstore.Commands[ cmd ]
	if not func or not isfunction( func ) then return end

	return func( pl, args )
end

function itemstore.CommandExists( cmd )
	return itemstore.Commands[ cmd ] ~= nil
end

hook.Add( "PlayerSay", "ItemStoreCommand", function( pl, text, team )
	local args = string.Explode( " ", text, false )
	local cmd = table.remove( args, 1 )

	if not string.StartWith( cmd, itemstore.config.ChatCommandPrefix ) then
		return
	end

	cmd = string.sub( cmd, 2 )

	if not itemstore.CommandExists( cmd ) then
		return
	end

	itemstore.RunCommand( pl, cmd, args )
	return ""
end )