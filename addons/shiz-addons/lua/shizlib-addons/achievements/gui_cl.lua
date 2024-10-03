shizlib.Achievements = shizlib.Achievements or {}

local s = shizlib.surface.s
local DTR = shizlib.surface.DTR

function shizlib.Achievements.Open(tbl)
    shizlib.Achievements.fr = vgui.Create('DFrame')
    shizlib.Achievements.fr:SetSize(s(450), s(120))
    shizlib.Achievements.fr:SetPos(s(-450), s(50))
    shizlib.Achievements.fr:SetTitle(tbl.name)
    shizlib.Achievements.fr:MoveTo(s(0), s(50), .4, 0, -1, function()
        surface.PlaySound(CFG.skinSound['achievements'])
        timer.Simple(7, function()
            if IsValid(shizlib.Achievements.fr) then
                shizlib.Achievements.fr:MoveTo(s(-450), s(50), .4, 0, -1, function()
                    shizlib.Achievements.fr:Close()
                end)
            end
        end)
    end)
    
    local pnl = shizlib.Achievements.fr:Add('Panel')
    pnl:Dock(FILL)
    function pnl:Paint(w, h)
        shizlib.surface.DrawRightRect(s(35), s(35), s(50), s(50), color_white, Material(tbl.icon))
        -- DTR(s(10), s(10), s(50), s(50), color_white, Material(tbl.icon))
    end

    local lbl =  shizlib.Achievements.fr:Add('DLabel')
    lbl:SetText(tbl.description)
    lbl:SetFont('font.20')
    lbl:SetTextColor(color_white) 
    lbl:Dock(FILL)
    lbl:DockMargin(s(10),s(10),s(10),s(10))
end

netstream.Hook('shizlib.Achievements',function(data)
    shizlib.Achievements.Open(data)
end)

shizlib.getURLMaterial('https://i.imgur.com/MnjGHpQ.png') // #death
shizlib.getURLMaterial('https://i.imgur.com/yqBVB77.png') // #kill
shizlib.getURLMaterial('https://i.imgur.com/doXsoqb.png') // #accessory
shizlib.getURLMaterial('https://i.imgur.com/zAaFDcH.png') // #craft
shizlib.getURLMaterial('https://i.imgur.com/lNDK0ML.png') // #purchase