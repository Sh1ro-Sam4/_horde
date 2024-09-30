SWEP.Base = "tfa_melee_base"
SWEP.Category = "TFA CS:O Melees"
SWEP.PrintName = "Storm Giant"
SWEP.Author	= "Kamikaze, Meika, ★Bullet★" --Author Tooltip
SWEP.Purpose = "Maximum Bonking Machine. Hold LMB when weapon draw to for draw combo attack" --Purpose Tooltip
SWEP.ViewModel = "models/weapons/tfa_cso/c_stormgiant.mdl"
SWEP.WorldModel = "models/weapons/tfa_cso/w_storm_giant.mdl"
SWEP.ViewModelFlip = false
SWEP.ViewModelFOV = 80
SWEP.UseHands = true
SWEP.HoldType = "melee2"
SWEP.DrawCrosshair = true

SWEP.ProceduralHolsterTime = 0

SWEP.Primary.Directional = false

SWEP.Spawnable = true
SWEP.AdminOnly = false

SWEP.DisableIdleAnimations = false

SWEP.Secondary.CanBash = false
SWEP.Secondary.MaxCombo = -1
SWEP.Primary.MaxCombo = -1

SWEP.Attachments = {
    [1] = { atts = { "cso_stormgiantlizard" } },
}

-- nZombies Stuff
SWEP.NZWonderWeapon		= true	-- Is this a Wonder-Weapon? If true, only one player can have it at a time. Cheats aren't stopped, though.
--SWEP.NZRePaPText		= "your text here"	-- When RePaPing, what should be shown? Example: Press E to your text here for 2000 points.
--SWEP.NZPaPName				= "BIG FUCKING HAMMER"
SWEP.NZPaPReplacement 	= "tfa_cso_stormgiant_tw"	-- If Pack-a-Punched, replace this gun with the entity class shown here.
SWEP.NZPreventBox		= false	-- If true, this gun won't be placed in random boxes GENERATED. Users can still place it in manually.
SWEP.NZTotalBlackList	= false	-- if true, this gun can't be placed in the box, even manually, and can't be bought off a wall, even if placed manually. Only code can give this gun.
SWEP.PaPMats			= {}

SWEP.Precision = 1

SWEP.Offset = {
		Pos = {
		Up = 0,
		Right = 1,
		Forward = 3,
		},
		Ang = {
		Up = 90,
		Right = 180,
		Forward = 0
		},
		Scale = 1.5
}

sound.Add({
	['name'] = "StormGiant.Draw",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/stormgiant/draw.wav" },
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "StormGiant.Draw_Attack",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/stormgiant/draw_attack.wav" },
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "StormGiant.Idle",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/stormgiant/idle.wav" },
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "StormGiant.Midslash1",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/stormgiant/midslash1.wav" },
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "StormGiant.Midslash2",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/stormgiant/midslash2.wav" },
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "StormGiant.Midslash1_Hit",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/stormgiant/midslash1_hit.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "StormGiant.Midslash2_Hit",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/stormgiant/midslash2_hit.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "StormGiant.HitFlesh",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/stormgiant/hit_flesh1.wav", "weapons/tfa_cso/stormgiant/hit_flesh2.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "StormGiant.HitWorld",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/stormgiant/hit_world1.wav", "weapons/tfa_cso/stormgiant/hit_world2.wav", "weapons/tfa_cso/stormgiant/hit_world3.wav"},
	['pitch'] = {100,100}
})

SWEP.Primary.Attacks = {
	{
		['act'] = ACT_VM_PRIMARYATTACK, -- Animation; ACT_VM_THINGY, ideally something unique per-sequence
		['len'] = 160, -- Trace source; X ( +right, -left ), Y ( +forward, -back ), Z ( +up, -down )
		['dir'] = Vector(-240,0,0), -- Trace dir/length; X ( +right, -left ), Y ( +forward, -back ), Z ( +up, -down )
		['dmg'] = 1750, --This isn't overpowered enough, I swear!!
		['dmgtype'] = DMG_CLUB, --DMG_SLASH,DMG_CRUSH, etc.
		['delay'] = 1, --Delay
		['spr'] = true, --Allow attack while sprinting?
		['snd'] = "TFABaseMelee.Null", -- Sound ID
		['snd_delay'] = 1,
		["viewpunch"] = Angle(0,0,0), --viewpunch angle
		['end'] = 1.5, --time before next attack
		['hull'] = 256, --Hullsize
		['direction'] = "R", --Swing dir,
		['hitflesh'] = "StormGiant.HitFlesh",
		['hitworld'] = "StormGiant.HitWorld",
		['maxhits'] = 25
	}
}

SWEP.Secondary.Attacks = {
	{
		['act'] = ACT_VM_SECONDARYATTACK, -- Animation; ACT_VM_THINGY, ideally something unique per-sequence
		['len'] = 160, -- Trace source; X ( +right, -left ), Y ( +forward, -back ), Z ( +up, -down )
		['dir'] = Vector(0,0,-100), -- Trace dir/length; X ( +right, -left ), Y ( +forward, -back ), Z ( +up, -down )
		['dmg'] = 2250, --Nope!! Not overpowered!!
		['dmgtype'] = DMG_CLUB, --DMG_SLASH,DMG_CRUSH, etc.
		['delay'] = 1, --Delay
		['spr'] = true, --Allow attack while sprinting?
		['snd'] = "TFABaseMelee.Null", -- Sound ID
		['snd_delay'] = 1,
		["viewpunch"] = Angle(0,0,0), --viewpunch angle
		['end'] = 1.3, --time before next attack
		['hull'] = 256, --Hullsize
		['direction'] = "F", --Swing dir
		['hitflesh'] = "StormGiant.HitFlesh",
		['hitworld'] = "StormGiant.HitWorld",
		['maxhits'] = 25
	}
}

function IsWantedWeapon(w)
	if(!IsValid(w)) then return false end
	local bList = {
		["tfa_cso_stormgiant"] = true,
		["tfa_cso_stormgiant_tw"] = true,
		["tfa_cso_stormgiant_v8"] = true,
	}
	return bList[w:GetClass()]
end

if CLIENT then
	SWEP.WepSelectIconCSO = Material("vgui/killicons/tfa_cso_stormgiant")
	SWEP.DrawWeaponSelection = TFA_CSO_DrawWeaponSelection
end

hook.Add( "Move", "RunSecondAttack", function(ply, mv)
	if(!IsValid(ply)) then return end
	if(!ply:Alive()) then return end
	local wep = ply:GetActiveWeapon()
	if(!IsValid(wep)) then return end
	if(!IsWantedWeapon(wep)) then return end
	local vm = ply:GetViewModel(0)
	local seq = vm:GetSequence()
	local cyc = vm:GetCycle()
	local dur = vm:SequenceDuration(seq) * cyc
	if(seq == 3 || seq == 2) then
		if(dur >= 0.425 && dur <= 0.6) then
			if(ply:KeyDown(IN_ATTACK)) then
				wep:SetStatusEnd(CurTime() + 0.3)
				vm:SetSequence(9)
				vm:SetPlaybackRate(0.85)
				if(CLIENT) then
					sound.PlayFile( 'sound/weapons/tfa_cso/stormgiant/draw_attack.wav', 'noplay', function( station, errCode, errStr ) station:Play() end)
				end
				if(SERVER) then
					local pushVec = ply:EyeAngles():Forward() * 150
					RunAttackCode(ply, pushVec, 750)
				end
			end
		end
	end
end)

if(SERVER) then

function RunAttackCode(ply, vel, dmg)
	local apos = ply:EyePos() + (ply:EyeAngles():Forward() * 128)
	local bPlaySound = false
	for k,v in pairs(ents.FindInSphere(apos, 128)) do
		if(!IsValid(v)) then continue end
		if(v:Health() <= 0) then continue end
		if(v == ply) then continue end
		local d = DamageInfo()
		d:SetDamage(dmg)
		d:SetDamageType(128)
		d:SetDamagePosition(v:GetPos())
		d:SetAttacker(ply)
		d:SetInflictor(ply:GetActiveWeapon())
		v:SetVelocity(vel)
		v:TakeDamageInfo(d)
		bPlaySound = true
	end
	if(bPlaySound) then -- So it'll only play once instead of multiple times ( if you hit more than one target)
		sound.Play("weapons/tfa_cso/stormgiant/hit_flesh"..math.random(1, 2)..".wav", ply:GetPos(), 100, 100, 1)
	else
		tr = {
			start = ply:EyePos(),
			endpos = ply:EyePos() + ply:EyeAngles():Forward() * 128,
			filter = ply,
		}
		local ret = util.TraceLine(tr)
		if(ret.HitWorld) then
			sound.Play("weapons/tfa_cso/stormgiant/hit_world"..math.random(1, 3)..".wav", ret.HitPos, 100, 100, 1)
		end
	end
end

hook.Add( "PlayerSwitchWeapon", "CSO_StormGiantDrawAttack", function( ply, oldWeapon, newWeapon )
	if(!IsValid(newWeapon)) then return end
	if(!IsWantedWeapon(newWeapon)) then return end
	timer.Simple(0.1, function()
		if(!IsValid(ply)) then return end
		local wep = ply:GetActiveWeapon()
		if(!IsValid(wep)) then return end
		if(!IsWantedWeapon(wep)) then return end
		local vm = ply:GetViewModel(0)
		local seq = vm:GetSequence()
		if(seq != 3 && seq != 2) then return end
		local pushVec = ply:EyeAngles():Forward() * 150
		RunAttackCode(ply, Vector(pushVec.x, pushVec.y, 150), 25)
	end)
end )
end
