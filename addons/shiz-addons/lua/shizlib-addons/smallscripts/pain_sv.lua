local Player = FindMetaTable('Player')
util.AddNetworkString('Pain')

local male_pain = {
	Sound('vo/coast/bugbait/sandy_help.wav'),
	Sound('vo/npc/male01/pain01.wav'),
	Sound('vo/npc/male01/pain02.wav'),
	Sound('vo/npc/male01/pain03.wav'),
	Sound('vo/npc/male01/pain04.wav'),
	Sound('vo/npc/male01/pain05.wav'),
	Sound('vo/npc/male01/pain06.wav'),
	Sound('vo/npc/male01/pain07.wav'),
	Sound('vo/npc/male01/pain08.wav'),
	Sound('vo/npc/male01/pain09.wav'),
}

local female_pain = {
	Sound('vo/canals/arrest_helpme.wav'),
	Sound('vo/npc/female01/pain01.wav'),
	Sound('vo/npc/female01/pain02.wav'),
	Sound('vo/npc/female01/pain03.wav'),
	Sound('vo/npc/female01/pain04.wav'),
	Sound('vo/npc/female01/pain05.wav'),
	Sound('vo/npc/female01/pain06.wav'),
	Sound('vo/npc/female01/pain07.wav'),
	Sound('vo/npc/female01/pain08.wav'),
	Sound('vo/npc/female01/pain09.wav'),
	Sound('vo/npc/female01/moan01.wav'),
	Sound('vo/npc/female01/moan02.wav'),
	Sound('vo/npc/female01/moan03.wav'),
	Sound('vo/npc/female01/moan04.wav'),
	Sound('vo/npc/female01/moan05.wav'),
}

local male_arm_sounds = {Sound('vo/npc/male01/myarm01.wav'),Sound('vo/npc/male01/myarm02.wav')}
local female_arm_sounds = {Sound('vo/npc/female01/myarm01.wav'),Sound('vo/npc/female01/myarm02.wav')}

local male_leg_sounds = {Sound('vo/npc/male01/myleg01.wav'),Sound('vo/npc/male01/myleg02.wav')}
local female_leg_sounds = {Sound('vo/npc/female01/myleg01.wav'),Sound('vo/npc/female01/myleg02.wav')}

local male_gut_sounds = {Sound('vo/npc/male01/mygut02.wav'),Sound('vo/npc/male01/hitingut01.wav'),Sound('vo/npc/male01/hitingut02.wav')}
local female_gut_sounds = {Sound('vo/npc/female01/mygut02.wav'),Sound('vo/npc/female01/hitingut01.wav'),Sound('vo/npc/female01/hitingut02.wav')}

function Player:SendShock(int)
	if self:HasGodMode() then return end
	net.Start('Pain')
		net.WriteFloat(int)
		net.WriteString('шок')
	net.Send(self)
end

function Player:SendNogaBreak(int)
	net.Start('Pain')
		net.WriteFloat(int)
		net.WriteString('нога')
	net.Send(self)
end

function Player:EmitHurtSound(sound,dmg)
	if dmg < self:Health() then
		self:EmitSound(sound,68,100,1,CHAN_AUTO)
	end
end

hook.Add('GetFallDamage','shizlib-FallDamage',function(ply, speed)
    local bonus = { less = 1 }

    hook.Run("Horde_GetFallDamage", ply, speed, bonus)
	return 10
end)

local function takedmgg(ply, hitgroup, dmginfo)
    if not ply:IsPlayer() then return end
    -- if dmginfo:GetAttacker() and dmginfo:GetAttacker():IsPlayer() then return end
    local dmgpos = dmginfo:GetDamagePosition()

    local PelvisIndx = ply:LookupBone('ValveBiped.Bip01_Pelvis')
    if (PelvisIndx == nil) or ply.damaged then return dmginfo end
    local PelvisPos = ply:GetBonePosition( PelvisIndx )
    local NutsDistance = dmgpos:Distance(PelvisPos)

    local LHandIndex = ply:LookupBone('ValveBiped.Bip01_L_Hand')
    local LHandPos = ply:GetBonePosition( LHandIndex )
    local LHandDistance = dmgpos:Distance(LHandPos)

    local RHandIndex = ply:LookupBone('ValveBiped.Bip01_R_Hand')
    local RHandPos = ply:GetBonePosition(RHandIndex)
    local RHandDistance = dmgpos:Distance(RHandPos)

    if (NutsDistance <= 7 && NutsDistance >= 5) then
        hitgroup = 'HITGROUP_NUTS'
    elseif (LHandDistance < 6 || RHandDistance < 6 ) then
        hitgroup = 'HITGROUP_HAND'
    end
    local dmg = dmginfo:GetDamage()
    if (hitgroup == HITGROUP_HEAD) then
        dmginfo:ScaleDamage(1.92)
        ply:SendShock(.8)
    elseif (hitgroup == HITGROUP_LEFTARM || hitgroup == HITGROUP_RIGHTARM) then
        local sound = table.Random(male_arm_sounds)
        if ply:isFemale() then
            sound = table.Random(female_arm_sounds)
        end
        ply:EmitHurtSound(sound,dmg*.2)
        ply:SendShock(.4)
    elseif (hitgroup == HITGROUP_LEFTLEG || hitgroup == HITGROUP_RIGHTLEG) then
        dmginfo:ScaleDamage(1.1)

        local sound = table.Random(male_leg_sounds)
        if ply:isFemale() then
            sound = table.Random(female_leg_sounds)
        end
        ply:EmitHurtSound(sound,dmg*1.1)
        ply:SendShock(.2)

    elseif (hitgroup == HITGROUP_CHEST) then
        local sound = table.Random(male_pain)
        if ply:isFemale() then
            sound = table.Random(female_pain)
        end
        ply:EmitHurtSound(sound,dmg)
        ply:SendShock(.1)
    elseif (hitgroup == HITGROUP_STOMACH) then
        local sound = table.Random(male_pain)
        if ply:isFemale() then
            sound = table.Random(female_pain)
        end
        ply:EmitHurtSound(sound,dmg)
        ply:SendShock(.1)
    elseif (hitgroup == 'HITGROUP_NUTS') then
        local sound = table.Random(male_gut_sounds)
        if ply:isFemale() then
            sound = table.Random(female_gut_sounds)
        end
        ply:EmitHurtSound(sound,dmg)
        ply:SendShock(.6)
    elseif(hitgroup == 'HITGROUP_HAND') then
        local sound = table.Random(male_arm_sounds)
        if ply:isFemale() then
            sound = table.Random(female_arm_sounds)
        end
        ply:EmitHurtSound(sound,dmg)
        ply:SendShock(.7)
    else
        local sound = table.Random(male_pain)
        if ply:isFemale() then
            sound = table.Random(female_pain)
        end
        ply:EmitHurtSound(sound,dmg)
        ply:SendShock(.2)
    end
    ply.damaged = true
    timer.Simple(2,function() if IsValid(ply) then ply.damaged = false end end)
end

-- hook.Add('ScalePlayerDamage', 'shizlib-PerfectDamage?', takedmgg)