ITEM.Name = itemstore.Translate( "shipment_name" )
ITEM.Description = itemstore.Translate( "shipment_desc" )
ITEM.Model = "models/Items/item_item_crate.mdl"
ITEM.HighlightColor = itemstore.config.HighlightColours.Shipments
ITEM.Stackable = true
ITEM.DropStack = true
ITEM.Base = "base_darkrp"

-- Because all of you feel the need to fuck with your shipments on a daily basis.

function ITEM:Initialize()
	if not SERVER then return end
	if not self:GetData( "Class" ) then return end

	local shipment = CustomShipments[ self:GetData( "Contents" ) ]
	if shipment and shipment.entity == self:GetData( "class" ) then return end

	for k, v in ipairs( CustomShipments ) do
		if v.entity == self:GetData( "Class" ) then
			self:SetData( "Contents", k )
			return
		end
	end
end

function ITEM:GetDescription()
	local shipment = CustomShipments[ self:GetData( "Contents" ) ]

	local str = itemstore.Translate( "shipment_invalid" )
	if shipment then
		str = string.format( self.Description, shipment.name )
	end

	return self:GetData( "Description", str )
end

function ITEM:CanMerge( item )
	return self.Stackable and self:GetClass() == item:GetClass() and
		self:GetData( "Contents" ) == item:GetData( "Contents" ) and
		self:GetMaxStack() >= ( item:GetAmount() + self:GetAmount() )
end

function ITEM:SaveData( ent )
	self:SetData( "Owner", ent:Getowning_ent() )
	self:SetData( "Contents", ent:Getcontents() )
	self:SetData( "Amount", ent:Getcount() )

	self:SetData( "Class", CustomShipments[ ent:Getcontents() ].entity )

	self:SetData( "Ammo", ent.ammoadd )
	self:SetData( "Clip1", ent.clip1 )
	self:SetData( "Clip2", ent.clip2 )
end

function ITEM:CanPickup( pl, ent )
	return self:GetMaxStack() >= ent:Getcount() and not ent.locked
end

function ITEM:Pickup( pl, con, slot, ent )
	timer.Destroy( ent:EntIndex() .. "crate" )
	--ent.locked = false
	ent.sparking = false
end

-- 76561198068291318

function ITEM:LoadData( ent )
	ent:Setcontents( self:GetData( "Contents" ) )
	ent:Setcount( self:GetData( "Amount" ) )
	ent:Setowning_ent( self:GetData( "Owner" ) )

	ent.ammoadd = self:GetData( "Ammo" )
	ent.clip1 = self:GetData( "Clip1" )
	ent.clip2 = self:GetData( "Clip2" )
end

function ITEM:Use( pl )
	if not CustomShipments[ self:GetData( "Contents" ) ] then return end
	if pl:isArrested() then return end

	local class = CustomShipments[ self:GetData( "Contents" ) ].entity

	local wep_table = weapons.Get( class )
	local ammo, ammo_type

	if wep_table then
		ammo_type = wep_table.Primary.Ammo

		if ammo_type then
			ammo = pl:GetAmmoCount( ammo_type )
		end
	end

	local wep = pl:Give( class )

	if ammo and ammo_type then
		pl:SetAmmo( ammo, ammo_type )
	end

	local weapon_exists = false

	if not IsValid( wep ) then
		wep = pl:GetWeapon( class )
		weapon_exists = IsValid( wep )
	end

	if IsValid( wep ) and wep:IsWeapon() then
		if self:GetData( "Clip1" ) then
			if weapon_exists then
				pl:GiveAmmo( self:GetData( "Clip1" ), wep:GetPrimaryAmmoType() )
			else
				wep:SetClip1( self:GetData( "Clip1" ) )
			end
		end

		if self:GetData( "Clip2" ) then
			if weapon_exists then
				pl:GiveAmmo( self:GetData( "Clip2" ), wep:GetSecondaryAmmoType() )
			else
				wep:SetClip2( self:GetData( "Clip2" ) )
			end
		end

		if self:GetData( "Ammo" ) then
			pl:GiveAmmo( self:GetData( "Ammo" ), wep:GetPrimaryAmmoType() )
		elseif wep.Primary and wep.Primary.DefaultClip then
			pl:GiveAmmo( wep.Primary.DefaultClip, wep:GetPrimaryAmmoType() )
		end
	end

	return self:TakeOne()
end
