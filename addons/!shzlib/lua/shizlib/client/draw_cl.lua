shizlib.draw = shizlib.draw or {}

function shizlib.draw.ShadowText(str, font, font_shadow, x, y, color, xalign, yalign)
    surface.SetFont(font)
    local w, h = surface.GetTextSize(str)
    x = (x or 0) - w * (xalign or 0)
    y = (y or 0) - h * (yalign or 0)
    surface.SetTextColor(color_black)
    surface.SetTextPos(x + 2, y + 2)
    surface.DrawText(str)
    surface.SetTextColor(color or color_white)
    surface.SetTextPos(x, y)
    surface.DrawText(str)

    return tw, th
end