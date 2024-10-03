local meta = FindMetaTable("Player")

--
function meta:SH_NearAccessoryVendor()
	if (SH_ACC.FreeAccess) then
		return true
	end

	local pos = self:GetPos()
	for _, v in ipairs (ents.FindByClass("npc_accessory_vendor")) do
		if (v:GetPos():Distance(pos) <= 256) then
			return true
		end
	end

	return false
end

function meta:SH_HasAccessoryChanger()
	local swep = self:GetActiveWeapon()
	if (IsValid(swep) and swep:GetClass() == "sh_accessory_changer") then
		return swep
	end

	return false
end

function meta:SH_HasAccessory(id)
	if (!self.SH_AccessoryInfo) then
		return false
	end

	return self.SH_AccessoryInfo.inventory[id] ~= nil
end

function meta:SH_HasAccessoryEquipped(id)
	if (!self.SH_AccessoryInfo) then
		return false
	end

	return self.SH_AccessoryInfo.equipped[id] ~= nil
end

function meta:SH_CanAdjustAccessories()
	local ap = SH_ACC.AllowAdjustingPlayers[self:SteamID()]
	if (ap ~= nil) then
		return ap
	end

	local au = SH_ACC.AllowAdjustingUsergroups[self:GetUserGroup()]
	if (au ~= nil) then
		return au
	end

	return SH_ACC.AllowAdjusting
end

function meta:SH_GetAccessoryPurchaseFrac()
	return SH_ACC.PurchaseFracPlayers[self:SteamID()] or SH_ACC.PurchaseFracUsergroups[self:GetUserGroup()] or SH_ACC.PurchaseFrac
end

function meta:SH_GetAccessorySellFrac()
	return SH_ACC.SellFracPlayers[self:SteamID()] or SH_ACC.SellFracUsergroups[self:GetUserGroup()] or SH_ACC.SellFrac
end

function meta:SH_GetAccessoryAdjustFactor()
	return SH_ACC.AdjustFactorPlayers[self:SteamID()] or SH_ACC.AdjustFactorUsergroups[self:GetUserGroup()] or SH_ACC.AdjustFactor
end

function meta:SH_GetAccessoryLimit()
	return SH_ACC.MaximumWearablePlayers[self:SteamID()] or SH_ACC.MaximumWearableUsergroups[self:GetUserGroup()] or SH_ACC.MaximumWearable
end

function meta:SH_CanSellAccessories()
	local sp = SH_ACC.AllowSellingPlayers[self:SteamID()]
	if (sp ~= nil) then
		return sp
	end

	local su = SH_ACC.AllowSellingUsergroups[self:GetUserGroup()]
	if (su ~= nil) then
		return su
	end

	return SH_ACC.AllowSelling
end

function meta:SH_GetNumEquippedAccessories()
	if (!self.SH_AccessoryInfo) then
		return 0
	end

	return table.Count(self.SH_AccessoryInfo.equipped)
end

-- DarkRP 2.4.3 compatibility
function SH_ACC.CanAfford(ply, i)
	return ply:GetMoney() > i
end

-- boo
local function attachCurrency(str)
	local config = GAMEMODE.Config
	if (!config) then
		return "$" .. str
	end

	local cr = config.currency or "$"
	return config.currencyLeft and cr .. str or str .. cr
end

function SH_ACC.formatMoney(n)
	if (DarkRP and DarkRP.formatMoney) then
		return DarkRP.formatMoney(n)
	else
		if not n then return attachCurrency("0") end

		if n >= 1e14 then return attachCurrency(tostring(n)) end
		if n <= -1e14 then return "-" .. attachCurrency(tostring(math.abs(n))) end

		local negative = n < 0

		n = tostring(math.abs(n))
		local sep = sep or ","
		local dp = string.find(n, "%.") or #n + 1

		for i = dp - 4, 1, -3 do
			n = n:sub(1, i) .. sep .. n:sub(i + 1)
		end

		return (negative and "-" or "") .. attachCurrency(n)
	end
end