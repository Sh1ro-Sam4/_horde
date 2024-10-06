AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2020 by Mayhem, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/nightmare/horror.mdl"}
ENT.StartHealth = 450
ENT.HullType = HULL_HUMAN
ENT.Teleporting = false
ENT.TeleportDelay = 0
---------------------------------------------------------------------------------------------------------------------------------------------
	-- ====== Blood-Related Variables ====== --
ENT.Bleeds = true
ENT.BloodColor = "Oil"
ENT.Immune_Dissolve = true

	-- ====== Melee Attack ====== --
ENT.HasMeleeAttack = true
ENT.MeleeAttackDistance = 70
ENT.MeleeAttackAngleRadius = 70
ENT.MeleeAttackDamageType = DMG_SLASH
ENT.TimeUntilMeleeAttackDamage = false
ENT.NextAnyAttackTime_Melee = false

	-- ====== Call For Help Variables ====== --
ENT.CallForHelp = false -- Does the SNPC call for help?

	-- ====== Death Code ====== --
ENT.HasDeathAnimation = true
ENT.AnimTbl_Death = {"Death"}
ENT.DeathAnimationTime = 2.7
ENT.HasDeathRagdoll = false

	-- ====== Flinching Code ====== --
ENT.CanFlinch = 1
ENT.FlinchChance = 1
ENT.NextMoveAfterFlinchTime = "LetBaseDecide"
ENT.NextFlinchTime = 5
ENT.FlinchAnimation_UseSchedule = false
ENT.HasHitGroupFlinching = true
ENT.HitGroupFlinching_DefaultWhenNotHit = false
ENT.HitGroupFlinching_Values = {{HitGroup = {3}, IsSchedule = false, Animation = {ACT_FLINCH_STOMACH}}, {HitGroup = {1}, IsSchedule = false, Animation = {ACT_FLINCH_HEAD}}, {HitGroup = {2}, IsSchedule = false, Animation = {ACT_FLINCH_CHEST}}, {HitGroup = {4}, IsSchedule = false, Animation = {ACT_FLINCH_LEFTARM}}, {HitGroup = {5}, IsSchedule = false, Animation = {ACT_FLINCH_RIGHTARM}}, {HitGroup = {6}, IsSchedule = false, Animation = {ACT_FLINCH_LEFTLEG}}, {HitGroup = {7}, IsSchedule = false, Animation = {ACT_FLINCH_RIGHTLEG}}}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
	self:SetCollisionBounds(Vector(23, 23, 95), Vector(-23, -23, 0))
	self:SetRenderFX(kRenderFxHologram)
	self:DrawShadow(false)
	//self:EmitSound("macho/flightroar/distant/npc_dragon_flightroar_distant_01.mp3", 120, 100, 1)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPriorToKilled(dmginfo,hitgroup)
	self:SetRenderFX(kRenderFxNone)
	self:DrawShadow(true)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnThink_AIEnabled()
	if GetConVarNumber("vj_mutant_is_macho") == 1 then
		self.SoundTbl_Death = {
			"macho/death/npc_dragon_death_01.mp3",
			"macho/death/npc_dragon_death_02.mp3"
		}

		self.SoundTbl_Idle = {
			"macho/flightroar/npc_dragon_flightroar_01.mp3",
			"macho/flightroar/npc_dragon_flightroar_02.mp3",
			"macho/flightroar/npc_dragon_flightroar_03.mp3",
			"macho/flightroar/npc_dragon_flightroar_04.mp3",
			"macho/flightroar/npc_dragon_flightroar_05.mp3",
			"macho/flightroar/npc_dragon_flightroar_06.mp3",
			"macho/flightroar/npc_dragon_flightroar_07.mp3",
			"macho/flightroar/npc_dragon_flightroar_08.mp3"
		}
	else
		self.SoundTbl_Idle = {
			"Nightmare/voice/1shot_breathing_01.mp3",
			"Nightmare/voice/1shot_breathing_02.mp3",
			"Nightmare/voice/1shot_breathing_03.mp3",
			"Nightmare/voice/1shot_breathing_08.mp3",
			"Nightmare/voice/1shot_breathing_09.mp3",
			"Nightmare/voice/1shot_creep_01.mp3",
			"Nightmare/voice/1shot_creep_02.mp3",
			"Nightmare/voice/1shot_creep_03.mp3",
			"Nightmare/voice/1shot_creep_06.mp3",
			"Nightmare/voice/1shot_creep_06_3s.mp3",
			"Nightmare/voice/1shot_creep_07.mp3",
			"Nightmare/voice/1shot_creep_09.mp3",
			"Nightmare/voice/1shot_creep_10.mp3"
		}

		self.SoundTbl_Death = {
			"Nightmare/zekZombieDeath01.mp3",
			"Nightmare/zekZombieDeath02.mp3",
			"Nightmare/zekZombieDeath03.mp3",
			"Nightmare/zekZombieDeath04.mp3"
		}
	end
	
	if !self.Dead && self:GetEnemy() != nil && !self.VJ_IsBeingControlled && !self.Teleporting && !self.Flinching && !self.MeleeAttacking	then
		if math.random(1,10) == 1 && CurTime() > self.TeleportDelay then
			self:Teleport()
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:GetFitAtPos(pos)
    local stepHeight = self.loco and self.loco:GetStepHeight() or self.GetStepSize and self:GetStepSize() or 24
    local stepPos = pos + Vector(0,0,stepHeight)
    local tr = util.TraceEntity({
        start = stepPos,
        endpos = stepPos,
        filter = self,
        mask = MASK_NPCSOLID
    }, self)
    return not tr.Hit and stepPos
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Teleport()
	local basePos = self:GetEnemy():GetPos() -- position we start looking from
	local dist = math.random(128,256) -- min and max distance outward
	local ang = Angle(0,math.random(0,360),0) -- find a random angle
	local pos = basePos + ang:Forward() * dist --- it's all coming together
	local viable = self:FindViablePos(pos)
	
	if viable && self.Teleporting == false then
		self:VJ_ACT_PLAYACTIVITY("Flee",true,VJ_GetSequenceDuration(self,"Flee"),false)
        self.HasMeleeAttack = false
		self.CanFlinch = 0
		self.Teleporting = true
		self:SetRenderFX(kRenderFxFadeSlow)
		timer.Simple(VJ_GetSequenceDuration(self,"Flee"),function() 
			if IsValid(self) && !self.Dead then
				self:SetPos(viable)
				self:SetRenderFX(kRenderFxHologram)
				self.HasMeleeAttack = true
				self.Teleporting = false
				self.CanFlinch = 1
			end 
		end)
		self.TeleportDelay = CurTime()+math.random(10,15)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:FindViablePos(curPos, fallback)
    curPos = curPos or self:GetPos()

    local nearestMesh = navmesh.GetNearestNavArea(curPos, false, 1024, false, true)
    local nearest = IsValid(nearestMesh) and nearestMesh:GetClosestPointOnArea(curPos)

    local nearestPos = nearest and self:GetFitAtPos(nearest)

    if nearestPos then -- Check if we can fit at the closest position
        return nearestPos
    else -- Check the center pos
        local center = IsValid(nearestMesh) and nearestMesh:GetCenter()
        local centerPos = center and self:GetFitAtPos(center)
        if centerPos then -- use the center position instead if we can
            return centerPos
        else
            local nearestMeshes = navmesh.Find(center or curPos, 1024, 64, 64)
            for k, v in pairs(nearestMeshes) do
                if nearestMeshes ~= nearestMesh then

                    local otherNearest = v:GetClosestPointOnArea(curPos)
                    local otherNearestPos = self:GetFitAtPos(otherNearest)
                    if otherNearestPos then
                        return otherNearestPos
                    else
                        local otherCenter = v:GetCenter()
                        local otherCenterPos = self:GetFitAtPos(otherCenter)
                        if otherCenterPos then
                            return otherCenter
                        end
                    end
                end
            end
        end
    end
    return fallback
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:MultipleMeleeAttacks()
	local randattack_close = math.random(1,2)
		if randattack_close == 1 then
		self.AnimTbl_MeleeAttack = {"Melee_1", "Melee_2", "Melee_3", "Melee_5", "Melee_6"}
		self.MeleeAttackDamageAngleRadius = 50
		self.MeleeAttackDamageDistance = 80
		self.MeleeAttackDamage = math.Rand(15, 25)

		elseif randattack_close == 2 then
		self.AnimTbl_MeleeAttack = {"Melee_4"}
		self.MeleeAttackDamageAngleRadius = 50
		self.MeleeAttackDamageDistance = 40
		self.MeleeAttackDamage = math.Rand(20, 35)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAcceptInput(key,activator,caller,data)
	if key == "Step" then
		self:EmitSound("Nightmare/footstepBareFast0"..math.random(5,8)..".mp3", 65, 100, 1)

	elseif key == "Whoosh" then
		self:EmitSound("Nightmare/meleeSwingFast0"..math.random(1,4)..".mp3", 70, 100, 1)

	elseif key == "Scream" then
		if GetConVarNumber("vj_mutant_is_macho") == 1 then
			self:EmitSound("macho/flightroar/npc_dragon_flightroar_0"..math.random(1,8)..".mp3", 90, 100, 1)
		else
			self:EmitSound("Nightmare/zekAmbientHowl0"..math.random(1,5)..".mp3", 90, 100, 1)
		end
	elseif key == "Pain" then
		self:EmitSound("Nightmare/zekPain0"..math.random(1,8)..".mp3", 90, 100, 1)

	elseif key == "Melee1" then
		if GetConVarNumber("vj_mutant_is_macho") == 1 then
			self:EmitSound("macho/attack/npc_dragon_attack_0"..math.random(1,4)..".mp3", 80, 100, 1)
		else
			--self:EmitSound("Nightmare/zekAttackMelee"..math.random(1,12)..".mp3", 80, 100, 1)
			self:EmitSound("Nightmare/new_sounds/zombieAttack0"..math.random(1,4)..".mp3", 80, 100, 1)
		end

	elseif key == "Melee2" then
		if GetConVarNumber("vj_mutant_is_macho") == 1 then
			self:EmitSound("macho/attack/npc_dragon_attack_0"..math.random(1,4)..".mp3", 80, 100, 1)
		else
			--self:EmitSound("Nightmare/zekAttackMelee"..math.random(1,12)..".mp3", 80, 100, 1)
			self:EmitSound("Nightmare/new_sounds/zombieAttack0"..math.random(1,4)..".mp3", 80, 100, 1)
		end

	elseif key == "Melee3" then
		if GetConVarNumber("vj_mutant_is_macho") == 1 then
			self:EmitSound("macho/attack/npc_dragon_attack_0"..math.random(1,4)..".mp3", 80, 100, 1)
		else
			--self:EmitSound("Nightmare/zekAttackMelee"..math.random(1,12)..".mp3", 80, 100, 1)
			self:EmitSound("Nightmare/new_sounds/zombieAttack0"..math.random(1,4)..".mp3", 80, 100, 1)
		end

	elseif key == "Melee4" then
		self:EmitSound("Nightmare/zekEatBite0"..math.random(1,8)..".mp3", 70, 100, 1)

	elseif key == "Melee5" then
		if GetConVarNumber("vj_mutant_is_macho") == 1 then
			self:EmitSound("macho/attack/npc_dragon_attack_0"..math.random(1,4)..".mp3", 80, 100, 1)
		else
			--self:EmitSound("Nightmare/zekAttackMelee"..math.random(1,12)..".mp3", 80, 100, 1)
			self:EmitSound("Nightmare/new_sounds/zombieAttack0"..math.random(1,4)..".mp3", 80, 100, 1)
		end

	elseif key == "Hit" then
		self:MeleeAttackCode()
		
	elseif key == "Left_Arm_Explode" then
		util.ScreenShake(self:GetPos(),5,100,0.2,250)
		self:EmitSound("sfx_blood_gib.mp3", 75, 100, 1)
		self:EmitSound("sfx_blood_splash.mp3", 70, 100, 1)
		ParticleEffectAttach("horror_bloodgibs",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("Arm_Left"))
	
	elseif key == "Right_Arm_Explode" then
		util.ScreenShake(self:GetPos(),5,100,0.2,250)
		self:EmitSound("sfx_blood_gib.mp3", 75, 100, 1)
		self:EmitSound("sfx_blood_splash.mp3", 70, 100, 1)
		ParticleEffectAttach("horror_bloodgibs",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("Arm_Right"))
	
	elseif key == "Body_Explode" then
		util.ScreenShake(self:GetPos(),12,100,0.6,600)
		self:EmitSound("sfx_blood_explode.mp3", 80, 100, 1)
		self:EmitSound("sfx_blood_splash.mp3", 75, 100, 1)
		ParticleEffectAttach("horror_bloodsplosion",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("Origin"))
		
	elseif key == "Left_Arm_Scale" then
		for i=13,31 do
			self:ManipulateBoneScale(i,Vector()*0)
		end
		
	elseif key == "Right_Arm_Scale" then
		for i=33,51 do
			self:ManipulateBoneScale(i,Vector()*0)
		end
	end
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2020 by Mayhem, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
