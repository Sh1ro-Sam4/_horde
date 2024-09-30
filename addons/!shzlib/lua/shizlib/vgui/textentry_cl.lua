local PANEL = {}

surface.CreateFont('shz-textebry-text', {
    font = 'Roboto',
    extended = true,
    size = 16,
})

function PANEL:Init()
	self:SetDrawBorder(false)
	self:SetDrawBackground(false)
	self:SetTextColor(color_white)
	self:SetFont('shz-textebry-text')
	self:SetCursorColor(color_black)
	self:SetHighlightColor(CFG.theme.accent)

	self.IndicatorColor = Color(255, 255, 255)

	self:SetTooltipPanelOverride('SHZTooltip')
	self:SetTooltip(false)
end

function PANEL:IndicatorLayout()
	if self:HasFocus() then
		self.IndicatorColor = shizlib.surface.LerpColor(5 * FrameTime(), self.IndicatorColor, CFG.theme.focus)
	else
		self.IndicatorColor = shizlib.surface.LerpColor(5 * FrameTime(), self.IndicatorColor, color_black)
	end
end

function PANEL:Paint(w,h)
	self:IndicatorLayout()

	draw.NoTexture()
	surface.SetDrawColor(self.IndicatorColor)
	surface.DrawLine(0, 5, 0, h - 6)
	surface.DrawLine(1, 7, 1, h - 8)
	surface.SetDrawColor(ColorAlpha(self.IndicatorColor, 127))
	surface.DrawLine(0, 4, 0, h - 5)
	surface.DrawLine(1, 5, 1, h - 6)
	draw.RoundedBox(6, 0, 0, w, h, CFG.theme.focus)

	derma.SkinHook('Paint', 'TextEntry', self, w, h)
end

derma.DefineControl('SHZTextEntry', '', PANEL, 'DTextEntry')