AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2015 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/Deimos_zombie2.mdl" 
ENT.StartHealth = GetConVarNumber("vj_deimosz_h")
ENT.MovementType = VJ_MOVETYPE_GROUND
ENT.HullType = HULL_LARGE
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_ZOMBIE", "CLASS_XEN"}
ENT.Bleeds = true -- Does the SNPC bleed? (Blood decal, particle and etc.)
ENT.BloodParticle = "blood_impact_red_01" -- Particle that the SNPC spawns when it's damaged
ENT.BloodDecal = "Blood" -- (Red = Blood) (Yellow Blood = YellowBlood) | Leave blank for none
ENT.BloodDecalRate = 1000 -- The more the number is the more chance is has to spawn | 1000 is a good number for yellow blood, for red blood 500 is good | Make the number smaller if you are using big decal like Antlion Splat, Which 5 or 10 is a really good number for this stuff


ENT.HasMeleeAttack = true -- Should the SNPC have a melee attack?
ENT.CustomBlood_Decal = {} -- Decals to spawn when it's damaged
--ENT.AnimTbl_IdleStand = {"idle1"}
ENT.MeleeAttackAnimationDelay = 0 -- It will wait certain amount of time before playing the animation
ENT.MeleeAttackDistance = 45 -- How close does it have to be until it attacks?
ENT.MeleeAttackDamageDistance = 140 -- How far the damage goes
ENT.NextAnyAttackTime_Melee = 1.4
ENT.MeleeAttackHitTime = 1 -- This counted in seconds | This calculates the time until it hits something
ENT.UntilNextAttack_Melee = 0.1 -- How much time until it can use a attack again? | Counted in Seconds
ENT.AnimTbl_MeleeAttack = {"Attack1"} 
ENT.MeleeAttackDamage = 34
ENT.MeleeAttackDamageType = DMG_SLASH -- Type of Damage
ENT.TimeUntilMeleeAttackDamage = 0.45
ENT.MeleeAttackReps = 1
ENT.MeleeAttackExtraTimers = {0.86, 1.15 }
 
ENT.HasMeleeAttackKnockBack = true -- If true, it will cause a knockback to its enemy
ENT.MeleeAttackKnockBack_Forward1 = 120 -- How far it will push you forward | First in math.random
ENT.MeleeAttackKnockBack_Forward2 = 120 -- How far it will push you forward | Second in math.random
ENT.MeleeAttackKnockBack_Up1 = 150 -- How far it will push you up | First in math.random
ENT.MeleeAttackKnockBack_Up2 = 150 -- How far it will push you up | Second in math.random
ENT.MeleeAttackKnockBack_Right1 = 0 -- How far it will push you right | First in math.random
ENT.MeleeAttackKnockBack_Right2 = 0 -- How far it will push you right | Second in math.random 

ENT.Immune_Dissolve = true -- Immune to Dissolving | Example: Combine Ball
ENT.Immune_Physics = true -- Immune to Physics

ENT.HasDeathAnimation = true -- Does it play an animation when it dies?
ENT.AnimTbl_Death = {"Death1","Death2","Death3"} -- Death Animations
ENT.HasDeathRagdoll = false
ENT.DeathAnimationTime = 15
 
	-- ====== Flinching Code ====== --
ENT.Flinches = 0 -- 0 = No Flinch | 1 = Flinches at any damage | 2 = Flinches only from certain damages
ENT.FlinchingChance = 14 -- chance of it flinching from 1 to x | 1 will make it always flinch
ENT.FlinchingSchedules = {SCHED_FLINCH_PHYSICS} -- If self.FlinchUseACT is false the it uses this | Common: SCHED_BIG_FLINCH, SCHED_SMALL_FLINCH, SCHED_FLINCH_PHYSICS
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_FootStep = {}
ENT.SoundTbl_BeforeMeleeAttack = {""}
ENT.SoundTbl_Idle = {""}
ENT.SoundTbl_Alert = {""}
ENT.SoundTbl_BeforeMeleeAttack = {"cszom/zombi_swing_1.mp3","cszom/zombi_swing_2.mp3","cszom/zombi_swing_3.mp3"}
ENT.SoundTbl_MeleeAttack = {"cszom/zombi_attack_1.wav","cszom/zombi_attack_2.wav","cszom/zombi_attack_3.wav"}
ENT.SoundTbl_MeleeAttackMiss = {}
ENT.SoundTbl_Pain = {"cszom/zombi_hurt_heavy_1.mp3","cszom/zombi_hurt_heavy_1.mp3"}
ENT.SoundTbl_Death = {"cszom/zombi_death_1.wav","cszom/zombi_death_2.wav"}
ENT.SoundTbl_MeleeAttackExtra = {""}
ENT.SoundTbl_Impact = {""}


ENT.PainSoundLevel = 145
ENT.MeleeAttackSoundLevel = 95
ENT.BeforeMeleeAttackSoundLevel = 145


---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomInitialize()
	self:SetCollisionBounds(Vector(55, 55, 115), Vector(-55, -55, 0))
	
end

function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo,hitgroup)
 
	local panis = dmginfo:GetDamageType()
	if (panis == DMG_SLASH or panis == DMG_CLUB ) && dmginfo:GetDamage() > 2 && dmginfo:GetAttacker().IsHugeMonster != false then
	dmginfo:ScaleDamage(0.9)
	end
	
	 local panis = dmginfo:GetDamageType()
	if (panis == DMG_BULLET or panis == DMG_BUCKSHOT ) && dmginfo:GetDamage() > 2 && dmginfo:GetAttacker().IsHugeMonster != false then
	dmginfo:ScaleDamage(0.4)
	end
	
	 local panis = dmginfo:GetDamageType()
	if (panis == DMG_BLAST  ) && dmginfo:GetDamage() > 2 && dmginfo:GetAttacker().IsHugeMonster != false then
	dmginfo:ScaleDamage(1.1)
	end
	
end



/*-----------------------------------------------
	*** Copyright (c) 2012-2015 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/