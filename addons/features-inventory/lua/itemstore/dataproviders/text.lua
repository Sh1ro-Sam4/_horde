function PROVIDER:LoadInventory( pl )
	local json = file.Read( "itemstore/" .. ( pl:SteamID64() or "0" ) .. ".txt", "DATA" )

	if json then
		local inv = util.JSONToTable( json )

		if inv then
			for k, v in pairs( inv ) do
				pl.Inventory:SetItem( k, itemstore.Item( v.Class, v.Data ) )
			end
		end
	end

	pl.InventoryLoaded = true
end

function PROVIDER:SaveInventory( pl )
	local inv = {}

	for k, v in pairs( pl.Inventory:GetItems() ) do
		inv[ k ] = { Class = v.Class, Data = v.Data }
	end

	file.Write( "itemstore/" .. ( pl:SteamID64() or "0" ) .. ".txt", util.TableToJSON( inv ) )
end

function PROVIDER:LoadBank( pl )
	local json = file.Read( "itemstore/" .. ( pl:SteamID64() or "0" ) .. "_bank.txt", "DATA" )

	if json then
		local bank = util.JSONToTable( json )

		if bank then
			for k, v in pairs( bank ) do
				pl.Bank:SetItem( k, itemstore.Item( v.Class, v.Data ) )
			end
		end
	end

	pl.BankLoaded = true
end

function PROVIDER:SaveBank( pl )
	local inv = {}

	for k, v in pairs( pl.Bank:GetItems() ) do
		inv[ k ] = { Class = v.Class, Data = v.Data }
	end

	file.Write( "itemstore/" .. ( pl:SteamID64() or "0" ) .. "_bank.txt", util.TableToJSON( inv ) )
end

function PROVIDER:Import( data )
	for k, v in pairs( data ) do
		file.Write( "itemstore/" .. k .. ".txt", util.TableToJSON( data.Inventory ) )
		file.Write( "itemstore/" .. k .. "_bank.txt", util.TableToJSON( data.Bank ) )
	end

	return true
end

function PROVIDER:Export( filename )
	local export = {}

	for _, filename in ipairs( file.Find( "itemstore/*.txt", "DATA" ) ) do
		local data = util.JSONToTable( file.Read( "itemstore/" .. filename, "DATA" ) )

		if data then
			local inv_steamid = string.match( filename, "(%d+).txt" )
			local bank_steamid = string.match( filename, "(%d+)_bank.txt" )
			local steamid = inv_steamid or bank_steamid
			local isbank = steamid == bank_steamid

			-- you shouldn't put random shit in itemstore's data folder but just in case
			if steamid then
				if not export[ steamid ] then
					export[ steamid ] = {}
				end

				if isbank then
					export[ steamid ].Bank = data
				else
					export[ steamid ].Inventory = data
				end
			end
		end
	end

	file.Write( filename, util.TableToJSON( export ) )
end
