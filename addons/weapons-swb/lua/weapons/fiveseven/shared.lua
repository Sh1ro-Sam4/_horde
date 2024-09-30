AddCSLuaFile()

if CLIENT then
	SWEP.DrawCrosshair = true
	SWEP.PrintName = "Five-Seven"
	SWEP.CSMuzzleFlashes = true
	
	SWEP.AimPos = Vector(2.687, 0, 1.12)
	SWEP.AimAng = Vector(1.598, 0, 0)
		
	SWEP.SprintPos = Vector(-1.098, -7.132, -5.106)
	SWEP.SprintAng = Vector(59.402, 0, 0)
	
	SWEP.ZoomAmount = 5
	SWEP.ViewModelMovementScale = 0.85
	SWEP.Shell = "smallshell"
	
	SWEP.IconLetter = "u"
	--killicon.AddFont("swb_fiveseven", "SWB_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "swb_pistol_med"
end

SWEP.FadeCrosshairOnAim = true

SWEP.PlayBackRate = 30
SWEP.PlayBackRateSV = 12
SWEP.SpeedDec = 10
SWEP.BulletDiameter = 5.7
SWEP.CaseLength = 28

SWEP.Kind = WEAPON_PISTOL
SWEP.AutoSpawnable = true
SWEP.AllowDrop = true
SWEP.AmmoEnt = "item_ammo_pistol_ttt"

SWEP.Slot = 1
SWEP.SlotPos = 0
SWEP.NormalHoldType = "pistol"
SWEP.RunHoldType = "normal"
SWEP.FireModes = {"semi"}
SWEP.Base = "swb_base"
SWEP.Category = "Weapons"

SWEP.Author			= "Base swb"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV		= 70
SWEP.ViewModelFlip		= true
SWEP.ViewModel				= "models/weapons/2_pist_fiveseven.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_pist_fiveseven.mdl"	-- Weapon world model

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 20
SWEP.Primary.DefaultClip	= 20
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "pistol"

SWEP.FireDelay = 0.145
SWEP.FireSound = Sound("Alt_Weapon_FiveSeven.1")
SWEP.Recoil = 0.65

SWEP.HipSpread = 0.04
SWEP.AimSpread = 0.009
SWEP.VelocitySensitivity = 0
SWEP.MaxSpreadInc = 0
SWEP.SpreadPerShot = 0
SWEP.SpreadCooldown = 0
SWEP.Shots = 1
SWEP.Damage = 21
SWEP.DeployTime = 1