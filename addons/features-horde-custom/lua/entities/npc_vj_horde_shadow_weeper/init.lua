AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2021 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/horde/infected_stalker/infected_stalker.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.StartHealth = 100
ENT.HullType = HULL_HUMAN
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_PLAYER_ALLY", "CLASS_COMBINE"} -- NPCs with the same class with be allied to each other
ENT.FriendsWithAllPlayerAllies = true
ENT.PlayerFriendly = true
ENT.BloodColor = "Red" -- The blood type, this will determine what it should use (decal, particle, etc.)
ENT.HasMeleeAttack = true -- Should the SNPC have a melee attack?
ENT.AnimTbl_MeleeAttack = {ACT_MELEE_ATTACK1} -- Melee Attack Animations
ENT.MeleeAttackDistance = 32 -- How close does it have to be until it attacks?
ENT.MeleeAttackDamageDistance = 60 -- How far does the damage go?
ENT.TimeUntilMeleeAttackDamage = 0.4 -- This counted in seconds | This calculates the time until it hits something
ENT.MeleeAttackDamage = 20
ENT.MeleeAttackDamageType = DMG_SLASH
ENT.MeleeAttackBleedEnemy = false -- Should the player bleed when attacked by melee
ENT.HasLeapAttack = false -- Should the SNPC have a leap attack?
ENT.FootStepTimeRun = 0.2 -- Next foot step sound when it is running
ENT.FootStepTimeWalk = 0.3 -- Next foot step sound when it is walking
--ENT.HasMeleeAttackKnockBack = true -- If true, it will cause a knockback to its enemy
--ENT.MeleeAttackKnockBack_Forward1 = 100 -- How far it will push you forward | First in math.random
--ENT.MeleeAttackKnockBack_Forward2 = 130 -- How far it will push you forward | Second in math.random
--ENT.MeleeAttackKnockBack_Up1 = 250 -- How far it will push you up | First in math.random
--ENT.MeleeAttackKnockBack_Up2 = 260 -- How far it will push you up | Second in math.random
ENT.AnimTbl_Run = {ACT_WALK}
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_FootStep = {"npc/stalker/stalker_footstep_left1.wav", "npc/stalker/stalker_footstep_left2.wav", "npc/stalker/stalker_footstep_right1.wav", "npc/stalker/stalker_footstep_right2.wav"}
ENT.SoundTbl_Idle = {}
ENT.SoundTbl_Alert = {}
ENT.SoundTbl_MeleeAttack = {"npc/zombie/claw_strike1.wav","npc/zombie/claw_strike2.wav","npc/zombie/claw_strike3.wav"}
ENT.SoundTbl_MeleeAttackMiss = {"zsszombie/miss1.wav","zsszombie/miss2.wav","zsszombie/miss3.wav","zsszombie/miss4.wav"}
ENT.SoundTbl_Pain = {"zsszombies/zmisc_pain1.wav","zsszombies/zmisc_pain2.wav","zsszombies/zmisc_pain3.wav","zsszombies/zmisc_pain4.wav","zsszombies/zmisc_pain5.wav","zsszombies/zmisc_pain6.wav"}
ENT.SoundTbl_Death = {"zsszombies/zmisc_die1.wav","zsszombies/zmisc_die2.wav","zsszombies/zmisc_die3.wav"}
ENT.GeneralSoundPitch1 = 30
ENT.GeneralSoundPitch2 = 30

ENT.FootStepSoundLevel = 55
ENT.NextBlastTime = CurTime()
ENT.NextBlastCooldown = 5
ENT.AnimTbl_MeleeAttack = {}
ENT.Critical = nil

ENT.HasAllies = true

ENT.VJFriendly = false
ENT.Abyssal_Roar = false
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Shockwave(delay)
	if self.Horde_Stunned then return end
	timer.Simple(delay, function()
		if not self:IsValid() then return end
		local dmg = DamageInfo()
		dmg:SetAttacker(self)
		dmg:SetInflictor(self)
		dmg:SetDamageType(DMG_GENERIC)
		dmg:SetDamage(self.MeleeAttackDamage / 2)

		for _, ent in pairs(ents.FindInSphere(self:GetPos(), 250)) do
			if HORDE:IsEnemy(ent) then
				ent:Horde_AddDebuffBuildup(HORDE.Status_Frostbite, 8, self:GetNWEntity("HordeOwner"))
				ent:TakeDamageInfo(dmg)
				dmg:SetDamagePosition(ent:GetPos())
			end
		end

		local e = EffectData()
			e:SetOrigin(self:GetPos())
		util.Effect("abyssal_roar", e, true, true)
	end)
end

function ENT:Roar()
	if not self:IsValid() then return end
    sound.Play("horde/spectres/abyssal_roar.ogg", self:GetPos(), 75, 100)
    self:VJ_ACT_PLAYACTIVITY("FireWalk", true, 1.5, false)
	-- Deals heavy Physical damage to nearby enemies
	self:Shockwave(0.2)
	self:Shockwave(0.4)
	self:Shockwave(0.6)
	self:Shockwave(0.8)
	self:Shockwave(1.0)
end

function ENT:CustomOnInitialize()

	self:SetModelScale(self:GetModelScale() * 1.25, 0)
	

	self:SetCollisionBounds(Vector(0, 0, 0), Vector(0, 0, 0))
	self.AnimTbl_Run = ACT_RUN
    if self.properties.abyssal_might == true then
		local id = self:GetCreationID()
		self.Abyssal_Roar = true
		timer.Simple(0.5, function() self:Roar() end)
		timer.Remove("Horde_FlayerRoar" .. id)
		timer.Create("Horde_FlayerRoar" .. id, 10, 0, function ()
			if not IsValid(self) then return end
			self:Roar()
		end)
    end
	local e = EffectData()
		e:SetOrigin(self:GetPos())
		e:SetNormal(Vector(0,0,1))
		e:SetScale(0.25)
	util.Effect("abyssal_roar", e, true, true)
    self:SetRenderMode(RENDERMODE_TRANSCOLOR)
    self:SetColor(Color(0, 0, 0, 200))
	self.MeleeAttackDamage = 2.75 * (self.MeleeAttackDamage + 6 * self.properties.level)
	self:SetHealth((90 + 32 * self.properties.level))
	self:AddRelationship("npc_turret_floor D_LI 99")
	self:AddRelationship("npc_vj_horde_combat_bot D_LI 99")
	self:AddRelationship("npc_manhack D_LI 99")
	self:AddRelationship("npc_vj_horde_vortigaunt D_LI 99")
	self:AddRelationship("npc_vj_horde_rocket_turret D_LI 99")
	self:AddRelationship("npc_vj_horde_antlion D_LI 99")
    --self:EmitSound("horde/lesion/lesion_roar.ogg", 1500, 80, 1, CHAN_STATIC)
end

function ENT:ShockAttack(delay)
	if self.Horde_Stunned then return end
	timer.Simple(delay, function()
		if not self:IsValid() then return end
		local dmg = DamageInfo()
		dmg:SetAttacker(self)
		dmg:SetInflictor(self)
		dmg:SetDamageType(DMG_REMOVENORAGDOLL)
		dmg:SetDamage(self.MeleeAttackDamage / 2)
		dmg:SetDamagePosition(self:GetPos())
		util.BlastDamageInfo(dmg, self:GetPos(), 350)

		for _, ent in pairs(ents.FindInSphere(self:GetPos(), 200)) do
			if HORDE:IsEnemy(ent) and not HORDE:IsPlayerOrMinion(ent) then
				ent:Horde_AddDebuffBuildup(HORDE.Status_Frostbite, 4, self)
			end
		end

		local e = EffectData()
			e:SetOrigin(self:GetPos())
			e:SetNormal(Vector(0,0,1))
			e:SetScale(1)
		util.Effect("weeper_blast", e, true, true)
	end)
end

function ENT:DoEntityRelationshipCheck()
    if self.Behavior == VJ_BEHAVIOR_PASSIVE_NATURE then return false end
	local posEnemies = self.CurrentPossibleEnemies
	if posEnemies == nil then return false end
	self.ReachableEnemyCount = 0
	local eneSeen = false
	local myPos = self:GetPos()
	local nearestDist = nil
	local mySDir = self:GetSightDirection()
	local mySAng = math.cos(math.rad(self.SightAngle))
	local plyControlled = self.VJ_IsBeingControlled
	local sdHintBullet = sound.GetLoudestSoundHint(SOUND_BULLET_IMPACT, myPos)
	local sdHintBulletOwner = nil;
	if sdHintBullet then
		sdHintBulletOwner = sdHintBullet.owner
	end
	local it = 1
	while it <= #posEnemies do
		local v = posEnemies[it]
		if !IsValid(v) then
			table.remove(posEnemies, it)
		else
			it = it + 1
			if self:VJ_HasNoTarget(v) == true then
				if IsValid(self:GetEnemy()) && self:GetEnemy() == v then
					self:ResetEnemy(false)
				end
				continue
			end
			local vPos = v:GetPos()
			local vDistanceToMy = vPos:Distance(myPos)
			local sightDist = self.SightDistance
			if vDistanceToMy > sightDist then continue end
			local entFri = false
			local vClass = v:GetClass()
			local vNPC = v:IsNPC()
			local vPlayer = v:IsPlayer()
			if vClass != self:GetClass() then
				for _,friClass in ipairs(self.VJ_NPC_Class) do
					if friClass == varCPly && self.PlayerFriendly == false then self.PlayerFriendly = true end -- If player ally then set the PlayerFriendly to true
					if (friClass == varCCom && NPCTbl_Combine[vClass]) or (friClass == varCZom && NPCTbl_Zombies[vClass]) or (friClass == varCAnt && NPCTbl_Antlions[vClass]) or (friClass == varCXen && NPCTbl_Xen[vClass]) then
						v:AddEntityRelationship(self, D_LI, 99)
						self:AddEntityRelationship(v, D_LI, 99)
						entFri = true
					end
					if (v.VJ_NPC_Class && VJ_HasValue(v.VJ_NPC_Class, friClass)) or (entFri == true) then
						if friClass == varCPly then -- If we have the player ally class then check if we both of us are supposed to be friends
							if self.FriendsWithAllPlayerAllies == true && v.FriendsWithAllPlayerAllies == true then
								entFri = true
								if vNPC then v:AddEntityRelationship(self, D_LI, 99) end
								self:AddEntityRelationship(v, D_LI, 99)
							end
						else
							entFri = true
							-- If I am enemy to it, then reset it!
							if IsValid(self:GetEnemy()) && self:GetEnemy() == v then
								self.EnemyReset = true
								self:ResetEnemy(false)
							end
							if vNPC then v:AddEntityRelationship(self, D_LI, 99) end
							self:AddEntityRelationship(v, D_LI, 99)
						end
					end
				end
				
				if vPlayer then
					entFri = true
					self:AddEntityRelationship(v, D_LI, 99)
				end
				if vClass == "npc_turret_floor" or vClass == "npc_vj_horde_combat_bot" or vClass == "npc_vj_horde_vortigaunt" or vClass == "npc_manhack" then
					entFri = true
					self:AddEntityRelationship(v, D_LI, 99)
				else
					if !entFri && vNPC then v:AddEntityRelationship(self, D_HT, 99) end
				end
				-- Investigation detection systems, including sound, movement and flashlight
				if (!self.IsVJBaseSNPC_Tank) && !IsValid(self:GetEnemy()) && entFri == false then
					if vPlayer then
						self:AddEntityRelationship(v, D_NU, 99) -- Make the player neutral since it's not supposed to be a friend
						if v:Crouching() && v:GetMoveType() != MOVETYPE_NOCLIP then
							sightDist = self.VJ_IsHugeMonster == true and 5000 or 2000
						end
						if vDistanceToMy < 350 && v:FlashlightIsOn() == true && (v:GetForward():Dot((myPos - vPos):GetNormalized()) > math_cos(math_rad(20))) then
							//			   Asiga hoser ^ (!v:Crouching() && v:GetVelocity():Length() > 0 && v:GetMoveType() != MOVETYPE_NOCLIP && ((!v:KeyDown(IN_WALK) && (v:KeyDown(IN_FORWARD) or v:KeyDown(IN_BACK) or v:KeyDown(IN_MOVELEFT) or v:KeyDown(IN_MOVERIGHT))) or (v:KeyDown(IN_SPEED) or v:KeyDown(IN_JUMP)))) or
							self:SetTarget(v)
							self:VJ_TASK_FACE_X("TASK_FACE_TARGET")
						end
					end
					if self.NextInvestigateSoundMove < CurTime() then
						-- When a sound is detected
						if v.VJ_LastInvestigateSdLevel && vDistanceToMy < (self.InvestigateSoundDistance * v.VJ_LastInvestigateSdLevel) && ((CurTime() - v.VJ_LastInvestigateSd) <= 1) then
							if self:Visible(v) then
								self:StopMoving()
								self:SetTarget(v)
								self:VJ_TASK_FACE_X("TASK_FACE_TARGET")
							elseif self.FollowingPlayer == false then
								self:SetLastPosition(vPos)
								self:VJ_TASK_GOTO_LASTPOS("TASK_WALK_PATH")
							end
							self:CustomOnInvestigate(v)
							self:PlaySoundSystem("InvestigateSound")
							self.NextInvestigateSoundMove = CurTime() + 2
						-- When a bullet hit is detected
						elseif IsValid(sdHintBulletOwner) && sdHintBulletOwner == v then
							self:StopMoving()
							self:SetLastPosition(sdHintBullet.origin)
							self:VJ_TASK_FACE_X("TASK_FACE_LASTPOSITION")
							self:CustomOnInvestigate(v)
							self:PlaySoundSystem("InvestigateSound")
							self.NextInvestigateSoundMove = CurTime() + 0.3 -- Shorter delay because many bullets could hit
						end
					end
				end
			end

			-- Check in order: Can find enemy + Neutral or not + Is visible + In sight
			if self.DisableFindEnemy == false && (self.Behavior != VJ_BEHAVIOR_NEUTRAL or self.Alerted) && (self.FindEnemy_CanSeeThroughWalls or self:Visible(v)) && (self.FindEnemy_UseSphere or (mySDir:Dot((vPos - myPos):GetNormalized()) > mySAng)) then
				local check = self:DoRelationshipCheck(v)
				if check == true then -- Is enemy
					eneSeen = true
					self.ReachableEnemyCount = self.ReachableEnemyCount + 1
					self:AddEntityRelationship(v, D_HT, 99)
					-- If the detected enemy is closer than the previous enemy, the set this as the enemy!
					if (nearestDist == nil) or (vDistanceToMy < nearestDist) then
						nearestDist = vDistanceToMy
						self:VJ_DoSetEnemy(v, true, true)
					end
				-- If the current enemy is a friendly player, then reset the enemy!
				elseif check == false && vPlayer && IsValid(self:GetEnemy()) && self:GetEnemy() == v then
					self.EnemyReset = true
					self:ResetEnemy(false)
				end
			end
			if vPlayer then
				if entFri == true && self.MoveOutOfFriendlyPlayersWay == true && self.IsGuard == false && !self:IsMoving() && CurTime() > self.TakingCoverT && !plyControlled && (!self.IsVJBaseSNPC_Tank) && self:BusyWithActivity() == false then
					local dist = 20
					if self.FollowingPlayer == true then dist = 10 end
					if /*self:Disposition(v) == D_LI &&*/ (self:VJ_GetNearestPointToEntityDistance(v) < dist) && v:GetVelocity():Length() > 0 && v:GetMoveType() != MOVETYPE_NOCLIP then
						self.NextFollowPlayerT = CurTime() + 2
						self:PlaySoundSystem("MoveOutOfPlayersWay")
						self:SetMovementActivity(VJ_PICK(self.AnimTbl_Run))
						local vsched = ai_vj_schedule.New("vj_move_away")
						vsched:EngTask("TASK_MOVE_AWAY_PATH", 120)
						vsched:EngTask("TASK_RUN_PATH", 0)
						vsched:EngTask("TASK_WAIT_FOR_MOVEMENT", 0)
						vsched.IsMovingTask = true
						vsched.MoveType = 1
						self:StartSchedule(vsched)
						self.TakingCoverT = CurTime() + 0.2
					end
				end
				
				-- HasOnPlayerSight system, used to do certain actions when it sees the player
				if self.HasOnPlayerSight == true && v:Alive() &&(CurTime() > self.OnPlayerSightNextT) && (vDistanceToMy < self.OnPlayerSightDistance) && self:Visible(v) && (mySDir:Dot((v:GetPos() - myPos):GetNormalized()) > mySAng) then
					-- 0 = Run it every time | 1 = Run it only when friendly to player | 2 = Run it only when enemy to player
					local disp = self.OnPlayerSightDispositionLevel
					if (disp == 0) or (disp == 1 && (self:Disposition(v) == D_LI or self:Disposition(v) == D_NU)) or (disp == 2 && self:Disposition(v) != D_LI) then
						self:CustomOnPlayerSight(v)
						self:PlaySoundSystem("OnPlayerSight")
						if self.OnPlayerSightOnlyOnce == true then -- If it's only suppose to play it once then turn the system off
							self.HasOnPlayerSight = false
						else
							self.OnPlayerSightNextT = CurTime() + math.Rand(self.OnPlayerSightNextTime.a, self.OnPlayerSightNextTime.b)
						end
					end
				end
			end
		end
	end
	if eneSeen == true then return true else return false end
end

local finishAttack = {
	[VJ_ATTACK_MELEE] = function(self, skipStopAttacks)
		if skipStopAttacks != true then
			timer.Create("timer_melee_finished"..self:EntIndex(), self:DecideAttackTimer(self.NextAnyAttackTime_Melee, self.NextAnyAttackTime_Melee_DoRand, self.TimeUntilMeleeAttackDamage, self.CurrentAttackAnimationDuration), 1, function()
				self:StopAttacks()
				self:DoChaseAnimation()
			end)
		end
		timer.Create("timer_melee_finished_abletomelee"..self:EntIndex(), self:DecideAttackTimer(self.NextMeleeAttackTime, self.NextMeleeAttackTime_DoRand), 1, function()
			self.IsAbleToMeleeAttack = true
		end)
	end,
	[VJ_ATTACK_RANGE] = function(self, skipStopAttacks)
		if skipStopAttacks != true then
			timer.Create("timer_range_finished"..self:EntIndex(), self:DecideAttackTimer(self.NextAnyAttackTime_Range, self.NextAnyAttackTime_Range_DoRand, self.TimeUntilRangeAttackProjectileRelease, self.CurrentAttackAnimationDuration), 1, function()
				self:StopAttacks()
				self:DoChaseAnimation()
			end)
		end
		timer.Create("timer_range_finished_abletorange"..self:EntIndex(), self:DecideAttackTimer(self.NextRangeAttackTime, self.NextRangeAttackTime_DoRand), 1, function()
			self.IsAbleToRangeAttack = true
		end)
	end,
	[VJ_ATTACK_LEAP] = function(self, skipStopAttacks)
		if skipStopAttacks != true then
			timer.Create("timer_leap_finished"..self:EntIndex(), self:DecideAttackTimer(self.NextAnyAttackTime_Leap, self.NextAnyAttackTime_Leap_DoRand, self.TimeUntilLeapAttackDamage, self.CurrentAttackAnimationDuration), 1, function()
				self:StopAttacks()
				self:DoChaseAnimation()
			end)
		end
		timer.Create("timer_leap_finished_abletoleap"..self:EntIndex(), self:DecideAttackTimer(self.NextLeapAttackTime, self.NextLeapAttackTime_DoRand), 1, function()
			self.IsAbleToLeapAttack = true
		end)
	end
}

function ENT:CustomOnThink()
	if not self:GetEnemy() then return end
	local EnemyDistance = self.NearestPointToEnemyDistance
	if EnemyDistance < 200 then
		if CurTime() > self.NextBlastTime then
			sound.Play("npc/stalker/go_alert2.wav", self:GetPos(), 100, 50)
			self:VJ_ACT_PLAYACTIVITY("podconvulse", true, 1.5, false)
			self:ShockAttack(1.5)
			self:ShockAttack(1.7)
			self:ShockAttack(1.9)
			self:ShockAttack(2.1)
			self:ShockAttack(2.3)
			self:ShockAttack(2.5)
			self.NextBlastTime = CurTime() + self.NextBlastCooldown
			timer.Simple(2.5, function ()
				if not self:IsValid() then return end
				self:VJ_ACT_PLAYACTIVITY("walk")
			end)
		end
	end
end


VJ.AddNPC("Shadow Weeper","npc_vj_horde_shadow_weeper", "Horde")