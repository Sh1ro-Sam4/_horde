AddCSLuaFile()

if CLIENT then
    SWEP.DrawCrosshair = true
    SWEP.PrintName = "Dual Berettas"
    SWEP.CSMuzzleFlashes = true
    SWEP.AimPos = Vector(0.115, -5, 0)
    SWEP.AimAng = Vector(0.115, 0.083, 0)
    SWEP.SprintPos = Vector(0, 0, -5.019)
    SWEP.SprintAng = Vector(0, 0, 0)
    SWEP.ZoomAmount = 5
    SWEP.ViewModelMovementScale = 0.85
    SWEP.Shell = "smallshell"
    SWEP.IconLetter = "c"
    SWEP.MuzzleEffect = "swb_pistol_small"
end

SWEP.CanPenetrate = false
SWEP.PlayBackRate = 30
SWEP.PlayBackRateSV = 12
SWEP.SpeedDec = 10
SWEP.BulletDiameter = 9
SWEP.CaseLength = 19
SWEP.Kind = WEAPON_PISTOL
SWEP.AutoSpawnable = true
SWEP.AllowDrop = true
SWEP.AmmoEnt = "item_ammo_pistol_ttt"
SWEP.Slot = 1
SWEP.SlotPos = 0
SWEP.NormalHoldType = "duel"
SWEP.RunHoldType = "normal"

SWEP.FireModes = {"semi"}

SWEP.Base = "swb_base"
SWEP.Category = "Weapons"
SWEP.Author = "Base swb"
SWEP.Contact = ""
SWEP.UseHands = true
SWEP.Purpose = ""
SWEP.Instructions = ""
SWEP.ViewModelFOV = 60
SWEP.ViewModelFlip = false
SWEP.AutoSwitchTo = false
SWEP.AutoSwitchFrom = false
SWEP.ViewModel = "models/weapons/cstrike/c_pist_elite.mdl"
SWEP.WorldModel = "models/weapons/w_pist_elite.mdl"
SWEP.Spawnable = true
SWEP.AdminSpawnable = true
SWEP.Primary.ClipSize = 30
SWEP.Primary.DefaultClip = 120
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "pistol"
SWEP.FireDelay = 0.15
SWEP.FireSound = Sound("Weapon_Elite.Single")
SWEP.Recoil = 0.3
SWEP.HipSpread = 0.036
SWEP.AimSpread = 0.0115
SWEP.VelocitySensitivity = 0
SWEP.MaxSpreadInc = 0
SWEP.SpreadPerShot = 0
SWEP.SpreadCooldown = 0
SWEP.Shots = 1
SWEP.Damage = 14
SWEP.DeployTime = 2