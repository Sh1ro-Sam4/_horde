FPP = FPP or {}

surface.CreateFont("TabLarge", {
    size = 17,
    weight = 700,
    antialias = true,
    shadow = false,
    font = "Trebuchet MS"})

hook.Add("CanTool", "FPP_CL_CanTool", function(ply, trace, tool) -- Prevent client from SEEING his toolgun shoot while it doesn't shoot serverside.
    if IsValid(trace.Entity) and not FPP.canTouchEnt(trace.Entity, "Toolgun") then
        return false
    end
end)

-- This looks weird, but whenever a client touches an ent he can't touch, without the code it'll look like he picked it up. WITH the code it really looks like he can't
-- besides, when the client CAN pick up a prop, it also looks like he can.
hook.Add("PhysgunPickup", "FPP_CL_PhysgunPickup", function(ply, ent)
    if not FPP.canTouchEnt(ent, "Physgun") then
        return false
    end
end)

-- Makes sure the client doesn't think they can punt props
hook.Add("GravGunPunt", "FPP_CL_GravGunPunt", function(ply, ent)
    if tobool(FPP.Settings.FPP_GRAVGUN1.noshooting) then return false end
    if IsValid(ent) and not FPP.canTouchEnt(ent, "Gravgun") then
        return false
    end
end)

local surface_SetFont = surface.SetFont
local surface_GetTextSize = surface.GetTextSize
local surface_SetDrawColor = surface.SetDrawColor

local draw_SimpleText = draw.SimpleText
local draw_DrawText = draw.DrawText
local draw_RoundedBox = draw.RoundedBox

local HUDNote_c = 0
local HUDNote_i = 1
local HUDNotes = {}

--Notify ripped off the Sandbox notify, changed to my likings
function FPP.AddNotify( str, type )
    local tab = {}
    tab.text    = str
    tab.recv    = SysTime()
    tab.velx    = 0
    tab.vely    = -5
    surface_SetFont( "TabLarge" )
    local w = surface_GetTextSize( str )

    tab.x       = ScrW() / 2 + w * 0.5 + (ScrW() / 20)
    tab.y       = ScrH()
    tab.a       = 255

    if type then
        tab.type = true
    else
        tab.type = false
    end

    table.insert( HUDNotes, tab )

    HUDNote_c = HUDNote_c + 1
    HUDNote_i = HUDNote_i + 1

    local ply = LocalPlayer()

    if not IsValid(ply) then return end -- I honestly got this error
    ply:EmitSound("npc/turret_floor/click1.wav", 10, 100)
end

usermessage.Hook("FPP_Notify", function(u) FPP.AddNotify(u:ReadString(), u:ReadBool()) end)