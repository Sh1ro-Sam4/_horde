local matClose = Material("shenesis/accessory/close.png", "noclamp smooth")
local matList = Material("shenesis/accessory/list.png", "noclamp smooth")
local matPrevious = Material("shenesis/accessory/previous.png", "noclamp smooth")
local matStop = Material("shenesis/accessory/stop.png", "noclamp smooth")
local matSearch = Material("shenesis/accessory/search.png", "noclamp smooth")

local th, m, m5
local scale

local cacheL = {}
local cacheC = {}

local function L(s, ...)
	if (cacheL[s]) then
		return cacheL[s]
	end

	local tx = SH_ACC.Language[s] or s

	local a = {...}
	if (#a > 0) then
		return string.format(tx, ...)
	else
		cacheL[s] = tx
		return tx
	end
end
SH_ACC._L = L

local function C(s)
	if (cacheC[s]) then
		return cacheC[s]
	else
		local c = SH_ACC.Style[s]
		cacheC[s] = c

		return c
	end
end
SH_ACC._C = C

function SH_ACC:Label(t, f, c, p)
	local l = vgui.Create("DLabel", p)
	l:SetText(t)
	l:SetFont(f)
	l:SetColor(c)
	l:SizeToContents()

	return l
end

function SH_ACC:PaintScroll(panel)
	local styl = self.Style

	local scr = panel:GetVBar()
	scr.Paint = function(_, w, h)
		draw.RoundedBox(4, 0, 0, w, h, styl.bg)
	end

	scr.btnUp.Paint = function(_, w, h)
		draw.RoundedBox(4, 2, 0, w - 4, h - 2, styl.inbg)
	end
	scr.btnDown.Paint = function(_, w, h)
		draw.RoundedBox(4, 2, 2, w - 4, h - 2, styl.inbg)
	end

	scr.btnGrip.Paint = function(me, w, h)
		draw.RoundedBox(4, 2, 0, w - 4, h, styl.inbg)

		if (vgui.GetHoveredPanel() == me) then
			draw.RoundedBox(4, 2, 0, w - 4, h, styl.hover2)
		end

		if (me.Depressed) then
			draw.RoundedBox(4, 2, 0, w - 4, h, styl.hover2)
		end
	end
end

function SH_ACC:CreateAccIcon(acc, bg)
	local mdl = vgui.Create("DModelPanel", bg)
	mdl:SetModel(acc.mdl)
	mdl:Dock(FILL)
	mdl.LayoutEntity = function() end
	mdl:SetLookAt(Vector(0, 0, 0))
	mdl:SetFOV(10)
	mdl.Entity:SetSkin(acc.skin)
	-- TODO: bodygroups
	mdl.Entity:SetMaterial(acc.material)
	mdl.Entity:SetColor(acc.color)
	mdl.Entity:SetModelScale(acc.scale, 0)

	return mdl
end

function SH_ACC:TextEntry(parent)
	local tent = vgui.Create("DTextEntry", parent)
	tent:SetTextColor(C"text")
	tent:SetCursorColor(C"text")
	tent:SetFont("SH_ACC.Medium")
	tent:SetDrawLanguageID(false)
	tent.Paint = function(me, w, h)
		draw.RoundedBox(4, 0, 0, w, h, C"bg")

		if (me:HasFocus()) then
			draw.RoundedBox(4, 0, 0, w, h, C"hover")
		end
		me:DrawTextEntryText(me:GetTextColor(), me:GetHighlightColor(), me:GetCursorColor())
	end

	return tent
end

function SH_ACC:NumSlider(parent)
	local slider = vgui.Create("DNumSlider", parent)
	slider.TextArea:SetTextColor(C"text")
	slider.TextArea:SetFont("SH_ACC.Medium")
	slider.TextArea:SetDrawLanguageID(false)
	slider.TextArea:SetCursorColor(C"text")
	slider.Label:SetVisible(false)
	slider.Slider.Paint = function(me, w, h)
		draw.RoundedBox(0, 0, h * 0.5 - 1, w, 2, C"bg")
	end
	slider.Slider.Knob.Paint = function(me, w, h)
		draw.RoundedBox(4, 0, 0, w, h, C"header")

		if (me.Hovered) then
			surface.SetDrawColor(C"hover")
			surface.DrawRect(0, 0, w, h)
		end

		if (me:IsDown()) then
			surface.SetDrawColor(C"hover")
			surface.DrawRect(0, 0, w, h)
		end
	end

	return slider
end

function SH_ACC:Menu()
	local styl = self.Style

	if (IsValid(_SH_ACC_MENU)) then
		_SH_ACC_MENU:Remove()
	end

	scale = math.Clamp(ScrH() / 1080, 0.7, 1)

	local th = 48 * scale
	local m = th * 0.25

	local cancel = vgui.Create("DPanel")
	cancel:SetDrawBackground(false)
	cancel:StretchToParent(0, 0, 0, 0)
	cancel:MoveToFront()
	cancel:MakePopup()

	local pnl = vgui.Create("DPanel")
	pnl:SetDrawBackground(false)
	pnl:SetSize(20, 1)
	pnl.AddOption = function(me, text, callback)
		surface.SetFont("SH_ACC.MediumB")
		local wi, he = surface.GetTextSize(text)
		wi = wi + m * 2
		he = he + m

		me:SetWide(math.max(wi, me:GetWide()))
		me:SetTall(pnl:GetTall() + he)

		local btn = vgui.Create("DButton", me)
		btn:SetText(text)
		btn:SetFont("SH_ACC.MediumB")
		btn:SetColor(styl.text)
		btn:Dock(TOP)
		btn:SetSize(wi, he)
		btn.Paint = function(me, w, h)
			surface.SetDrawColor(styl.menu)
			surface.DrawRect(0, 0, w, h)

			if (me.Hovered) then
				surface.SetDrawColor(styl.hover)
				surface.DrawRect(0, 0, w, h)
			end

			if (me:IsDown()) then
				surface.SetDrawColor(styl.hover)
				surface.DrawRect(0, 0, w, h)
			end
		end
		btn.DoClick = function(me)
			callback()
			pnl:Close()
		end
	end
	pnl.Open = function(me)
		me:SetPos(gui.MouseX(), gui.MouseY())
		me:MakePopup()
	end
	pnl.Close = function(me)
		if (me.m_bClosing) then
			return end

		me.m_bClosing = true
		me:AlphaTo(0, 0.1, 0, function()
			me:Remove()
		end)
	end
	_SH_ACC_MENU = pnl

	cancel.OnMouseReleased = function(me, mc)
		pnl:Close()
	end
	cancel.Think = function(me)
		if (!IsValid(pnl)) then
			me:Remove()
		end
	end

	return pnl
end

function SH_ACC:MakeFrame(title)
	scale = math.Clamp(ScrH() / 1080, 0.7, 1)

	local pnl = vgui.Create("EditablePanel")
	pnl.Paint = function(me, w, h)
		if (me.m_fCreateTime) then
			Derma_DrawBackgroundBlur(me, me.m_fCreateTime)
		end

		draw.RoundedBox(4, 0, 0, w, h, C"bg")
	end
	pnl.Close = function(me)
		if (me.m_bClosing) then
			return end

		me.m_bClosing = true
		me:AlphaTo(0, 0.1, 0, function()
			me:Remove()
		end)

		me:OnClose()
	end
	pnl.OnClose = function()
	end

		th = 48 * scale
		m = th * 0.25
		m5 = m * 0.5

		local header = vgui.Create("DPanel", pnl)
		header:SetTall(th)
		header:Dock(TOP)
		header.Paint = function(me, w, h)
			draw.RoundedBoxEx(4, 0, 0, w, h, C"header", true, true, false, false)
		end

			local titlelbl = self:Label(title or "", "SH_ACC.Larger", C"text", header)
			titlelbl:Dock(FILL)
			titlelbl:DockMargin(m, 0, 0, 0)

			local close = vgui.Create("DButton", header)
			close:SetText("")
			close:SetWide(th)
			close:Dock(RIGHT)
			close.Paint = function(me, w, h)
				if (me.Hovered) then
					draw.RoundedBoxEx(4, 0, 0, w, h, C"close_hover", false, true, false, false)
				end

				if (me:IsDown()) then
					draw.RoundedBoxEx(4, 0, 0, w, h, C"hover", false, true, false, false)
				end

				surface.SetDrawColor(me:IsDown() and C"text_down" or C"text")
				surface.SetMaterial(matClose)
				surface.DrawTexturedRectRotated(w * 0.5, h * 0.5, 16 * scale, 16 * scale, 0)
			end
			close.DoClick = function(me)
				pnl:Close()
			end

	pnl.SetTitle = function(me, tx)
		titlelbl:SetText(tx)
	end

	return pnl
end

function SH_ACC:CreateFonts(sc)
	local font = self.Font
	local font_bold = self.FontBold

	local sizes = {
		[12] = "Small",
		[16] = "Medium",
		[20] = "Large",
		[24] = "Larger",
		[32] = "Largest",
	}

	for s, n in pairs (sizes) do
		surface.CreateFont("SH_ACC." .. n, {font = font, size = s * sc})
		surface.CreateFont("SH_ACC." .. n .. "B", {font = font_bold, size = s * sc})
	end
end

function SH_ACC:ShowAdjustMenu(acc, contents, ilist)
	if (IsValid(_SH_ACC_ADJUST_MENU)) then
		_SH_ACC_ADJUST_MENU:QuickSave()
		_SH_ACC_ADJUST_MENU:Remove()
	end

	local MySelf = LocalPlayer()
	local fact = MySelf:SH_GetAccessoryAdjustFactor()
	local mdl = acc.mdl

	local w = ilist:GetWide()

	ilist:Dock(NODOCK)
	ilist:MoveTo(-(ilist:GetWide() + m * 2), ilist.y, 0.2)

	local apnl = vgui.Create("DScrollPanel", contents)
	apnl:SetSize(w, contents:GetTall() - m * 2)
	apnl:SetPos(w, m)
	apnl:MoveTo(m, apnl.y, 0.2, nil, nil, function()
		apnl:Dock(FILL)
	end)
	apnl.Close = function(me)
		if (me.m_bClosing) then
			return end

		me.m_bClosing = true

		-- Save immediately
		me:QuickSave()

		apnl:Dock(NODOCK)
		apnl:MoveTo(apnl:GetWide() + m * 2, apnl.y, 0.2)

		ilist:MoveTo(m, ilist.y, 0.2, nil, nil, function()
			ilist:Dock(FILL)
			apnl:Remove()
		end)
	end
	apnl.Think = function(me)
		if (me.m_fNetworkIn and CurTime() >= me.m_fNetworkIn) then
			MySelf:SH_BroadcastAdjustment(mdl)
			MySelf:SH_SaveAdjustments()
			me.m_fNetworkIn = nil
		end
	end
	apnl.QuickSave = function(me)
		if (me.m_fNetworkIn) then
			me.m_fNetworkIn = 0
			me:Think()
		end
	end
	_SH_ACC_ADJUST_MENU = apnl

		local top = vgui.Create("DPanel", apnl)
		top:SetDrawBackground(false)
		top:SetTall(32 * scale)
		top:Dock(TOP)
		top:DockMargin(0, 0, 0, 0)

			local btn = vgui.Create("DImageButton", top)
			btn:SetImage("shenesis/accessory/previous.png")
			btn:SetWide(top:GetTall())
			btn:Dock(LEFT)
			btn:DockMargin(-6 * scale, 0, 0, 0)
			btn.DoClick = function(me)
				apnl:Close()
			end
			btn.DoRightClick = btn.DoClick
			if (!self.DisableKeyShortcuts) then
				btn.Think = function(me)
					if (input.IsMouseDown(MOUSE_4)) then
						btn:DoClick()
					end
				end
			end

		local pnl = vgui.Create("DPanel", apnl)
		pnl:SetTall(64 * scale)
		pnl:Dock(TOP)
		pnl:DockMargin(0, m5, 0, 0)
		pnl:DockPadding(m5, m5, m5, m5)
		pnl.Paint = function(me, w, h)
			draw.RoundedBox(4, 0, 0, w, h, C"inbg")
		end

			local lbl = self:Label(L"adjust" .. " - " .. acc.name, "SH_ACC.LargerB", C"text", pnl)
			lbl:Dock(TOP)

			local lbl = self:Label(L"adjust_desc", "SH_ACC.Medium", C"text", pnl)
			lbl:SetAutoStretchVertical(true)
			lbl:SetWrap(true)
			lbl:Dock(TOP)

		timer.Simple(0.1, function()
			if (!IsValid(pnl)) then
				return end

			pnl:SizeToChildren(true, true)
		end)

		local nosave = false
		local adjustments = {}
		local function AddAdjustMenu(tx, ad, fc, de)
			tx = L(tx)
			fc = fc or 1
			de = de or 0

			local adj = vgui.Create("DPanel", apnl)
			adj:SetTall(64 * scale)
			adj:Dock(TOP)
			adj:DockMargin(0, m5, 0, 0)
			adj:DockPadding(m5, m5, m5, m5)
			adj.Paint = pnl.Paint

			for _, c in ipairs ({"x", "y", "z"}) do
				local id = ad .. c

				local lbl = self:Label(tx .. " " .. c:upper(), "SH_ACC.LargeB", C"text", adj)
				lbl:Dock(TOP)

				local slider = self:NumSlider(adj)
				slider:Dock(TOP)
				slider:SetMinMax(de + -fact * fc, de + fact * fc)
				slider.m_fDefault = de
				table.insert(adjustments, slider)

				if (MySelf.SH_AccessoryAdjust and MySelf.SH_AccessoryAdjust[mdl]) then
					slider:SetValue(MySelf.SH_AccessoryAdjust[mdl][id] or de)
				else
					slider:SetValue(de)
				end

				slider.OnValueChanged = function(me, val)
					val = math.Clamp(val, -fact, fact)

					if (!MySelf.SH_AccessoryAdjust) then
						MySelf.SH_AccessoryAdjust = {}
					end

					if (!MySelf.SH_AccessoryAdjust[mdl]) then
						MySelf.SH_AccessoryAdjust[mdl] = {
							[id] = val,
						}
					else
						MySelf.SH_AccessoryAdjust[mdl][id] = val
					end

					MySelf.SH_AccessoryAdjust[mdl][ad] = nil

					if (nosave) then
						return end

					apnl.m_fNetworkIn = CurTime() + 0.5
				end
			end

			timer.Simple(0, function()
				if (!IsValid(adj)) then
					return end

				adj:SizeToChildren(true, true)
			end)
		end

		local function ShowAdjustElements()
			AddAdjustMenu("translate", "p", self.IndividiualAdjustFactor.translate)
			AddAdjustMenu("rotate", "a", self.IndividiualAdjustFactor.rotate)
			AddAdjustMenu("scale", "s", self.IndividiualAdjustFactor.scale, 1)
		end

		ShowAdjustElements()

		local reset = vgui.Create("DButton", apnl)
		reset:SetText(L"reset_adjustments")
		reset:SetColor(C"text")
		reset:SetFont("SH_ACC.LargeB")
		reset:SetTall(draw.GetFontHeight(reset:GetFont()) + m5)
		reset:Dock(TOP)
		reset:DockMargin(0, m5, 0, 0)
		reset.Paint = function(me, w, h)
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
		reset.DoClick = function(me)
			MySelf:SH_ResetAdjustments(mdl)

			nosave = true
			for _, v in ipairs (adjustments) do
				v:SetValue(v.m_fDefault)
			end
			nosave = false
		end
end

function SH_ACC:ShowConfirmMenu(title, text, callback)
	if (IsValid(_SH_ACC_CONFIRM)) then
		_SH_ACC_CONFIRM:Remove()
	end

	scale = math.Clamp(ScrH() / 1080, 0.7, 1)
	local wi, he = 200 * scale, 160 * scale

	local cancel = vgui.Create("DPanel")
	cancel:SetDrawBackground(false)
	cancel:StretchToParent(0, 0, 0, 0)
	cancel:MoveToFront()
	cancel:MakePopup()

	local pnl = SH_ACC:MakeFrame(L(title))
	pnl:SetSize(wi, he)
	pnl:Center()
	pnl:MakePopup()
	pnl.m_fCreateTime = SysTime()
	_SH_ACC_CONFIRM = pnl

	cancel.OnMouseReleased = function(me, mc)
		if (mc == MOUSE_LEFT) then
			pnl:Close()
		end
	end
	cancel.Think = function(me)
		if (!IsValid(pnl)) then
			me:Remove()
		end
	end

		local th = 48 * scale
		local m = th * 0.25

		local body = vgui.Create("DPanel", pnl)
		body:SetDrawBackground(false)
		body:Dock(FILL)
		body:DockPadding(m, 0, m, m)

			local tx
			if (istable(text)) then
				tx = L(unpack(text))
			else
				tx = L(text)
			end

			local tx = self:Label(tx, "SH_ACC.Large", C"text", body)
			tx:SetContentAlignment(5)
			tx:Dock(FILL)

			local btns = vgui.Create("DPanel", body)
			btns:SetDrawBackground(false)
			btns:Dock(BOTTOM)

				local yes = vgui.Create("DButton", btns)
				yes:SetText(L"yes")
				yes:SetColor(C"text")
				yes:SetFont("SH_ACC.Medium")
				yes:Dock(FILL)
				yes.Paint = function(me, w, h)
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
				yes.DoClick = function()
					pnl:Close()
					callback()
				end

				local no = vgui.Create("DButton", btns)
				no:SetText(L"no")
				no:SetColor(C"text")
				no:SetFont("SH_ACC.Medium")
				no:Dock(RIGHT)
				no:DockMargin(m, 0, 0, 0)
				no.Paint = yes.Paint
				no.DoClick = function()
					pnl:Close()
				end

	pnl.OnFocusChanged = function(me, gained)
		if (!gained) then
			timer.Simple(0, function()
				if (!IsValid(me) or vgui.GetKeyboardFocus() == entry) then
					return end

				me:Close()
			end)
		end
	end

	pnl:SetWide(math.max(tx:GetWide() + m * 2, pnl:GetWide()))
	pnl:CenterHorizontal()

	no:SetWide(pnl:GetWide() * 0.5 - m * 1.5)

	pnl:SetAlpha(0)
	pnl:AlphaTo(255, 0.1)
end

local mdlcam_pos = CreateClientConVar("sh_acc_campos", "50 50 50", true, false)
local mdlcam_lookat = CreateClientConVar("sh_acc_lookat", "0 0 40", true, false)
local mdlcam_fov = CreateClientConVar("sh_acc_fov", "30", true, false)
local mdlcam_ang = CreateClientConVar("sh_acc_angle", "0", true, false)

function SH_ACC:ChangeEquipment(id, eq)
	net.Start("SH_ACC_CHANGE")
		net.WriteString(id)
		net.WriteBool(eq)
	net.SendToServer()

	surface.PlaySound("shenesis/generic_cloth_movement" .. math.random(1, 16) .. ".ogg")
end

function SH_ACC:ShowBuyMenu()
	if (IsValid(_SH_ACC_BUYMENU)) then
		_SH_ACC_BUYMENU:Remove()
	end

	local curcat
	local previewing

	local MySelf = LocalPlayer()
	scale = math.Clamp(ScrH() / 1080, 0.7, 1)
	self:CreateFonts(scale)

	local wi, he = 1100 * scale, 800 * scale

	local title = L"accessory_vendor"
	local swep = MySelf:SH_HasAccessoryChanger()
	if (!MySelf:SH_NearAccessoryVendor() and swep) then
		title = swep:GetPrintName()
	end
	
	local frame = self:MakeFrame(title)
	frame:SetSize(wi, he)
	frame:Center()
	frame:MakePopup()
	if (self.DrawBackgroundBlur) then
		frame.m_fCreateTime = SysTime()
	end
	frame.OnClose = function(me)
		if (previewing) then
			if (!MySelf:SH_HasAccessoryEquipped(previewing[1])) then
				MySelf:SH_RemoveAccessory(previewing[1])
			end
			previewing = nil
		end

		if (IsValid(_SH_ACC_MENU)) then
			_SH_ACC_MENU:Remove()
		end
		if (IsValid(_SH_ACC_CONFIRM)) then
			_SH_ACC_CONFIRM:Remove()
		end
		if (IsValid(_SH_ACC_ADJUST_MENU)) then
			_SH_ACC_ADJUST_MENU:QuickSave()
			_SH_ACC_ADJUST_MENU:Remove()
		end
	end
	frame.m_bEscaping = false
	frame.Think = function(me)
		if (input.IsKeyDown(KEY_ESCAPE)) then
			if (frame.m_bEscaping) then
				return end

			frame.m_bEscaping = true

			gui.HideGameUI()
			timer.Simple(0, function()
				gui.HideGameUI()
			end)

			local focus = vgui.GetKeyboardFocus()
			if (IsValid(focus) and focus:GetName() == "DTextEntry") then
				focus:KillFocus()
				TextEntryLoseFocus()
				return
			end

			me:Close()
		else
			frame.m_bEscaping = false
		end
	end
	_SH_ACC_BUYMENU = frame

		local body = vgui.Create("DPanel", frame)
		body:SetDrawBackground(false)
		body:Dock(FILL)

			local contents = vgui.Create("DPanel", body)
			contents:SetDrawBackground(false)
			contents:SetWide(wi - th)
			contents:Dock(FILL)
			contents:DockPadding(m, m, m, m)
			contents.m_iBorder = m
			frame.m_Contents = contents

				local ilist = vgui.Create("DScrollPanel", contents)
				self:PaintScroll(ilist)
				ilist:StretchToParent(0, 0, 0, 0)
				ilist:Dock(FILL)
				ilist.Think = function()
					local hover = vgui.GetHoveredPanel()
					if (IsValid(hover) and hover.m_Accessory and !frame.m_bClosing) then
						if (!MySelf:SH_HasAccessoryEquipped(hover.m_Accessory.id)) then
							if (previewing and !MySelf:SH_HasAccessoryEquipped(previewing[1])) then
								MySelf:SH_RemoveAccessory(previewing[1])
							end

							previewing = {hover.m_Accessory.id, hover.m_Accessory.slots}
							local cs = MySelf:SH_AddAccessory(previewing[1], true)
							if (IsValid(cs)) then
								_SH_ACC_BUYMENU.m_PreviewModel = cs
							end
						end
					else
						if (previewing) then
							if (MySelf:SH_HasAccessoryEquipped(previewing[1])) then
								previewing = nil
							else
								MySelf:SH_RemoveAccessory(previewing[1])
								previewing = nil
							end
						end
					end

					_SH_ACC_BUYMENU.m_Previewing = previewing
				end

			local function AddAccessoryPanel(acc, title, slot)
				local ph = 64 * scale + (title and (16 * scale + m5) or 0)

				local pnl = vgui.Create("DPanel", ilist)
				pnl:SetDrawBackground(false)
				pnl:SetTall(ph)
				pnl:Dock(TOP)
				pnl:DockMargin(0, 0, 0, m5)

					local function DrawBG(me, w, h, col)
						if (me.m_QuickSwitch) then
							draw.RoundedBoxEx(4, 0, 0, w, h, col, true, true, false, false)
						else
							draw.RoundedBox(4, 0, 0, w, h, col)
						end
					end

					local btnbody = vgui.Create("DButton", pnl)
					btnbody:SetText("")
					btnbody:Dock(FILL)
					btnbody:DockPadding(m5, m5, m5, m5)
					btnbody.Paint = function(me, w, h)
						DrawBG(me, w, h, C"inbg")

						if (me.Hovered) then
							DrawBG(me, w, h, C"hover")
						end

						if (me:IsDown()) then
							DrawBG(me, w, h, C"hover")
						end
					end

						-- overview accpnl
						if (title) then
							local lbl = self:Label(L(title), "SH_ACC.MediumB", C"text", btnbody)
							lbl:Dock(TOP)
							lbl:DockMargin(0, 0, 0, m5)
							pnl.m_Title = lbl
						else -- shop category accpnl: can preview
							pnl.m_Accessory = acc
							btnbody.m_Accessory = pnl.m_Accessory
						end

						local itm = vgui.Create("DPanel", btnbody)
						itm:SetDrawBackground(false)
						itm:SetMouseInputEnabled(false)
						itm:Dock(FILL)

							local bg = vgui.Create("DPanel", itm)
							bg:Dock(LEFT)
							bg.Think = function(me)
								me:SetWide(itm:GetTall())
							end
							bg.Paint = frame.Paint

								if (acc) then
									SH_ACC:CreateAccIcon(acc, bg)
								end

							local lbl = self:Label(acc and acc.name or L"none", "SH_ACC.LargeB", C"text", itm)
							lbl:SetContentAlignment(title and 5 or 7)
							lbl:Dock(title and FILL or TOP)
							lbl:DockMargin(m5, 0, 0, 0)

							local textlbl
							if (acc and !title) then
								local lbls = vgui.Create("DPanel", itm)
								lbls:SetDrawBackground(false)
								lbls:SetTall(draw.GetFontHeight("SH_ACC.Medium"))
								lbls:Dock(TOP)
								lbls:DockMargin(m5, 0, 0, 0)

									local lbl = self:Label("", "SH_ACC.Medium", col, lbls)
									lbl:Dock(LEFT)
									lbl.Update = function(me)
										local tx = acc.price > 0 and SH_ACC.formatMoney(acc.price * MySelf:SH_GetAccessoryPurchaseFrac()) or L"free"
										local col = SH_ACC.CanAfford(LocalPlayer(), acc.price * MySelf:SH_GetAccessoryPurchaseFrac()) and C"can_afford" or C"cant_afford"

										if (MySelf:SH_HasAccessory(acc.id)) then
											local eq = MySelf:SH_HasAccessoryEquipped(acc.id)
											tx = eq and L"equipped" or L"possessed"
											col = eq and C"equipped" or C"possessed"
										end

										me:SetText(tx)
										me:SetTextColor(col)
										me:SizeToContents()
									end
									textlbl = lbl

									if (acc.canPurchase or acc.usergroups or acc.steamids) then
										local lbl = self:Label(" - " .. L"restricted", "SH_ACC.Medium", C"restricted", lbls)
										lbl:Dock(LEFT)
									end

									if (acc.jobs or acc.jobsexclude) then
										local lbl = self:Label(" - " .. L"job_specific", "SH_ACC.Medium", C"restricted", lbls)
										lbl:Dock(LEFT)
									end

								-- slot text
								local t = {}
								for sl, tx in SortedPairs (self.SlotText) do
									if (bit.band(acc.slots, sl) > 0) then
										table.insert(t, L(tx))
									end
								end

								if (#t > 1) then
									local lbl = self:Label(L("this_accessory_covers_x", table.concat(t, ", ")), "SH_ACC.Medium", C"text", itm)
									lbl:Dock(TOP)
									lbl:DockMargin(m5, 0, 0, 0)
								end
							end

					btnbody.DoClick = function(me, rmb)
						if (title and !rmb) then
							if (me.m_bQuickSwitchAnim) then
								return end

							me.m_bQuickSwitchAnim = true

							local b = !me.m_bQuickSwitching
							me.m_bQuickSwitching = b

							me:Dock(TOP)
							pnl:Stop()
							pnl:SizeTo(pnl:GetWide(), b and (ph + m5 * 3 + 48 * scale + 20 * scale) or ph, 0.2, nil, nil, function()
								me.m_bQuickSwitchAnim = false

								if (!b) then
									if (IsValid(me.m_QuickSwitch)) then
										me.m_QuickSwitch:Remove()
									end
									me.m_QuickSwitch = nil

									-- die
									timer.Simple(0, function()
										if (IsValid(me)) then
											me:Dock(FILL)
										end
									end)
								end
							end)

							if (b) then
								if (IsValid(me.m_QuickSwitch)) then
									me.m_QuickSwitch:Remove()
								end

								local p = vgui.Create("DPanel", pnl)
								p:Dock(FILL)
								p:DockPadding(m5, m5, m5, m5)
								p.Paint = function(me, w, h)
									draw.RoundedBoxEx(4, 0, 0, w, h, C"inbg", false, false, true, true)
								end
								me.m_QuickSwitch = p

									local scroll = vgui.Create("DScrollPanel", p)
									SH_ACC:PaintScroll(scroll)
									scroll:Dock(FILL)

										local ilist = vgui.Create("DIconLayout", scroll)
										ilist:SetSpaceX(m5)
										ilist:SetSpaceY(m5)
										ilist:Dock(FILL)

									local deftext = L"quick_switch"

									local name = vgui.Create("DPanel", p)
									name:SetTall(20 * scale)
									name:Dock(BOTTOM)
									name.Paint = function(me, w, h)
										draw.RoundedBox(4, 0, 0, w, h, C"bg")
										draw.SimpleText(me.m_sText, "SH_ACC.Medium", w * 0.5, h * 0.5, C"text", TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
									end
									name.m_sText = deftext

									-- Take off
									local takeoff = vgui.Create("DButton", ilist)
									takeoff:SetText("")
									takeoff:SetSize(32 * scale, 32 * scale)
									takeoff.Paint = function(me, w, h)
										DrawBG(me, w, h, C"bg")

										if (me.Hovered) then
											DrawBG(me, w, h, C"hover")
										end

										if (me:IsDown()) then
											DrawBG(me, w, h, C"hover")
										end
									end
									takeoff.OnCursorEntered = function(me)
										name.m_sText = L"unequip"
									end
									takeoff.OnCursorExited = function(me)
										name.m_sText = deftext
									end
									takeoff.DoClick = function(me)
										self:ChangeEquipment(acc.id, false)
									end
									takeoff:SetVisible(acc ~= nil)

										local img = vgui.Create("DPanel", takeoff)
										img:SetMouseInputEnabled(false)
										img:Dock(FILL)
										img.Paint = function(me, w, h)
											surface.SetDrawColor(C"text")
											surface.SetMaterial(matStop)
											surface.DrawTexturedRectRotated(w * 0.5, h * 0.5, 16 * scale, 16 * scale, 0)
										end

									-- Actual accessories
									for accid in SortedPairs (MySelf.SH_AccessoryInfo.inventory) do
										if (acc and acc.id == accid) then
											continue end

										local acc2 = SH_ACC:GetAccessory(accid)
										if (acc2 and bit.band(acc2.slots, slot) > 0) then
											local bg = vgui.Create("DButton", ilist)
											bg:SetText("")
											bg:SetSize(32 * scale, 32 * scale)
											bg.Paint = takeoff.Paint
											bg.OnCursorEntered = function(me)
												name.m_sText = acc2.name
											end
											bg.OnCursorExited = takeoff.OnCursorExited
											bg.DoClick = function(me)
												self:ChangeEquipment(accid, true)
											end
											bg.m_Accessory = acc2 -- Hover

												local mdl = SH_ACC:CreateAccIcon(acc2, bg)
												mdl:SetMouseInputEnabled(false)
										end
									end
							end
						elseif (acc) then
							local m = SH_ACC:Menu()

							local haveitem = MySelf:SH_HasAccessory(acc.id)
							if (title) or (haveitem) then
								if (haveitem and MySelf:SH_HasAccessoryEquipped(acc.id)) then
									m:AddOption(L"adjust", function()
										self:ShowAdjustMenu(acc, contents, ilist)
									end)

									local mdl = acc.mdl
									if (MySelf.SH_AccessoryAdjust and MySelf.SH_AccessoryAdjust[mdl]) then
										m:AddOption(L"reset_adjustments", function()
											MySelf:SH_ResetAdjustments(mdl)
										end)
									end

									m:AddOption(L"unequip", function()
										self:ChangeEquipment(acc.id, false)
									end)
								else
									m:AddOption(L"equip", function()
										self:ChangeEquipment(acc.id, true)
									end)
								end

								if (MySelf:SH_CanSellAccessories() and MySelf:SH_NearAccessoryVendor()) then
									m:AddOption(L"sell", function()
										SH_ACC:ShowConfirmMenu("confirm_action", {"sell_confirm", acc.name, SH_ACC.formatMoney(math.Round(acc.price * MySelf:SH_GetAccessorySellFrac()))}, function()
											net.Start("SH_ACC_SELL")
												net.WriteString(acc.id)
											net.SendToServer()

											surface.PlaySound("ambient/levels/labs/coinslot1.wav")
										end)
									end)
								end
							else
								if (!MySelf:SH_HasAccessory(acc.id) and MySelf:SH_NearAccessoryVendor()) then
									m:AddOption(L"purchase" .. " (" .. SH_ACC.formatMoney(acc.price * MySelf:SH_GetAccessoryPurchaseFrac()) .. ")", function()
										SH_ACC:ShowConfirmMenu("confirm_action", {"buy_confirm", acc.name, SH_ACC.formatMoney(acc.price * MySelf:SH_GetAccessoryPurchaseFrac())}, function()
											net.Start("SH_ACC_PURCHASE")
												net.WriteString(acc.id)
											net.SendToServer()

											surface.PlaySound("ambient/levels/labs/coinslot1.wav")
										end)
									end)
								end
							end

							m:Open()
						end
					end
					btnbody.DoRightClick = function(me)
						me:DoClick(true)
					end

				pnl.Think = function()
					if (acc and textlbl) then
						textlbl:Update()
					end
				end

				return pnl
			end

			local overv = false

			contents.RefreshOverview = function(me, refresh)
				if (refresh and !overv) then
					return end

				overv = true

				if (IsValid(_SH_ACC_ADJUST_MENU)) then
					_SH_ACC_ADJUST_MENU:Close()
				end

				if (IsValid(_SH_ACC_POPULATE_DUMMY)) then
					_SH_ACC_POPULATE_DUMMY:Remove()
				end

				timer.Destroy("_SH_ACC_POPULATE_LIST")

				if (IsValid(contents.m_SearchBar)) then
					contents.m_SearchBar:Remove()
				end

				ilist:Clear()

				-- Show acc count if need be
				local limit = MySelf:SH_GetAccessoryLimit()
				if (limit > 0) then
					local num = MySelf:SH_GetNumEquippedAccessories()

					local pnl = vgui.Create("DPanel", ilist)
					pnl:Dock(TOP)
					pnl:DockMargin(0, 0, 0, m5)
					pnl.Paint = function(me, w, h)
						draw.RoundedBox(4, 0, 0, w, h, C"inbg")
					end

						local lbl = self:Label(L"accessory_limit" .. ": " .. num .. "/" .. limit, "SH_ACC.Medium", num >= limit and C"cant_afford" or C"text", pnl)
						lbl:SetContentAlignment(5)
						lbl:Dock(FILL)
				end

				-- Build category pnls
				local notadded = table.Copy(self.SlotText)

				local toadd = {}
				for id, cs in pairs (MySelf.SH_AccessoryInfo.equipped) do
					local acc = self:GetAccessory(id)
					if (!acc) then
						continue end

					for sl, tx in pairs (self.SlotText) do
						if (bit.band(acc.slots, sl) > 0) then
							toadd[sl] = id
						end
					end
				end

				local pnls = {}
				for sl, id in pairs (notadded) do
					local cls = toadd[sl]
					if (cls) then
						if (!pnls[cls]) then
							pnls[cls] = AddAccessoryPanel(self:GetAccessory(cls), id, sl)
						else
							local lbl = pnls[cls].m_Title
							if (IsValid(lbl)) then
								lbl:SetText(lbl:GetText() .. ", " .. L(id))
							end
						end
					else
						AddAccessoryPanel(nil, id, sl)
					end
				end
			end
			contents.RefreshCategory = function(me, slot)
				overv = false

				if (IsValid(_SH_ACC_ADJUST_MENU)) then
					_SH_ACC_ADJUST_MENU:Close()
				end

				if (IsValid(_SH_ACC_POPULATE_DUMMY)) then
					_SH_ACC_POPULATE_DUMMY:Remove()
				end

				timer.Destroy("_SH_ACC_POPULATE_LIST")

				ilist:Clear()
				ilist.VBar:SetScroll(0)

				local itemz = {}
				local function PopulateList(slot, filter)
					if (IsValid(_SH_ACC_POPULATE_DUMMY)) then
						_SH_ACC_POPULATE_DUMMY:Remove()
					end

					timer.Destroy("_SH_ACC_POPULATE_LIST")

					for _, v in pairs (itemz) do
						if (IsValid(v)) then
							v:Remove()
						end
					end

					--
					if (filter == "") then
						filter = nil
					end

					local toadd = {}
					local delayed = {}
					for id, acc in SortedPairsByMemberValue (self.List, "name") do
						if not (bit.band(acc.slots, slot) > 0) then
							continue end

						if (filter and !string.find(acc.name:lower(), filter)) then
							continue end

						-- Don't delay population if searching
						table.insert((!filter and #toadd >= 10) and delayed or toadd, acc)
					end

					for _, acc in pairs (toadd) do
						table.insert(itemz, AddAccessoryPanel(acc))
					end

					if (#delayed > 0) then
						-- Add a dummy panel to fool the scrollbar..!
						local dummy = vgui.Create("DPanel", ilist)
						dummy:SetDrawBackground(false)
						dummy:SetTall(64 * scale * #delayed)
						dummy:Dock(TOP)
						_SH_ACC_POPULATE_DUMMY = dummy

						-- This is probably the ugliest thing alive to avoid a potential freeze when loading up big lists
						-- but it WORKS
						timer.Create("_SH_ACC_POPULATE_LIST", 0.01, 0, function()
							if (#delayed <= 0 or !IsValid(_SH_ACC_BUYMENU)) then
								timer.Destroy("_SH_ACC_POPULATE_LIST")
								if (IsValid(dummy)) then
									for _, v in pairs (dummy:GetChildren()) do
										if (IsValid(v) and IsValid(ilist)) then
											v:SetParent(ilist)
										end
									end

									dummy:Remove()
								end

								return
							end

							for i = 1, 3 do
								if (#delayed <= 0) then
									return end

								local acc = table.remove(delayed, 1)
								local pnl = AddAccessoryPanel(acc)
								pnl:SetParent(dummy)
								table.insert(itemz, pnl)
							end
						end)
					end
				end

				-- Search bar
				if (IsValid(contents.m_SearchBar)) then
					contents.m_SearchBar:Remove()
				end

				local pnl = vgui.Create("DPanel", contents)
				pnl:SetTall(24 * scale + m5 * 2)
				pnl:Dock(TOP)
				pnl:DockMargin(0, 0, 0, m5)
				pnl:DockPadding(m5, m5, m5, m5)
				pnl.Paint = function(me, w, h)
					draw.RoundedBox(4, 0, 0, w, h, C"inbg")
				end
				contents.m_SearchBar = pnl

					local tent = self:TextEntry(pnl)
					tent:SetText(filter or "")
					tent:Dock(FILL)
					tent.Paint = function(me, w, h)
						draw.RoundedBox(4, 0, 0, w, h, C"bg")

						surface.SetDrawColor(me:GetTextColor())
						surface.SetMaterial(matSearch)
						surface.DrawTexturedRect(w - 16 * scale - 2, h * 0.5 - 8 * scale, 16 * scale, 16 * scale)

						if (me:GetText() == "" and !me:HasFocus()) then
							draw.SimpleText(L"search" .. ".. " .. (self.DisableKeyShortcuts and "" or "(Ctrl+F)"), me:GetFont(), 2, h * 0.5, me:GetTextColor(), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
						else
							draw.RoundedBox(4, 0, 0, w, h, C"hover")
							me:DrawTextEntryText(me:GetTextColor(), me:GetHighlightColor(), me:GetCursorColor())
						end
					end
					tent.OnChange = function(me)
						local tx = me:GetValue():lower():Trim()
						PopulateList(slot, tx)
					end
					if (!self.DisableKeyShortcuts) then
						tent.Think = function(me)
							if (input.IsKeyDown(KEY_LCONTROL) or input.IsKeyDown(KEY_RCONTROL)) and (input.IsKeyDown(KEY_F)) then
								if (me:HasFocus()) then
									me:SelectAllText()
								else
									me:RequestFocus()
								end
							end
						end
					end

				-- The hats
				PopulateList(slot)
			end

			local mdlpanel = vgui.Create("DPanel", body)
			mdlpanel:SetWide(wi * 0.35)
			mdlpanel:Dock(RIGHT)
			mdlpanel:DockMargin(0, m, m, m)
			mdlpanel.Paint = function(me, w, h)
				draw.RoundedBox(4, 0, 0, w, h, C"inbg")
			end

				local mdl = vgui.Create("DModelPanel", mdlpanel)
				mdl:SetModel(MySelf.m_sServerModel or MySelf:GetModel())
				mdl:SetCamPos(Vector(mdlcam_pos:GetString()))
				mdl:SetLookAt(Vector(mdlcam_lookat:GetString()))
				mdl.Entity:SetAngles(Angle(0, mdlcam_ang:GetInt(), 0))
				mdl:SetFOV(mdlcam_fov:GetInt())
				mdl:Dock(FILL)
				mdl.LayoutEntity = function() end
				mdl.PostDrawModel = function(me, ent)
					self:DrawAccessories(ent, MySelf)
				end
				mdl.m_iX = 0
				mdl.m_iY = 0
				mdl.PaintOver = function(me, w, h)
					if (me.m_bCursorIn) then
						local c = table.Copy(C"text")
						c.a = (me.m_bDragging or me.m_bZooming or me.m_bMoving) and c.a * 0.5 or c.a

						local f = "SH_ACC.Medium"
						local fh = draw.GetFontHeight(f)
						draw.SimpleText(L"left_click_help", f, m5, m5, c)
						draw.SimpleText(L"right_click_help", f, m5, m5 + fh, c)
						draw.SimpleText(L"middle_click_help", f, m5, m5 + fh * 2, c)
					end
				end
				mdl.Think = function(me)
					if (me.m_bDragging and !input.IsMouseDown(MOUSE_LEFT)) then
						me.m_bDragging = false
					end

					if (me.m_bZooming and !input.IsMouseDown(MOUSE_RIGHT)) then
						me.m_bZooming = false
					end

					if (me.m_bMoving and !input.IsMouseDown(MOUSE_MIDDLE)) then
						me.m_bMoving = false
					end

					-- Save camera pos
					if (me.m_fNextSave and RealTime() >= me.m_fNextSave) then
						RunConsoleCommand("sh_acc_campos", tostring(me:GetCamPos()))
						RunConsoleCommand("sh_acc_lookat", tostring(me:GetLookAt()))
						RunConsoleCommand("sh_acc_fov", tostring(me:GetFOV()))
						RunConsoleCommand("sh_acc_angle", tostring(me.Entity:GetAngles()[2]))
						me.m_fNextSave = nil
					end
				end
				mdl.OnMousePressed = function(me, mc)
					if (mc == MOUSE_LEFT) then
						me.m_bDragging = true
						me.m_iX = gui.MouseX()
					elseif (mc == MOUSE_RIGHT) then
						me.m_bZooming = true
						me.m_iY = gui.MouseY()
					elseif (mc == MOUSE_MIDDLE) then
						me.m_bMoving = true
						me.m_iX = gui.MouseX()
						me.m_iY = gui.MouseY()
					end
				end
				mdl.OnCursorMoved = function(me)
					local ang = me.Entity:GetAngles()
					local modif = me.m_bDragging or me.m_bZooming or me.m_bMoving

					if (me.m_bDragging) then
						local mx = gui.MouseX()
						local xdif = mx - me.m_iX

						me.m_iX = mx
						me.Entity:SetAngles(Angle(0, (ang[2] + xdif * 0.5) % 360, 0))
					end

					if (me.m_bZooming) then
						local my = gui.MouseY()
						local ydif = my - me.m_iY

						me.m_iY = my
						me:SetFOV(math.Clamp(me:GetFOV() + ydif * 0.33, 5, 100))
					end

					if (me.m_bMoving) then
						local mx, my = gui.MousePos()
						local xdif = mx - me.m_iX
						local ydif = my - me.m_iY
						local cp = me:GetCamPos()
						local la = me:GetLookAt()

						me.m_iX = mx
						me.m_iY = my
						me:SetCamPos(Vector(cp.x + xdif * 0.1, cp.y, cp.z + ydif * 0.15))
						me:SetLookAt(Vector(la.x + xdif * 0.1, la.y, la.z + ydif * 0.15))
					end

					if (modif) then
						me.m_fNextSave = RealTime() + 0.1
					end

					me.m_bCursorIn = true
				end
				mdl.OnCursorExited = function(me)
					local mx, my = gui.MousePos()

					if (me.m_bDragging or me.m_bZooming or me.m_bMoving) then
						local rx, ry = me:ScreenToLocal(mx, my)
						if (rx <= 0) then
							rx, ry = me:LocalToScreen(me:GetWide(), 0)
							input.SetCursorPos(rx, my)
							me.m_iX = rx
						elseif (rx >= me:GetWide()) then
							rx, ry = me:LocalToScreen(0, 0)
							input.SetCursorPos(rx, my)
							me.m_iX = rx
						end

						local rx, ry = me:ScreenToLocal(mx, my)
						if (ry <= 0) then
							rx, ry = me:LocalToScreen(0, me:GetTall())
							input.SetCursorPos(mx, ry)
							me.m_iY = ry
						elseif (ry >= me:GetTall()) then
							rx, ry = me:LocalToScreen(0, 0)
							input.SetCursorPos(mx, ry)
							me.m_iY = ry
						end
					end

					me.m_bCursorIn = false
				end
				mdl.OnMouseReleased = function(me, mc)
					if (mc == MOUSE_LEFT) then
						me.m_bDragging = false
					elseif (mc == MOUSE_RIGHT) then
						me.m_bZooming = false
					elseif (mc == MOUSE_MIDDLE) then
						me.m_bMoving = false
					end
				end

			local toggled = cookie.GetNumber("SH_ACC.NavBarOff", 0) == 0

			local navbar = vgui.Create("DPanel", body)
			navbar:SetWide(toggled and th * 3 or th)
			navbar:Dock(LEFT)
			navbar:DockPadding(0, th, 0, 0)
			navbar.Paint = mdlpanel.Paint

				local togglenavbar = vgui.Create("DButton", navbar)
				togglenavbar:SetText("")
				togglenavbar:SetToolTip(L"toggle")
				togglenavbar:SetSize(th, th)
				togglenavbar.Paint = function(me, w, h)
					surface.SetDrawColor(C"text")
					surface.SetMaterial(matList)
					surface.DrawTexturedRectRotated(w * 0.5, h * 0.5, 24 * scale, 24 * scale, 0)
				end
				togglenavbar.DoClick = function()
					toggled = !toggled
					cookie.Set("SH_ACC.NavBarOff", toggled and 0 or 1)

					navbar:Stop()
					navbar:SizeTo(toggled and th * 3 or th, -1, 0.1, 0, 0.2)
				end

				local cats = {}
				local function AddCategory(text, icon, callback, i)
					local tx = L(text)

					local btn = vgui.Create("DButton", navbar)
					btn:SetText("")
					btn:SetToolTip(tx)
					btn:SetTall(th)
					btn:Dock(TOP)
					btn.Paint = function(me, w, h)
						if (me.Hovered) then
							surface.SetDrawColor(C"hover")
							surface.DrawRect(0, 0, w, h)
						end

						if (me:IsDown()) then
							surface.SetDrawColor(C"hover")
							surface.DrawRect(0, 0, w, h)
						end

						surface.SetDrawColor(C"text")
						surface.SetMaterial(icon)
						surface.DrawTexturedRectRotated(24 * scale, 24 * scale, 24 * scale, 24 * scale, 0)

						if (i and curcat == i) then
							surface.SetDrawColor(C"header")
							surface.DrawRect(0, 0, th * 0.1, h)
						end
					end
					btn.DoClick = function(me)
						callback(me)
					end
					btn.m_sText = tx

						local lbl = self:Label(tx, "SH_ACC.Medium", C"text", btn)
						lbl:Dock(LEFT)
						lbl:DockMargin(th, 0, 0, 0)

					cats[#cats + 1] = btn

					return btn
				end

				AddCategory("overview", Material("shenesis/accessory/user.png", "noclamp smooth"), function(me)
					contents:RefreshOverview()

					--
					curcat = 0
					frame:SetTitle(title .. " - " .. me.m_sText)
				end, 0):DoClick()

				for i, cat in ipairs (self.ShopCategories) do
					AddCategory(cat.text, cat.icon, function(me)
						contents:RefreshCategory(cat.slot)

						--
						curcat = i
						frame:SetTitle(title .. " - " .. me.m_sText)
					end, i)
				end

				if (!self.DisableInfoTab) then
					local cachedworkshop = {}

					AddCategory("info", Material("shenesis/accessory/info.png", "noclamp smooth"), function(me)
						if (IsValid(_SH_ACC_ADJUST_MENU)) then
							_SH_ACC_ADJUST_MENU:Close()
						end

						if (IsValid(contents.m_SearchBar)) then
							contents.m_SearchBar:Remove()
						end

						ilist:Clear()

						local lbl = self:Label("SH Accessories " .. _SH_ACC_VERSION, "SH_ACC.LargestB", C"text", ilist)
						lbl:Dock(TOP)

						local lbl = self:Label("by Shendow", "SH_ACC.LargerB", C"text", ilist)
						lbl:Dock(TOP)

						local lbl = self:Label("Enabled add-ons:", "SH_ACC.LargeB", C"text", ilist)
						lbl:Dock(TOP)
						lbl:DockMargin(0, m, 0, 0)

						for id, b in pairs (SH_ACC.Addons) do
							if (!b) then
								continue end

							local lbl = self:Label("[" .. id .. "]", "SH_ACC.Medium", C"text", ilist)
							lbl:SetMouseInputEnabled(true)
							lbl:Dock(TOP)

								local btn = vgui.Create("DButton", lbl)
								btn:SetText("")
								btn:Dock(FILL)
								btn.Paint = function() end
								btn.DoClick = function(me)
									steamworks.ViewFile(tonumber(id))
								end

							if (cachedworkshop[id]) then
								lbl:SetText("- " .. cachedworkshop[id])
							else
								steamworks.FileInfo(tonumber(id), function(result)
									if (result and IsValid(lbl)) then
										lbl:SetText("- " .. result.title)
										cachedworkshop[id] = result.title
									end
								end)
							end
						end

						local cnt = table.Count(self.List)

						local lbl = self:Label("Number of accessories registered: " .. cnt, "SH_ACC.LargeB", cnt <= 0 and C"cant_afford" or C"text", ilist)
						lbl:Dock(TOP)
						lbl:DockMargin(0, m, 0, 0)

						local valid = 0
						for id in pairs (MySelf.SH_AccessoryInfo.inventory) do
							if (self:GetAccessory(id)) then
								valid = valid + 1
							end
						end

						local lbl = self:Label("You have: " .. valid .. "/" .. table.Count(self.List) .. " accessories", "SH_ACC.LargeB", C"text", ilist)
						lbl:Dock(TOP)

						local lbl = self:Label("Google", "SH_ACC.LargeB", C"header", ilist)
						lbl:SetMouseInputEnabled(true)
						lbl:Dock(TOP)
						lbl:DockMargin(0, m, 0, 0)

							local btn = vgui.Create("DButton", lbl)
							btn:SetText("")
							btn:Dock(FILL)
							btn.Paint = function() end
							btn.DoClick = function(me)
								gui.OpenURL("https://www.google.com/")
							end

						--
						curcat = 999
						frame:SetTitle(title .. " - " .. L"info")
					end, 999)
				end

			if (!self.DisableKeyShortcuts) then
				local tabbing = false
				local pressing = false
				navbar.Think = function()
					if (input.IsKeyDown(KEY_TAB)) then
						if (!tabbing) then
							tabbing = true
							togglenavbar:DoClick()
						end
					else
						tabbing = false
					end

					if not (pressing and input.IsKeyDown(pressing)) then
						pressing = false

						for id, btn in pairs (cats) do
							local key = _G["KEY_" .. id]
							if (!key) then
								continue end

							if (input.IsKeyDown(key)) then
								pressing = key
								btn:DoClick()
								return
							end
						end
					end
				end
			end

	frame:SetAlpha(0)
	frame:AlphaTo(255, 0.1)
end