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

function SH_ACC:ShowEditor()
	if (!LocalPlayer():IsAdmin()) then
		return end

	if (IsValid(_SH_ACC_EDITOR)) then
		if (IsValid(_SH_ACC_EDITOR.m_PreviewModel)) then
			_SH_ACC_EDITOR.m_PreviewModel:Remove()
		end

		_SH_ACC_EDITOR:Remove()
	end

	local ang = Angle(0, -90, 0)
	local dis = 90
	local mlast_x = ScrW() * 0.5
	local mlast_y = ScrH() * 0.5

	local L, C = self._L, self._C
	local scale = math.Clamp(ScrH() / 1080, 0.7, 1)

	local frame = self:MakeFrame("Accessory Creator")
	frame:MakePopup()
	frame:SetSize(400 * scale, 600 * scale)
	frame:AlignLeft(ScrW() * 0.5 - frame:GetWide() * 1.75)
	frame:CenterVertical()
	frame.m_PreviewModel = NULL
	frame.Think = function(me)
		local mx, my = gui.MousePos()
		local diffx, diffy = (mx - mlast_x), (my - mlast_y)

		if (input.IsMouseDown(MOUSE_RIGHT) and !(diffx > 40 or diffy > 40)) then // right mouse press without sudden jumps
			if (input.IsKeyDown(KEY_E)) then
				dis = math.Clamp(dis + diffy, 10, 500)
			else
				ang = ang + Angle(diffy * 0.5, diffx * 0.5, 0)
			end
		end

		mlast_x, mlast_y = mx, my
	end
	frame.OnClose = function(me)
		if (IsValid(me.m_PreviewModel)) then
			me.m_PreviewModel:Remove()
		end

		hook.Remove("PostPlayerDraw", "SH_ACC.Editor")
		hook.Remove("CalcView", "SH_ACC.Editor")
		hook.Remove("ShouldDrawLocalPlayer", "SH_ACC.Editor")
	end
	_SH_ACC_EDITOR = frame

		local th = 48 * scale
		local m = th * 0.25
		local m5 = m * 0.5

		local body = vgui.Create("DScrollPanel", frame)
		self:PaintScroll(body)
		body:DockMargin(m, m, m, m)
		body:GetCanvas():DockPadding(m5, m5, m5, m5)
		body:Dock(FILL)
		body:GetCanvas().Paint = function(me, w, h)
			draw.RoundedBox(4, 0, 0, w, h, C"inbg")
		end

			local lbl = self:Label("ID (must be unique, A-Z 0-9 characters only)", "SH_ACC.LargeB", C"text", body)
			lbl:Dock(TOP)
			lbl:DockMargin(0, 0, 0, m5)

				local id = self:TextEntry(body)
				id:SetText("accessory")
				id:Dock(TOP)

			local lbl = self:Label("Name", "SH_ACC.LargeB", C"text", body)
			lbl:Dock(TOP)
			lbl:DockMargin(0, m5, 0, m5)

				local name = self:TextEntry(body)
				name:SetText("New Accessory")
				name:Dock(TOP)

			local lbl = self:Label("Slots (separate with spaces)", "SH_ACC.LargeB", C"text", body)
			lbl:Dock(TOP)
			lbl:DockMargin(0, m5, 0, 0)

			local lookup = {
				head = "SH_SLOT_HEAD",
				eyes = "SH_SLOT_EYES",
				mouth = "SH_SLOT_MOUTH",
				back = "SH_SLOT_BACK",
				neck = "SH_SLOT_NECK",
			}

			local lbl = self:Label("Valid: head, eyes, mouth, back, neck", "SH_ACC.MediumB", C"text", body)
			lbl:Dock(TOP)
			lbl:DockMargin(0, 0, 0, m5)

				local slots = self:TextEntry(body)
				slots:SetText("head")
				slots:Dock(TOP)

			local lbl = self:Label("Price", "SH_ACC.LargeB", C"text", body)
			lbl:Dock(TOP)
			lbl:DockMargin(0, m5, 0, m5)

				local price = self:TextEntry(body)
				price:SetText(5000)
				price:Dock(TOP)

			local lbl = self:Label("Model", "SH_ACC.LargeB", C"text", body)
			lbl:Dock(TOP)
			lbl:DockMargin(0, m5, 0, m5)

				local mdl = self:TextEntry(body)
				mdl:Dock(TOP)
				mdl.OnChange = function(me)
					if (IsValid(frame.m_PreviewModel)) then
						frame.m_PreviewModel:Remove()
					end

					local val = me:GetValue():Trim()
					if (file.Exists(val, "GAME")) then
						frame.m_PreviewModel = ClientsideModel(val)
						if (IsValid(frame.m_PreviewModel)) then
							frame.m_PreviewModel:SetNoDraw(true)
						end
					end
				end

			local lbl = self:Label("Bone", "SH_ACC.LargeB", C"text", body)
			lbl:Dock(TOP)
			lbl:DockMargin(0, m5, 0, m5)

				local bone = self:TextEntry(body)
				bone:SetText("ValveBiped.Bip01_Head1")
				bone:Dock(TOP)

			local sliders = {}
			local function addComponent(name)
				for _, c in ipairs {"X", "Y", "Z"} do
					local lbl = self:Label(name .. " " .. c, "SH_ACC.LargeB", C"text", body)
					lbl:Dock(TOP)
					lbl:DockMargin(0, m5, 0, m5)

						local slider = self:NumSlider(body)
						slider.Label:SetVisible(true) -- precise sliding
						slider:SetMinMax(-360, 360)
						slider:Dock(TOP)
						slider.OnValueChanged = function(me, val)
							sliders[name .. c] = val
						end
						slider:SetValue(def)
				end
			end

			addComponent("Position")
			addComponent("Angle")

			local lbl = self:Label("Scale", "SH_ACC.LargeB", C"text", body)
			lbl:Dock(TOP)
			lbl:DockMargin(0, m5, 0, m5)

				local slider = self:NumSlider(body)
				slider.Label:SetVisible(true) -- precise sliding
				slider:SetMinMax(0.01, 5)
				slider:Dock(TOP)
				slider.OnValueChanged = function(me, val)
					sliders.Scale = val
				end
				slider:SetValue(1)

			local export = vgui.Create("DButton", frame)
			export:SetText("Export")
			export:SetColor(C"text")
			export:SetFont("SH_ACC.Medium")
			export:Dock(BOTTOM)
			export:DockMargin(m, 0, m, m)
			export.Paint = function(me, w, h)
				draw.RoundedBox(4, 0, 0, w, h, C"inbg")

				if (me.Hovered) then
					surface.SetDrawColor(C"hover")
					surface.DrawRect(0, 0, w, h)
				end

				if (me:IsDown()) then
					surface.SetDrawColor(C"hover")
					surface.DrawRect(0, 0, w, h)
				end
			end
			export.DoClick = function()
				if (gui.IsGameUIVisible() and !gui.IsConsoleVisible()) then
					self:ShowConfirmMenu("Export", "SH Accessories: Enable your console to see the output.", function() end)
				end

				gui.ActivateGameUI()

				--
				local tx = Color(52, 152, 219)
				MsgC(tx, "\n============================================\n")
				MsgC(tx, "======= SH Accessories - Acc Export ========\n")
				MsgC(tx, "============================================\n\n")

				-- prep and validate
				local sl = {}
				for _, v in pairs (string.Explode(" ", slots:GetValue())) do
					if (lookup[v]) then
						table.insert(sl, lookup[v])
					end
				end

				if (id:GetValue():Trim() == "") then
					MsgC(Color(231, 76, 60), "!! ERROR! ID can't be empty.\n")
					return
				end

				if (mdl:GetValue():Trim() == "") then
					MsgC(Color(231, 76, 60), "!! ERROR! Model can't be empty.\n")
					return
				end

				if (bone:GetValue():Trim() == "") then
					MsgC(Color(231, 76, 60), "!! ERROR! Bone can't be empty.\n")
					return
				end

				if (#sl == 0) then
					MsgC(Color(231, 76, 60), "!! ERROR! No valid slots defined.\n")
					return
				end

				-- output the shit
				local tx = Color(241, 196, 15)
				MsgC(tx, "!! Here is the output of the item to be copied into accessory_list.lua (under CUSTOM ACCESSORIES!)\n\n")

				local tx = color_white
				MsgC(tx, string.format([[local a = New("%s", {name = "%s", price = %d, slot = %s, mdl = "%s"})%s]] .. "\n\n",
					SQLStr(id:GetValue(), true),
					SQLStr(name:GetValue(), true),
					math.max(tonumber(price:GetValue()) or 0, 0),
					table.concat(sl, " + "),
					SQLStr(mdl:GetValue(), true),
					(sliders.Scale ~= 1 and "\na.scale = " .. math.Round(sliders.Scale, 2) .. "\n" or "")
				))

				local tx = Color(241, 196, 15)
				MsgC(tx, "!! Now here is the offset output to be copied into accessory_offets.lua (under CUSTOM OFFSETS!)\n\n")

				local tx = color_white
				MsgC(tx, string.format([[Offset("%s", "%s", Vector(%0.3g, %0.3g, %0.3g), Angle(%0.3g, %0.3g, %0.3g))]] .. "\n\n",
					SQLStr(mdl:GetValue(), true),
					SQLStr(bone:GetValue(), true),
					sliders.PositionX, sliders.PositionY, sliders.PositionZ,
					sliders.AngleX, sliders.AngleY, sliders.AngleZ
				))
			end

	--
	hook.Add("PostPlayerDraw", "SH_ACC.Editor", function(ply)
		if (ply ~= LocalPlayer() or !IsValid(frame) or !IsValid(frame.m_PreviewModel)) then
			return end

		local mdl = frame.m_PreviewModel
		local boneid = ply:LookupBone(bone:GetValue())
		if (!boneid) then
			return end

		local bp, ba = ply:GetBonePosition(boneid)
		if (!bp) then
			return end

		-- Apply model specific bone offsets
		local offset2 = self:GetModelOffset(bone:GetValue(), ply)
		if (offset2) then
			if (offset2.pos) then
				bp = VectorOffset(bp, offset2.pos, ba)
			end

			if (offset2.ang) then
				ba = AngleOffset(ba, offset2.ang)
			end
		end

		local newpos = VectorOffset(bp, Vector(sliders.PositionX, sliders.PositionY, sliders.PositionZ), ba)
		local newang = AngleOffset(ba, Angle(sliders.AngleX, sliders.AngleY, sliders.AngleZ))

		mdl:SetModelScale(sliders.Scale)
		mdl:SetRenderOrigin(newpos)
		mdl:SetRenderAngles(newang)
		mdl:DrawModel()
	end)

	hook.Add("CalcView", "SH_ACC.Editor", function(pl, pos, angles, fov)
		local look_pos = pos
		local bone = pl:LookupBone("ValveBiped.Bip01_Head1")
		if (bone) then
			look_pos = pl:GetBonePosition(bone)
		end

		local view = {}
		view.origin = look_pos + ((pl:GetAngles() + ang):Forward() * dis)
		view.angles = (look_pos - view.origin):Angle()
		view.fov = fov

		return view
	end)

	hook.Add("ShouldDrawLocalPlayer", "SH_ACC.Editor", function(ply)
		return true
	end)
end

concommand.Add("sh_accessories_editor", function()
	SH_ACC:ShowEditor()
end)