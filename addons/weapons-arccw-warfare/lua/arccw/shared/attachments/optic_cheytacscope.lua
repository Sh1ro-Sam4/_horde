att.PrintName = "CheyTac (2-4.3x)"
att.Icon = Material("entities/acwatt_optic_cheytacscope.png", "smooth")
att.Description = "Good scope. Gooood scope."

att.SortOrder = 4.3

att.Desc_Pros = {
    "autostat.holosight",
    "autostat.zoom",
}
att.Desc_Cons = {
}
att.AutoStats = true
att.Slot = {"optic","optic_sniper"}

att.Model 			= "models/weapons/arccw/fesiugmw2/atts/cheytacscope_3b.mdl"
att.HolosightPiece 	= "models/weapons/arccw/fesiugmw2/atts/cheytacscope_2b_hsp.mdl"

att.AdditionalSights = {
    {
        Pos = Vector(0, 10.2, -1.5),
        Ang = Angle(0, 0, 0),
        ViewModelFOV = 65 / 2.25,
        Magnification = 2.25,
        ScrollFunc = ArcCW.SCROLL_ZOOM,
        ZoomLevels = 6,
        ZoomSound = "weapons/arccw/fiveseven/fiveseven_slideback.wav",
        IgnoreExtra = true
    }
}

att.ScopeGlint = true

att.Holosight = true
att.HolosightReticle = Material("hud/scopes/m40a3.png", "mips smooth")
att.HolosightNoFlare = true
att.HolosightSize = 25
att.HolosightBone = "holosight"
att.Colorable = false

att.HolosightMagnification = 4.3
att.HolosightBlackbox = true

att.HolosightMagnificationMin = 2
att.HolosightMagnificationMax = 4.3

att.Mult_SightTime = 1.15
att.Mult_SightedSpeedMult = 0.9
-- att.Mult_SpeedMult = 0.98