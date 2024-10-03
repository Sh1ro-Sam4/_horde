function SH_ACC:Notify(acc, text, duration)
	if (IsValid(_SH_ACC_NOTIFY)) then
		_SH_ACC_NOTIFY:Remove()
	end

	local scale = math.Clamp(ScrH() / 1080, 0.7, 1)
	local wi, he = 400 * scale, 64 * scale

	local th = 48 * scale
	local m = th * 0.25
	local m5 = m * 0.5
	he = he + m5 * 2

	local pnl = vgui.Create("DButton")
	pnl:SetText("")
	pnl:MoveToFront()
	pnl:SetSize(wi, he)
	pnl:SetPos(ScrW(), ScrH() * 0.7)
	pnl:MoveTo(ScrW() - wi, pnl.y, 0.2, 0, 0.99)
	pnl:DockPadding(m5, m5, m5, m5)
	pnl.DoClick = function(me)
		me.DoClick = function() end
		me:Stop()
		me:AlphaTo(0, 0.2, 0, function()
			me:Remove()
		end)
	end
	pnl.Paint = function(me, w, h)
		draw.RoundedBoxEx(4, 0, 0, w, h, self.Style.header, true, false, true, false)
	end
	_SH_ACC_NOTIFY = pnl

	pnl:AlphaTo(0, 0.2, duration > 0 and duration or 5, function()
		pnl:Remove()
	end)

		if (acc) then
			local bg = vgui.Create("DPanel", pnl)
			bg:Dock(LEFT)
			bg:DockMargin(0, 0, m5, 0)
			bg.Paint = function(me, w, h)
				draw.RoundedBox(4, 0, 0, w, h, self.Style.inbg)
			end

				local mdl = self:CreateAccIcon(acc, bg)
				mdl:SetMouseInputEnabled(false)
		end

		local lbl = self:Label(text, "SH_ACC.Large", self.Style.text, pnl)
		lbl:SetContentAlignment(7)
		lbl:SetWrap(true)
		lbl:Dock(FILL)

		if (duration > 0) then
			local start = CurTime()
			local endtime = start + duration

			local timebar = vgui.Create("DPanel", pnl)
			timebar:SetTall(m5)
			timebar:Dock(BOTTOM)
			timebar:DockMargin(0, m5, 0, 0)
			timebar.Paint = function(me, w, h)
				local tl = (endtime - CurTime()) / (endtime - start)

				draw.RoundedBox(4, 0, 0, w, h, self.Style.bg)
				draw.RoundedBox(4, 0, 0, w * tl, h, self.Style.menu)
			end
		end
end

net.Receive("SH_ACC_NOTIFY", function()
	SH_ACC:Notify(SH_ACC:GetAccessory(net.ReadString()), net.ReadString(), net.ReadUInt(16))
end)