SWEP.Base = "tfa_melee_base"
SWEP.Category = "TFA CS:O Melees"
SWEP.PrintName = "Beam Sword"

SWEP.ViewModel = "models/weapons/tfa_cso/c_beam_sword.mdl"
SWEP.WorldModel = "models/weapons/tfa_cso/w_beam_sword.mdl"
SWEP.ViewModelFlip = false
SWEP.ViewModelFOV = 75
SWEP.UseHands = true
SWEP.HoldType = "melee2"
SWEP.DrawCrosshair = true

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
SWEP.NZPaPName			= "Copyright Lightsword 5000"	-- What name this weapon should use when Pack-a-Punched.
--SWEP.NZPaPReplacement 	= "nil"	-- If Pack-a-Punched, replace this gun with the entity class shown here.
SWEP.NZPreventBox		= false	-- If true, this gun won't be placed in random boxes GENERATED. Users can still place it in manually.
SWEP.NZTotalBlackList	= false	-- if true, this gun can't be placed in the box, even manually, and can't be bought off a wall, even if placed manually.

SWEP.Offset = { --Procedural world model animation, defaulted for CS:S purposes.
		Pos = {
		Up = -1,
		Right = 1,
		Forward = 4,
		},
		Ang = {
		Up = 90,
		Right = -10,
		Forward = 180
		},
		Scale = 1.35
}

sound.Add({
	['name'] = "BeamSword.Draw",
	['channel'] = CHAN_WEAPON,
	['sound'] = { "weapons/tfa_cso/beamsword/draw.wav" },
	['pitch'] = {95,105}
})
sound.Add({
	['name'] = "BeamSword.Idle",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/beamsword/idle.wav" },
	['pitch'] = {100}
})
sound.Add({
	['name'] = "BeamSword.MidSlash1",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/beamsword/midslash1.wav" },
	['pitch'] = {95,105}
})
sound.Add({
	['name'] = "BeamSword.MidSlash2",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/beamsword/midslash2.wav" },
	['pitch'] = {95,105}
})
sound.Add({
	['name'] = "BeamSword.Stab",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/beamsword/stab.wav" },
	['pitch'] = {95,105}
})
sound.Add({
	['name'] = "BeamSword.Hit",
	['channel'] = CHAN_WEAPON,
	['sound'] = { "weapons/tfa_cso/beamsword/hit_1.wav", "weapons/tfa_cso/beamsword/hit_2.wav" },
	['pitch'] = {95,105}
})
sound.Add({
	['name'] = "BeamSword.HitWorld",
	['channel'] = CHAN_WEAPON,
	['sound'] = { "weapons/tfa_cso/beamsword/hit_wall_1.wav", "weapons/tfa_cso/beamsword/hit_wall_2.wav" },
	['pitch'] = {95,105}
})
sound.Add({
	['name'] = "TFABaseMelee.Null",
	['channel'] = CHAN_WEAPON,
	['sound'] = { "common/null.wav" },
	['pitch'] = {95,105}
})

SWEP.Primary.Attacks = {
	{
		['act'] = ACT_VM_PRIMARYATTACK, -- Animation; ACT_VM_THINGY, ideally something unique per-sequence
		['len'] = 100, -- Trace source; X ( +right, -left ), Y ( +forward, -back ), Z ( +up, -down )
		['dir'] = Vector(-60,0,-60), -- Trace dir/length; X ( +right, -left ), Y ( +forward, -back ), Z ( +up, -down )
		['dmg'] = 200, --This isn't overpowered enough, I swear!!
		['dmgtype'] = bit.bor(DMG_SLASH,DMG_ALWAYSGIB), --DMG_SLASH,DMG_CRUSH, etc.
		['delay'] = 0.25, --Delay
		['spr'] = true, --Allow attack while sprinting?
		['snd'] = "TFABaseMelee.Null", -- Sound ID
		['snd_delay'] = 0.25,
		["viewpunch"] = Angle(0,0,0), --viewpunch angle
		['end'] = 1, --time before next attack
		['hull'] = 24, --Hullsize
		['direction'] = "W", --Swing dir,
		['hitflesh'] = "BeamSword.Hit",
		['hitworld'] = "BeamSword.HitWorld"
	}
}

SWEP.Secondary.Attacks = {
	{
		['act'] = ACT_VM_SECONDARYATTACK, -- Animation; ACT_VM_THINGY, ideally something unique per-sequence
		['len'] = 100, -- Trace source; X ( +right, -left ), Y ( +forward, -back ), Z ( +up, -down )
		['dir'] = Vector(-60,0,60), -- Trace dir/length; X ( +right, -left ), Y ( +forward, -back ), Z ( +up, -down )
		['dmg'] = 200, --This isn't overpowered enough, I swear!!
		['dmgtype'] = bit.bor(DMG_SLASH,DMG_ALWAYSGIB), --DMG_SLASH,DMG_CRUSH, etc.
		['delay'] = 0.25, --Delay
		['spr'] = true, --Allow attack while sprinting?
		['snd'] = "TFABaseMelee.Null", -- Sound ID
		['snd_delay'] = 0.2,
		["viewpunch"] = Angle(0,0,0), --viewpunch angle
		['end'] = 1, --time before next attack
		['hull'] = 24, --Hullsize
		['direction'] = "S", --Swing dir,
		['hitflesh'] = "BeamSword.Hit",
		['hitworld'] = "BeamSword.HitWorld"
	}
}

local BaseClass = baseclass.Get(SWEP.Base)
function SWEP:Holster( ... )
	self:StopSound("BeamSword.Idle")
	return BaseClass.Holster(self,...)
end
if CLIENT then
	SWEP.WepSelectIconCSO = Material("vgui/killicons/tfa_cso_beam_sword")
	SWEP.DrawWeaponSelection = TFA_CSO_DrawWeaponSelection
end
