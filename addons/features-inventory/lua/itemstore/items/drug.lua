ITEM.Name = itemstore.Translate( "drug_name" )
ITEM.Description = itemstore.Translate( "drug_desc" )
ITEM.Model = "models/props_lab/jar01a.mdl"
ITEM.HighlightColor = itemstore.config.HighlightColours.Consumables
ITEM.Base = "base_darkrp"
ITEM.Stackable = true

function ITEM:SaveData( ent )
	self:SetData( "Price", ent:Getprice() )
	self:SetData( "Owner", ent:Getowning_ent() )
end

function ITEM:LoadData( ent )
	ent:Setprice( self:GetData( "Price" ) )
	ent:Setowning_ent( self:GetData( "Owner" ) )
end