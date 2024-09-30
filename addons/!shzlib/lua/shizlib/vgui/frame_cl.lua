CreateClientConVar('shizlib_blur', '1', true, true)

surface.CreateFont('shz-frame-title', {
    font = 'Roboto',
    extended = true,
    size = 26,
})

surface.CreateFont('shz-frame-close', {
    font = 'Roboto',
    extended = true,
    size = 16,
})

local col = CFG.skinColors

local PANEL = {}

function PANEL:Init()
    self:SetSize(ScrW() / 2, ScrH() / 2)
    self:Center()
    
    self:SetAlpha(0)
    self:AlphaTo(255, .4, 0)

    self.Rounded = 4

    self.CloseButton = vgui.Create('DButton', self)
    self.CloseButton:SetText('')
    self.CloseButton.hvrStatus = 0
    self.CloseButton.Paint = function(a, w, h)
        if a:IsHovered() then
            a.hvrStatus = (a.hvrStatus + .05) > 1 and 1 or a.hvrStatus + .05
        else
            a.hvrStatus = (a.hvrStatus + .05) < 0 and 0 or a.hvrStatus - .05
        end
        draw.RoundedBox(self.Rounded, 0, 0, w, h, col.focus)
        draw.RoundedBox(self.Rounded, 0, 0, w * a.hvrStatus, h, col.accent)
        draw.SimpleText(utf8.char(0x274C), 'shz-frame-close', w/2, h/2, Color(255*a.hvrStatus,255*a.hvrStatus,255*a.hvrStatus), 1, 1)
    end
    self.CloseButton.DoClick = function(a)
        self:Close()
    end
end

function PANEL:SetRounded(num)
    self.Rounded = (num == nil and true or num) and 0 or 4
end

function PANEL:ShowCloseButton(val)
    if not val then
        self.CloseButton:Remove()
    end
end

function PANEL:Paint(w, h)
    draw.RoundedBox(self.Rounded, 0, 0, w, h, col.bg)
    draw.RoundedBoxEx(self.Rounded, 0, 0, w, 30, col.hvr, true, true, false, false)
end

function PANEL:SetTitle(text)
    self.Title = vgui.Create('DLabel', self)
    self.Title:SetTextColor(color_white)
    self.Title:SetText(text and text or '')
    self.Title:SetExpensiveShadow(1, ColorAlpha(color_white, 50))
    
    self.Title:SetFont('shz-frame-title')
end

function PANEL:Close()
    self:AlphaTo(0, 0.3, 0,  function(_,pnl)
        pnl:Remove()
    end)
end

function PANEL:PerformLayout()
    if IsValid(self.CloseButton) then
        self.CloseButton:SetSize(40, 20)
        self.CloseButton:SetPos(self:GetWide()-44, 5)
    end

    self.Title:Dock(TOP)
    self.Title:DockMargin(6, 2, 6, 2)
    self.Title:SizeToContents()
end

derma.DefineControl('SHZFrame', '', PANEL, 'EditablePanel')