-- I like to think this does something
local Vector = Vector
local Angle = Angle
local IsValid = IsValid
local pairs = pairs
local Matrix = Matrix
local bit = bit
local player = player
local team = team
local bit_band = bit.band
local player_GetAll = player.GetAll
local team_GetName = team.GetName

local MySelf = LocalPlayer()
local MYSELFVALID = false
hook.Add("Think", "SH_ACC.Think0", function()
	MySelf = LocalPlayer()
	if (IsValid(MySelf)) then
		MYSELFVALID = true
		SH_ACC:PlayerReady(MySelf)
		hook.Remove("Think", "SH_ACC.Think0")

		net.Start("SH_ACC_READY")
		net.SendToServer()
	end
end)

function SH_ACC:PlayerReady(ply)
	if (!ply.SH_Accessories) then
		ply.SH_Accessories = {}
	end

	if (!ply.SH_AccessoryInfo) then
		ply.SH_AccessoryInfo = {
			inventory = {},
			equipped = {},
		}
	end

	if (ply == MySelf) then
		-- Load adjustments to be ready to transmit
		local t = util.JSONToTable(file.Read("sh_accessory_adjustments.txt", "DATA") or "") or {}
		ply.SH_AccessoryAdjust = t
	else
		ply.SH_AccessoryAdjust = ply.SH_AccessoryAdjust or {}
	end
end

local function VectorOffset(pos, offset, ang)
	local newpos = Vector()
	newpos:Set(pos + ang:Forward() * offset.x + ang:Right() * offset.y + ang:Up() * offset.z)

	return newpos
end

local function AngleOffset(ang, offset)
	local newang = Angle()
	newang:Set(ang)
	newang:RotateAroundAxis(newang:Up(), offset.y)
	newang:RotateAroundAxis(newang:Right(), offset.p)
	newang:RotateAroundAxis(newang:Forward(), offset.r)

	return newang
end

function SH_ACC:DrawAccessories(target, ply)
	if (!self.DrawOnArrested and ply.isArrested and ply:isArrested()) then
		return end

	if (!ply.SH_Accessories) then
		SH_ACC:PlayerReady(ply)
	end

	if (ply ~= MySelf and !ply.SH_RequestedAccessories) then
		ply.SH_RequestedAccessories = true

		net.Start("SH_ACC_REQUEST")
			net.WriteEntity(ply)
		net.SendToServer()
	end

	local n = team_GetName(ply:Team())

	local precache = {}
	local cache = {}
	local previewmodel

	for id, cs in pairs (ply.SH_Accessories) do
		if (ply == MySelf and IsValid(_SH_ACC_BUYMENU) and _SH_ACC_BUYMENU.m_Previewing) then
			previewmodel = _SH_ACC_BUYMENU.m_PreviewModel

			local band = bit_band(_SH_ACC_BUYMENU.m_Previewing[2], cs.m_iOccupiedSlots)
			if (band > 0 and previewmodel ~= cs) then
				continue end
		end

		if (!IsValid(cs)) then
			ply:SH_RemoveAccessory(id)
			continue
		end

		if (previewmodel ~= cs) then
			if (cs.m_JobNames and !cs.m_JobNames[n]) then
				continue end

			if (cs.m_JobNamesExclude and cs.m_JobNamesExclude[n]) then
				continue end
		end

		local offset = cs.m_Offset
		if (!offset) then -- que
			continue end

		local boneid
		if (precache[offset.bone]) then
			boneid = precache[offset.bone]
		else
			boneid = target:LookupBone(offset.bone)
			precache[offset.bone] = boneid
		end

		local pos, ang
		if (boneid) then
			if (cache[boneid]) then
				pos, ang = cache[boneid][1], cache[boneid][2]
			else
				local mat = target:GetBoneMatrix(boneid)
				if (!mat) then
					continue end

				pos, ang = mat:GetTranslation(), mat:GetAngles()

				-- Apply model specific bone offsets
				local offset2 = self:GetModelOffset(offset.bone, target)
				if (offset2) then
					if (offset2.pos) then
						pos = VectorOffset(pos, offset2.pos, ang)
					end

					if (offset2.ang) then
						ang = AngleOffset(ang, offset2.ang)
					end
				end

				-- update cache
				cache[boneid] = {pos, ang}
			end
		else
			if (!self.DisplayWithEmptyBone) then
				continue end

			pos = target:GetPos()
			ang = Angle(0, 0, 0)
		end

		local newpos = VectorOffset(pos, offset.pos, ang)
		local newang = AngleOffset(ang, offset.ang)

		-- Apply adjustments if any
		local adjust = ply.SH_AccessoryAdjust and ply.SH_AccessoryAdjust[cs.m_sModel]
		if (adjust) then
			-- cache the offsets if need be
			if (!adjust.p) and (adjust.px or adjust.py or adjust.pz) then
				adjust.p = Vector(adjust.px or 0, adjust.py or 0, adjust.pz or 0)
			end

			if (!adjust.a) and (adjust.ax or adjust.ay or adjust.az) then
				adjust.a = Angle(adjust.ax or 0, adjust.ay or 0, adjust.az or 0)
			end

			if (!adjust.s) and (adjust.sx or adjust.sy or adjust.sz) then
				local mat = Matrix()
				mat:Scale(Vector(adjust.sx or 1, adjust.sy or 1, adjust.sz or 1))
				adjust.s = mat

				cs:EnableMatrix("RenderMultiply", mat)
			end

			-- apply the offests
			if (adjust.p) then
				newpos = VectorOffset(newpos, adjust.p, newang)
			end

			if (adjust.a) then
				newang = AngleOffset(newang, adjust.a)
			end

			cs.m_bAppliedAdjustments = true
		else
			if (cs.m_bAppliedAdjustments) then
				cs.m_bAppliedAdjustments = nil
				cs:DisableMatrix("RenderMultiply")
			end
		end

		cs:SetPos(newpos)
		cs:SetAngles(newang)
		cs:SetRenderOrigin(newpos)
		cs:SetRenderAngles(newang)

		cs:SetupBones()
		cs:DrawModel()
	end
end

hook.Add("PostDrawTranslucentRenderables", "SH_ACC.PostDrawTranslucentRenderables", function()
	if (!MYSELFVALID or !SH_ACC.DrawOnBodies) then
		return end

	for _, ply in ipairs (player_GetAll()) do
		if (ply:Alive()) or (ply == MySelf and IsValid(_SH_ACC_BUYMENU)) then
			continue end

		local ragdoll = ply:GetRagdollEntity()
		if (!IsValid(ragdoll)) then
			continue end

		SH_ACC:DrawAccessories(ragdoll, ply)
	end
end)

hook.Add("PostPlayerDraw", "SH_ACC.PostPlayerDraw", function(ply)
	if (!MYSELFVALID or !ply:Alive()) then
		return end

	-- can't draw hats on both models so draw on shop/editor first
	if (ply == MySelf) and (IsValid(_SH_ACC_BUYMENU) or IsValid(_SH_ACC_EDITOR)) then
		return end

	if (ply ~= MySelf) then
		local dist = SH_ACC.RenderDistance
		if (dist > 0) then
			local mypos = MySelf:GetPos()
			if (mypos:Distance(ply:GetPos()) >= dist) then
				return end
		end
	end

	SH_ACC:DrawAccessories(ply, ply)
end)

gameevent.Listen("player_disconnect")

hook.Add("player_disconnect", "SH_ACC.player_disconnect", function(data)
	for _, v in pairs (ents.GetAll()) do
		if (IsValid(v) and v.m_sAccOwner and v.m_sAccOwner == data.networkid) then
			SafeRemoveEntity(v)
		end
	end
end)

net.Receive("SH_ACC_MENU", function()
	local inv = {}
	for i = 1, net.ReadUInt(32) do
		inv[net.ReadString()] = true
	end

	local svmdl = net.ReadString()

	MySelf.m_sServerModel = svmdl
	MySelf.SH_AccessoryInfo.inventory = inv

	SH_ACC:ShowBuyMenu()
end)

net.Receive("SH_ACC_INV", function()
	local inv = {}
	for i = 1, net.ReadUInt(32) do
		inv[net.ReadString()] = true
	end

	MySelf.SH_AccessoryInfo.inventory = inv
end)

net.Receive("SH_ACC_EQUIP", function()
	local ent = net.ReadEntity()
	local id = net.ReadString()
	local eq = net.ReadBool()

	if (!IsValid(ent) or !ent:IsPlayer()) then
		return end

	SH_ACC:PlayerReady(ent)

	if (eq) then
		ent:SH_AddAccessory(id)
	else
		ent:SH_RemoveAccessory(id)
	end
	ent.SH_AccessoryInfo.equipped[id] = eq and true or nil

	if (ent == MySelf and IsValid(_SH_ACC_BUYMENU)) then
		_SH_ACC_BUYMENU.m_Contents:RefreshOverview(true)
	end
end)

net.Receive("SH_ACC_EQUIPS", function()
	local ent = net.ReadEntity()

	local eqs = {}
	for i = 1, net.ReadUInt(16) do
		eqs[i] = net.ReadString()
	end

	if (!IsValid(ent) or !ent:IsPlayer()) then
		return end

	SH_ACC:PlayerReady(ent)

	ent:SH_RemoveAllAccessories()
	ent.SH_AccessoryInfo.equipped = {}

	for _, id in ipairs (eqs) do
		ent:SH_AddAccessory(id)
		ent.SH_AccessoryInfo.equipped[id] = true
	end

	if (ent == MySelf and IsValid(_SH_ACC_BUYMENU)) then
		_SH_ACC_BUYMENU.m_Contents:RefreshOverview(true)
	end
end)

net.Receive("SH_ACC_ADJUST", function()
	local ent = net.ReadEntity()
	local mdl = net.ReadString()
	if (!IsValid(ent)) then
		return end

	SH_ACC:PlayerReady(ent)

	local tosend = net.ReadUInt(8)

	local tbl = {}
	if (bit.band(tosend, 1) > 0) then
		local pos = net.ReadVector()
		tbl.px = pos.x
		tbl.py = pos.y
		tbl.pz = pos.z
	end

	if (bit.band(tosend, 2) > 0) then
		local ang = net.ReadAngle()
		tbl.ax = ang.x
		tbl.ay = ang.y
		tbl.az = ang.z
	end

	if (bit.band(tosend, 4) > 0) then
		local siz = net.ReadVector()
		tbl.sx = siz.x
		tbl.sy = siz.y
		tbl.sz = siz.z
	end

	ent.SH_AccessoryAdjust[mdl] = tbl
end)

net.Receive("SH_ACC_ADJUST_RESET", function()
	local ent = net.ReadEntity()
	local mdl = net.ReadString()
	if (!IsValid(ent) or !ent.SH_AccessoryAdjust) then
		return end

	ent.SH_AccessoryAdjust[mdl] = nil
end)