SWEP.Base				= "tfa_gun_base"
SWEP.Category				= "TFA CS:O Equipment" --The category.  Please, just choose something generic or something I've already done if you plan on only doing like one swep.
SWEP.Author				= "★Bullet★" --Author Tooltip
SWEP.Contact				= "" --Contact Info Tooltip
SWEP.Purpose				= "" --Purpose Tooltip
SWEP.Instructions				= "" --Instructions Tooltip
SWEP.Spawnable				= true --Can you, as a normal user, spawn this?
SWEP.AdminSpawnable			= true --Can an adminstrator spawn this?  Does not tie into your admin mod necessarily, unless its coded to allow for GMod's default ranks somewhere in its code.  Evolve and ULX should work, but try to use weapon restriction rather than these.
SWEP.AdminOnly				= true
SWEP.DrawCrosshair			= true		-- Draw the crosshair?
SWEP.PrintName				= "C4"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 4				-- Slot in the weapon selection menu.  Subtract 1, as this starts at 0.
SWEP.SlotPos				= 73			-- Position in the slot
SWEP.DrawAmmo				= false		-- Should draw the default HL2 ammo counter if enabled in the GUI.
SWEP.DrawWeaponInfoBox			= false		-- Should draw the weapon info box
SWEP.BounceWeaponIcon   		= 	false	-- Should the weapon icon bounce?
SWEP.AutoSwitchTo			= true		-- Auto switch to if we pick it up
SWEP.AutoSwitchFrom			= true		-- Auto switch from if you pick up a better weapon
SWEP.Weight				= 30			-- This controls how "good" the weapon is for autopickup.
SWEP.Type	= "Basic Grade Equipment"
SWEP.ProceduralHolsterTime = 0

--[[WEAPON HANDLING]]--

--Firing related
SWEP.Primary.Sound 			= nil				-- This is the sound of the weapon, when you shoot.
SWEP.Primary.Damage		= 80000					-- Damage, in standard damage points.
SWEP.DamageType = DMG_BULLET --See DMG enum.  This might be DMG_SHOCK, DMG_BURN, DMG_BULLET, etc.
SWEP.Primary.NumShots	= 1 --The number of shots the weapon fires.  SWEP.Shotgun is NOT required for this to be >1.
SWEP.Primary.Automatic			= true					-- Automatic/Semi Auto
SWEP.Primary.RPM				= 100					-- This is in Rounds Per Minute / RPM
SWEP.Primary.RPM_Semi				= 100					-- RPM for semi-automatic or burst fire.  This is in Rounds Per Minute / RPM
SWEP.FiresUnderwater = true

-- nZombies Stuff
SWEP.NZWonderWeapon		= true	-- Is this a Wonder-Weapon? If true, only one player can have it at a time. Cheats aren't stopped, though.
--SWEP.NZRePaPText		= "your text here"	-- When RePaPing, what should be shown? Example: Press E to your text here for 2000 points.
SWEP.NZPaPName			= "TACTICAL NUKE"
--SWEP.NZPaPReplacement = "tfa_cso_darkknight_overlord"	-- If Pack-a-Punched, replace this gun with the entity class shown here.
SWEP.NZPreventBox		= false	-- If true, this gun won't be placed in random boxes GENERATED. Users can still place it in manually.
SWEP.NZTotalBlackList	= false	-- if true, this gun can't be placed in the box, even manually, and can't be bought off a wall, even if placed manually. Only code can give this gun.
SWEP.PaPMats			= {0}

--Ammo Related

SWEP.Primary.ClipSize			= 1					-- This is the size of a clip
SWEP.Primary.DefaultClip			= 0				-- This is the number of bullets the gun gives you, counting a clip as defined directly above.
SWEP.Primary.Ammo			= ""					-- What kind of ammo.  Options, besides custom, include pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, and AirboatGun.  
--Pistol, buckshot, and slam like to ricochet. Use AirboatGun for a light metal peircing shotgun pellets

SWEP.DisableChambering = true --Disable round-in-the-chamber

--[[PROJECTILES]]--

SWEP.ProjectileEntity = nil --Entity to shoot
SWEP.ProjectileVelocity = 0 --Entity to shoot's velocity
SWEP.ProjectileModel = nil --Entity to shoot's model

--[[VIEWMODEL]]--

SWEP.ViewModel			= "models/weapons/tfa_cso/c_c4.mdl" --Viewmodel path
SWEP.ViewModelFOV			= 80		-- This controls how big the viewmodel looks.  Less is more.
SWEP.ViewModelFlip			= true		-- Set this to true for CSS models, or false for everything else (with a righthanded viewmodel.)
SWEP.UseHands = true --Use gmod c_arms system.
SWEP.VMPos = Vector(0,0,0) --The viewmodel positional offset, constantly.  Subtract this from any other modifications to viewmodel position. 
SWEP.VMAng = Vector(0,0,0) --The viewmodel angular offset, constantly.   Subtract this from any other modifications to viewmodel angle. 

--[[WORLDMODEL]]--

SWEP.WorldModel			= "models/weapons/tfa_cso/w_c4.mdl" -- same case UHGI;DFSD/

SWEP.HoldType 				= "slam"		-- This is how others view you carrying the weapon. Options include:
-- normal melee melee2 fist knife smg ar2 pistol rpg physgun grenade shotgun crossbow slam passive
-- You're mostly going to use ar2, smg, shotgun or pistol. rpg and crossbow make for good sniper rifles

SWEP.Offset = { --Procedural world model animation, defaulted for CS:S purposes.
		Pos = {
		Up = -0.1,
		Right = 5,
		Forward = 4,
		},
		Ang = {
		Up = -90,
		Right = 0,
		Forward = -180
		},
		Scale = 1
}

SWEP.InspectPos = Vector(1,-2,-4) --Replace with a vector, in style of ironsights position, to be used for inspection
SWEP.InspectAng = Vector(25,25,-20) --Replace with a vector, in style of ironsights angle, to be used for inspection
SWEP.InspectionLoop = true --Setting false will cancel inspection once the animation is done.  CS:GO style.

SWEP.data 				= {}
SWEP.data.ironsights			= 0 --Enable Ironsights
SWEP.Secondary.IronFOV			= 75					-- How much you 'zoom' in. Less is more!  Don't have this be <= 0.  A good value for ironsights is like 70.

SWEP.AllowSprintAttack = true --Shoot while sprinting?

DEFINE_BASECLASS( SWEP.Base )
if CLIENT then
	SWEP.WepSelectIconCSO = Material("vgui/killicons/tfa_cso_c4")
	SWEP.DrawWeaponSelection = TFA_CSO_DrawWeaponSelection
end

function SWEP:Initialize()
	BaseClass.Initialize(self)

	self.StatCache_Blacklist["MoveSpeed"] = true

	self:ClearStatCache()
end

function SWEP:PrimaryAttack()
	if self:GetStatus() ~= TFA.GetStatus("idle") then return end
	--if self:GetOwner():GetVelocity():Length() > 10 then return end
	self:SendViewModelAnim( ACT_VM_PRIMARYATTACK )
	self:SetStatus(TFA.GetStatus("shooting"))
	self:SetStatusEnd(CurTime() + self:GetActivityLength())
	--[[
	self:GetOwner():AnimRestartGesture( GESTURE_SLOT_CUSTOM, self.SurrenderGesture, true )
	if game.SinglePlayer() then
		self:CallOnClient("Gesture",tostring( self.SurrenderGesture ) )
	end
	]]--
	self.CanPlaceC4 = true
end

function SWEP:Think2( ... )
	if self:GetStatus() == TFA.GetStatus("shooting") or self:GetStatus() == TFA.GetStatus("bashing") then
		self.MoveSpeed = 0.01
	else
		self.MoveSpeed = 1
	end
	local ply = self:GetOwner()
	if self:GetStatus() == TFA.GetStatus("shooting") then
		if ply:KeyDown(IN_ATTACK) then--and ply:GetVelocity():Length() < 10 then
			if CurTime() > self:GetStatusEnd() then
				self:SendViewModelAnim( ACT_VM_SECONDARYATTACK )
				self:SetStatus(TFA.GetStatus("bashing"))
				self:SetStatusEnd(CurTime() + 1.2)
			end
		else
			-- self:SetStatus(TFA.GetStatus("idle"))
			-- self:SetStatusEnd(-1)
			-- self:SendViewModelAnim(ACT_VM_IDLE)
			-- self:ChooseIdleAnim()
			self:Deploy()
		end
	elseif self:GetStatus() == TFA.GetStatus("bashing") and CurTime() > self:GetStatusEnd() then
		timer.Simple(0, function()
			if IsValid(self) and IsValid(ply) and ply.StripWeapon then
				ply:StripWeapon(self:GetClass())
			end
		end)
		if SERVER and self.CanPlaceC4 then
			local tdi = math.min( ply:GetEyeTrace().HitPos:Distance( ply:GetShootPos() ), 32 )
			local hpos = ply:GetShootPos() + ply:EyeAngles():Forward() * tdi
			local ent = ents.Create("cso_c4_planted")
			ent:SetPos(hpos)
			ent:SetAngles( Angle( 0, ply:EyeAngles().y, 0 ) )
			ent:Spawn()
			ent:Activate()
			ent:SetNWEntity("owner",self.Owner)
			ent.Damage = self.Primary.Damage
			self.CanPlaceC4  = false
		end
		return
	end
	return BaseClass.Think2( self, ... )
end

function SWEP:SecondaryAttack()
end