ITEM.Name = itemstore.Translate( "money_name" )
ITEM.Description = itemstore.Translate( "money_desc" )
ITEM.Model = "models/props/cs_assault/money.mdl"
ITEM.HighlightColor = itemstore.config.HighlightColours.Money
ITEM.Base = "base_darkrp"
ITEM.Stackable = true
ITEM.DropStack = true
ITEM.MaxStack = math.huge

function ITEM:FormatAmount()
	return GAMEMODE.Config.currency .. self:GetAmount()
end

function ITEM:Use( pl )
	itemstore.gamemodes.GiveMoney( pl, self:GetAmount() )
	return true
end

function ITEM:SaveData( ent )
	self:SetAmount( ent:Getamount() )
end

function ITEM:LoadData( ent )
	ent:Setamount( self:GetAmount() )
end
