/*
    https://github.com/XenPare/gmod-xpgui/blob/master/lua/xpgui/surface.lua
*/

shizlib.surface = shizlib.surface or {}

local scrW, scrH
local cos, sin, pi =  math.cos, math.sin, math.pi

--(1 - t) * from + t * to
function shizlib.surface.LerpColor(t, from, to)
	return Color(
		(1 - t) * from.r + t * to.r,
		(1 - t) * from.g + t * to.g,
		(1 - t) * from.b + t * to.b,
		(1 - t) * from.a + t * to.a
	)
end

function shizlib.surface.FormatTime(time)
    local s = time % 60
    time = math.floor(time / 60)
    local m = time % 60
    time = math.floor(time / 60)
    local h = time % 24
    time = math.floor(time / 24)
    local d = time % 7

    if d > 1 then
        return string.format("%iд %02iч %02iм", d, h, m)
    elseif d < 1 and h > 1 then
        return string.format("%02iч %02iм", h, m)
    elseif h < 1 and m > 1 and s > 0 then
        return string.format("%02iм %02iс", m, s)
    elseif h < 1 and m > 1 then
        return string.format("%02iм", m)
    end
end


local pan_x, pan_y
local blur = Material("pp/blurscreen")
function shizlib.surface.DrawPanelBlur(panel, amount)
	pan_x, pan_y = panel:LocalToScreen(0, 0)

	surface.SetDrawColor(color_white)
	surface.SetMaterial(blur)

	for i = 1, 3 do
		blur:SetFloat("$blur", (i / 3) * (amount or 6))
		blur:Recompute()
		render.UpdateScreenEffectTexture()
		surface.DrawTexturedRect(pan_x * -1, pan_y * -1, ScrW(), ScrH())
	end
end

function shizlib.surface.PrecacheRoundedRect(x, y, w, h, r, seg)
	local min = (w > h and h or w) * 0.5
	r = r > min and min or r

	local poly = {}
	for i = 0, seg do
		local a = pi * 0.5 * i / seg
		local cosine, sine = r * cos(a), r * sin(a)
		poly[i+1] = {
			x = x + r - cosine,
			y = y + r - sine
		}
		poly[i + seg + 1] = {
			x = x + w - r + sine,
			y = y + r - cosine
		}
		poly[i + seg * 2 + 1] = {
			x = x + w - r + cosine,
			y = y + h - r + sine
		}
		poly[i + seg * 3 + 1] = {
			x = x + r - sine,
			y = y + h - r + cosine
		}
	end
	return poly
end

/*
	kasanov
*/

function shizlib.surface.DTR(x, y, w, h, col, icon)
    surface.SetMaterial(icon)
    surface.SetDrawColor(col)
    surface.DrawTexturedRect(x, y, w, h)
end

function shizlib.surface.s(y)
    local scrW, scrH = ScrW(), ScrH()
    return math.Round(y * math.min(scrW, scrH) / 1080)
end

local math = CLIENT and math
local math_Round = CLIENT and math.Round
local string = string
local string_format = string.format

for i = 1, 140 do
	local sizee = i
	local size = math_Round(i / 1920 * ScrW())
	surface.CreateFont( string_format("font.%s", sizee), {
		font = 'Inter Bold',
		antialias = true,
		extended = true;
		size = size,
		weight = i > 14 and 1000 or 500,
	} )
end

/*
	Special THX: c0nfuse (right using chatGPT)
*/

function shizlib.surface.DrawRightRect(centerX, centerY, maxW, maxH, col, icon)
    local texW = icon:Width()
    local texH = icon:Height()
    local aspectRatio = texW / texH
    local drawW, drawH

    if texW > texH then
        drawW = math.min(maxW, texW)
        drawH = drawW / aspectRatio
    else
        drawH = math.min(maxH, texH)
        drawW = drawH * aspectRatio
    end
    
    local drawX = centerX - drawW / 2
    local drawY = centerY - drawH / 2
    
    surface.SetMaterial(icon)
    surface.SetDrawColor(col)
    surface.DrawTexturedRect(drawX, drawY, drawW, drawH)
end