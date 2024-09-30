if not ArcCWInstalled then return end
if CLIENT then
    SWEP.WepSelectIcon = surface.GetTextureID("arccw/weaponicons/arccw_go_ak47")
    killicon.Add("arccw_horde_ak47", "arccw/weaponicons/arccw_go_ak47", Color(0, 0, 0, 255))
end
SWEP.Base = "arccw_base"
SWEP.Spawnable = true -- this obviously has to be set to true
SWEP.Category = "ArcCW - Horde" -- edit this if you like
SWEP.AdminOnly = false

SWEP.PrintName = "AKM"
SWEP.Trivia_Class = "Assault Rifle"
SWEP.Trivia_Desc = "Ubiquitous Russian designed rifle used by militaries and militias around the world. One of the most popular weapons ever produced. Can be adapted into a variety of different forms."
SWEP.Trivia_Manufacturer = "Izhmash"
SWEP.Trivia_Calibre = "7.62x39mm Soviet"
SWEP.Trivia_Mechanism = "Gas-Operated"
SWEP.Trivia_Country = "Russia"
SWEP.Trivia_Year = 1956

SWEP.Slot = 2

SWEP.UseHands = true

SWEP.ViewModel = "models/weapons/arccw_go/v_rif_ak47.mdl"
SWEP.WorldModel = "models/weapons/w_rif_ak47.mdl"
SWEP.ViewModelFOV = 60

SWEP.DefaultBodygroups = "000000000000"

SWEP.Damage = 36 * 1.25
SWEP.DamageMin = 24 * 1.25 -- damage done at maximum range
SWEP.Range = 100 -- in METRES
SWEP.Penetration = 14
SWEP.DamageType = DMG_BULLET
SWEP.ShootEntity = nil -- entity to fire, if any
SWEP.MuzzleVelocity = 715 -- projectile or phys bullet muzzle velocity
-- IN M/S
SWEP.ChamberSize = 1 -- how many rounds can be chambered.
SWEP.Primary.ClipSize = 30 -- DefaultClip is automatically set.

SWEP.PhysBulletMuzzleVelocity = 700

SWEP.Recoil = 0.7
SWEP.RecoilSide = 0.65
SWEP.RecoilRise = 0.1
SWEP.RecoilPunch = 2.5

SWEP.Delay = 60 / 600 -- 60 / RPM.
SWEP.Num = 1 -- number of shots per trigger pull.
SWEP.Firemodes = {
    {
        Mode = 2,
    },
    {
        Mode = 1,
    },
    {
        Mode = 0
    }
}

SWEP.NPCWeaponType = "weapon_ar2"
SWEP.NPCWeight = 200

SWEP.AccuracyMOA = 6 -- accuracy in Minutes of Angle. There are 60 MOA in a degree.
SWEP.HipDispersion = 750 -- inaccuracy added by hip firing.
SWEP.MoveDispersion = 200

SWEP.Primary.Ammo = "ar2" -- what ammo type the gun uses
SWEP.MagID = "ak47" -- the magazine pool this gun draws from

SWEP.ShootVol = 120 -- volume of shoot sound
SWEP.ShootPitch = 100 -- pitch of shoot sound

SWEP.ShootSound = "arccw_go/ak47/ak47_01.wav"
SWEP.ShootSoundSilenced = "arccw_go/m4a1/m4a1_silencer_01.wav"
SWEP.DistantShootSound = "arccw_go/ak47/ak47-1-distant.wav"

SWEP.MeleeSwingSound = "arccw_go/m249/m249_draw.wav"
SWEP.MeleeMissSound = "weapons/iceaxe/iceaxe_swing1.wav"
SWEP.MeleeHitSound = "arccw_go/knife/knife_hitwall1.wav"
SWEP.MeleeHitNPCSound = "physics/body/body_medium_break2.wav"

SWEP.MuzzleEffect = "muzzleflash_ak47"
SWEP.ShellModel = "models/shells/shell_556.mdl"
SWEP.ShellPitch = 90
SWEP.ShellScale = 1.5
SWEP.ShellRotateAngle = Angle(0, 180, 0)

SWEP.MuzzleEffectAttachment = 1 -- which attachment to put the muzzle on
SWEP.CaseEffectAttachment = 2 -- which attachment to put the case effect on

SWEP.SpeedMult = 0.91
SWEP.SightedSpeedMult = 0.75
SWEP.SightTime = 0.30

SWEP.IronSightStruct = {
    Pos = Vector(-5.03, -10, 1.1),
    Ang = Angle(0.16, 0.125, -2.412),
    Magnification = 1.1,
    SwitchToSound = "", -- sound that plays when switching to this sight
    CrosshairInSights = false
}

SWEP.HoldtypeHolstered = "passive"
SWEP.HoldtypeActive = "ar2"
SWEP.HoldtypeSights = "rpg"

SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2

SWEP.ActivePos = Vector(-1, 0, -1)
SWEP.ActiveAng = Angle(0, 0, 0)

SWEP.CrouchPos = Vector(-4, 0, -1)
SWEP.CrouchAng = Angle(0, 0, -10)

SWEP.HolsterPos = Vector(3, 3, 0)
SWEP.HolsterAng = Angle(-7.036, 30.016, 0)

SWEP.BarrelOffsetSighted = Vector(0, 0, -1)
SWEP.BarrelOffsetHip = Vector(2, 0, -2)

SWEP.CustomizePos = Vector(8, 0, 1)
SWEP.CustomizeAng = Angle(5, 30, 30)

SWEP.BarrelLength = 24

SWEP.AttachmentElements = {
    ["sidemount"] = {
        VMBodygroups = {{ind = 1, bg = 1}},
    },
    ["ubrms"] = {
        VMBodygroups = {{ind = 7, bg = 1}},
    },
    ["no_fh"] = {
        VMBodygroups = {{ind = 6, bg = 0}},
    },
    ["go_ak_barrel_short"] = {
        VMBodygroups = {
            {ind = 3, bg = 1},
            {ind = 6, bg = 1},
        },
        AttPosMods = {
            [5] = {
                vpos = Vector(0, -3.4, 15.5),
            }
        },
        -- Override_IronSightStruct = false
        Override_IronSightStruct = {
            Pos = Vector(-5.03, -10, 1.25),
            Ang = Angle(-0.9, 0.075, -2.412),
            Magnification = 1.1,
            CrosshairInSights = false
        }
    },
    ["go_ak_barrel_long"] = {
        VMBodygroups = {
            {ind = 3, bg = 2},
        },
        AttPosMods = {
            [5] = {
                vpos = Vector(0, -3.4, 32),
            }
        },
        -- Override_IronSightStruct = {
        --     Pos = Vector(-5.03, -10, 1.1),
        --     Ang = Angle(0.16, 0.125, -2.412),
        --     Magnification = 1.1,
        --     CrosshairInSights = false
        -- }
    },
    ["go_ak_barrel_tac"] = {
        VMBodygroups = {
            {ind = 3, bg = 3},
            {ind = 7, bg = 0}
        },
        AttPosMods = {
            [2] = {
                vpos = Vector(0, -2.25, 13),
            }
        }
    },
    ["go_ak_grip_poly"] = {
        VMBodygroups = {
            {ind = 4, bg = 1},
        },
    },
    ["go_stock_none"] = {
        VMBodygroups = {
            {ind = 5, bg = 1},
        },
    },
    ["go_stock"] = {
        VMBodygroups = {
            {ind = 5, bg = 1},
        },
        VMElements = {
            {
                Model = "models/weapons/arccw_go/atts/stock_buftube.mdl",
                Bone = "v_weapon.ak47_Parent",
                Offset = {
                    pos = Vector(0, -2.75, -1.5),
                    ang = Angle(90, 0, -90),
                },
            }
        },
    },
    ["go_ak_stock_skeleton"] = {
        VMBodygroups = {
            {ind = 5, bg = 2},
        },
    },
    ["go_ak_stock_basilisk"] = {
        VMBodygroups = {
            {ind = 5, bg = 3},
        },
    },
    ["go_ak_stock_contractor"] = {
        VMBodygroups = {
            {ind = 5, bg = 4},
        },
    },
    ["go_ak_stock_heavy"] = {
        VMBodygroups = {
            {ind = 5, bg = 5},
        },
    },
    ["go_ak_mag_30"] = {
        VMBodygroups = {
            {ind = 2, bg = 1},
        },
    },
    ["go_ak_mag_30_545"] = {
        NameChange = "AK-74",
        VMBodygroups = {
            {ind = 2, bg = 2},
        },
    },
    ["go_ak_mag_10"] = {
        VMBodygroups = {
            {ind = 2, bg = 3},
        },
    },
    ["go_ak_mag_10_steel"] = {
        VMBodygroups = {
            {ind = 2, bg = 4},
        },
    },
    ["go_ak_mag_40"] = {
        VMBodygroups = {
            {ind = 2, bg = 5},
        },
    },
    ["go_ak_mag_40_steel"] = {
        VMBodygroups = {
            {ind = 2, bg = 6},
        },
    },
    ["go_ak_mag_45_545"] = {
        NameChange = "AK-74",
        VMBodygroups = {
            {ind = 2, bg = 7},
        },
    },
    ["go_ak_mag_60_545"] = {
        NameChange = "AK-74",
        VMBodygroups = {
            {ind = 2, bg = 8},
        },
    },
    ["go_ak_mag_15_545"] = {
        NameChange = "AK-74",
        VMBodygroups = {
            {ind = 2, bg = 9},
        },
    },
}

SWEP.ExtraSightDist = 10
SWEP.GuaranteeLaser = true

SWEP.WorldModelOffset = {
    pos = Vector(-11, 6, -3),
    ang = Angle(-10, 0, 180)
}

SWEP.MirrorVMWM = true

SWEP.Attachments = {
    {
        PrintName = "Optic",
        Slot = {"optic_lp", "optic"},
        Bone = "v_weapon.ak47_Parent",
        DefaultAttName = "Iron Sights",
        Offset = {
            vpos = Vector(0.15, -5.3, 3),
            vang = Angle(90, 0, -90),
        },
        InstalledEles = {"sidemount"},
        CorrectiveAng = Angle(-1.25, 0, 0)
    },
    {
        PrintName = "Underbarrel",
        Slot = {"foregrip", "ubgl"},
        Bone = "v_weapon.ak47_Parent",
        Offset = {
            vpos = Vector(0, -2.05, 13),
            vang = Angle(90, 0, -90),
        },
        InstalledEles = {"ubrms"},
    },
    {
        PrintName = "Tactical",
        Slot = "tac",
        Bone = "v_weapon.ak47_Parent",
        Offset = {
            vpos = Vector(1.24, -4, 3),
            vang = Angle(90, 0, 0),
        },
        InstalledEles = {"sidemount"},
    },
    {
        PrintName = "Barrel",
        Slot = "go_ak47_barrel",
        DefaultAttName = "415mm Standard Barrel"
    },
    {
        PrintName = "Muzzle",
        DefaultAttName = "Standard Muzzle",
        Slot = "muzzle",
        Bone = "v_weapon.ak47_Parent",
        Offset = {
            vpos = Vector(0, -3.4, 25),
            vang = Angle(90, 0, -90),
        },
        InstalledEles = {"no_fh"}
    },
    {
        PrintName = "Magazine",
        Slot = {"go_ammo_ak47", "go_ammo_ak74"},
        DefaultAttName = "30-Round 7.62mm Steel"
    },
    {
        PrintName = "Stock",
        Slot = {"go_ak47_stock", "go_stock_none", "go_stock", "go_ak47_stock_heavy"},
        DefaultAttName = "Standard Stock",
        Bone = "v_weapon.ak47_Parent",
        Offset = {
            vpos = Vector(0, -2.75, -1.5),
            vang = Angle(90, 0, -90),
        },
    },
    {
        PrintName = "Ammo Type",
        Slot = "go_ammo",
        DefaultAttName = "Standard Ammo"
    },
    {
        PrintName = "Perk",
        Slot = "go_perk"
    },
    {
        PrintName = "Charm",
        Slot = "charm",
        FreeSlot = true,
        Bone = "v_weapon.ak47_Parent", -- relevant bone any attachments will be mostly referring to
        Offset = {
            vpos = Vector(0.6, -2.75, 6), -- offset that the attachment will be relative to the bone
            vang = Angle(90, 0, -90),
        },
    },
}

function SWEP:Hook_TranslateAnimation(anim)
    if anim == "fire_iron" then
        if self:GetBuff_Override("NoStock") then return "fire" end
    elseif anim == "fire_iron_empty" then
        if self:GetBuff_Override("NoStock") then return "fire_empty" end
    end
end

function SWEP:Hook_NameChange(name)
    local eles = self:GetActiveElements()

    local prefix = "AK"
    local s = ""
    local model = "M"
    local stock = ""

    for i, k in pairs(eles or {}) do
        if k == "go_ak_mag_15_545" then
            model = "-74"
        elseif k == "go_ak_mag_30_545" then
            model = "-74"
        elseif k == "go_ak_mag_45_545" then
            model = "-74"
        elseif k == "go_ak_mag_60_545" then
            model = "-74"
        elseif k == "go_ak_barrel_long" then
            prefix = "RPK"
            if model == "M" then
                model = ""
            end
        elseif k == "go_ak_barrel_short" then
            stock = "U"
        elseif k == "go_ak_stock_skeleton" then
            s = "S"
        elseif k == "go_ak_stock_heavy" then
            prefix = "RPK"
            if model == "M" then
                model = ""
            end
        end
    end

    if model == "M" then
        return prefix .. model .. s .. stock
    else
        return prefix .. s .. model .. stock
    end
end

SWEP.Animations = {
    ["idle"] = {
        Source = "ak47_idle"
    },
    ["draw"] = {
        Source = "ak47_draw",
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0.5,
    },
    ["ready"] = {
        Source = "ak47_ready",
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0.5,
    },
    ["fire"] = {
        Source = {"ak47_fire1", "ak47_fire2", "ak47_fire3"},
        Time = 0.5,
        ShellEjectAt = 0,
    },
    ["fire_iron"] = {
        Source = "ak47_fire_iron",
        Time = 0.5,
        ShellEjectAt = 0,
    },
    ["reload"] = {
        Source = "ak47_reload",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        Checkpoints = {16, 30},
        FrameRate = 30,
        LHIK = true,
        LHIKIn = 0.3,
        LHIKOut = 0.3,
        LHIKEaseOut = 0.25,
    },
    ["reload_empty"] = {
        Source = "ak47_reload_empty",
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        Checkpoints = {16, 30, 55},
        FrameRate = 30,
        LHIK = true,
        LHIKIn = 0.3,
        LHIKOut = 0.3,
        LHIKEaseOut = 0.25,
    },
    ["enter_inspect"] = false,
    ["idle_inspect"] = false,
    ["exit_inspect"] = false,
}

sound.Add({
    name = "ArcCW_GO_AK47.Draw",
    channel = 16,
    volume = 1.0,
    sound = "arccw_go/ak47/ak47_draw.wav"
})

sound.Add({
    name = "ARCCW_GO_AK47.Boltpull",
    channel = 16,
    volume = 1.0,
    sound = "arccw_go/ak47/ak47_boltpull.wav"
})

sound.Add({
    name = "ARCCW_GO_AK47.Clipout",
    channel = 16,
    volume = 1.0,
    sound = "arccw_go/ak47/ak47_clipout.wav"
})

sound.Add({
    name = "ARCCW_GO_AK47.Clipin",
    channel = 16,
    volume = 1.0,
    sound = "arccw_go/ak47/ak47_clipin.wav"
})
