local meta = FindMetaTable("Player")

function meta:SH_AddAccessory(id, nopreview)
	local acc = SH_ACC:GetAccessory(id)
	if (!acc) then
		return false
	end

	self.SH_Accessories = self.SH_Accessories or {}

	if (self.SH_Accessories[id]) then
		return false
	end

	local mdl = acc.mdl:lower()
	local offset = SH_ACC:GetOffset(mdl, self)
	assert(offset, "model '" .. acc.mdl .. "' does not have a registered offset")

	local cs = ents.CreateClientProp()
	if (IsValid(cs)) then
		cs.m_sAccOwner = self:SteamID()
		cs.m_iOccupiedSlots = acc.slots
		cs.m_Offset = offset
		cs.m_sModel = mdl
		cs.m_JobNames = acc.jobs or nil
		cs.m_JobNamesExclude = acc.jobsexclude or nil
		cs:SetModel(mdl)
		cs:SetNoDraw(true)
		cs:SetSkin(acc.skin)
		-- TODO: bodygroups
		cs:SetMaterial(acc.material)
		cs:SetColor(acc.color)
		cs:SetModelScale(acc.scale, 0)
		cs:SetPredictable(false)
		cs:DrawShadow(false)
		cs:DestroyShadow()
		cs:SetMoveType(MOVETYPE_NONE)
		cs:Spawn()

		if acc.unusual then
			local ef = EffectData()
			ef:SetOrigin(cs:GetPos())
			ef:SetEntity(cs)

			util.Effect('acc_effect2', ef)
		end

		self.SH_Accessories[id] = cs
	end

	-- Network adjustment if need be
	if (!nopreview and self == LocalPlayer() and self:SH_CanAdjustAccessories()) then
		self:SH_BroadcastAdjustment(mdl)
	end

	return cs
end

function meta:SH_RemoveAccessory(id)
	self.SH_Accessories = self.SH_Accessories or {}

	if (!self.SH_Accessories[id]) then
		return false
	end

	SafeRemoveEntity(self.SH_Accessories[id])
	self.SH_Accessories[id] = nil

	return true
end

function meta:SH_RemoveAllAccessories(id)
	if (!self.SH_Accessories) then
		return false
	end

	for id, cs in pairs (self.SH_Accessories) do
		SafeRemoveEntity(cs)
	end
	self.SH_Accessories = {}

	return true
end

function meta:SH_ResetAdjustments(mdl)
	if (!self.SH_AccessoryAdjust) then
		return end

	self.SH_AccessoryAdjust[mdl] = nil
	self:SH_SaveAdjustments()

	net.Start("SH_ACC_ADJUST_RESET")
		net.WriteString(mdl)
	net.SendToServer()
end

function meta:SH_SaveAdjustments()
	if (!self.SH_AccessoryAdjust) then
		return end

	local tosave = {}

	for mdl, adj in pairs (self.SH_AccessoryAdjust) do
		tosave[mdl] = {
			px = adj.px or 0,
			py = adj.py or 0,
			pz = adj.pz or 0,
			ax = adj.ax or 0,
			ay = adj.ay or 0,
			az = adj.az or 0,
			sx = adj.sx or 1,
			sy = adj.sy or 1,
			sz = adj.sz or 1,
		}

		local t = tosave[mdl]
		if (t.px == 0 and t.py == 0 and t.pz == 0 and t.ax == 0 and t.ay == 0 and t.az == 0 and t.sx == 1 and t.sy == 1 and t.sz == 1) then
			continue end -- gtho
	end

	file.Write("sh_accessory_adjustments.txt", util.TableToJSON(tosave))
end

function meta:SH_BroadcastAdjustment(mdl)
	local adj = self.SH_AccessoryAdjust[mdl]
	if (adj) then
		net.Start("SH_ACC_ADJUST")
			net.WriteString(mdl)

			net.WriteVector(Vector(adj.px or 0, adj.py or 0, adj.pz or 0))
			net.WriteAngle(Angle(adj.ax or 0, adj.ay or 0, adj.az or 0))
			net.WriteVector(Vector(adj.sx or 0, adj.sy or 0, adj.sz or 0))
		net.SendToServer()
	end
end