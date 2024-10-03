util.AddNetworkString("SH_ACC_READY")
util.AddNetworkString("SH_ACC_PURCHASE")
util.AddNetworkString("SH_ACC_SELL")
util.AddNetworkString("SH_ACC_MENU")
util.AddNetworkString("SH_ACC_EQUIP")
util.AddNetworkString("SH_ACC_EQUIPS")
util.AddNetworkString("SH_ACC_CHANGE")
util.AddNetworkString("SH_ACC_INV")
util.AddNetworkString("SH_ACC_NOTIFY")
util.AddNetworkString("SH_ACC_ADJUST")
util.AddNetworkString("SH_ACC_ADJUST_RESET")
util.AddNetworkString("SH_ACC_REQUEST")

function SH_ACC:Initialize()
	self:InitializeDB()
	hook.Call("SH_ACC.Init", GAMEMODE)
end

function SH_ACC:PlayerReady(ply)
	ply:SH_SyncEquippedAccessories()
	hook.Call("SH_ACC.Ready", GAMEMODE, ply)
end

function SH_ACC:PlayerInitialSpawn(ply)
	ply.SH_WornModels = {}
	ply.SH_StoredAdjustments = {}

	ply.SH_AccessoryInfo = {
		inventory = {},
		equipped = {},
	}

	-- self:Query("SELECT inventory, equipped FROM :db WHERE id = :id", {id = ply}, function(data)
	-- 	if (!IsValid(ply)) then
	-- 		return end

	-- 	hook.Call("SH_ACC.QueryingInfo", GAMEMODE, ply)

	-- 	-- Joining for first time, create row
	-- 	if (!data or !data[1]) then
	-- 		self:Query("INSERT INTO :db (id, inventory, equipped) VALUES (:id, '', '')", {id = ply}, function()
	-- 			if (!IsValid(ply)) then
	-- 				return end

	-- 			ply.SH_AccessoryInfo = {
	-- 				inventory = {},
	-- 				equipped = {},
	-- 			}

	-- 			hook.Call("SH_ACC.InfoCreated", GAMEMODE, ply, ply.SH_AccessoryInfo)
	-- 		end)
	-- 	else
	-- 		local inventory = {}
	-- 		local equipped = {}

	-- 		for _, id in pairs (string.Explode("|", data[1].inventory)) do
	-- 			if (id:Trim() == "") then
	-- 				continue end

	-- 			inventory[id] = true
	-- 		end

	-- 		local limit = ply:SH_GetAccessoryLimit()
	-- 		local eq = 0
	-- 		for _, id in pairs (string.Explode("|", data[1].equipped)) do
	-- 			if (id:Trim() == "") then
	-- 				continue end

	-- 			local acc = self:GetAccessory(id)
	-- 			if (!acc) then -- don't bother equipping a non existent acc
	-- 				continue end

	-- 			if (limit > 0 and eq >= limit) then -- incase the limit changes while the player is offline
	-- 				continue end

	-- 			ply.SH_WornModels[acc.mdl] = true

	-- 			eq = eq + 1
	-- 			equipped[id] = true
	-- 		end

	-- 		ply.SH_AccessoryInfo = {
	-- 			inventory = inventory,
	-- 			equipped = equipped,
	-- 		}

	-- 		hook.Call("SH_ACC.InfoLoaded", GAMEMODE, ply, ply.SH_AccessoryInfo)
	-- 	end
	-- end)
end

function SH_ACC:PlayerSay(ply, say, bteam)
	if (self.FreeAccess) then
		say = say:lower():Trim():Replace("!", "/")
		if (table.HasValue(self.FreeAccessCommand, say)) then
			self:Show(ply)
			return ""
		end
	end
end

function SH_ACC:Purchase(ply, id)
	if (!self:AllowedUsergroup(ply)) then
		return end

	if (!ply:SH_NearAccessoryVendor()) then
		return end

	local acc = self:GetAccessory(id)
	if (!acc or ply:SH_HasAccessory(id)) then
		return end

	if (!SH_ACC.CanAfford(ply, acc.price * ply:SH_GetAccessoryPurchaseFrac())) then
		ply:SH_AccNotify(acc, {self.Language.cant_afford_x, acc.name})
		return
	end

	local whitelist = (acc.usergroups and acc.usergroups[ply:GetUserGroup()]) or (acc.steamids and acc.steamids[ply:SteamID()])

	if (acc.canPurchase == false) or ((acc.usergroups or acc.steamids) and !whitelist) then
		ply:SH_AccNotify(nil, self.Language.cannot_purchase_accessory)
		return
	end

	if (acc.canPurchase and isfunction(acc.canPurchase)) then
		local ok, why = acc.canPurchase(ply)
		if (!ok) then
			ply:SH_AccNotify(nil, self.Language.cannot_purchase_accessory .. (why and ": " .. why or ""))
			return
		end
	end

	local b = hook.Call("SH_ACC.CanPurchase", GAMEMODE, ply, acc)
	if (b == false) then
		return end

	if (ply:SH_AddAccessory(id)) then
		SH_ACC.AddMoney(ply, -acc.price * ply:SH_GetAccessoryPurchaseFrac())
		ply:SH_AccNotify(acc, {self.Language.you_purchased_x, acc.name})
		ply:SH_SyncInventory()

		hook.Call("SH_ACC.Purchased", GAMEMODE, ply, acc)
	else
		ply:SH_AccNotify(nil, self.Language.failed_to_perform_action)
	end
end

function SH_ACC:Sell(ply, id)
	if (!self:AllowedUsergroup(ply)) then
		return end

	if (!ply:SH_NearAccessoryVendor()) then
		return end

	local acc = self:GetAccessory(id)
	if (!acc or !ply:SH_HasAccessory(id)) then
		return end

	if (acc.canSell == false or !ply:SH_CanSellAccessories()) then
		ply:SH_AccNotify(nil, self.Language.cannot_sell_accessory)
		return
	end

	if (acc.canSell and isfunction(acc.canSell)) then
		local ok, why = acc.canSell(ply)
		if (!ok) then
			ply:SH_AccNotify(nil, self.Language.cannot_sell_accessory .. (why and ": " .. why or ""))
			return
		end
	end

	local b = hook.Call("SH_ACC.CanSell", GAMEMODE, ply, acc)
	if (b == false) then
		return end

	if (ply:SH_RemoveAccessory(id)) then
		local m = math.Round(acc.price * ply:SH_GetAccessorySellFrac())

		SH_ACC.AddMoney(ply, m)
		ply:SH_AccNotify(acc, {self.Language.you_sold_x_for_y, acc.name, SH_ACC.formatMoney(m)})
		ply:SH_SyncInventory()

		hook.Call("SH_ACC.Sold", GAMEMODE, ply, acc)
	else
		ply:SH_AccNotify(nil, self.Language.failed_to_perform_action)
	end
end

function SH_ACC:ChangeEquipment(ply, id, eq)
	if (!self:AllowedUsergroup(ply)) then
		return end

	local acc = self:GetAccessory(id)
	if (!acc) then
		return end

	local b = hook.Call("SH_ACC.CanChangeEquipment", GAMEMODE, ply, id, eq)
	if (b == false) then
		return end
	
	local function PerformSwitch()
		if (eq) then -- Equip
			local idd = ply.Inventory:GetID()
			local con = itemstore.containers.Get( idd )
			local flag = false
			
			for k, v in pairs(con:GetItems()) do
				if v.Class == 'base_accessory' then
					if v.Data.id == id then flag = true break end
				end
			end

			if not flag then return print('pizdec') end

			local limit = ply:SH_GetAccessoryLimit()
			if (limit > 0) then
				local num = ply:SH_GetNumEquippedAccessories()

				for oid in pairs (ply.SH_AccessoryInfo.equipped) do
					if (oid == id) then
						continue end

					local oacc = self:GetAccessory(oid)
					if (oacc and bit.band(acc.slots, oacc.slots) > 0) then
						num = num - 1
					end
				end

				if (num >= limit) then
					ply:SH_AccNotify(nil, self.Language.reached_acc_limit)
					return
				end
			end

			if (ply:SH_EquipAccessory(id)) then
				local uneq = {}
				for oid in pairs (ply.SH_AccessoryInfo.equipped) do
					if (oid == id) then
						continue end

					local oacc = self:GetAccessory(oid)
					if (oacc and bit.band(acc.slots, oacc.slots) > 0) then
						ply:SH_UnequipAccessory(oid)
						table.insert(uneq, oacc.name)
					end
				end

				if (self.EquipMessages) then
					local acc = self:GetAccessory(id)
					local tbl = {self.Language.you_equipped_x, acc and acc.name or id}
					if (#uneq > 0) then
						tbl = {self.Language.you_equipped_x_swapped_with_y, acc and acc.name or id, table.concat(uneq, ", ")}
					end

					ply:SH_AccNotify(acc, tbl)
				end
			else
				if (self.EquipMessages) then
					ply:SH_AccNotify(nil, self.Language.failed_to_perform_action)
				end
			end
		else
			if (ply:SH_UnequipAccessory(id)) then
				if (self.EquipMessages) then
					local acc = self:GetAccessory(id)
					ply:SH_AccNotify(acc, {self.Language.you_unequipped_x, acc and acc.name or id})
				end
			else
				if (self.EquipMessages) then
					ply:SH_AccNotify(nil, self.Language.failed_to_perform_action)
				end
			end
		end
	end
	if (!IsValid(ply) or !ply:Alive()) then return end
		
	PerformSwitch()
	ply:SH_AccNotify(acc, {self.Language[eq and "equipping_to_acc" or "unequipping_acc"], acc and acc.name or id}, t)
end

function SH_ACC:SetAdjustment(ply, mdl, pos, ang, siz)
	if (!ply.SH_WornModels[mdl]) then
		return end

	local b = hook.Call("SH_ACC.CanSetAdjustment", GAMEMODE, ply, mdl, pos, ang, siz)
	if (b == false) then
		return end

	local fact = ply:SH_GetAccessoryAdjustFactor()

	-- clamp just incase
	local i = self.IndividiualAdjustFactor.translate
	pos.x = math.Clamp(pos.x, -fact * i, fact * i)
	pos.y = math.Clamp(pos.y, -fact * i, fact * i)
	pos.z = math.Clamp(pos.z, -fact * i, fact * i)

	local i = self.IndividiualAdjustFactor.rotate
	ang.x = math.Clamp(ang.x, -fact * i, fact * i)
	ang.y = math.Clamp(ang.y, -fact * i, fact * i)
	ang.z = math.Clamp(ang.z, -fact * i, fact * i)

	local i = self.IndividiualAdjustFactor.scale
	siz.x = math.Clamp(siz.x, 1 + -fact * i, 1 + fact * i)
	siz.y = math.Clamp(siz.y, 1 + -fact * i, 1 + fact * i)
	siz.z = math.Clamp(siz.z, 1 + -fact * i, 1 + fact * i)

	ply.SH_StoredAdjustments[mdl] = {
		pos = pos,
		ang = ang,
		siz = siz,
	}

	-- antispam, cba making think hook
	local id = "SH_ACC." .. ply:UserID() .. "_ADJUST_SYNC_" .. mdl

	timer.Destroy(id)
	timer.Create(id, 0.5, 1, function()
		if (IsValid(ply) and ply.SH_WornModels[mdl]) then
			ply:SH_SyncAdjustment(mdl, pos, ang, siz)
		end
	end)
end

function SH_ACC:ResetAdjustment(ply, mdl)
	if (!ply.SH_WornModels[mdl] or !ply.SH_StoredAdjustments[mdl]) then
		return end

	local b = hook.Call("SH_ACC.CanResetAdjustment", GAMEMODE, ply, mdl)
	if (b == false) then
		return end

	ply.SH_StoredAdjustments[mdl] = nil

	net.Start("SH_ACC_ADJUST_RESET")
		net.WriteEntity(ply)
		net.WriteString(mdl)
	net.SendOmit(ply)
end

function SH_ACC:Show(ply)
	-- if (!self:AllowedUsergroup(ply)) then
	-- 	return end

	net.Start("SH_ACC_MENU")
		net.WriteUInt(table.Count(ply.SH_AccessoryInfo.inventory), 32)

		for id in pairs (ply.SH_AccessoryInfo.inventory) do
			net.WriteString(id)
		end

		net.WriteString(ply:GetModel())
	net.Send(ply)
end

function SH_ACC:Notify(ply, acc, text, duration)
	duration = duration or 0

	net.Start("SH_ACC_NOTIFY")
		net.WriteString(acc)
		net.WriteString(text)
		net.WriteUInt(duration, 16)
	net.Send(ply)
end

function SH_ACC:AllowedUsergroup(ply)	
	if (table.Count(self.AllowedUsergroups) > 0 and !self.AllowedUsergroups[ply:GetUserGroup():lower()]) then	
		SH_ACC:Notify(ply, "", self.Language.bad_usergroup)
		return false
	end
	
	return true
end

hook.Add("Initialize", "SH_ACC.Initialize", function()
	SH_ACC:Initialize()
end)

hook.Add("PlayerInitialSpawn", "SH_ACC.PlayerInitialSpawn", function(ply)
	SH_ACC:PlayerInitialSpawn(ply)
end)

net.Receive("SH_ACC_READY", function(_, ply)
	if (ply.m_bReady) then
		return end

	ply.m_bReady = true
	SH_ACC:PlayerReady(ply)
end)

net.Receive("SH_ACC_PURCHASE", function(_, ply)
	SH_ACC:Purchase(ply, net.ReadString())
end)

net.Receive("SH_ACC_SELL", function(_, ply)
	SH_ACC:Sell(ply, net.ReadString())
end)

net.Receive("SH_ACC_CHANGE", function(_, ply)
	SH_ACC:ChangeEquipment(ply, net.ReadString(), net.ReadBool())
end)

net.Receive("SH_ACC_REQUEST", function(_, ply)
	local target = net.ReadEntity()
	if (!IsValid(target) or !target:IsPlayer()) then
		return end

	-- antispam
	if (!ply.SH_LastAccRequests) then
		ply.SH_LastAccRequests = {[target] = CurTime()}
	else
		if (ply.SH_LastAccRequests[target] and CurTime() - ply.SH_LastAccRequests[target] <= 2) then
			return end

		ply.SH_LastAccRequests[target] = CurTime()
	end

	-- transmit hats
	target:SH_SyncEquippedAccessories(ply)

	-- transmit adjustments
	for mdl in pairs (target.SH_WornModels) do
		local adj = target.SH_StoredAdjustments[mdl]
		if (adj) then
			target:SH_SyncAdjustment(mdl, adj.pos, adj.ang, adj.siz, ply)
		end
	end
end)

net.Receive("SH_ACC_ADJUST", function(_, ply)
	local mdl = net.ReadString():lower()
	local pos = net.ReadVector()
	local ang = net.ReadAngle()
	local siz = net.ReadVector()

	SH_ACC:SetAdjustment(ply, mdl, pos, ang, siz)
end)

net.Receive("SH_ACC_ADJUST_RESET", function(_, ply)
	SH_ACC:ResetAdjustment(ply, net.ReadString():lower())
end)

concommand.Add("sh_accessories_give", function(ply, cmd, args)
	if (IsValid(ply)) then
		return end

	local steamid = args[1]
	if (!steamid) then
		print("sh_accessory_give: SteamID not given!")
		return end

	local id = args[2]
	if (!id) then
		print("sh_accessory_give: Item ID not given!")
		return end

	local acc = SH_ACC:GetAccessory(id)
	if (!acc) then
		print("sh_accessory_give: Accessory '" .. id .. "' doesn't exist!")
		return end

	local ply = player.GetBySteamID(steamid)
	if (!IsValid(ply)) then
		print("sh_accessory_give: Player with SteamID '" .. steamid .. "' is not online!")
		return end

	if (ply:SH_HasAccessory(id)) then
		print("sh_accessory_give: " .. ply:Nick() .. " <" .. ply:SteamID() .. "> already has '" .. id .. "' accessory!")
		return end

	if (ply:SH_AddAccessory(id)) then
		print("sh_accessory_give: Successfully given " .. ply:Nick() .. " <" .. ply:SteamID() .. "> the '" .. id .. "' accessory!")
	else
		print("sh_accessory_give: Failed to give " .. ply:Nick() .. " <" .. ply:SteamID() .. "> the '" .. id .. "' accessory!")
	end
end)

concommand.Add("sh_accessories_remove", function(ply, cmd, args)
	if (IsValid(ply)) then
		return end

	local steamid = args[1]
	if (!steamid) then
		print("sh_accessories_remove: SteamID not given!")
		return end

	local id = args[2]
	if (!id) then
		print("sh_accessories_remove: Item ID not given!")
		return end

	local acc = SH_ACC:GetAccessory(id)
	if (!acc) then
		print("sh_accessories_remove: Accessory '" .. id .. "' doesn't exist!")
		return end

	local ply = player.GetBySteamID(steamid)
	if (!IsValid(ply)) then
		print("sh_accessories_remove: Player with SteamID '" .. steamid .. "' is not online!")
		return end

	if (!ply:SH_HasAccessory(id)) then
		print("sh_accessories_remove: " .. ply:Nick() .. " <" .. ply:SteamID() .. "> doesn't have '" .. id .. "' accessory!")
		return end

	if (ply:SH_RemoveAccessory(id)) then
		print("sh_accessories_remove: Successfully removed the '" .. id .. "' accessory " .. ply:Nick() .. " <" .. ply:SteamID() .. ">!")
	else
		print("sh_accessories_remove: Failed to remove the '" .. id .. "' accessory " .. ply:Nick() .. " <" .. ply:SteamID() .. ">!")
	end
end)

concommand.Add("sh_accessories_mypos", function(ply)
	local pos, ang = ply:GetPos(), ply:GetAngles()
	ply:PrintMessage(HUD_PRINTCONSOLE, string.format("{pos = Vector(%g, %g, %g), ang = Angle(%g, %g, %g)},", pos.x, pos.y, pos.z, ang.x, ang.y, ang.z))
end)