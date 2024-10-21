ITEM.Name = itemstore.Translate( "weapon_name" )
ITEM.Description = itemstore.Translate( "weapon_desc" )
ITEM.Model = "models/weapons/w_pistol.mdl"
ITEM.HighlightColor = itemstore.config.HighlightColours.Weapons
ITEM.Base = "base_darkrp"
ITEM.Stackable = true

ITEM.Weapons = {
	weapon_physgun = itemstore.Translate( "weapon_physgun" ),
	weapon_physcannon = itemstore.Translate( "weapon_physcannon" ),
	weapon_crowbar = itemstore.Translate( "weapon_crowbar" ),
	weapon_stunstick = itemstore.Translate( "weapon_stunstick" ),
	weapon_pistol = itemstore.Translate( "weapon_pistol" ),
	weapon_357 = itemstore.Translate( "weapon_357" ),
	weapon_smg1 = itemstore.Translate( "weapon_smg1" ),
	weapon_ar2 = itemstore.Translate( "weapon_ar2" ),
	weapon_annabelle = itemstore.Translate( "weapon_annabelle" ),
	weapon_shotgun = itemstore.Translate( "weapon_shotgun" ),
	weapon_crossbow = itemstore.Translate( "weapon_crossbow" ),
	weapon_frag = itemstore.Translate( "weapon_frag" ),
	weapon_rpg = itemstore.Translate( "weapon_rpg" ),
	weapon_slam = itemstore.Translate( "weapon_slam" ),
	weapon_bugbait = itemstore.Translate( "weapon_bugbait" )
}

function ITEM:IsValid()
	return self.Weapons[ self:GetData( "Class" ) ] or weapons.Get( self:GetData( "Class" ) )
end

function ITEM:GetWeaponClass( wep )
	return wep.GetWeaponClass and wep:GetWeaponClass() or wep.WeaponClass
end

function ITEM:GetName()
	local name = self.Name

	if self.Weapons[ self:GetData( "Class" ) ] then
		name = self.Weapons[ self:GetData( "Class"  ) ]
	end

	local wep_class = weapons.Get( self:GetData( "Class" ) )
	if wep_class and wep_class.PrintName then
		name = wep_class.PrintName
	end

	return self:GetData( "Name", name )
end

function ITEM:GetDescription()
	local desc = self.Description

	local clip = self:GetData( "Clip1", 0 )
	local reserve = self:GetData( "Ammo", 0 )

	return self:GetData( "Description", string.format( desc, clip, reserve ) )
end

function ITEM:CanPickup( pl, ent )
	if self.MaxStack < 1 then return false end
	if ent.PlayerUse then return false end
	if not weapons.Get( self:GetData( "Class" ) ) and
		not self.Weapons[ self:GetData( "Class" ) ] then return false end
	if itemstore.config.DisabledItems[ self:GetData( "Class" ) ] then return false end

	return true
end

function ITEM:CanMerge( item )
	return self.Stackable and item:GetClass() == self:GetClass() and
		item:GetData( "Class" ) == self:GetData( "Class" ) and
		self.MaxStack >= self:GetAmount() + 1
end

function ITEM:Merge( item )
	self:SetAmount( self:GetAmount() + 1 )

	self:SetData( "Clip2", item:GetData( "Clip2", 0 ) + self:GetData( "Clip2", 0 ) )
	self:SetData( "Ammo", item:GetData( "Ammo", 0 ) + self:GetData( "Ammo", 0 )
		+ item:GetData( "Clip1", 0 ) )
end

function ITEM:Split( amount )
	self:SetAmount( self:GetAmount() - amount )

	local item = self:Copy()
	item:SetAmount( amount )

	self:SetData( "Clip1", 0 )
	self:SetData( "Clip2", 0 )
	self:SetData( "Ammo", 0 )

	return item
end

function ITEM:SaveData( ent )
	self:SetData( "Class", self:GetWeaponClass( ent ) )
	self:SetData( "Amount", 1 )
	self:SetData( "Model", ent:GetModel() )

	if ent.clip1 then self:SetData( "Clip1", ent.clip1 ) end
	if ent.clip2 then self:SetData( "Clip2", ent.clip2 ) end

	local reserve = 0
	if ent.clip1 and 1 > 1 then
		reserve = reserve + ent.clip1 * ( 1 - 1 )
	end

	if ent.ammoadd then
		reserve = reserve + ent.ammoadd * 1
	end

	self:SetData( "Ammo", reserve )
end

function ITEM:LoadData( ent )
	ent:SetModel( self:GetData( "Model" ) )

	if ent.GetWeaponClass then
		ent:SetWeaponClass( self:GetData( "Class" ) )
	else
		ent.weaponclass = self:GetData( "Class" )
	end

	ent.clip1 = math.floor( self:GetData( "Clip1", 0 ) / 1 )
	ent.clip2 = math.floor( self:GetData( "Clip2", 0 ) / 1 )
	ent.ammoadd = math.floor( self:GetData( "Ammo", 0 ) / 1 )

	self:SetData( "Clip1", 0 )
	self:SetData( "Clip2", 0 )
	self:SetData( "Ammo", 0 )

	function ent:Initialize()
		self:PhysicsInit( SOLID_VPHYSICS )
		self:SetMoveType( MOVETYPE_VPHYSICS )
		self:SetSolid( SOLID_VPHYSICS )
		self:SetUseType( SIMPLE_USE )
		self:GetPhysicsObject():Wake()

		self:SetCollisionGroup( COLLISION_GROUP_INTERACTIVE_DEBRIS )
	end
end

local hl2_ammo = {
	weapon_pistol = 3,
	weapon_357 = 5,
	weapon_smg1 = 4,
	weapon_ar2 = 1,
	weapon_annabelle = 7,
	weapon_shotgun = 7,
	weapon_crossbow = 6,
	weapon_frag = 10,
	weapon_rpg = 8,
}

function ITEM:Use( pl )
	local class = self:GetData( "Class" )

	if not self.Weapons[ class ] and
		not weapons.Get( class ) then return false end

	local has_weapon = pl:HasWeapon( class )

	local wep_table = weapons.Get( class )
	local ammo, ammo_type

	if wep_table then
		ammo_type = wep_table.Primary.Ammo
	else
		ammo_type = hl2_ammo[ class ]
	end

	if ammo_type then
		ammo = pl:GetAmmoCount( ammo_type )
	end

	pl:Give( class )

	if ammo and ammo_type then
		pl:SetAmmo( ammo, ammo_type )
	end
	
	local wep = pl:GetWeapon( class )

	-- make sure we actually gave the weapon before we start deducting stuff
	if not IsValid( wep ) then return end

	if self:GetData( "Clip1" ) then
		if has_weapon then
			-- pl:GiveAmmo( self:GetData( "Clip1" ), wep:GetPrimaryAmmoType() )
		else
			wep:SetClip1( self:GetData( "Clip1" ) )
		end
	end

	if self:GetData( "Clip2" ) then
		if has_weapon then
			-- pl:GiveAmmo( self:GetData( "Clip2" ), wep:GetPrimaryAmmoType() )
		else
			wep:SetClip2( self:GetData( "Clip2" ) )
		end
	end

	-- self:SetData( "Clip1", 0 )
	-- self:SetData( "Clip2", 0 )

	if itemstore.config.SplitWeaponAmmo then
		if self:GetData( "Ammo" ) then
			local reserve = self:GetData( "Ammo" )
			local amount = self:GetAmount()

			local ammo = math.min( math.ceil( reserve / amount ), reserve )

			pl:GiveAmmo( ammo, wep:GetPrimaryAmmoType() )
			self:SetData( "Ammo", reserve - ammo )
		end
	else
		pl:GiveAmmo( self:GetData( "Ammo", 0 ), wep:GetPrimaryAmmoType() )
		self:SetData( "Ammo", 0 )
	end

	-- return self:TakeOne()
	return false
end
