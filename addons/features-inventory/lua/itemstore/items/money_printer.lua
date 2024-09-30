ITEM.Name = itemstore.Translate( "moneyprinter_name" )
ITEM.Description = itemstore.Translate( "moneyprinter_desc" )
ITEM.Model = "models/props_c17/consolebox01a.mdl"
ITEM.HighlightColor = itemstore.config.HighlightColours.Factories
ITEM.Base = "base_darkrp"

function ITEM:SaveData( ent )
	self:SetData( "Price", ent:Getprice() )
	self:SetData( "Owner", ent:Getowning_ent() )
end

function ITEM:LoadData( ent )
	ent:Setprice( self:GetData( "Price" ) )
	ent:Setowning_ent( self:GetData( "Owner" ) )
end