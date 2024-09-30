SWEP.Base = "tfa_melee_base"
SWEP.Category = "TFA CS:O Melees"
SWEP.PrintName = "War Fan"
SWEP.Author	= "★Bullet★" --Author Tooltip
SWEP.ViewModel = "models/weapons/tfa_cso/c_ironfan.mdl"
SWEP.WorldModel = "models/weapons/tfa_cso/w_ironfan.mdl"
SWEP.ViewModelFlip = false
SWEP.ViewModelFOV = 80
SWEP.UseHands = true
SWEP.HoldType = "melee"
SWEP.Type	= "Unique Grade Melee"
SWEP.DrawCrosshair = true

SWEP.Primary.Directional = false
SWEP.ProceduralHolsterTime = 0
SWEP.Spawnable = true
SWEP.AdminOnly = false

SWEP.DisableIdleAnimations = false
SWEP.Secondary.Automatic = true
SWEP.Secondary.CanBash = false
SWEP.Secondary.MaxCombo = -1
SWEP.Primary.MaxCombo = -1

--[[INSPECTION]]--

SWEP.InspectPos = Vector (0,0,0) --Replace with a vector, in style of ironsights position, to be used for inspection
SWEP.InspectAng = Vector (0,0,0) --Replace with a vector, in style of ironsights angle, to be used for inspection
SWEP.InspectionLoop = true --Setting false will cancel inspection once the animation is done.  CS:GO style.

-- nZombies Stuff
SWEP.NZWonderWeapon		= false	-- Is this a Wonder-Weapon? If true, only one player can have it at a time. Cheats aren't stopped, though.
--SWEP.NZRePaPText		= "your text here"	-- When RePaPing, what should be shown? Example: Press E to your text here for 2000 points.
SWEP.NZPaPName				= "Deadly Grace"
--SWEP.NZPaPReplacement 	= "tfa_cso_dualsword"	-- If Pack-a-Punched, replace this gun with the entity class shown here.
SWEP.NZPreventBox		= false	-- If true, this gun won't be placed in random boxes GENERATED. Users can still place it in manually.
SWEP.NZTotalBlackList	= false	-- if true, this gun can't be placed in the box, even manually, and can't be bought off a wall, even if placed manually. Only code can give this gun.
SWEP.PaPMats			= {}

SWEP.Offset = {
		Pos = {
		Up = -6,
		Right = 2,
		Forward = 3.5,
		},
		Ang = {
		Up = 90,
		Right = 180,
		Forward = 90
		},
		Scale = 1.25
}

sound.Add({
	['name'] = "IronFan.Draw",
	['channel'] = CHAN_WEAPON,
	['sound'] = { "weapons/tfa_cso/ironfan/draw.wav" },
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "IronFan.Slash1",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/ironfan/slash1.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "IronFan.Slash1_1",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/ironfan/slash1_1.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "IronFan.Slash2",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/ironfan/slash2.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "IronFan.Slash3",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/ironfan/slash3.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "IronFan.Slash3_1",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/ironfan/slash3_1.wav"},
	['pitch'] = {100,100}
})

SWEP.Primary.Attacks = {
	{
		['act'] = ACT_VM_HITCENTER, -- Animation; ACT_VM_THINGY, ideally something unique per-sequence
		['len'] = 75, -- Trace source; X ( +right, -left ), Y ( +forward, -back ), Z ( +up, -down )
		['dir'] = Vector(-80,0,-70), -- Trace dir/length; X ( +right, -left ), Y ( +forward, -back ), Z ( +up, -down )
		['dmg'] = 80, --This isn't overpowered enough, I swear!!
		['dmgtype'] = DMG_SLASH, --DMG_SLASH,DMG_CRUSH, etc.
		['delay'] = 1.25, --Delay
		['spr'] = true, --Allow attack while sprinting?
		['snd'] = "IronFan.Slash1_1", -- Sound ID
		['snd_delay'] = 1.2,
		["viewpunch"] = Angle(0,0,0), --viewpunch angle
		['end'] = 1.6, --time before next attack
		['hull'] = 64, --Hullsize
		['direction'] = "F", --Swing dir,
		['hitflesh'] = "Tomahawk.HitFleshSlash1",
		['hitworld'] = "Tomahawk.HitWall",
		['maxhits'] = 25
	}
}

SWEP.Secondary.Attacks = {
	{
		['act'] = ACT_VM_MISSLEFT, -- Animation; ACT_VM_THINGY, ideally something unique per-sequence
		['len'] = 250, -- Trace source; X ( +right, -left ), Y ( +forward, -back ), Z ( +up, -down )
		['dir'] = Vector(-150,0,-10), -- Trace dir/length; X ( +right, -left ), Y ( +forward, -back ), Z ( +up, -down )
		['dmg'] = 50, --Nope!! Not overpowered!!
		["force"] = 500, -- Damage force
		['dmgtype'] = DMG_SLASH, --DMG_SLASH,DMG_CRUSH, etc.
		['delay'] = 1.2, --Delay
		['spr'] = true, --Allow attack while sprinting?
		['snd'] = "IronFan.Slash3_1", -- Sound ID
		['snd_delay'] = 1.2,
		["viewpunch"] = Angle(0,0,0), --viewpunch angle
		['end'] = 1.5, --time before next attack
		['hull'] = 640, --Hullsize
		['direction'] = "F", --Swing dir
		['hitflesh'] = "Tomahawk.HitFleshSlash3",
		['hitworld'] = "Tomahawk.HitWall",
		['maxhits'] = 25
	},
	{
		['act'] = ACT_VM_MISSRIGHT, -- Animation; ACT_VM_THINGY, ideally something unique per-sequence
		['len'] = 250, -- Trace source; X ( +right, -left ), Y ( +forward, -back ), Z ( +up, -down )
		['dir'] = Vector(90,0,120), -- Trace dir/length; X ( +right, -left ), Y ( +forward, -back ), Z ( +up, -down )
		['dmg'] = 50, --Nope!! Not overpowered!!
		["force"] = 500, -- Damage force
		['dmgtype'] = DMG_SLASH, --DMG_SLASH,DMG_CRUSH, etc.
		['delay'] = 0.2, --Delay
		['spr'] = true, --Allow attack while sprinting?
		['snd'] = "IronFan.Slash2", -- Sound ID
		['snd_delay'] = 0.2,
		["viewpunch"] = Angle(0,0,0), --viewpunch angle
		['end'] = 0.5, --time before next attack
		['hull'] = 640, --Hullsize
		['direction'] = "F", --Swing dir
		['hitflesh'] = "Tomahawk.HitFleshSlash3",
		['hitworld'] = "Tomahawk.HitWall",
		['maxhits'] = 25
	}
}

DEFINE_BASECLASS(SWEP.Base)
if CLIENT then
	SWEP.WepSelectIconCSO = Material("vgui/killicons/tfa_cso_ironfan")
	SWEP.DrawWeaponSelection = TFA_CSO_DrawWeaponSelection
end

function SWEP:SetupDataTables(...)
    local retVal = BaseClass.SetupDataTables(self, ...)

    self:NetworkVarTFA("Int", "LastPrimaryAttackChoice") -- self:GetLastPrimaryAttackChoice() and self:SetLastPrimaryAttackChoice(number)
    self:NetworkVarTFA("Int", "LastSecondaryAttackChoice") -- self:GetLastSecondaryAttackChoice() and self:SetLastSecondaryAttackChoice(number)

    return retVal
end

function SWEP:ChooseSecondaryAttack()
    local attacks = self:GetStatL("Secondary.Attacks") -- getting the SWEP.Primary.Attacks table

    local lastattack = self:GetLastSecondaryAttackChoice() -- default value is 0 so it'll start with 1 from next line

    local nextattack = lastattack + 1 -- choosing the next attack
    if nextattack > 2 or self:GetComboCount() <= 0 then -- use this if you want choice to start from 1 when leaving mouse key (combo reset), otherwise do self:SetLastPrimaryAttackChoice(0) either in SWEP:Deploy() or SWEP:Holster()
        nextattack = 1
	end
    if nextattack > 2 then -- reset the count if we're going beyond attacks count
        nextattack = 1
    end

    self:SetLastSecondaryAttackChoice(nextattack) -- remembering the current choice for next time
    return nextattack, attacks[nextattack] -- returning the key of SWEP.Primary.Attacks table and the chosen attack table itself
end