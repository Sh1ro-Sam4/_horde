SWEP.Base = "tfa_melee_base"
SWEP.Category = "TFA CS:O Melees"
SWEP.PrintName = "Whip Sword"
SWEP.Author				= "Kamikaze" --Author Tooltip
SWEP.Type	= "Transcendent grade melee weapon"
SWEP.ViewModel = "models/weapons/tfa_cso/c_whipsword.mdl"
SWEP.WorldModel = "models/weapons/tfa_cso/w_whipsword.mdl"
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
		Up = -8,
		Right = 2.5,
		Forward = 3,
		},
		Ang = {
		Up = -5,
		Right = 100,
		Forward = -60
		},
		Scale = 1
}


sound.Add({
	['name'] = "WhipSword.Draw",
	['channel'] = CHAN_WEAPON,
	['sound'] = { "weapons/tfa_cso/whipsword/draw.wav" },
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "WhipSword.Slash",
	['channel'] = CHAN_WEAPON,
	['sound'] = { "weapons/tfa_cso/whipsword/slash1.wav", "weapons/tfa_cso/whipsword/slash2.wav", "weapons/tfa_cso/whipsword/slash3.wav" },
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "WhipSword.Slash1_End",
	['channel'] = CHAN_WEAPON,
	['sound'] = { "weapons/tfa_cso/whipsword/slash1_end.wav" },
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "WhipSword.Slash_Skill",
	['channel'] = CHAN_WEAPON,
	['sound'] = { "weapons/tfa_cso/whipsword/slash_skill.wav" },
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "WhipSword.Stab1",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/whipsword/stab1.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "WhipSword.Stab2",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/whipsword/stab2.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "WhipSword.Stab12_End",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/whipsword/stab12_end.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "PrismSword.HitFleshSlash",
	['channel'] = CHAN_WEAPON,
	['sound'] = { "weapons/tfa_cso/magicknife/hit.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "PrismSword.HitWall",
	['channel'] = CHAN_WEAPON,
	['sound'] = { "weapons/tfa_cso/magicknife/wall.wav" },
	['pitch'] = {100,100}
})

SWEP.Primary.Attacks = {
	{
		['act'] = ACT_VM_MISSLEFT, -- Animation; ACT_VM_THINGY, ideally something unique per-sequence
		['len'] = 185, -- Trace source; X ( +right, -left ), Y ( +forward, -back ), Z ( +up, -down )
		['dir'] = Vector(180,0,0), -- Trace dir/length; X ( +right, -left ), Y ( +forward, -back ), Z ( +up, -down )
		['dmg'] = 750, --This isn't overpowered enough, I swear!!
		['dmgtype'] = DMG_SLASH, --DMG_SLASH,DMG_CRUSH, etc.
		['delay'] = 0.05, --Delay
		['spr'] = true, --Allow attack while sprinting?
		['snd'] = "TFABaseMelee.Null", -- Sound ID
		['snd_delay'] = 0.05,
		["viewpunch"] = Angle(0,0,0), --viewpunch angle
		['end'] = 0.6, --time before next attack
		['hull'] = 32, --Hullsize
		['direction'] = "F", --Swing dir,
		['hitflesh'] = "PrismSword.HitFleshSlash",
		['hitworld'] = "PrismSword.HitWall",
		['maxhits'] = 25
	}
}

SWEP.Secondary.Attacks = {
	{
		['act'] = ACT_VM_HITLEFT, -- Animation; ACT_VM_THINGY, ideally something unique per-sequence
		['len'] = 175, -- Trace source; X ( +right, -left ), Y ( +forward, -back ), Z ( +up, -down )
		['dir'] = Vector(180,0,-75), -- Trace dir/length; X ( +right, -left ), Y ( +forward, -back ), Z ( +up, -down )
		['dmg'] = 500, --Nope!! Not overpowered!!
		['dmgtype'] = DMG_SLASH, --DMG_SLASH,DMG_CRUSH, etc.
		['delay'] = 0.12, --Delay
		['spr'] = true, --Allow attack while sprinting?
		['snd'] = "TFABaseMelee.Null", -- Sound ID
		['snd_delay'] = 0.12,
		["viewpunch"] = Angle(0,0,0), --viewpunch angle
		['end'] = 0.3, --time before next attack
		['hull'] = 128, --Hullsize
		['direction'] = "F", --Swing dir
		['hitflesh'] = "PrismSword.HitFleshSlash",
		['hitworld'] = "PrismSword.HitWall",
		['maxhits'] = 25
	},
	{
		['act'] = ACT_VM_HITRIGHT, -- Animation; ACT_VM_THINGY, ideally something unique per-sequence
		['len'] = 175, -- Trace source; X ( +right, -left ), Y ( +forward, -back ), Z ( +up, -down )
		['dir'] = Vector(-120,0,-75), -- Trace dir/length; X ( +right, -left ), Y ( +forward, -back ), Z ( +up, -down )
		['dmg'] = 500, --Nope!! Not overpowered!!
		['dmgtype'] = DMG_SLASH, --DMG_SLASH,DMG_CRUSH, etc.
		['delay'] = 0.12, --Delay
		['spr'] = true, --Allow attack while sprinting?
		['snd'] = "TFABaseMelee.Null", -- Sound ID
		['snd_delay'] = 0.12,
		["viewpunch"] = Angle(0,0,0), --viewpunch angle
		['end'] = 0.3, --time before next attack
		['hull'] = 128, --Hullsize
		['direction'] = "F", --Swing dir
		['hitflesh'] = "PrismSword.HitFleshSlash",
		['hitworld'] = "PrismSword.HitWall",
		['maxhits'] = 25
	}
}

SWEP.InspectionActions = {ACT_VM_RECOIL1}

local BaseClass = baseclass.Get(SWEP.Base)
function SWEP:Holster( ... )
	self:StopSound("Hellfire.Idle")
	return BaseClass.Holster(self,...)
end
if CLIENT then
	SWEP.WepSelectIconCSO = Material("vgui/killicons/tfa_cso_whipsword")
	SWEP.DrawWeaponSelection = TFA_CSO_DrawWeaponSelection
end

function SWEP:Reload( ... )
     if self:GetNextPrimaryFire() > CurTime() or self:GetNextSecondaryFire() > CurTime() then return end
    self:SetNextPrimaryFire(CurTime()+ 1)
	self:SetNextSecondaryFire(CurTime()+ 1)
	self.Owner:AnimRestartGesture(0, ACT_HL2MP_GESTURE_RANGE_ATTACK_MELEE, true)
	self:GetOwner():SetAnimation(PLAYER_ATTACK1)
	self:SendViewModelAnim( ACT_VM_RECOIL1 )
	timer.Simple(0.25,function() if self:IsValid() then
    util.BlastDamage( self.Owner, self.Owner,self.Owner:GetPos(),225, 100 )  --damage
	for k, v in pairs(ents.FindInSphere(self:GetPos(),250)) do
			
			if IsValid( v ) then
			 if v == self then continue end
			 if v == self.Owner then continue end
					if v:GetMoveType() != MOVETYPE_NOCLIP then
					
						local dif = v:GetPos() - self:GetPos()
				
						local forceApplied = ( dif * 2000  )  
						v:SetVelocity( forceApplied + Vector(0,0,100))
					
					end
				
				end
			
			end

local effectdata = EffectData()
effectdata:SetOrigin( self.Owner:GetPos() )
util.Effect( "exp_whipsword", effectdata )  -- easy effect
end

 end)
	return BaseClass.Reload(self,...)
end
hook.Add( "PlayerShouldTakeDamage", "antiselfdamage", function( ply, attacker )
	if ply == attacker and ply:GetActiveWeapon():GetClass() == "tfa_cso_whipsword" then
	return false
	end
end)