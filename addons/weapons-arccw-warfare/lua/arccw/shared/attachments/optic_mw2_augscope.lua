att.PrintName = "Swavorski (2.1x)"
att.Icon = Material("entities/acwatt_optic_mw2_augscope.png", "smooth")
att.Description = "Integrated telescopic scope created for the AUG."

att.SortOrder = 2.1

att.Desc_Pros = {
    "autostat.holosight",
    "autostat.zoom",
}
att.Desc_Cons = {
}
att.AutoStats = true
att.Slot = {"optic"}

att.Model = "models/weapons/arccw/fesiugmw2/atts/scopes/swavorski_base_2b.mdl"
att.ModelOffset = Vector(-1, 0, 0)

att.AdditionalSights = {
    {
        Pos = Vector(0, 11, -1.62),
        Ang = Angle(0, 0, 0),
        ViewModelFOV = 65 / 1.6,
        Magnification = 1.6,
        ScrollFunc = ArcCW.SCROLL_ZOOM,
        ZoomLevels = 12,
        ZoomSound = "weapons/arccw/fiveseven/fiveseven_slideback.wav",
        IgnoreExtra = true
    }
}

att.ScopeGlint = false

att.Holosight = true
att.HolosightReticle = Material("hud/scopes/m40a3.png", "mips smooth")
att.HolosightNoFlare = true
att.HolosightSize = 14
att.HolosightBone = "holosight"
att.HolosightPiece = "models/weapons/arccw/fesiugmw2/atts/scopes/swavorski_lens_2b.mdl"
att.Colorable = false

att.HolosightMagnification = 2.16
att.HolosightBlackbox = true

att.HolosightConstDist = 64

att.Mult_SightTime = 1.12
att.Mult_SightedSpeedMult = 0.92

att.ModelRotate = Angle(0, 90, 0)

att.AddSuffix = " Swavorski"