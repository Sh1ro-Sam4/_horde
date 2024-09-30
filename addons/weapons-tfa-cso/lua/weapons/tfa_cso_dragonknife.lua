SWEP.Base = "tfa_melee_base"
SWEP.Category = "TFA CS:O Melees"
SWEP.PrintName = "Dragon Knife"
SWEP.Author	= "Kamikaze" --Author Tooltip
SWEP.ViewModel = "models/weapons/tfa_cso/c_dragonknife.mdl"
SWEP.WorldModel = "models/weapons/tfa_cso/w_dragonknife.mdl"
SWEP.ViewModelFlip = false
SWEP.ViewModelFOV = 85
SWEP.UseHands = true
SWEP.HoldType = "knife"
SWEP.DrawCrosshair = true
SWEP.Primary.Knockback = 0 

SWEP.Primary.Directional = false

SWEP.Spawnable = true
SWEP.AdminOnly = false

SWEP.DisableIdleAnimations = false

SWEP.Secondary.CanBash = false
SWEP.Secondary.MaxCombo = -1
SWEP.Primary.MaxCombo = -1

SWEP.VMPos = Vector(0,0,0) --The viewmodel positional offset, constantly.  Subtract this from any other modifications to viewmodel position.

-- nZombies Stuff
SWEP.NZWonderWeapon		= false	-- Is this a Wonder-Weapon? If true, only one player can have it at a time. Cheats aren't stopped, though.
--SWEP.NZRePaPText		= "your text here"	-- When RePaPing, what should be shown? Example: Press E to your text here for 2000 points.
SWEP.NZPaPName				= "Dragon's Kiss"
--SWEP.NZPaPReplacement 	= "tfa_cso_dualinfinityfinal"	-- If Pack-a-Punched, replace this gun with the entity class shown here.
SWEP.NZPreventBox		= false	-- If true, this gun won't be placed in random boxes GENERATED. Users can still place it in manually.
SWEP.NZTotalBlackList	= false	-- if true, this gun can't be placed in the box, even manually, and can't be bought off a wall, even if placed manually. Only code can give this gun.


SWEP.Offset = { --Procedural world model animation, defaulted for CS:S purposes.
		Pos = {
		Up = -2.5,
		Right = 1,
		Forward = 4,
		},
		Ang = {
		Up = 180,
		Right = -10,
		Forward = 90
		},
		Scale = 1
}


sound.Add({
	['name'] = "DragonKnife.Draw",
	['channel'] = CHAN_WEAPON,
	['sound'] = { "weapons/tfa_cso/dragonknife/draw.wav" },
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "DragonKnife.Slash",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/dragonknife/slash.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "DragonKnife.HitFleshSlash",
	['channel'] = CHAN_WEAPON,
	['sound'] = { "weapons/tfa_cso/dragonknife/hit.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "DragonKnife.HitFleshStab",
	['channel'] = CHAN_WEAPON,
	['sound'] = { "weapons/tfa_cso/dragonknife/stab.wav" },
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "DragonKnife.HitWall",
	['channel'] = CHAN_WEAPON,
	['sound'] = { "weapons/tfa_cso/dragonknife/wall.wav" },
	['pitch'] = {100,100}
})

SWEP.Primary.Attacks = {
	{
		['act'] = ACT_VM_HITLEFT, -- Animation; ACT_VM_THINGY, ideally something unique per-sequence
		['len'] = 60, -- Trace source; X ( +right, -left ), Y ( +forward, -back ), Z ( +up, -down )
		['dir'] = Vector(50,0,-10), -- Trace dir/length; X ( +right, -left ), Y ( +forward, -back ), Z ( +up, -down )
		['dmg'] = 50, --This isn't overpowered enough, I swear!!
		['dmgtype'] = DMG_SLASH, --DMG_SLASH,DMG_CRUSH, etc.
		['delay'] = 0.18, --Delay
		['spr'] = true, --Allow attack while sprinting?
		['snd'] = "Weapon_Knife.Miss", -- Sound ID
		['snd_delay'] = 0.15,
		["viewpunch"] = Angle(0,0,0), --viewpunch angle
		['end'] = 0.4, --time before next attack
		['hull'] = 48, --Hullsize
		['direction'] = "W", --Swing dir,
		['hitflesh'] = "DragonKnife.HitFleshSlash",
		['hitworld'] = "DragonKnife.HitWall"
	},
	{
		['act'] = ACT_VM_HITRIGHT, -- Animation; ACT_VM_THINGY, ideally something unique per-sequence
		['len'] = 60, -- Trace source; X ( +right, -left ), Y ( +forward, -back ), Z ( +up, -down )
		['dir'] = Vector(50,0,-10), -- Trace dir/length; X ( +right, -left ), Y ( +forward, -back ), Z ( +up, -down )
		['dmg'] = 50, --This isn't overpowered enough, I swear!!
		['dmgtype'] = DMG_SLASH, --DMG_SLASH,DMG_CRUSH, etc.
		['delay'] = 0.15, --Delay
		['spr'] = true, --Allow attack while sprinting?
		['snd'] = "Weapon_Knife.Miss", -- Sound ID
		['snd_delay'] = 0.15,
		["viewpunch"] = Angle(0,0,0), --viewpunch angle
		['end'] = 0.4, --time before next attack
		['hull'] = 48, --Hullsize
		['direction'] = "W", --Swing dir,
		['hitflesh'] = "DragonKnife.HitFleshSlash",
		['hitworld'] = "DragonKnife.HitWall"
	}
}

SWEP.Secondary.Attacks = {
	{
		['act'] = ACT_VM_MISSLEFT, -- Animation; ACT_VM_THINGY, ideally something unique per-sequence
		['len'] = 60, -- Trace source; X ( +right, -left ), Y ( +forward, -back ), Z ( +up, -down )
		['dir'] = Vector(-30,0,0), -- Trace dir/length; X ( +right, -left ), Y ( +forward, -back ), Z ( +up, -down )
		['dmg'] = 100, --This isn't overpowered enough, I swear!!
		['dmgtype'] = bit.bor(DMG_SLASH,DMG_ALWAYSGIB), --DMG_SLASH,DMG_CRUSH, etc.
		['delay'] = 0.25, --Delay
		['spr'] = true, --Allow attack while sprinting?
		['snd'] = "Weapon_Knife.Miss", -- Sound ID
		['snd_delay'] = 0.2,
		["viewpunch"] = Angle(0,0,0), --viewpunch angle
		['end'] = 1, --time before next attack
		['hull'] = 48, --Hullsize
		['direction'] = "S", --Swing dir,
		['hitflesh'] = "DragonKnife.HitFleshStab",
		['hitworld'] = "DragonKnife.HitWall"
	}
}
if CLIENT then
	SWEP.WepSelectIconCSO = Material("vgui/killicons/tfa_cso_dragonknife")
	SWEP.DrawWeaponSelection = TFA_CSO_DrawWeaponSelection
end