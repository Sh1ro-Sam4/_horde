local col = CFG.theme

local PANEL = {}

function PANEL:Init()
    self.BarScale = 2
    self.Color = col.focus
end

function PANEL:OnMousePressed()
    self:GetParent():Grip(1)
end

function PANEL:Think()
    if self:IsHovered()  or self:GetParent().Dragging then
        self.BarScale = Lerp(FrameTime() * 10, self.BarScale, self:GetWide())
    else
        self.BarScale = Lerp(FrameTime() * 10, self.BarScale, 6)
    end

    if self:GetParent().Dragging then
        self.Color = shizlib.surface.LerpColor(FrameTime() * 10, col.accent, col.focus)
    else
        self.Color = shizlib.surface.LerpColor(FrameTime() * 10, col.focus, col.accent)
    end
end

function PANEL:Paint(w, h)
    draw.RoundedBox (self.BarScale * .5, w-self.BarScale, 0, self.BarScale, h, self.Color)
end

derma.DefineControl('SHZScrollBarGrip', '', PANEL, 'DPanel')