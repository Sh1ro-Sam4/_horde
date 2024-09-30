SWEP.Base				= "tfa_gun_base"
SWEP.Category				= "TFA CS:O Sniper Rifles" --The category.  Please, just choose something generic or something I've already done if you plan on only doing like one swep.
SWEP.Author				= "★Bullet★" --Author Tooltip
SWEP.Contact				= "" --Contact Info Tooltip
SWEP.Purpose				= "" --Purpose Tooltip
SWEP.Instructions				= "" --Instructions Tooltip
SWEP.Spawnable				= true --Can you, as a normal user, spawn this?
SWEP.AdminSpawnable			= true --Can an adminstrator spawn this?  Does not tie into your admin mod necessarily, unless its coded to allow for GMod's default ranks somewhere in its code.  Evolve and ULX should work, but try to use weapon restriction rather than these.
SWEP.DrawCrosshair			= true		-- Draw the crosshair?
SWEP.PrintName				= "None"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 3				-- Slot in the weapon selection menu.  Subtract 1, as this starts at 0.
SWEP.SlotPos				= 73			-- Position in the slot
SWEP.DrawAmmo				= true		-- Should draw the default HL2 ammo counter if enabled in the GUI.
SWEP.DrawWeaponInfoBox			= false		-- Should draw the weapon info box
SWEP.BounceWeaponIcon   		= 	false	-- Should the weapon icon bounce?
SWEP.AutoSwitchTo			= true		-- Auto switch to if we pick it up
SWEP.AutoSwitchFrom			= true		-- Auto switch from if you pick up a better weapon
SWEP.Weight				= 30			-- This controls how "good" the weapon is for autopickup.
SWEP.Type	= "Transcendent Sniper Rifle"
SWEP.Primary.Knockback = 0
SWEP.ProceduralHolsterTime = 0

--[[WEAPON HANDLING]]--

--Firing related
SWEP.Primary.Sound 			= Sound("ChainSR.Fire")				-- This is the sound of the weapon, when you shoot. 
SWEP.Primary.Damage		= 99 -- Damage, in standard damage points.
SWEP.DamageType = bit.bor(DMG_AIRBOAT, DMG_BLAST) --See DMG enum.  This might be DMG_SHOCK, DMG_BURN, DMG_BULLET, etc.
SWEP.Primary.HullSize = 4 --Big bullets,  increase this value.  They increase the hull size of the hitscan bullet.
SWEP.Primary.BlastRadius = 1
SWEP.Primary.DamageTypeHandled = false
SWEP.Primary.NumShots	= 1 --The number of shots the weapon fires.  SWEP.Shotgun is NOT required for this to be >1.
SWEP.Primary.Automatic			= false					-- Automatic/Semi Auto
SWEP.Primary.RPM				= 36					-- This is in Rounds Per Minute / RPM
SWEP.Primary.RPM_Semi				= 36					-- RPM for semi-automatic or burst fire.  This is in Rounds Per Minute / RPM
SWEP.FiresUnderwater = true

-- nZombies Stuff
SWEP.NZWonderWeapon		= false	-- Is this a Wonder-Weapon? If true, only one player can have it at a time. Cheats aren't stopped, though.
--SWEP.NZRePaPText		= "your text here"	-- When RePaPing, what should be shown? Example: Press E to your text here for 2000 points.
SWEP.NZPaPName				= "Hellcat Ultimate"
--SWEP.NZPaPReplacement 	= "tfa_cso_savery_v6"	-- If Pack-a-Punched, replace this gun with the entity class shown here.
SWEP.NZPreventBox		= false	-- If true, this gun won't be placed in random boxes GENERATED. Users can still place it in manually.
SWEP.NZTotalBlackList	= false	-- if true, this gun can't be placed in the box, even manually, and can't be bought off a wall, even if placed manually. Only code can give this gun.


-- Selective Fire Stuff

SWEP.SelectiveFire		= true --Allow selecting your firemode?
SWEP.DisableBurstFire	= false --Only auto/single?
SWEP.OnlyBurstFire		= false --No auto, only burst/single?
SWEP.DefaultFireMode 	= "Semi" --Default to auto or whatev
SWEP.FireModes = {"Semi"}

--Ammo Related

SWEP.Primary.ClipSize			= 10					-- This is the size of a clip
SWEP.Primary.DefaultClip			= 120				-- This is the number of bullets the gun gives you, counting a clip as defined directly above.
SWEP.Primary.Ammo			= "SniperPenetratedRound"					-- What kind of ammo.  Options, besides custom, include pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, and AirboatGun.  
--Pistol, buckshot, and slam like to ricochet. Use AirboatGun for a light metal peircing shotgun pellets

SWEP.DisableChambering = true --Disable round-in-the-chamber

--Recoil Related
SWEP.Primary.KickUp			= 0.365 				-- This is the maximum upwards recoil (rise)
SWEP.Primary.KickDown			= 0.235					-- This is the maximum downwards recoil (skeet)
SWEP.Primary.KickHorizontal			= 0.05					-- This is the maximum sideways recoil (no real term)
SWEP.Primary.StaticRecoilFactor = 0 	--Amount of recoil to directly apply to EyeAngles.  Enter what fraction or percentage (in decimal form) you want.  This is also affected by a convar that defaults to 0.5.

--Firing Cone Related

SWEP.Primary.Spread		= .005					--This is hip-fire acuracy.  Less is more (1 is horribly awful, .0001 is close to perfect)
SWEP.Primary.IronAccuracy = .0001	-- Ironsight accuracy, should be the same for shotguns

--Unless you can do this manually, autodetect it.  If you decide to manually do these, uncomment this block and remove this line.
SWEP.Primary.SpreadMultiplierMax = 4 --How far the spread can expand when you shoot.
SWEP.Primary.SpreadIncrement = 3 --What percentage of the modifier is added on, per shot.
SWEP.Primary.SpreadRecovery = 3.5 --How much the spread recovers, per second.

--Range Related
SWEP.Primary.Range = -1 -- The distance the bullet can travel in source units.  Set to -1 to autodetect based on damage/rpm.
SWEP.Primary.RangeFalloff = 1 -- The percentage of the range the bullet damage starts to fall off at.  Set to 0.8, for example, to start falling off after 80% of the range.


--Penetration Related

SWEP.MaxPenetrationCounter=2 --The maximum number of ricochets.  To prevent stack overflows.

--Misc
SWEP.IronRecoilMultiplier=0.75 --Multiply recoil by this factor when we're in ironsights.  This is proportional, not inversely.
SWEP.CrouchRecoilMultiplier=0.5  --Multiply recoil by this factor when we're crouching.  This is proportional, not inversely.
SWEP.JumpRecoilMultiplier=2  --Multiply recoil by this factor when we're jumping.  This is proportional, not inversely.
SWEP.WallRecoilMultiplier=1.1  --Multiply recoil by this factor when we're changing state e.g. not completely ironsighted.  This is proportional, not inversely.
SWEP.ChangeStateRecoilMultiplier=1.3  --Multiply recoil by this factor when we're crouching.  This is proportional, not inversely.
SWEP.CrouchAccuracyMultiplier=0.5--Less is more.  Accuracy * 0.5 = Twice as accurate, Accuracy * 0.1 = Ten times as accurate
SWEP.ChangeStateAccuracyMultiplier=1.5 --Less is more.  A change of state is when we're in the progress of doing something, like crouching or ironsighting.  Accuracy * 2 = Half as accurate.  Accuracy * 5 = 1/5 as accurate
SWEP.JumpAccuracyMultiplier=1--Less is more.  Accuracy * 2 = Half as accurate.  Accuracy * 5 = 1/5 as accurate
SWEP.WalkAccuracyMultiplier=2.5--Less is more.  Accuracy * 2 = Half as accurate.  Accuracy * 5 = 1/5 as accurate
SWEP.IronSightTime = 0 --The time to enter ironsights/exit it.
SWEP.NearWallTime = 0.25 --The time to pull up  your weapon or put it back down
SWEP.ToCrouchTime = 0.05 --The time it takes to enter crouching state
SWEP.WeaponLength = 50 --Almost 3 feet Feet.  This should be how far the weapon sticks out from the player.  This is used for calculating the nearwall trace.
SWEP.MoveSpeed = 1 --Multiply the player's movespeed by this.
SWEP.IronSightsMoveSpeed = 0.8 --Multiply the player's movespeed by this when sighting.
SWEP.SprintFOVOffset = 3.75 --Add this onto the FOV when we're sprinting.

--[[PROJECTILES]]--

SWEP.ProjectileEntity = nil --Entity to shoot
SWEP.ProjectileVelocity = 0 --Entity to shoot's velocity
SWEP.ProjectileModel = nil --Entity to shoot's model

--[[VIEWMODEL]]--

SWEP.ViewModel			= "models/weapons/tfa_cso/c_chainsr.mdl" --Viewmodel path
SWEP.ViewModelFOV			= 80		-- This controls how big the viewmodel looks.  Less is more.
SWEP.ViewModelFlip			= true		-- Set this to true for CSS models, or false for everything else (with a righthanded viewmodel.)
SWEP.UseHands = true --Use gmod c_arms system.
SWEP.VMPos = Vector(0,0,0) --The viewmodel positional offset, constantly.  Subtract this from any other modifications to viewmodel position. 
SWEP.VMAng = Vector(0,0,0) --The viewmodel angular offset, constantly.   Subtract this from any other modifications to viewmodel angle. 

//SWEP.ViewModelBoneMods = {
//	["root"] = { scale = Vector(1, 1, 1), pos = Vector(0, -0.5, 0), angle = Angle(0, 0, 0) },
//	["spsmg"] = { scale = Vector(1, 1, 1), pos = Vector(0, -0.5, 0), angle = Angle(0, 0, 0) }
//}

--[[WORLDMODEL]]--

SWEP.WorldModel			= "" -- Worldmodel path

SWEP.HoldType 				= "magic"		-- This is how others view you carrying the weapon. Options include:
-- normal melee melee2 fist knife smg ar2 pistol rpg physgun grenade shotgun crossbow slam passive
-- You're mostly going to use ar2, smg, shotgun or pistol. rpg and crossbow make for good sniper rifles

SWEP.Offset = { --Procedural world model animation, defaulted for CS:S purposes.
        Pos = {
        Up = -6,
        Right = 1,
        Forward = 8,
        },
        Ang = {
        Up = -90,
        Right = 0,
        Forward = 172
        },
		Scale = 1.2
}

SWEP.ThirdPersonReloadDisable=false --Disable third person reload?  True disables.

SWEP.ShowWorldModel = true

--[[SCOPES]]--

SWEP.BoltAction			= true  --Unscope/sight after you shoot?
SWEP.Scoped				= true  --Draw a scope overlay?

SWEP.ScopeOverlayThreshold = 0.875 --Percentage you have to be sighted in to see the scope.
SWEP.BoltTimerOffset = 0 --How long you stay sighted in after shooting, with a bolt action.

SWEP.ScopeScale = 1 --Scale of the scope overlay
SWEP.ReticleScale = 1 --Scale of the reticle overlay

--GDCW Overlay Options.  Only choose one.

SWEP.Secondary.ScopeTable = {
	["ScopeMaterial"] =  Material("scope/m95tiger/m95tiger_scope.png", "smooth"),
	["ScopeBorder"] = Color(0,0,0,88),
	["ScopeCrosshair"] = { ["r"] = 0, ["g"]  = 0, ["b"] = 0, ["a"] = 255, ["s"] = 0 }
}

--[[SHOTGUN CODE]]--

SWEP.Shotgun = false --Enable shotgun style reloading.

SWEP.ShellTime			= .4 -- For shotguns, how long it takes to insert a shell.

--[[SPRINTING]]--

SWEP.RunSightsPos = Vector(-5.788, -1.009, 0)
SWEP.RunSightsAng = Vector(-16.223, -35.562, 0)

--[[IRONSIGHTS]]--

SWEP.data 				= {}
SWEP.data.ironsights			= 1 --Enable Ironsights
SWEP.Secondary.IronFOV			= 10					-- How much you 'zoom' in. Less is more!  Don't have this be <= 0.  A good value for ironsights is like 70.
SWEP.IronSightsPos = Vector(5.891, -2.145, 1.134)
SWEP.IronSightsAng = Vector(1.406, 0, 0)

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

--[[HOLDTYPES]]--

SWEP.IronSightHoldTypeOverride=""  --This variable overrides the ironsights holdtype, choosing it instead of something from the above tables.  Change it to "" to disable.
SWEP.SprintHoldTypeOverride=""  --This variable overrides the sprint holdtype, choosing it instead of something from the above tables.  Change it to "" to disable.

--[[VIEWMODEL BLOWBACK]]--

SWEP.BlowbackEnabled = false --Enable Blowback?
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

--If you really want, you can remove things from SWEP.actlist and manually enable animations and set their lengths.

SWEP.SequenceEnabled = {} --Self explanitory.  This can forcefully enable or disable a certain ACT_VM
SWEP.SequenceLength = {}  --This controls the length of a certain ACT_VM
SWEP.StatusLengthOverride = {
	[ACT_VM_RELOAD] = 62 / 30
}

--[[EFFECTS]]--

--Muzzle Flash

SWEP.MuzzleAttachment			= "0" 		-- Should be "1" for CSS models or "muzzle" for hl2 models
--SWEP.MuzzleAttachmentRaw = 1 --This will override whatever string you gave.  This is the raw attachment number.  This is overridden or created when a gun makes a muzzle event.
SWEP.ShellAttachment			= "2" 		-- Should be "2" for CSS models or "shell" for hl2 models

SWEP.DoMuzzleFlash = true --Do a muzzle flash?
SWEP.CustomMuzzleFlash = true --Disable muzzle anim events and use our custom flashes?
SWEP.AutoDetectMuzzleAttachment = false --For multi-barrel weapons, detect the proper attachment?
SWEP.MuzzleFlashEffect = "muz_chainsr" --Change to a string of your muzzle flash effect.  Copy/paste one of the existing from the base.

--Tracer Stuff

SWEP.Tracer				= 0		--Bullet tracer.  TracerName overrides this.
SWEP.TracerName 		= "tra_chainsr" 	--Change to a string of your tracer name.  Can be custom.
								--There is a nice example at https://github.com/garrynewman/garrysmod/blob/master/garrysmod/gamemodes/base/entities/effects/tooltracer.lua
SWEP.TracerCount 		= 1 	--0 disables, otherwise, 1 in X chance


SWEP.TracerLua 			= false --Use lua effect, TFA Muzzle syntax.  Currently obsolete.
SWEP.TracerDelay		= 0.01 --Delay for lua tracer effect

--[[EVENT TABLE]]--

SWEP.EventTable = {} --Event Table, used for custom events when an action is played.  This can even do stuff like playing a pump animation after shooting.

--example:
--SWEP.EventTable = {
--	[ACT_VM_RELOAD] = {
--		{ ['time'] = 0.1, ['type'] = "lua", ['value'] = examplefunction, ['client'] = true, ['server'] = false  },
--		{ ['time'] = 0.2, ['type'] = "sound", ['value'] = Sound("ExampleGun.Sound1", ['client'] = true, ['server'] = false ) }
--	}
--}


--[[RENDER TARGET]]--

SWEP.RTMaterialOverride = nil -- Take the material you want out of print(LocalPlayer():GetViewModel():GetMaterials()), subtract 1 from its index, and set it to this.

SWEP.RTOpaque = false -- Do you want your render target to be opaque?

SWEP.RTCode = nil

--[[AKIMBO]]--

SWEP.Akimbo = false --Akimbo gun?  Alternates between primary and secondary attacks.
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

--Disable secondary crap

SWEP.Secondary.ClipSize			= 0					-- Size of a clip
SWEP.Secondary.DefaultClip			= 0					-- Default ammo to give...
SWEP.Secondary.Automatic			= false					-- Automatic/Semi Auto
SWEP.Secondary.Ammo			= "none" -- Self explanitory, ammo type.

SWEP.Base				= "tfa_gun_base"

if CLIENT then
	//SWEP.WepSelectIconCSO = Material("vgui/killicons/tfa_cso_chainsr")
	//SWEP.DrawWeaponSelection = TFA_CSO_DrawWeaponSelection
end

DEFINE_BASECLASS("tfa_gun_base" )
function SWEP:Reload(...)
	if self.Owner:KeyPressed(IN_RELOAD) and self:Clip1() < 20 and TFA.Enum.ReadyStatus[ self:GetStatus() ] and self:Ammo1() > 0 then
		-- timer.Simple(0.5,function()
		-- 	local effectdata = EffectData()
		-- 	effectdata:SetEntity(self.Owner)
		-- 	effectdata:SetOrigin(self.Owner:GetPos())
		-- 	effectdata:SetAngles(Angle(0,0,0))
		-- 	util.Effect("exp_gunkata", effectdata)
		-- 	local radius = 250
		-- 	local phys_force = 512
		-- 	local push_force = 1024
		-- 	for k, target in pairs( ents.FindInSphere( self.Owner:GetPos() + self.Owner:OBBCenter(), radius ) ) do
		-- 		if IsValid( target ) then
		-- 			local phys = target:GetPhysicsObject()
		-- 			local tpos = target:LocalToWorld( target:OBBCenter() )
		-- 			local dir = ( tpos - self.Owner:GetPos() ):GetNormal()
		-- 			if CSO:IsValidTarget(target, self.Owner) then
		-- 				if target ~= self.Owner then
	
		-- 					dir.z = math.abs( dir.z ) + 1
	
		-- 					local push = dir * push_force
	
		-- 					local vel = target:GetVelocity() + push
		-- 					vel.z = math.min( vel.z, push_force / 3 )
		-- 					vel.z = vel.z + 82
	
		-- 					target:SetVelocity( vel )
		
		-- 				end
		-- 			elseif IsValid( phys ) then
		-- 				phys:ApplyForceCenter( dir * 2.5 * phys_force * (phys:GetMass() * 0.8) )
		-- 			end
		-- 		end
		-- 	end
		-- end)
	end
	return BaseClass.Reload(self,...)
end

function SWEP:Holster( ... )
	self:StopSound("ChainSR.Idle")
	return BaseClass.Holster(self,...)
end

if(SERVER) then

	local function SetEntityDatas( ent1, ent2, target, sVec )
		if (!IsValid(ent1) || !IsValid(ent2)) then return false end
		ent1:SetModel(ent2:GetModel())
		ent1:SetFlexScale(ent2:GetFlexScale())
		for i = 0, ent2:GetNumBodyGroups() - 1 do ent1:SetBodygroup(i,ent2:GetBodygroup(i)) end
		for i = 0, ent2:GetFlexNum() - 1 do ent1:SetFlexWeight(i,ent2:GetFlexWeight(i)) end
		for i = 0, ent2:GetBoneCount() do
			ent1:ManipulateBoneScale(i,ent2:GetManipulateBoneScale(i))
			ent1:ManipulateBoneAngles(i,ent2:GetManipulateBoneAngles(i))
			ent1:ManipulateBonePosition(i,ent2:GetManipulateBonePosition(i))
			ent1:ManipulateBoneJiggle(i,ent2:GetManipulateBoneJiggle(i))
		end
	end

	function CreateGhost(ply, mdl, ang, vec)
		local v = GetTargets(vec + Vector(0, 0, 50), ply)
		if(v == nil) then return end
		local Ghost = ents.Create("npc_barney") -- barney is hardcoded to only take at most 20 out of 80 health in damage
		Ghost:SetPos(vec + Vector(0, 0, 1))
		Ghost:Spawn()
		Ghost:SetMaterial("models/debug/debugwhite")
		SetEntityDatas(Ghost, ply)
		local aimAng = Vector(v:GetPos() - vec):Angle()
		Ghost:SetCollisionGroup(COLLISION_GROUP_DEBRIS)
		Ghost:SetHealth(1024000)
		Ghost:SetMaxHealth(1024000)
		Ghost:SetAngles(Angle(aimAng.x, aimAng.y, 0))
		Ghost:SetSequence(111)
		Ghost:SetColor(Color(0, 0, 0, 255))
		Ghost:SetRenderMode(RENDERMODE_TRANSCOLOR)
		Ghost:Give("tfa_cso_chainsr")
		Ghost:AddFlags(65536) -- No target
		Ghost:NextThink(CurTime() + 32767)
		Ghost:SetMoveType(MOVETYPE_NOCLIP)
		local aimPos = v:GetPos()
		if(v:IsPlayer()) then
			aimPos = v:EyePos() -- Headshot LOL
		else
			aimPos = v:EyePos() - Vector(0, 0, 3)
		end
		local bAng = (aimPos - Ghost:GetShootPos()):Angle()
		local e = EffectData()
			e:SetOrigin(aimPos)
			e:SetStart(Ghost:GetShootPos())
		util.Effect("tra_chainsr", e)
		sound.Play("weapons/tfa_cso/chainsr/fire2.wav", Ghost:GetShootPos(), 100, 100, 1)
		Ghost.MarkAsGhost = true
		bullet = {}
			bullet.Attacker = ply
			bullet.Num = 1
			bullet.Src = Ghost:GetShootPos()
			bullet.Dir = bAng:Forward()
			bullet.HullSize = 1
			bullet.Spread = Vector(0, 0, 0)
			bullet.Tracer = 0
			bullet.Distance = 102400
			bullet.Force = 9
			bullet.Damage = 200
			bullet.IgnoreEntity = Ghost
		ply:FireBullets(bullet)
		timer.Simple(0.7, function()
			if(!IsValid(Ghost)) then return end
			Ghost:Remove()
		end)
	end

	function GetTargets(vec, attacker)
		local Targets = {}
		for k,v in pairs(ents.GetAll()) do
			if(!IsValid(v)) then continue end
			if(!v:IsNPC() && !v:IsPlayer()) then continue end
			if(v == attacker) then continue end
			if(v.MarkAsGhost) then continue end
			if(v:GetPos():Distance(vec) > 1536) then continue end
			if(v:Health() <= 0) then continue end
			local mins, maxs = v:GetCollisionBounds()
			local tr = {
				start = vec,
				endpos = v:EyePos(),
				mask = MASK_SHOT,
				filter = {v},
			}
			local ret = util.TraceLine(tr)
			if(ret.Fraction != 1) then continue end
			table.insert(Targets, v)
		end
		if(table.Count(Targets) <= 0) then return nil end
		return Targets[math.random(1, table.Count(Targets))]
	end

	hook.Add( "PlayerDeath", "GlobalDeathMessage", function( victim, inflictor, attacker )
		if(!IsValid(attacker) || !IsValid(victim)) then return end
		if(!attacker:IsPlayer()) then return end
		local w = attacker:GetActiveWeapon()
		if(!IsValid(w)) then return end
		if(w:GetClass() != "tfa_cso_chainsr") then return end
		local vec = util.QuickTrace(victim:GetPos(), Vector(victim:GetPos().x, victim:GetPos().y, -6000), victim).HitPos
		timer.Simple(1.25, function()
			CreateGhost(attacker, attacker:GetModel(), attacker:EyeAngles(), vec)
		end)
	end )

	hook.Add( "OnNPCKilled", "GlobalDeathMessage", function( npc, attacker, inflictor )
		if(!IsValid(attacker) || !IsValid(npc)) then return end
		if(!attacker:IsPlayer()) then return end
		local w = attacker:GetActiveWeapon()
		if(!IsValid(w)) then return end
		if(w:GetClass() != "tfa_cso_chainsr") then return end
		local vec = util.QuickTrace(npc:GetPos(), Vector(npc:GetPos().x, npc:GetPos().y, -6000), npc).HitPos
		timer.Simple(1.25, function()
			CreateGhost(attacker, attacker:GetModel(), attacker:EyeAngles(), vec)
		end)
	end )
end

function SWEP:FinishHolster(...)
  self:SetIronSightsProgress(0)
  
  if CLIENT then
      self.IronSightsProgressUnpredicted = 0
      self.IronSightsProgressUnpredicted2 = 0
      self.IronSightsProgressUnpredicted3 = 0
  end
  return BaseClass.FinishHolster(self, ...)
end