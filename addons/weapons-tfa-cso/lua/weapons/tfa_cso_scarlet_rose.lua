SWEP.Base = "tfa_melee_base"
SWEP.Category = "TFA CS:O Melees"
SWEP.PrintName = "Demonic Scarlet Rose"
SWEP.Author	= "Kamikaze" --Author Tooltip
SWEP.Type	= "Epic grade melee weapon"
SWEP.ViewModel = "models/weapons/tfa_cso/c_scarlet_rose.mdl"
SWEP.WorldModel = "models/weapons/tfa_cso/w_scarlet_rose.mdl"
SWEP.ViewModelFlip = false
SWEP.ViewModelFOV = 85
SWEP.UseHands = true
SWEP.HoldType = "melee2"
SWEP.DrawCrosshair = true
SWEP.Primary.Knockback = 0 

SWEP.Primary.Directional = false

SWEP.Spawnable = true
SWEP.AdminOnly = false

SWEP.DisableIdleAnimations = false

SWEP.Secondary.CanBash = false

--[[INSPECTION]]--

SWEP.InspectPos = Vector (0,0,0) --Replace with a vector, in style of ironsights position, to be used for inspection
SWEP.InspectAng = Vector (0,0,0) --Replace with a vector, in style of ironsights angle, to be used for inspection
SWEP.InspectionLoop = true --Setting false will cancel inspection once the animation is done.  CS:GO style.


-- nZombies Stuff
SWEP.NZWonderWeapon		= true	-- Is this a Wonder-Weapon? If true, only one player can have it at a time. Cheats aren't stopped, though.
--SWEP.NZRePaPText		= "your text here"	-- When RePaPing, what should be shown? Example: Press E to your text here for 2000 points.
SWEP.NZPaPName				= "KABOOOOOM!!!!!!!!!!!!"
--SWEP.NZPaPReplacement 	= "tfa_cso_dualsword"	-- If Pack-a-Punched, replace this gun with the entity class shown here.
SWEP.NZPreventBox		= false	-- If true, this gun won't be placed in random boxes GENERATED. Users can still place it in manually.
SWEP.NZTotalBlackList	= false	-- if true, this gun can't be placed in the box, even manually, and can't be bought off a wall, even if placed manually. Only code can give this gun.
SWEP.PaPMats			= {}

SWEP.Precision = 50
SWEP.Secondary.MaxCombo = -1
SWEP.Primary.MaxCombo = -1

SWEP.Offset = {
		Pos = {
		Up = -16,
		Right = 4,
		Forward = 3,
		},
		Ang = {
		Up = -0,
		Right = 0,
		Forward = 80
		},
		Scale = 1
}

sound.Add({
	['name'] = "ScarletRose.Draw",
	['channel'] = CHAN_WEAPON,
	['sound'] = { "weapons/tfa_cso/scarlet_rose/draw.wav" },
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "ScarletRose.Slash",
	['channel'] = CHAN_WEAPON,
	['sound'] = { "weapons/tfa_cso/scarlet_rose/slash.wav" },
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "ScarletRose.Stab1",
	['channel'] = CHAN_WEAPON,
	['sound'] = { "weapons/tfa_cso/scarlet_rose/stab1.wav" },
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "ScarletRose.Stab2",
	['channel'] = CHAN_WEAPON,
	['sound'] = { "weapons/tfa_cso/scarlet_rose/stab2.wav" },
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "ScarletRose.Stab3",
	['channel'] = CHAN_WEAPON,
	['sound'] = { "weapons/tfa_cso/scarlet_rose/stab3.wav" },
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "ScarletRose.Stab_Exp",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/scarlet_rose/stab_exp.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "ScarletRose.Hit1",
	['channel'] = CHAN_WEAPON,
	['sound'] = { "weapons/tfa_cso/scarlet_rose/hit1.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "ScarletRose.Hit2",
	['channel'] = CHAN_WEAPON,
	['sound'] = { "weapons/tfa_cso/scarlet_rose/hit2.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "ScarletRose.Hit3",
	['channel'] = CHAN_WEAPON,
	['sound'] = { "weapons/tfa_cso/scarlet_rose/hit3.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "ScarletRose.Wall1",
	['channel'] = CHAN_WEAPON,
	['sound'] = { "weapons/tfa_cso/scarlet_rose/wall1.wav" },
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "ScarletRose.Wall2",
	['channel'] = CHAN_WEAPON,
	['sound'] = { "weapons/tfa_cso/scarlet_rose/wall2.wav" },
	['pitch'] = {100,100}
})

SWEP.Primary.Attacks = {
    {
		['act'] = ACT_VM_PRIMARYATTACK, -- Animation; ACT_VM_THINGY, ideally something unique per-sequence
		['len'] = 160, -- Trace source; X ( +right, -left ), Y ( +forward, -back ), Z ( +up, -down )
		['dir'] = Vector(0,45,0), -- Trace dir/length; X ( +right, -left ), Y ( +forward, -back ), Z ( +up, -down )
		['dmg'] = 200, --This isn't overpowered enough, I swear!!
		['dmgtype'] = DMG_SLASH, --DMG_SLASH,DMG_CRUSH, etc.
		['delay'] = 0.2, --Delay
		['spr'] = true, --Allow attack while sprinting?
		['snd'] = "TFABaseMelee.Null", -- Sound ID
		['snd_delay'] = 0.2,
		["viewpunch"] = Angle(0,0,0), --viewpunch angle
		['end'] = 0.4, --time before next attack
		['hull'] = 32, --Hullsize
		['direction'] = "F", --Swing dir,
		['hitflesh'] = "ScarletRose.Hit2",
		['hitworld'] = "ScarletRose.Wall1",
		['maxhits'] = 25
	},
	{
		['act'] = ACT_VM_HITLEFT, -- Animation; ACT_VM_THINGY, ideally something unique per-sequence
		['len'] = 160, -- Trace source; X ( +right, -left ), Y ( +forward, -back ), Z ( +up, -down )
		['dir'] = Vector(0,45,0), -- Trace dir/length; X ( +right, -left ), Y ( +forward, -back ), Z ( +up, -down )
		['dmg'] = 200, --This isn't overpowered enough, I swear!!
		['dmgtype'] = DMG_SLASH, --DMG_SLASH,DMG_CRUSH, etc.
		['delay'] = 0.3, --Delay
		['spr'] = true, --Allow attack while sprinting?
		['snd'] = "TFABaseMelee.Null", -- Sound ID
		['snd_delay'] = 0.3,
		["viewpunch"] = Angle(0,0,0), --viewpunch angle
		['end'] = 0.4, --time before next attack
		['hull'] = 32, --Hullsize
		['direction'] = "F", --Swing dir,
		['hitflesh'] = "ScarletRose.Hit2",
		['hitworld'] = "ScarletRose.Wall1",
		['maxhits'] = 25
	},
}

SWEP.Secondary.Attacks = {
	{
		['act'] = ACT_VM_MISSLEFT, -- Animation; ACT_VM_THINGY, ideally something unique per-sequence
		['len'] = 140, -- Trace source; X ( +right, -left ), Y ( +forward, -back ), Z ( +up, -down )
		['dir'] = Vector(150,0,0), -- Trace dir/length; X ( +right, -left ), Y ( +forward, -back ), Z ( +up, -down )
		['dmg'] = 200, --Nope!! Not overpowered!!
		['dmgtype'] = DMG_SLASH, --DMG_SLASH,DMG_CRUSH, etc.
		['delay'] = 0.25, --Delay
		['spr'] = true, --Allow attack while sprinting?
		['snd'] = "TFABaseMelee.Null", -- Sound ID
		['snd_delay'] = 0.25,
		["viewpunch"] = Angle(0,0,0), --viewpunch angle
		['end'] = 1.5, --time before next attack
		['hull'] = 128, --Hullsize
		['direction'] = "F", --Swing dir
		['hitflesh'] = "ScarletRose.Hit3",
		['hitworld'] = "ScarletRose.Wall1",
		['maxhits'] = 25
	}
}

SWEP.InspectionActions = {ACT_VM_RECOIL1}

local BaseClass = baseclass.Get(SWEP.Base)
if CLIENT then
	SWEP.WepSelectIconCSO = Material("vgui/killicons/tfa_cso_scarlet_rose")
	SWEP.DrawWeaponSelection = TFA_CSO_DrawWeaponSelection
end

