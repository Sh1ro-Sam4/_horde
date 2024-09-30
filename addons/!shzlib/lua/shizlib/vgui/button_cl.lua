surface.CreateFont('shz-button-text', {
    font = 'Roboto',
    extended = true,
    size = 23,
})

local col = CFG.theme
local snd = CFG.skinSound

local PANEL = {}

function PANEL:Init()
    self:SetTooltipPanelOverride('SHZTooltip')

    self:SizeToContents()
    self:SetSize(self:GetWide() + 10, 36)

    self:DockMargin(3, 2, 3, 2)

    self:SetDoubleClickingEnabled(false)
    self:SetExpensiveShadow(1, ColorAlpha(color_black, 50))

    self.hvrStatus = 0
    self.Rounded = 4
    self.font = 'shz-button-text'

    self:SetFont(self.font)
    self:SetText('')
end

function PANEL:OnDepressed()
    surface.PlaySound(snd.press)
end

function PANEL:OnCursorEntered()
    if self:GetDisabled() then
        return
    end

    surface.PlaySound(snd.hover)
end

function PANEL:SetIcon(val)
    self.Icon = val
end

function PANEL:SetFont(val)
    self.font = val
end

function PANEL:SetRounded(val)
    self.Rounded = (val == nil and true or val) and 0 or 4
end

function PANEL:Paint(w, h)
    if not self.Text then self.Text = self:GetText() self:SetText('') end
    if self:IsHovered() then
        self.hvrStatus = (self.hvrStatus + .05) > 1 and 1 or self.hvrStatus + .05
    else
        self.hvrStatus = (self.hvrStatus - .05) < 0 and 0 or self.hvrStatus - .05
    end

    draw.RoundedBox(self.Rounded, 0, 0, w, h, col.focus)
    draw.RoundedBox(self.Rounded, 0, 0, w * self.hvrStatus, h, col.accent)
    if self.Icon then
        draw.SimpleText(self.Text, self.font, self:GetTall()+8, h/2, col.text, 0, 1)
        shizlib.surface.DTR(4, 4, self:GetTall()-8, self:GetTall()-8, color_white, self.Icon)
    else
        draw.SimpleText(self.Text, self.font, w/2, h/2, col.text, 1, 1)
    end
end


derma.DefineControl('SHZButton', '', PANEL, 'DButton')