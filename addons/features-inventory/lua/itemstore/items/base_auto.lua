ITEM.Name = "Auto Item Base"
ITEM.Model = "models/error.mdl"
ITEM.Base = "base_entity"

ITEM.DontNetwork = {
	EntityData = true
}

function ITEM:SaveData( ent )
	self:SetModel( ent:GetModel() )
	-- self:SetData( "EntityData", duplicator.CopyEntTable( ent ) )
end

function ITEM:LoadData( ent )
	ent:SetModel( self:GetModel() )
	-- local data = self:GetData( "EntityData" )

	-- duplicator.DoGeneric( ent, data )

	-- if data.DT then
	-- 	timer.Simple( 0, function()
	-- 		for k, v in pairs( data.DT ) do
	-- 			ent.dt[ k ] = v
	-- 		end
	-- 	end )
	-- end
end

-- function ITEM:Drop(ply, con, slot, ent)
-- 	local data = self:GetData( "EntityData" )

-- 	local class = data.ClassName
-- 	local ply = player.GetBySteamID(data.FPPOwnerID)
-- 	if not ply.kas_ItemStoreLimits then ply.kas_ItemStoreLimits = {} end
-- 	if ply.kas_ItemStoreLimits[class] then 
-- 		if ( ply.kas_ItemStoreLimits[class] + 1 ) > shizlib.itemstore.Limits[class] then
-- 			shizlib.notify(ply, Color(189,0,0), 'Инвентарь', string.format( 'Вы достигли лимита %s', class ) )
-- 			print"limit"
-- 			return
-- 		end
-- 		ply.kas_ItemStoreLimits[class] = tonumber(ply.kas_ItemStoreLimits[class]) + 1
-- 	else
-- 		ply.kas_ItemStoreLimits[class] = 1
-- 	end
-- end