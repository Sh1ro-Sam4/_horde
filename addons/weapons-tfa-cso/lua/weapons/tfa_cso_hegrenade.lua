-- Variables that are used on both client and server
SWEP.Category				= "TFA CS:O Equipment"
SWEP.Author				= "★Bullet★, Kamikaze"
SWEP.Contact				= ""
SWEP.Purpose				= ""
SWEP.Instructions				= ""
SWEP.PrintName				= "HE Grenade"		-- Weapon name (Shown on HUD)
SWEP.Slot				= 4				-- Slot in the weapon selection menu
SWEP.SlotPos				= 40			-- Position in the slot
SWEP.DrawAmmo				= true		-- Should draw the default HL2 ammo counter
SWEP.DrawWeaponInfoBox			= false		-- Should draw the weapon info box
SWEP.BounceWeaponIcon   		= 	false	-- Should the weapon icon bounce?
SWEP.DrawCrosshair			= true		-- set false if you want no crosshair
SWEP.Weight				= 2			-- rank relative ot other weapons. bigger is better
SWEP.AutoSwitchTo			= true		-- Auto switch to if we pick it up
SWEP.AutoSwitchFrom			= true		-- Auto switch from if you pick up a better weapon
SWEP.HoldType 				= "grenade"		-- how others view you carrying the weapon
-- normal melee melee2 fist knife smg ar2 pistol rpg physgun grenade shotgun crossbow slam passive
-- you're mostly going to use ar2, smg, shotgun or pistol. rpg and ar2 make for good sniper rifles

-- nZombies Stuff
SWEP.NZWonderWeapon		= false	-- Is this a Wonder-Weapon? If true, only one player can have it at a time. Cheats aren't stopped, though.
--SWEP.NZRePaPText		= "your text here"	-- When RePaPing, what should be shown? Example: Press E to your text here for 2000 points.
SWEP.NZPaPName				= "Sieg Heil"
--SWEP.NZPaPReplacement 	= "tfa_cso_dualinfinityfinal"	-- If Pack-a-Punched, replace this gun with the entity class shown here.
SWEP.NZPreventBox		= true	-- If true, this gun won't be placed in random boxes GENERATED. Users can still place it in manually.
SWEP.NZTotalBlackList	= true	-- if true, this gun can't be placed in the box, even manually, and can't be bought off a wall, even if placed manually. Only code can give this gun.

SWEP.ProceduralHolsterTime = 0
SWEP.ViewModelFOV			= 80
SWEP.ViewModelFlip			= true
SWEP.ViewModel				= "models/weapons/tfa_cso/c_hegrenade.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/tfa_cso/w_hegrenade.mdl"	-- Weapon world model
SWEP.ShowWorldModel			= true
SWEP.Base				= "tfa_nade_base"
SWEP.Spawnable				= true
SWEP.UseHands = true
SWEP.AdminSpawnable			= true

SWEP.Primary.RPM				= 30		-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 1		-- Size of a clip
SWEP.Primary.DefaultClip		= 6		-- Bullets you start with
SWEP.Primary.Automatic			= false		-- Automatic = true; Semi Auto = false
SWEP.Primary.Ammo			= "grenade"
-- pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, AirboatGun
-- Pistol, buckshot, and slam always ricochet. Use AirboatGun for a metal peircing shotgun slug

SWEP.Primary.Round 			= ("hegrenade")	--NAME OF ENTITY GOES HERE

SWEP.Velocity = 1000 -- Entity Velocity
SWEP.Velocity_Underhand = 500 -- Entity Velocity

SWEP.Offset = { --Procedural world model animation, defaulted for CS:S purposes.
		Pos = {
		Up = -1.5,
		Right = 2.5,
		Forward = 3.5,
		},
		Ang = {
		Up = -30,
		Right = -75,
		Forward = 0
		},
		Scale = 1
}
if CLIENT then
	SWEP.WepSelectIconCSO = Material("vgui/killicons/tfa_cso_hegrenade")
	SWEP.DrawWeaponSelection = TFA_CSO_DrawWeaponSelection
end

DEFINE_BASECLASS(SWEP.Base)

function SWEP:Deploy( ... )
    BaseClass.Deploy( self, ... )
	self:CleanParticles()
	return true
end

function SWEP:Holster( ... )
	self:CleanParticles()
	return BaseClass.Holster( self, ... )
end

function SWEP:OnRemove( ... )
	self:CleanParticles()
	return BaseClass.OnRemove( self, ... )
end