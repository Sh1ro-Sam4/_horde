ITEM.Name = itemstore.Translate( "food_name" )
ITEM.Description = itemstore.Translate( "food_desc" )
ITEM.Model = "models/props_junk/watermelon01.mdl"
ITEM.HighlightColor = itemstore.config.HighlightColours.Consumables
ITEM.Base = "base_darkrp"

ITEM.Foods = {
	[ "models/props_junk/watermelon01.mdl" ] = itemstore.Translate( "food_melon" ),
	[ "models/props/cs_italy/orange.mdl" ] = itemstore.Translate( "food_orange" ),
	[ "models/props/cs_italy/bananna_bunch.mdl" ] = itemstore.Translate( "food_bananas" ),
	[ "models/props/cs_italy/bananna.mdl" ] = itemstore.Translate( "food_banana" ),
	[ "models/props_junk/glassbottle01a.mdl" ] = itemstore.Translate( "food_glassbottle" ),
	[ "models/props_junk/popcan01a.mdl" ] = itemstore.Translate( "food_soda" ),
	[ "models/props_junk/garbage_milkcarton002a.mdl" ] = itemstore.Translate( "food_milk" ),
	[ "models/props_junk/garbage_glassbottle002a.mdl" ] = itemstore.Translate( "food_beer" ),
	[ "models/props_junk/garbage_plasticbottle003a.mdl" ] = itemstore.Translate( "food_twolitresoda" ),
	[ "models/props_junk/garbage_glassbottle001a.mdl" ] = itemstore.Translate( "food_onelitresoda" ),
	[ "models/props_junk/garbage_glassbottle003a.mdl" ] = itemstore.Translate( "food_glassbottle" )
}

function ITEM:GetName()
	local name = self.Name

	if self.Foods[ self:GetModel() ] then
		name = self.Foods[ self:GetModel() ]
	end

	return self:GetData( "Name", name )
end

function ITEM:GetDescription()
	return self:GetData( "Description", string.format( self.Description, self:GetData( "Nutrition", 1 ) ) )
end

function ITEM:Use( pl )
	local energy = pl:getDarkRPVar( "Energy" ) + self:GetData( "Nutrition", 1 )
	pl:setSelfDarkRPVar( "Energy", math.Clamp( energy, 0, 100 ) )

	umsg.Start( "AteFoodIcon", pl ) umsg.End()

	pl:EmitSound( "npc/barnacle/barnacle_crunch2.wav" )

	return self:TakeOne()
end

function ITEM:SaveData( ent )
	self:SetData( "Owner", ent:Getowning_ent() )
	self:SetData( "Nutrition", ent.FoodEnergy )
	self:SetModel( ent:GetModel() )
end

function ITEM:LoadData( ent )
	ent:Setowning_ent( self:GetData( "Owner" ) )
	ent:SetModel( self:GetModel() )
	ent.FoodEnergy = self:GetData( "Nutrition" )

	-- One day fptje is gonna have some feces mailed to his house or something, christ
	for k, v in ipairs( FoodItems ) do
		if v.model == self:GetModel() then
			ent.foodItem = v
			break
		end
	end
end
