SWEP.Base = "arccw_mw2_abase"
SWEP.Spawnable = true
SWEP.Category = "ArcCW - MW2 - Unofficial"
SWEP.AdminOnly = false
SWEP.WeaponCamBone = tag_camera

SWEP.PrintName = "L85A2 MIFL"
SWEP.Trivia_Class = "Assault Rifle"
SWEP.Trivia_Desc = "Fully automatic, all purpose weapon.\nUnofficial."

SWEP.Slot = 2

SWEP.UseHands = true

SWEP.ViewModel = "models/weapons/arccw/fesiugmw2/c_sa80_fml_6.mdl"
SWEP.MirrorVMWM = true
SWEP.WorldModelOffset = {
    pos = Vector(-8, 3, -4),
    ang = Angle(-10, 0, 180),
    scale = 1.33
}
SWEP.WorldModel = "models/weapons/w_rif_aug.mdl"
SWEP.ViewModelFOV = 65

SWEP.DefaultBodygroups = "100000"

SWEP.Damage = 40
SWEP.DamageMin = 20
SWEP.Range = 1300 * 0.025  -- GAME UNITS * 0.025 = METRES
SWEP.Penetration = 7
SWEP.DamageType = DMG_BULLET
SWEP.ShootEntity = nil -- entity to fire, if any


SWEP.ChamberSize = 0
SWEP.Primary.ClipSize = 30 -- DefaultClip is automatically set.
SWEP.ExtendedClipSize = 45
SWEP.ReducedClipSize = 15

SWEP.VisualRecoilMult = 0
SWEP.Recoil = 0.5
SWEP.RecoilSide = 0.5
SWEP.RecoilRise = 0

SWEP.Delay = 0.086 -- lazy, fix this l8r btich -- 60 / RPM.
SWEP.Num = 1 -- number of shots per trigger pull.
SWEP.Firemodes = {
    {
        Mode = 2,
    },
    {
        Mode = 1,
    },
    {
        Mode = 0,
    },
}

SWEP.NPCWeaponType = {"weapon_ar2", "weapon_smg1"}
SWEP.NPCWeight = 100

SWEP.AccuracyMOA = 5 -- accuracy in Minutes of Angle. There are 60 MOA in a degree.
SWEP.HipDispersion = 500 -- inaccuracy added by hip firing.
SWEP.MoveDispersion = 250

SWEP.Primary.Ammo = "smg1" -- what ammo type the gun uses

SWEP.ShootVol = 110 -- volume of shoot sound
SWEP.ShootPitch = 100 -- pitch of shoot sound

SWEP.ShootSound =			"weapons/fesiugmw2/fire/l85_u.wav"
SWEP.ShootMechSound =       ArcCW_MW2_Mech
--SWEP.DistantShootSound =	"weapons/fesiugmw2/fire_distant/aug.wav"
SWEP.ShootDrySound =        "weapons/fesiugmw2/fire/dryfire_rifle.wav"
SWEP.ShootSoundSilenced =	"weapons/fesiugmw2/fire/m4_sil.wav"

SWEP.MuzzleEffect = "muzzleflash_4"
SWEP.ShellModel = "models/shells/shell_556.mdl"
SWEP.ShellPitch = 95
SWEP.ShellScale = 1
SWEP.ShellRotate = 180

SWEP.MuzzleEffectAttachment = 1 -- which attachment to put the muzzle on
SWEP.CaseEffectAttachment = 2 -- which attachment to put the case effect on

SWEP.SpeedMult = 0.95
SWEP.SightedSpeedMult = 0.38
SWEP.SightTime = 0.25

SWEP.BulletBones = { -- the bone that represents bullets in gun/mag
    -- [0] = "bulletchamber",
    -- [1] = "bullet1"
}

SWEP.IronSightStruct = {
    Pos = Vector(-2.825, -2.026, -0.45),
    Ang = Angle(0.2, 0, 0),
    ViewModelFOV = 65 / 1.3,
    Magnification = 1.3,
}

SWEP.HoldtypeHolstered = "passive"
SWEP.HoldtypeActive = "ar2"
SWEP.HoldtypeSights = "rpg"

SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2

SWEP.ActivePos = Vector(0, 0, 1)
SWEP.ActiveAng = Angle(0, 0, 0)

SWEP.CustomizePos = Vector(10.479, 0, -1.321)
SWEP.CustomizeAng = Angle(18.2, 39.4, 14.8)

SWEP.HolsterPos = Vector(1, 0, 1)
SWEP.HolsterAng = Angle(-10, 12, 0)

SWEP.BarrelOffsetSighted = Vector(0, 0, -1)
SWEP.BarrelOffsetHip = Vector(2, 0, -2)

SWEP.BarrelLength = 27

SWEP.AttachmentElements = {
    ["nors"] = {
        VMBodygroups = {{ind = 1, bg = 1}},
    },
    ["optic_mw2_mp5krearsight"] = { VMBodygroups = {{ind = 2, bg = 0}} },
    ["grip"] = { VMBodygroups = {{ind = 2, bg = 1}} },
    ["wepcamo-desert"]		= { VMSkin = 1 },
    ["wepcamo-arctic"]		= { VMSkin = 2 },
    ["wepcamo-woodland"]	= { VMSkin = 3 },
    ["wepcamo-digital"]		= { VMSkin = 4 },
    ["wepcamo-urban"]		= { VMSkin = 5 },
    ["wepcamo-bluetiger"]	= { VMSkin = 6 },
    ["wepcamo-redtiger"]	= { VMSkin = 7 },
    ["wepcamo-fall"]		= { VMSkin = 8 },
    ["wepcamo-whiteout"]	= { VMSkin = 9 },
    ["wepcamo-blackout"]        = { VMSkin = 10 },
    ["wepcamo-bushdweller"]     = { VMSkin = 11 },
    ["wepcamo-thunderstorm"]    = { VMSkin = 12 },
}

SWEP.ExtraSightDist = 5

SWEP.Attachments = {
    {
        PrintName = "Optic",
        DefaultAttName = "Iron Sights",
        Slot = {"optic"},
        Bone = "Weapon",
        Offset = {
            vpos = Vector(0, -2.95, 0),
            vang = Angle(90, 0, -90),
            wang = Angle(-9.738, 0, 180)
        },
        InstalledEles = {"nors"},
    },
    {
        PrintName = "Muzzle",
        DefaultAttName = "Standard Muzzle",
        Slot = "muzzle",
        Bone = "Weapon",
        Offset = {
            vpos = Vector(0, -1.7, 16),
            vang = Angle(90, 0, -90),
            wpos = Vector(33.719, -2.122, -5.573),
            wang = Angle(0, 6.034, 180)
        },
    },
    {
        PrintName = "Tactical",
        Slot = "tac",
        Bone = "Weapon",
        Offset = {
            vpos = Vector(1, -1.4, 0.3),
            vang = Angle(90, 0, 0),
            wpos = Vector(15.625, -0.253, -6.298),
            wang = Angle(-8.829, -0.556, 90)
        },
    },
    {
        PrintName = "Fire Group",
        Slot = "fcg",
        DefaultAttName = "Standard FCG"
    },
    {
        PrintName = "Ammo Type",
        Slot = "ammo_bullet"
    },
    {
        PrintName = "Perk",
        Slot = "perk"
    },
    {
        PrintName = "Camouflage",
        DefaultAttName = "None",
        Slot = "mw2_wepcamo",
        FreeSlot = true,
    },
	{
        PrintName = "Charm",
        Slot = "charm",
        FreeSlot = true,
        Bone = "Weapon",
        Offset = {
            vpos = Vector(0.5, -1.25, 2.75),
            vang = Angle(90, 0, -90),
            wpos = Vector(9.625, 1.5, -4),
            wang = Angle(0, 0, 180)
        },
    },
}

SWEP.Animations = {
    ["idle"] = {
        Source = "idle",
        Time = 1/60
    },
    ["idle_empty"] = {
        Source = "idle_empty",
        Time = 1/60
    },
    ["enter_sprint"] = {
        Source = "sprint_in",
        Time = 10/60
    },
    ["idle_sprint"] = {
        Source = "sprint_loop",
        Time = 30/40
    },
    ["exit_sprint"] = {
        Source = "sprint_out",
        Time = 10/60
    },
    ["draw"] = {
        Source = "pullout",
        Time = 43/60,
        SoundTable = {{s = "MW2Common.Deploy", 		t = 0}},
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0.9,
    },
    ["draw_empty"] = {
        Source = "pullout_empty",
        Time = 43/60,
        SoundTable = {{s = "MW2Common.Deploy", 		t = 0}},
        LHIK = true,
        LHIKIn = 0,
        LHIKOut = 0.9,
    },
    ["ready"] = {
        Source = "pullout_first",
        Time = 61/60,
        SoundTable = {
						{s = "weapons/fesiugmw2/foley/wpfoly_sa80_reload_lift_v1.wav", 	t = 0},
						{s = "weapons/fesiugmw2/foley/wpfoly_sa80_reload_chamber_v1.wav", 	t = 18/30},
					},
    },
    ["fire"] = {
        Source = "fire",
        Time = 31/60,
        ShellEjectAt = 0,
    },
    ["fire_iron"] = {
        Source = "fire_ads",
        Time = 31/60,
        ShellEjectAt = 0,
    },
    ["fire_empty"] = {
        Source = "fire_empty",
        Time = 31/60,
        ShellEjectAt = 0,
    },
    ["fire_iron_empty"] = {
        Source = "fire_ads_empty",
        Time = 31/60,
        ShellEjectAt = 0,
    },
    ["reload"] = {
        Source = "reload",
        Time = 135/50,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        SoundTable = {
						{s = "weapons/fesiugmw2/foley/wpfoly_sa80_reload_lift_v1.wav", 		t = 0},
						{s = "weapons/fesiugmw2/foley/wpfoly_sa80_reload_clipout_v1.wav", 	t = 0.66},
						{s = "weapons/fesiugmw2/foley/wpfoly_sa80_reload_clipin_v1.wav", 		t = 1.6},
					},
    },
    ["reload_empty"] = {
        Source = "reload_empty2",
        Time = 166/50,
        TPAnim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        SoundTable = {
						{s = "weapons/fesiugmw2/foley/wpfoly_sa80_reload_lift_v1.wav", 		t = 0},
						{s = "weapons/fesiugmw2/foley/wpfoly_sa80_reload_clipout_v1.wav", 	t = 0.66},
						{s = "weapons/fesiugmw2/foley/wpfoly_sa80_reload_clipin_v1.wav", 		t = 1.6},
						{s = "weapons/fesiugmw2/foley/wpfoly_sa80_reload_chamber_v1.wav",		t = 2.4},
					},
    },
}