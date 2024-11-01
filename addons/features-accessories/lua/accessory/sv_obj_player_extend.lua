local meta = FindMetaTable("Player")

function meta:SH_AddAccessory(id)
	if (!self.SH_AccessoryInfo or self:SH_HasAccessory(id)) then
		return false
	end

	local acc = SH_ACC:GetAccessory(id)
	if (!acc) then
		return false
	end

	self.SH_AccessoryInfo.inventory[id] = true
	self:SH_SaveAccessoryInfo(true)

	return true
end

function meta:SH_RemoveAccessory(id)
	-- if (!self.SH_AccessoryInfo or !self:SH_HasAccessory(id)) then
	-- 	return false
	-- end
	if !self.SH_AccessoryInfo then
		return false
	end

	if (self:SH_HasAccessoryEquipped(id)) then
		self:SH_UnequipAccessory(id)
	end

	self.SH_AccessoryInfo.inventory[id] = nil
	self:SH_SaveAccessoryInfo(true)

	return true
end

function meta:SH_EquipAccessory(id)
	-- if (!self.SH_AccessoryInfo or !self:SH_HasAccessory(id) or self:SH_HasAccessoryEquipped(id)) then
	-- 	return false
	-- end
	if !self.SH_AccessoryInfo then
		return false
	end

	local acc = SH_ACC:GetAccessory(id)
	if (!acc) then
		return false
	end

	self.SH_AccessoryInfo.equipped[id] = true
	self:SH_SaveAccessoryInfo(nil, true)

	self.SH_WornModels[acc.mdl] = true

	net.Start("SH_ACC_EQUIP")
		net.WriteEntity(self)
		net.WriteString(id)
		net.WriteBool(true)
	net.Broadcast()
	
	if acc.unusual then
		if IsValid(shizlib.Accessory[self]) then SafeRemoveEntity(shizlib.Accessory[self]) end
		shizlib.Accessory[self] = ents.Create('prop_physics')
		local a = shizlib.Accessory[self]

		a:SetModel('models/hunter/blocks/cube025x025x025.mdl')
		a:SetNoDraw(true)
		a:SetSkin(1)
		a:DrawShadow(false)
		a:PhysicsInit(SOLID_VPHYSICS)
		a:SetMoveType(MOVETYPE_VPHYSICS)
		a:SetSolid(SOLID_VPHYSICS)
		a:SetCollisionGroup(COLLISION_GROUP_DEBRIS)
		ParticleEffectAttach('acc_effect2', 1, a, 1)
	end

	hook.Run('shizlib:accessoryEquip', self, id)

	return true
end

function meta:SH_UnequipAccessory(id)
	if (!self.SH_AccessoryInfo or !self:SH_HasAccessoryEquipped(id)) then
		return false
	end

	self.SH_AccessoryInfo.equipped[id] = nil
	self:SH_SaveAccessoryInfo(nil, true)

	local acc = SH_ACC:GetAccessory(id)
	if (acc) then
		self.SH_WornModels[acc.mdl] = nil
	end

	net.Start("SH_ACC_EQUIP")
		net.WriteEntity(self)
		net.WriteString(id)
		net.WriteBool(false)
	net.Broadcast()

	if acc.unusual then
		if IsValid(shizlib.Accessory[self]) then SafeRemoveEntity(shizlib.Accessory[self]) end
	end

	return true
end

function meta:SH_SyncInventory()
	if (!self.SH_AccessoryInfo) then
		return false
	end

	net.Start("SH_ACC_INV")
		net.WriteUInt(table.Count(self.SH_AccessoryInfo.inventory), 32)

		for id in pairs (self.SH_AccessoryInfo.inventory) do
			net.WriteString(id)
		end
	net.Send(self)
end

function meta:SH_SyncEquippedAccessories(target)
	if (!self.SH_AccessoryInfo) then
		return false
	end

	net.Start("SH_ACC_EQUIPS")
		net.WriteEntity(self)

		net.WriteUInt(table.Count(self.SH_AccessoryInfo.equipped), 16)
		for id in pairs (self.SH_AccessoryInfo.equipped) do
			net.WriteString(id)
		end
	net.Send(target or player.GetAll())
end

function meta:SH_SyncAdjustment(mdl, pos, ang, siz, target)
	local emptypos = pos.x == 0 and pos.y == 0 and pos.z == 0
	local emptyang = ang.x == 0 and ang.y == 0 and ang.z == 0
	local emptysiz = siz.x == 1 and siz.y == 1 and siz.z == 1

	local tosend = 0
	if (!emptypos) then tosend = tosend + 1 end
	if (!emptyang) then tosend = tosend + 2 end
	if (!emptysiz) then tosend = tosend + 4 end

	net.Start("SH_ACC_ADJUST")
		net.WriteEntity(self)
		net.WriteString(mdl)

		net.WriteUInt(tosend, 8)
		if (!emptypos) then net.WriteVector(pos) end
		if (!emptyang) then net.WriteAngle(ang) end
		if (!emptysiz) then net.WriteVector(siz) end
	if (target) then
		net.Send(target)
	else
		net.SendOmit(self)
	end
end

local function concatkeys(t, s)
	local tb = {}
	for k in pairs (t) do
		table.insert(tb, k)
	end

	return table.concat(tb, s)
end

function meta:SH_SaveAccessoryInfo(inv, eqq)
	if (!inv and !eqq) then
		inv = true
		eqq = true
	end

	SH_ACC:BeginCommit()
		if (inv) then
			SH_ACC:Query("UPDATE :db SET inventory = :inventory WHERE id = :id", {inventory = concatkeys(self.SH_AccessoryInfo.inventory, "|"), id = self})
		end
		if (eqq) then
			SH_ACC:Query("UPDATE :db SET equipped = :equipped WHERE id = :id", {equipped = concatkeys(self.SH_AccessoryInfo.equipped, "|"), id = self})
		end
	SH_ACC:FinishCommit()
end

function meta:SH_AccNotify(acc, text, duration)
	if (istable(text)) then
		text = string.format(text[1], unpack(text, 2))
	end

	if (acc and istable(acc)) then
		acc = acc.id
	end

	duration = duration or 0

	self:ChatPrint(Color(105, 0, 0), '[Аксессуары] ', text)
end

-- DarkRP 2.4.3 compatibility
function SH_ACC.AddMoney(ply, i)
	return ply:addMoney(i)
end