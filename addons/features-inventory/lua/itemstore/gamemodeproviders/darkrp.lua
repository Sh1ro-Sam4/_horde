function PROVIDER:GetMoney( pl )
	return 0
end

if SERVER then
	function PROVIDER:SetMoney( pl, money )
		pl:SetMoney(money)
	end

	itemstore.AddCommand( "invholster", function( pl, args )
		if not pl:CanUseInventory() then return end
		local wep = pl:GetActiveWeapon()
		if not CFG.whitelistInvholster[ wep:GetClass() ] then
			pl:ChatPrint(Color(0,0,0), '(ОШИБКА)', ' Невозможно сделать это!')
			return
		end

		local item = itemstore.Item( "horde_weapon" )
		item:SetData( "Class", wep:GetClass() )
		item:SetData( "Amount", 1 )
		item:SetData( "Model", wep:GetModel() )
		item:SetData( "Clip1", wep:Clip1() )
		item:SetData( "Clip2", wep:Clip2() )
		if itemstore.config.InvholsterTakesAmmo then
			local ammotype = wep:GetPrimaryAmmoType()
			if ammotype and ammotype ~= "none" then -- to be entirely honest I'm not sure if it returns nil or "none"
				local ammo = pl:GetAmmoCount( ammotype )
				item:SetData( "Ammo", ammo )
				pl:RemoveAmmo( ammo, ammotype )
			end
		end
		pl:StripWeapon( wep:GetClass() )
		pl.Inventory:AddItem( item )
	end )
end