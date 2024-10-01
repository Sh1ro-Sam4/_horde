local s = shizlib.surface.s
local DTR = shizlib.surface.DTR

CreateClientConVar('shizlib_hud_vingette', 1, true, true)

hook.Add('HUDPaint', 'shizlib-vignette', function()
    if GetConVar('shizlib_hud_vingette'):GetInt() == 0 then return end
    DTR(0, 0, s(1920), s(500), Color(0,0,0, 225), Material('vgui/gradient-u'))
    DTR(0, s(580), s(1920), s(500), Color(0,0,0, 225), Material('vgui/gradient-d'))
    DTR(s(1420), 0, s(500), s(1080), Color(0,0,0, 225), Material('vgui/gradient-r'))
    DTR(0, 0, s(500), s(1080), Color(0,0,0, 225), Material('vgui/gradient-l'))
end)

hook.Add('SpawnMenuOpen', 'shizlib-QMenu', function()
	return LocalPlayer():GetUserGroup() == 'founder'
end)