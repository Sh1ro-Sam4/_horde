SWEP.Base = "tfa_melee_base"
SWEP.Category = "TFA CS:O Melees"
SWEP.PrintName = "Ice bitch"
SWEP.Author		= "Kamikaze" --Author Tooltip
SWEP.Type	= "Transcendent grade melee weapon"
SWEP.ViewModel = "models/weapons/tfa_cso/c_tyrantmace.mdl"
SWEP.WorldModel = "models/weapons/tfa_cso/w_tyrantmace.mdl"
SWEP.ViewModelFlip = false
SWEP.ViewModelFOV = 85
SWEP.UseHands = true
SWEP.HoldType = "melee2"
SWEP.DrawCrosshair = true
SWEP.Primary.Knockback = 0 

SWEP.Primary.Directional = false

SWEP.Spawnable = true
SWEP.AdminOnly = false

--[[INSPECTION]]--
SWEP.InspectPos = Vector(0, 0, 0)
SWEP.InspectAng = Vector(0, 0, 0)

SWEP.DisableIdleAnimations = false
SWEP.ProceduralHolsterTime = 0
SWEP.Secondary.CanBash = false

-- nZombies Stuff
SWEP.NZWonderWeapon		= true	-- Is this a Wonder-Weapon? If true, only one player can have it at a time. Cheats aren't stopped, though.
--SWEP.NZRePaPText		= "your text here"	-- When RePaPing, what should be shown? Example: Press E to your text here for 2000 points.
SWEP.NZPaPName				= "Magic Slayer"
--SWEP.NZPaPReplacement 	= "tfa_cso_dualsword"	-- If Pack-a-Punched, replace this gun with the entity class shown here.
SWEP.NZPreventBox		= false	-- If true, this gun won't be placed in random boxes GENERATED. Users can still place it in manually.
SWEP.NZTotalBlackList	= false	-- if true, this gun can't be placed in the box, even manually, and can't be bought off a wall, even if placed manually. Only code can give this gun.
SWEP.PaPMats			= {}

SWEP.Precision = 50
SWEP.Secondary.MaxCombo = -1
SWEP.Primary.MaxCombo = -1

SWEP.Offset = {
		Pos = {
		Up = -15,
		Right = 2.5,
		Forward = 3,
		},
		Ang = {
		Up = -75,
		Right = 185,
		Forward = -0
		},
		Scale = 1
}


sound.Add({
	['name'] = "TyrantMace.Draw",
	['channel'] = CHAN_WEAPON,
	['sound'] = { "weapons/tfa_cso/tyrantmace/draw.wav" },
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "TyrantMace.Slash1",
	['channel'] = CHAN_WEAPON,
	['sound'] = { "weapons/tfa_cso/tyrantmace/slash1.wav" },
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "TyrantMace.Slash2",
	['channel'] = CHAN_WEAPON,
	['sound'] = { "weapons/tfa_cso/tyrantmace/slash2.wav" },
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "TyrantMace.Skill",
	['channel'] = CHAN_WEAPON,
	['sound'] = { "weapons/tfa_cso/tyrantmace/skill.wav" },
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "TyrantMace.Skill_Exp",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/tyrantmace/skill_exp.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "TyrantMace.HitFleshSlash1",
	['channel'] = CHAN_WEAPON,
	['sound'] = { "weapons/tfa_cso/tyrantmace/hit1.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "TyrantMace.HitFleshSlash2",
	['channel'] = CHAN_WEAPON,
	['sound'] = { "weapons/tfa_cso/tyrantmace/hit2.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "Janus9.HitWall1",
	['channel'] = CHAN_WEAPON,
	['sound'] = { "weapons/tfa_cso/janus9/hitwall1.wav" },
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "Janus9.HitWall2",
	['channel'] = CHAN_WEAPON,
	['sound'] = { "weapons/tfa_cso/janus9/hitwall2.wav" },
	['pitch'] = {100,100}
})

SWEP.Primary.Attacks = {
	{
		['act'] = ACT_VM_MISSLEFT, -- Animation; ACT_VM_THINGY, ideally something unique per-sequence
		['len'] = 135, -- Trace source; X ( +right, -left ), Y ( +forward, -back ), Z ( +up, -down )
		['dir'] = Vector(-180,0,0), -- Trace dir/length; X ( +right, -left ), Y ( +forward, -back ), Z ( +up, -down )
		['dmg'] = 170, --This isn't overpowered enough, I swear!!
		['dmgtype'] = DMG_CLUB, --DMG_SLASH,DMG_CRUSH, etc.
		['delay'] = 0.15, --Delay
		['spr'] = true, --Allow attack while sprinting?
		['snd'] = "TFABaseMelee.Null", -- Sound ID
		['snd_delay'] = 0.05,
		["viewpunch"] = Angle(0,0,0), --viewpunch angle
		['end'] = 0.7, --time before next attack
		['hull'] = 128, --Hullsize
		['direction'] = "F", --Swing dir,
		['hitflesh'] = "TyrantMace.HitFleshSlash1",
		['hitworld'] = "Janus9.HitWall1",
		['maxhits'] = 25
	},
	{
		['act'] = ACT_VM_HITLEFT, -- Animation; ACT_VM_THINGY, ideally something unique per-sequence
		['len'] = 135, -- Trace source; X ( +right, -left ), Y ( +forward, -back ), Z ( +up, -down )
		['dir'] = Vector(180,0,0), -- Trace dir/length; X ( +right, -left ), Y ( +forward, -back ), Z ( +up, -down )
		['dmg'] = 170, --Nope!! Not overpowered!!
		['dmgtype'] = DMG_CLUB, --DMG_SLASH,DMG_CRUSH, etc.
		['delay'] = 0.15, --Delay
		['spr'] = true, --Allow attack while sprinting?
		['snd'] = "TFABaseMelee.Null", -- Sound ID
		['snd_delay'] = 0.12,
		["viewpunch"] = Angle(0,0,0), --viewpunch angle
		['end'] = 0.7, --time before next attack
		['hull'] = 128, --Hullsize
		['direction'] = "F", --Swing dir
		['hitflesh'] = "TyrantMace.HitFleshSlash2",
		['hitworld'] = "Janus9.HitWall2",
		['maxhits'] = 1
	}
}

SWEP.Secondary.Attacks = {
}

DEFINE_BASECLASS(SWEP.Base)
if CLIENT then
	SWEP.WepSelectIconCSO = Material("vgui/killicons/tfa_cso_tyrantmace")
	SWEP.DrawWeaponSelection = TFA_CSO_DrawWeaponSelection
end

function SWEP:Reload(...)
	if self:GetNextPrimaryFire() > CurTime() or self:GetNextSecondaryFire() > CurTime() then return end
	self:SetNextPrimaryFire(CurTime() + 1.8)
	self:SetNextSecondaryFire(CurTime() + 1.8)
	self.Owner:AnimRestartGesture(0, ACT_HL2MP_GESTURE_RANGE_ATTACK_MELEE, true)
	self:GetOwner():SetAnimation(PLAYER_ATTACK1)
	self:SendViewModelAnim(ACT_VM_RECOIL1)

	timer.Simple(0.25, function()
		if self:IsValid() then
			local blastOffset = 100 -- Offset distance in front of the player
			local eyePosition = self.Owner:EyePos() -- Player's eye position
			local forwardDirection = self.Owner:GetAimVector() -- Player's forward direction

			-- Raycast to find the ground position in front of the player
			local trace =
				util.TraceHull(
				{
					start = eyePosition,
					endpos = eyePosition + forwardDirection * blastOffset,
					filter = self.Owner,
					mins = Vector(-16, -16, -32), -- Adjust the hull size as needed
					maxs = Vector(16, 16, -32) -- Adjust the hull size as needed
				}
			)

			local groundPosition = trace.HitPos -- Position of the ground

			local blastPosition = Vector(groundPosition.x, groundPosition.y, self.Owner:GetPos().z) -- Set blast position at the player's current feet level

			if SERVER then
				local dmginfo = CSO:DMGInfo(self.Owner, self, 120, Vector(0,0,0), DMG_BLAST, self:GetPos())
				CSO:DoRadiusAttack(self, dmginfo, 225, true, 2048, 1.5, false, nil, true)
			end

			if IsFirstTimePredicted() then
				local effectdata = EffectData()
				effectdata:SetOrigin(blastPosition)
				util.Effect("exp_tyrantmace", effectdata) -- easy effect
				self:EmitSound("TyrantMace.Skill_Exp", 120, 100)
			end
		end
	end)
	return BaseClass.Reload(self, ...)
end


-- hook.Add( "PlayerShouldTakeDamage", "antiselfdamage_tyrantmace", function( ply, attacker )
-- 	if ply == attacker and ply:GetActiveWeapon():GetClass() == "tfa_cso_tyrantmace" then
-- 	return false
-- 	end
-- end)

function SWEP:SetupDataTables(...)
    local retVal = BaseClass.SetupDataTables(self, ...)

    self:NetworkVarTFA("Int", "LastPrimaryAttackChoice") -- self:GetLastPrimaryAttackChoice() and self:SetLastPrimaryAttackChoice(number)
    self:NetworkVarTFA("Int", "LastSecondaryAttackChoice") -- self:GetLastSecondaryAttackChoice() and self:SetLastSecondaryAttackChoice(number)

    return retVal
end