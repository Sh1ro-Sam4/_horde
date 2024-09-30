SWEP.Base				= "tfa_gun_base"
SWEP.Category				= "TFA CS:O Pistols" --The category.  Please, just choose something generic or something I've already done if you plan on only doing like one swep.
SWEP.Author				= "★Bullet★" --Author Tooltip
SWEP.Contact				= "" --Contact Info Tooltip
SWEP.Purpose				= "" --Purpose Tooltip
SWEP.Instructions				= "" --Instructions Tooltip
SWEP.Spawnable				= true --Can you, as a normal user, spawn this?
SWEP.AdminSpawnable			= true --Can an adminstrator spawn this?  Does not tie into your admin mod necessarily, unless its coded to allow for GMod's default ranks somewhere in its code.  Evolve and ULX should work, but try to use weapon restriction rather than these.
SWEP.DrawCrosshair			= true		-- Draw the crosshair?
SWEP.PrintName				= "Blue Storm"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 1				-- Slot in the weapon selection menu.  Subtract 1, as this starts at 0.
SWEP.SlotPos				= 73			-- Position in the slot
SWEP.DrawAmmo				= true		-- Should draw the default HL2 ammo counter if enabled in the GUI.
SWEP.DrawWeaponInfoBox			= false		-- Should draw the weapon info box
SWEP.BounceWeaponIcon   		= 	false	-- Should the weapon icon bounce?
SWEP.AutoSwitchTo			= true		-- Auto switch to if we pick it up
SWEP.AutoSwitchFrom			= true		-- Auto switch from if you pick up a better weapon
SWEP.Weight				= 30			-- This controls how "good" the weapon is for autopickup.
SWEP.Type	= "Transcendence Grade Pistol"
SWEP.ProceduralHolsterTime = 0

--[[WEAPON HANDLING]]--

--Firing related
--SWEP.Primary.Sound 			= Sound("Jetgun.Fire")				-- This is the sound of the weapon, when you shoot.
SWEP.Primary.Damage		= 5					-- Damage, in standard damage points.
SWEP.DamageType = DMG_SHOCK --See DMG enum.  This might be DMG_SHOCK, DMG_BURN, DMG_BULLET, etc.
SWEP.Primary.NumShots	= 1 --The number of shots the weapon fires.  SWEP.Shotgun is NOT required for this to be >1.
SWEP.Primary.Automatic			= true					-- Automatic/Semi Auto
SWEP.Primary.RPM				= 800					-- This is in Rounds Per Minute / RPM
SWEP.Primary.RPM_Semi				= 800					-- RPM for semi-automatic or burst fire.  This is in Rounds Per Minute / RPM
SWEP.FiresUnderwater = true
SWEP.Primary.HullSize = 16 --Big bullets, increase this value.  They increase the hull size of the hitscan bullet.

-- nZombies Stuff
SWEP.NZWonderWeapon		= false	-- Is this a Wonder-Weapon? If true, only one player can have it at a time. Cheats aren't stopped, though.
--SWEP.NZRePaPText		= "your text here"	-- When RePaPing, what should be shown? Example: Press E to your text here for 2000 points.
SWEP.NZPaPName				= "Jetpack Joyride"
--SWEP.NZPaPReplacement 	= "tfa_cso_dualinfinityfinal"	-- If Pack-a-Punched, replace this gun with the entity class shown here.
SWEP.NZPreventBox		= false	-- If true, this gun won't be placed in random boxes GENERATED. Users can still place it in manually.
SWEP.NZTotalBlackList	= false	-- if true, this gun can't be placed in the box, even manually, and can't be bought off a wall, even if placed manually. Only code can give this gun.


-- Selective Fire Stuff

SWEP.SelectiveFire		= false --Allow selecting your firemode?
SWEP.DisableBurstFire	= false --Only auto/single?
SWEP.OnlyBurstFire		= false --No auto, only burst/single?
SWEP.DefaultFireMode 	= "Auto" --Default to auto or whatev
SWEP.FireModes = {"Auto"}

--Ammo Related

SWEP.Primary.ClipSize			= 50					-- This is the size of a clip
SWEP.Primary.DefaultClip			= 150				-- This is the number of bullets the gun gives you, counting a clip as defined directly above.
SWEP.Primary.Ammo			= "pistol"					-- What kind of ammo.  Options, besides custom, include pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, and AirboatGun.  
--Pistol, buckshot, and slam like to ricochet. Use AirboatGun for a light metal peircing shotgun pellets

SWEP.DisableChambering = true --Disable round-in-the-chamber

--Recoil Related
SWEP.Primary.KickUp			= 0				-- This is the maximum upwards recoil (rise)
SWEP.Primary.KickDown			= 0					-- This is the maximum downwards recoil (skeet)
SWEP.Primary.KickHorizontal			= 0.125					-- This is the maximum sideways recoil (no real term)
SWEP.Primary.StaticRecoilFactor = 0 	--Amount of recoil to directly apply to EyeAngles.  Enter what fraction or percentage (in decimal form) you want.  This is also affected by a convar that defaults to 0.5.

--Firing Cone Related

SWEP.Primary.Spread		= .00675					--This is hip-fire acuracy.  Less is more (1 is horribly awful, .0001 is close to perfect)
SWEP.Primary.IronAccuracy = .0035	-- Ironsight accuracy, should be the same for shotguns

--Unless you can do this manually, autodetect it.  If you decide to manually do these, uncomment this block and remove this line.
SWEP.Primary.SpreadMultiplierMax = 3 --How far the spread can expand when you shoot.
SWEP.Primary.SpreadIncrement = 0.5 --What percentage of the modifier is added on, per shot.
SWEP.Primary.SpreadRecovery = 3 --How much the spread recovers, per second.

--Range Related
SWEP.Primary.Range = 450 -- The distance the bullet can travel in source units.  Set to -1 to autodetect based on damage/rpm.
SWEP.Primary.RangeFalloff = -1 -- The percentage of the range the bullet damage starts to fall off at.  Set to 0.8, for example, to start falling off after 80% of the range.


--Penetration Related

SWEP.MaxPenetrationCounter=2 --The maximum number of ricochets.  To prevent stack overflows.

--Misc
SWEP.IronRecoilMultiplier=0.75 --Multiply recoil by this factor when we're in ironsights.  This is proportional, not inversely.
SWEP.CrouchRecoilMultiplier=0.75  --Multiply recoil by this factor when we're crouching.  This is proportional, not inversely.
SWEP.JumpRecoilMultiplier=1.3  --Multiply recoil by this factor when we're crouching.  This is proportional, not inversely.
SWEP.WallRecoilMultiplier=1.1  --Multiply recoil by this factor when we're changing state e.g. not completely ironsighted.  This is proportional, not inversely.
SWEP.ChangeStateRecoilMultiplier=1.3  --Multiply recoil by this factor when we're crouching.  This is proportional, not inversely.
SWEP.CrouchAccuracyMultiplier=0.9--Less is more.  Accuracy * 0.5 = Twice as accurate, Accuracy * 0.1 = Ten times as accurate
SWEP.ChangeStateAccuracyMultiplier=1.5 --Less is more.  A change of state is when we're in the progress of doing something, like crouching or ironsighting.  Accuracy * 2 = Half as accurate.  Accuracy * 5 = 1/5 as accurate
SWEP.JumpAccuracyMultiplier=2--Less is more.  Accuracy * 2 = Half as accurate.  Accuracy * 5 = 1/5 as accurate
SWEP.WalkAccuracyMultiplier=1.5--Less is more.  Accuracy * 2 = Half as accurate.  Accuracy * 5 = 1/5 as accurate
SWEP.IronSightTime = 0.3 --The time to enter ironsights/exit it.
SWEP.NearWallTime = 0.25 --The time to pull up  your weapon or put it back down
SWEP.ToCrouchTime = 0.05 --The time it takes to enter crouching state
SWEP.WeaponLength = 50 --Almost 3 feet Feet.  This should be how far the weapon sticks out from the player.  This is used for calculating the nearwall trace.
SWEP.MoveSpeed = 1.1 --Multiply the player's movespeed by this.
SWEP.IronSightsMoveSpeed = 0.8 --Multiply the player's movespeed by this when sighting.
SWEP.SprintFOVOffset = 3.75 --Add this onto the FOV when we're sprinting.

--[[PROJECTILES]]--

SWEP.ProjectileEntity = nil --Entity to shoot
SWEP.ProjectileVelocity = 0 --Entity to shoot's velocity
SWEP.ProjectileModel = nil --Entity to shoot's model

--[[VIEWMODEL]]--

SWEP.ViewModel			= "models/weapons/tfa_cso/c_jetgunex.mdl" --Viewmodel path
SWEP.ViewModelFOV			= 80		-- This controls how big the viewmodel looks.  Less is more.
SWEP.ViewModelFlip			= true		-- Set this to true for CSS models, or false for everything else (with a righthanded viewmodel.)
SWEP.UseHands = true --Use gmod c_arms system.
SWEP.VMPos = Vector(0,0,0) --The viewmodel positional offset, constantly.  Subtract this from any other modifications to viewmodel position. 
SWEP.VMAng = Vector(0,0,0) --The viewmodel angular offset, constantly.   Subtract this from any other modifications to viewmodel angle. 
SWEP.VElements = {
    ["addictive01"] = { type = "Model", model = "models/hunter/plates/plate1x1.mdl", bone = "Bone071", rel = "", pos = Vector(0, 10, -6), angle = Angle(45, 90, 90), size = Vector(0.5, 0.5, 0), color = Color(255, 255, 255, 255), surpresslightning = false, material = "sprites/ef_jetgun_fx01", skin = 0, bodygroup = {}, active = false},
	["addictive02"] = { type = "Model", model = "models/hunter/plates/plate1x1.mdl", bone = "Bone054", rel = "", pos = Vector(4, -10, 8), angle = Angle(-135, 90, 90), size = Vector(0.5, 0.5, 0), color = Color(255, 255, 255, 255), surpresslightning = false, material = "sprites/ef_jetgun_fx01", skin = 0, bodygroup = {}, active = false}
}

--[[WORLDMODEL]]--

SWEP.WorldModel			= "models/weapons/tfa_cso/w_jetrightex.mdl" -- Worldmodel path

SWEP.HoldType 				= "duel"		-- This is how others view you carrying the weapon. Options include:
-- normal melee melee2 fist knife smg ar2 pistol rpg physgun grenade shotgun crossbow slam passive
-- You're mostly going to use ar2, smg, shotgun or pistol. rpg and crossbow make for good sniper rifles

SWEP.Offset = { --Procedural world model animation, defaulted for CS:S purposes.
        Pos = {
        Up = -2,
        Right = 0,
        Forward = 0,
        },
        Ang = {
        Up = -90,
        Right = 0,
        Forward = 180
        },
        Scale = 1.4
}

SWEP.WElements = {
    ["jetgun_l"] = { type = "Model", model = "models/weapons/tfa_cso/w_jetleftex.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "", pos = Vector(0, 1, 1), angle = Angle(0, 85, 0), size = Vector(1.4, 1.4, 1.4), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
    ["tracer_l"] = { type = "Model", model = "models/hunter/plates/plate1x1.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "", pos = Vector(75, 2, 2), angle = Angle(180, 0, 90), size = Vector(3, 1, 0), color = Color(255, 255, 255, 255), surpresslightning = false, material = "tracers/ef_jetgun_fxw01", skin = 0, bodygroup = {}, active = false },
    ["tracer_r"] = { type = "Model", model = "models/hunter/plates/plate1x1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(75, 0, -2), angle = Angle(180, 0, 90), size = Vector(3, 1, 0), color = Color(255, 255, 255, 255), surpresslightning = false, material = "tracers/ef_jetgun_fxw01", skin = 0, bodygroup = {}, active = false },
    ["jetpack"] = { type = "Model", model = "models/weapons/tfa_cso/w_jetpackex.mdl", bone = "ValveBiped.Bip01_Spine2", rel = "", pos = Vector(5, 10, 0), angle = Angle(90, -180, 0), size = Vector(1.2, 1.2, 1.2), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}

SWEP.ThirdPersonReloadDisable=false --Disable third person reload?  True disables.

SWEP.ShowWorldModel = true

--[[SCOPES]]--

SWEP.BoltAction			= false  --Unscope/sight after you shoot?
SWEP.Scoped				= false  --Draw a scope overlay?

SWEP.ScopeOverlayThreshold = 0.875 --Percentage you have to be sighted in to see the scope.
SWEP.BoltTimerOffset = 0.25 --How long you stay sighted in after shooting, with a bolt action.

SWEP.ScopeScale = 0.5 --Scale of the scope overlay
SWEP.ReticleScale = 0.7 --Scale of the reticle overlay

--GDCW Overlay Options.  Only choose one.

SWEP.Secondary.UseACOG			= false	 --Overlay option
SWEP.Secondary.UseMilDot			= false			 --Overlay option
SWEP.Secondary.UseSVD			= false		 --Overlay option
SWEP.Secondary.UseParabolic		= false		 --Overlay option
SWEP.Secondary.UseElcan			= false	 --Overlay option
SWEP.Secondary.UseGreenDuplex		= true		 --Overlay option

--[[SHOTGUN CODE]]--

SWEP.Shotgun = false --Enable shotgun style reloading.

SWEP.ShellTime			= .4 -- For shotguns, how long it takes to insert a shell.

--[[SPRINTING]]--

SWEP.RunSightsPos = Vector(0, 0, 0)
SWEP.RunSightsAng = Vector(-16.223, -0.562, 0)

--[[IRONSIGHTS]]--

SWEP.data 				= {}
SWEP.data.ironsights			= 0 --Enable Ironsights
SWEP.Secondary.IronFOV			= 55					-- How much you 'zoom' in. Less is more!  Don't have this be <= 0.  A good value for ironsights is like 70.

SWEP.IronSightsPos = Vector(6.35, 0, 2.03)
SWEP.IronSightsAng = Vector(1.563, -0.25, 0)

--[[INSPECTION]]--

SWEP.InspectPos = nil --Replace with a vector, in style of ironsights position, to be used for inspection
SWEP.InspectAng = nil --Replace with a vector, in style of ironsights angle, to be used for inspection
SWEP.InspectionLoop = true --Setting false will cancel inspection once the animation is done.  CS:GO style.

--[[VIEWMODEL ANIMATION HANDLING]]--

SWEP.ShootWhileDraw=false --Can you shoot while draw anim plays?
SWEP.AllowReloadWhileDraw=false --Can you reload while draw anim plays?
SWEP.SightWhileDraw=false --Can we sight in while the weapon is drawing / the draw anim plays?
SWEP.AllowReloadWhileHolster=true --Can we interrupt holstering for reloading?
SWEP.ShootWhileHolster=true --Cam we interrupt holstering for shooting?
SWEP.SightWhileHolster=false --Cancel out "iron"sights when we holster?
SWEP.UnSightOnReload=true --Cancel out ironsights for reloading.
SWEP.AllowReloadWhileSprinting=false --Can you reload when close to a wall and facing it?
SWEP.AllowReloadWhileNearWall=false --Can you reload when close to a wall and facing it?
SWEP.SprintBobMult=1.5 -- More is more bobbing, proportionally.  This is multiplication, not addition.  You want to make this > 1 probably for sprinting.
SWEP.IronBobMult=0  -- More is more bobbing, proportionally.  This is multiplication, not addition.  You want to make this < 1 for sighting, 0 to outright disable.
SWEP.AllowViewAttachment = true --Allow the view to sway based on weapon attachment while reloading or drawing, IF THE CLIENT HAS IT ENABLED IN THEIR CONVARS!!!!11111oneONEELEVEN
SWEP.AllowSprintAttack = true --Shoot while sprinting?

--[[HOLDTYPES]]--

SWEP.IronSightHoldTypeOverride=""  --This variable overrides the ironsights holdtype, choosing it instead of something from the above tables.  Change it to "" to disable.
SWEP.SprintHoldTypeOverride=""  --This variable overrides the sprint holdtype, choosing it instead of something from the above tables.  Change it to "" to disable.

--[[VIEWMODEL BLOWBACK]]--

SWEP.BlowbackEnabled = true --Enable Blowback?
SWEP.BlowbackVector = Vector(0,-2,0) --Vector to move bone <or root> relative to bone <or view> orientation.
SWEP.BlowbackCurrentRoot = 0 --Amount of blowback currently, for root
SWEP.BlowbackCurrent = 0 --Amount of blowback currently, for bones
SWEP.Blowback_Only_Iron = true --Only do blowback on ironsights
SWEP.Blowback_PistolMode = false --Do we recover from blowback when empty?
SWEP.Blowback_Shell_Enabled = true
SWEP.Blowback_Shell_Effect = "9mmShellEject"

--[[ANIMATION]]--

SWEP.ForceDryFireOff = true --Disables dryfire.  Set to false to enable them.
SWEP.DisableIdleAnimations = false --Disables idle animations.  Set to false to enable them.
SWEP.ForceEmptyFireOff = true --Disables empty fire animations.  Set to false to enable them.
SWEP.StatusLengthOverride = {
	[ACT_VM_RELOAD] = 26 / 30
}

--If you really want, you can remove things from SWEP.actlist and manually enable animations and set their lengths.

SWEP.SequenceEnabled = {} --Self explanitory.  This can forcefully enable or disable a certain ACT_VM
SWEP.SequenceLength = {}  --This controls the length of a certain ACT_VM
//SWEP.SequenceLengthOverride={
//	[ACT_VM_PRIMARYATTACK] = 1,
//}
--[[EFFECTS]]--

--Muzzle Flash

SWEP.MuzzleAttachment			= "0" 		-- Should be "1" for CSS models or "muzzle" for hl2 models
--SWEP.MuzzleAttachmentRaw = 1 --This will override whatever string you gave.  This is the raw attachment number.  This is overridden or created when a gun makes a muzzle event.
SWEP.ShellAttachment			= "2" 		-- Should be "2" for CSS models or "shell" for hl2 models

SWEP.DoMuzzleFlash = true --Do a muzzle flash?
SWEP.CustomMuzzleFlash = true --Disable muzzle anim events and use our custom flashes?
SWEP.AutoDetectMuzzleAttachment = false --For multi-barrel weapons, detect the proper attachment?
SWEP.MuzzleFlashEffect = "cso_muz_jetgun" --Change to a string of your muzzle flash effect.  Copy/paste one of the existing from the base.

SWEP.ImpactEffect = "tfa_metal_impact"--Impact Effect
SWEP.ImpactDecal = "FadingScorch"--Impact Decal

--Tracer Stuff

SWEP.Tracer				= 0		--Bullet tracer.  TracerName overrides this.
SWEP.TracerName 		= nil 	--Change to a string of your tracer name.  Can be custom.
								--There is a nice example at https://github.com/garrynewman/garrysmod/blob/master/garrysmod/gamemodes/base/entities/effects/tooltracer.lua
SWEP.TracerCount 		= 1 	--0 disables, otherwise, 1 in X chance


SWEP.TracerLua 			= false --Use lua effect, TFA Muzzle syntax.  Currently obsolete.
SWEP.TracerDelay		= 0.01 --Delay for lua tracer effect

--[[EVENT TABLE]]--

SWEP.EventTable = {
    [ACT_VM_DRAW] = {
        {time = 1 / 30, type = "lua", value = function(wep)
            wep.VElements.addictive01.active = false
            wep.VElements.addictive02.active = false
            wep:ClearStatCache("VElements.addictive01.active")
            wep:ClearStatCache("VElements.addictive02.active")
        end}
    },
    [ACT_VM_IDLE] = {
        {time = 1 / 30, type = "lua", value = function(wep)
            wep.VElements.addictive01.active = false
            wep.VElements.addictive02.active = false
            wep:ClearStatCache("VElements.addictive01.active")
            wep:ClearStatCache("VElements.addictive02.active")
        end}
    },
    [ACT_VM_RELOAD] = {
        {time = 20 / 30, type = "lua", value = function(wep)
            wep.VElements.addictive01.active = true
            wep.VElements.addictive02.active = true
            wep:ClearStatCache("VElements.addictive01.active")
            wep:ClearStatCache("VElements.addictive02.active")
        end}
    },
    [ACT_VM_PRIMARYATTACK] = {
        {time = 1 / 30, type = "lua", value = function(wep)
            wep.VElements.addictive01.active = false
            wep.VElements.addictive02.active = false
            wep:ClearStatCache("VElements.addictive01.active")
            wep:ClearStatCache("VElements.addictive02.active")
        end}
    },
    [ACT_VM_SECONDARYATTACK] = {
        {time = 1 / 30, type = "lua", value = function(wep)
            wep.VElements.addictive01.active = false
            wep.VElements.addictive02.active = false
            wep:ClearStatCache("VElements.addictive01.active")
            wep:ClearStatCache("VElements.addictive02.active")
        end}
    },
    [ACT_VM_DRYFIRE] = {
        {time = 1 / 30, type = "lua", value = function(wep)
            wep.VElements.addictive01.active = false
            wep.VElements.addictive02.active = false
            wep:ClearStatCache("VElements.addictive01.active")
            wep:ClearStatCache("VElements.addictive02.active")
        end}
    }
}


--[[RENDER TARGET]]--

SWEP.RTMaterialOverride = nil -- Take the material you want out of print(LocalPlayer():GetViewModel():GetMaterials()), subtract 1 from its index, and set it to this.

SWEP.RTOpaque = false -- Do you want your render target to be opaque?

SWEP.RTCode = function( self ) --This is the function to draw onto your rendertarget
	
	return
	
end

--[[AKIMBO]]--

SWEP.Akimbo = true --Akimbo gun?  Alternates between primary and secondary attacks.
SWEP.AnimCycle = 0 -- Start on the right
 
--[[TTT]]--

local gm = engine.ActiveGamemode()
if string.find(gm,"ttt") or string.find(gm,"terrorist") then
	SWEP.Kind = WEAPON_HEAVY
	SWEP.AutoSpawnable = false
	SWEP.AllowDrop = true
	SWEP.AmmoEnt = "item_ammo_smg1_ttt"
	SWEP.Base = "weapon_tttbase"
	DEFINE_BASECLASS("weapon_tttbase")
else
	SWEP.Base = "weapon_base"
	DEFINE_BASECLASS("weapon_base")
end



--[[MISC INFO FOR MODELERS]]--

--[[

Used Animations (for modelers):

ACT_VM_DRAW - Draw
ACT_VM_DRAW_EMPTY - Draw empty
ACT_VM_DRAW_SILENCED - Draw silenced, overrides empty

ACT_VM_IDLE - Idle
ACT_VM_IDLE_SILENCED - Idle empty, overwritten by silenced
ACT_VM_IDLE_SILENCED - Idle silenced

ACT_VM_PRIMARYATTACK - Shoot
ACT_VM_PRIMARYATTACK_EMPTY - Shoot last chambered bullet
ACT_VM_PRIMARYATTACK_SILENCED - Shoot silenced, overrides empty
ACT_VM_PRIMARYATTACK_1 - Shoot ironsights, overriden by everything besides normal shooting
ACT_VM_DRYFIRE - Dryfire

ACT_VM_RELOAD - Reload / Tactical Reload / Insert Shotgun Shell
ACT_SHOTGUN_RELOAD_START - Start shotgun reload, unless ACT_VM_RELOAD_EMPTY is there.
ACT_SHOTGUN_RELOAD_FINISH - End shotgun reload.
ACT_VM_RELOAD_EMPTY - Empty mag reload, chambers the new round.  Works for shotguns too, where applicable.
ACT_VM_RELOAD_SILENCED - Silenced reload, overwrites all


ACT_VM_HOLSTER - Holster
ACT_VM_HOLSTER_SILENCED - Holster empty, overwritten by silenced
ACT_VM_HOLSTER_SILENCED - Holster silenced

]]--

--[[Stuff you SHOULD NOT touch after this]]--

--Allowed VAnimations.  These are autodetected, so not really needed except as an extra precaution.  Do NOT change these, unless absolutely necessary.

SWEP.CanDrawAnimate=true
SWEP.CanDrawAnimateEmpty=true
SWEP.CanDrawAnimateSilenced=false
SWEP.CanHolsterAnimate=true
SWEP.CanHolsterAnimateEmpty=false
SWEP.CanIdleAnimate=true
SWEP.CanIdleAnimateEmpty=true
SWEP.CanIdleAnimateSilenced=false
SWEP.CanShootAnimate=true
SWEP.CanShootAnimateSilenced=false
SWEP.CanReloadAnimate=true
SWEP.CanReloadAnimateEmpty=false
SWEP.CanReloadAnimateSilenced=false
SWEP.CanDryFireAnimate=false
SWEP.CanDryFireAnimateSilenced=false
SWEP.CanSilencerAttachAnimate=false
SWEP.CanSilencerDetachAnimate=false

--Misc

SWEP.ShouldDrawAmmoHUD=false--THIS IS PROCEDURALLY CHANGED AND SHOULD NOT BE TWEAKED.  BASE DEPENDENT VALUE.  DO NOT CHANGE OR THINGS MAY BREAK.  NO USE TO YOU.
SWEP.DefaultFOV=90 --BASE DEPENDENT VALUE.  DO NOT CHANGE OR THINGS MAY BREAK.  NO USE TO YOU.

SWEP.Base				= "tfa_gun_base"

SWEP.Secondary.Sound = Sound("Jetgun.Dash")
SWEP.Secondary.ClipSize			= -1					-- Size of a clip
SWEP.Secondary.DefaultClip			= 0					-- Default ammo to give...
SWEP.Secondary.Automatic			= false					-- Automatic/Semi Auto
SWEP.Secondary.Ammo			= "jetpackex" -- Self explanitory, ammo type.
SWEP.Secondary.MaxAmmo = 2
SWEP.NextGen = 0

DEFINE_BASECLASS("tfa_gun_base")

function SWEP:IsValidTarget(target)
	if not IsValid(target) then return false end -- don't break
	if target == self:GetOwner() then return false end -- not ourselves!

	if engine.ActiveGamemode() == "zombiesurvival" then
		if target:IsPlayer() and target:Team() == TEAM_UNDEAD and target:Alive() and not target:IsFrozen() then
			return true
		end
	else
		if (GetConVar("sv_tfa_cso_dmg_jetgun_player"):GetBool() and (target:IsPlayer() and target:Alive() and not target:IsFrozen())) or target:IsNPC() or target:IsNextBot() then
			return true
		end
	end
	return false
end

function SWEP:Initialize()
	BaseClass.Initialize(self)

	self.StatCache_Blacklist["Primary.Damage"] = true

	self:ClearStatCache()
end
 
function SWEP:PrimaryAttack()
	if SERVER then
		if TFA.Enum.ReadyStatus[ self:GetStatus() ] and self:Clip1() > 0 then
			for k,v in pairs(ents.FindInSphere(self.Owner:GetPos(),250)) do
				if self:IsValidTarget(v) then
					local dmginfo = CSO:DMGInfo(self.Owner, self, self.Primary_TFA.Damage, Vector(0,0,0), DMG_SHOCK, v:GetPos() + v:OBBCenter())
					v:TakeDamageInfo(dmginfo)
				end
			end
		end
	end
	BaseClass.PrimaryAttack(self)
end

function SWEP:SecondaryAttack()
	if self:Ammo2() > 0 and TFA.Enum.ReadyStatus[ self:GetStatus() ] and self.Owner:OnGround() then
		self.Owner:SetVelocity(self.Owner:GetForward() * 650 + self.Owner:GetUp() * 300)
		self.Weapon:SendWeaponAnim(ACT_VM_DRYFIRE)
		self.NextGen = 0
		self:TakeSecondaryAmmo(1)
		self:EmitSound(self:GetStat("Secondary.Sound"))
		self:SetStatusEnd(CurTime() + self:GetActivityLength( tanim ))
		self:SetNextPrimaryFire(CurTime() + 0.8)
		self:SetNextSecondaryFire(CurTime() + 0.4)
		self:SetNextIdleAnim(CurTime() + 0.85)
		elseif self:Ammo2() > 0 and TFA.Enum.ReadyStatus[ self:GetStatus() ] and not self.Owner:OnGround() then
		self.Owner:SetVelocity(self.Owner:GetForward() * 600 + self.Owner:GetUp() * 200)
		self.Weapon:SendWeaponAnim(ACT_VM_DRYFIRE)
		self.NextGen = 0
		self:TakeSecondaryAmmo(1)
		self:EmitSound(self:GetStat("Secondary.Sound"))
		self:SetStatusEnd(CurTime() + self:GetActivityLength( tanim ))
		self:SetNextPrimaryFire(CurTime() + 0.8)
		self:SetNextSecondaryFire(CurTime() + 0.8)
		self:SetNextIdleAnim(CurTime() + 0.85)
	end
end

function SWEP:PostPrimaryAttack()
    self.NextGen = self.NextGen + 1
	if SERVER then
		if self.NextGen >= 24 and self:Ammo2() < 2 then
			self.Owner:GiveAmmo(1, self.Secondary.Ammo, true)
			self.NextGen = 0
			self:EmitSound("Jetgun.Beep")
		end
	end
    BaseClass.PostPrimaryAttack(self)
end

function SWEP:CompleteReload()   
self.NextGen  = 0
BaseClass.CompleteReload(self)
end

function SWEP:Think2( ... )
	if not IsFirstTimePredicted() then
		return BaseClass.Think2(self,...)
	end
	if not self:VMIV() then return end
	if self.Shooting_Old == nil then
		self.Shooting_Old = false
	end
	local shooting = self:GetStatus() == TFA.GetStatus("shooting")
	if shooting ~= self.Shooting_Old then
		if shooting then
			self:EmitSound("Jetgun.Fire")
			self.NextIdleSound = CurTime() + 0
		else
			self:EmitSound("Jetgun.Fire_End")
			self.NextIdleSound = -1
			self:CleanParticles()
			self:SendViewModelAnim(ACT_VM_PRIMARYATTACK_EMPTY)
		end
	end
	if shooting then
		if self.NextIdleSound and CurTime() > self.NextIdleSound then
			self:EmitSound("Jetgun.Fire")
			self.NextIdleSound = CurTime() + SoundDuration( "Jetgun.Fire" ) - 0.1
		end
	end
	if self.Weapon:Ammo2() > self.Secondary.MaxAmmo then
			self.Owner:SetAmmo( self.Secondary.MaxAmmo, self.Secondary.Ammo )
	end
	if self:GetStatus() == TFA.GetStatus("shooting") then
	   if SERVER then
		  local effectdata = EffectData()
		  effectdata:SetEntity(self.Owner)
		  effectdata:SetOrigin(self.Owner:GetPos())
		  effectdata:SetAngles(Angle(0,0,0))
 
		  util.Effect("exp_jetgun_ring", effectdata)
		end
	end
	self.Shooting_Old = shooting
	BaseClass.Think2(self,...)
end

local range
local bul = {}
function SWEP:ShootBullet()
	bul.Attacker = self.Owner
	bul.Distance = self.Primary.Range
	bul.HullSize = self.Primary.HullSize
	bul.Num = 1
	bul.Damage = self.Primary.Damage
	bul.Distance = self.Primary.Range
	bul.Tracer = 0
	bul.Callback = cb
	bul.Src = self.Owner:GetShootPos()
	bul.Dir = self.Owner:GetAimVector()
	range = bul.Distance
	self.Owner:FireBullets(bul)
end

function SWEP:Holster( ... )
	self:StopSound("Jetgun.Idle")
	return BaseClass.Holster(self,...)
end

if CLIENT then
	SWEP.WepSelectIconCSO = Material("vgui/killicons/tfa_cso_jetgunex")
	SWEP.DrawWeaponSelection = TFA_CSO_DrawWeaponSelection
end