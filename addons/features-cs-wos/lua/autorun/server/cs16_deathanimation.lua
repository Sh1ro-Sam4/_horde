--[[ 
             /|  
,           /||  
\\ /` -_-_   ||  
 \\   || \\  ||  
 /\\  || ||  ||  
/  \; ||-'  ,/-' 
      |/         
      '          
Xp1 criador do addon 

]]--

AddCSLuaFile('autorun/client/cs16_deathanimationmenu.lua')

local onground = CreateConVar('death_onground', '0', {FCVAR_REPLICATED, FCVAR_NOTIFY}, 'Sets whether the death animations should only play when a player dies while on the ground.')
local csdeath = CreateConVar('cs_death', '1', {FCVAR_REPLICATED, FCVAR_NOTIFY}, 'Sets whether the CS death animations are enabled.')
local cshostagedeath = CreateConVar('cs_death_hostage', '0', {FCVAR_REPLICATED, FCVAR_NOTIFY}, 'Sets whether the CS hostage death animations are enabled.')
local csbetadeath = CreateConVar('cs_beta_death', '0', {FCVAR_REPLICATED, FCVAR_NOTIFY}, 'Sets whether the CS Beta death animations are enabled.')
local cs_pose_death = CreateConVar("cs_pose_death", "1", {FCVAR_REPLICATED, FCVAR_NOTIFY}, "Enable or disable death pose instead of ragdoll.")

util.AddNetworkString("UpdateDeathAnimations")
util.AddNetworkString("RequestDeathAnimationUpdate")

local function NotifyClients()
    net.Start("UpdateDeathAnimations")
    net.WriteBool(csdeath:GetBool())
    net.WriteBool(cshostagedeath:GetBool())
    net.WriteBool(csbetadeath:GetBool())
    net.Broadcast()
end

cvars.AddChangeCallback("cs_death", NotifyClients, "DeathAnimationChanged")
cvars.AddChangeCallback("cs_death_hostage", NotifyClients, "DeathAnimationChanged")
cvars.AddChangeCallback("cs_beta_death", NotifyClients, "DeathAnimationChanged")
cvars.AddChangeCallback("cs_pose_death", NotifyClients, "DeathAnimationChanged")

net.Receive("RequestDeathAnimationUpdate", function(len, ply)
    net.Start("UpdateDeathAnimations")
    net.WriteBool(csdeath:GetBool())
    net.WriteBool(cshostagedeath:GetBool())
    net.WriteBool(csbetadeath:GetBool())
    net.Send(ply)
end)

local function CheckAndRemoveRagdoll(ply)
    if IsValid(ply.Ragdoll) then ply.Ragdoll:Remove() end
end

local function SetEntityStuff(ent1, ent2)
    if not IsValid(ent1) or not IsValid(ent2) then return false end
    ent1:SetModel(ent2:GetModel())
    ent1:SetPos(ent2:GetPos())
    ent1:SetAngles(ent2:GetAngles())
    ent1:SetColor(ent2:GetColor())
    ent1:SetSkin(ent2:GetSkin())
    ent1:SetFlexScale(ent2:GetFlexScale())
    for i = 0, ent2:GetNumBodyGroups() - 1 do ent1:SetBodygroup(i, ent2:GetBodygroup(i)) end
    for i = 0, ent2:GetFlexNum() - 1 do ent1:SetFlexWeight(i, ent2:GetFlexWeight(i)) end
    for i = 0, ent2:GetBoneCount() do
        ent1:ManipulateBoneScale(i, ent2:GetManipulateBoneScale(i))
        ent1:ManipulateBoneAngles(i, ent2:GetManipulateBoneAngles(i))
        ent1:ManipulateBonePosition(i, ent2:GetManipulateBonePosition(i))
        ent1:ManipulateBoneJiggle(i, ent2:GetManipulateBoneJiggle(i))
    end
end

local function TransferBones(base, ragdoll)
    if not IsValid(base) or not IsValid(ragdoll) then return end
    for i = 0, ragdoll:GetPhysicsObjectCount() - 1 do
        local bone = ragdoll:GetPhysicsObjectNum(i)
        if IsValid(bone) then
            local pos, ang = base:GetBonePosition(ragdoll:TranslatePhysBoneToBone(i))
            if pos then bone:SetPos(pos) end
            if ang then bone:SetAngles(ang) end
        end
    end
end

local function TransferPhysicsData(animent, ragdoll)
    if not IsValid(animent) or not IsValid(ragdoll) then return end
    local animentPhys = animent:GetPhysicsObject()
    local ragdollPhys = ragdoll:GetPhysicsObject()

    if IsValid(animentPhys) and IsValid(ragdollPhys) then
        ragdollPhys:SetVelocity(animentPhys:GetVelocity())
        ragdollPhys:AddAngleVelocity(animentPhys:GetAngleVelocity())
    end
end

local function ChooseDeathAnimation(victim, hitgroup)
    local anim = "death1"
    local deathAnimations = {"back", "left", "right", "crouch_die", "death1", "death2", "death3", "forward", "head", "gutshot2"}
    local hostageDeathAnimations = {"hostage_die1", "hostage_die2", "hostage_die3", "hostage_die4", "hostage_die5", "hostage_die6"}
    local csbetaDeathAnimations = {"beta_die_chest1", "beta_die_chest2", "beta_die_crouch1", "beta_die_head1", "beta_die_head2", "beta_die_head3", "beta_die_head4", "beta_die_leftarm1", "beta_die_leftarm2", "beta_die_leftarm3", "beta_die_rightarm1", "beta_die_rightarm2", "beta_die_spin", "beta_die_stomach1", "beta_die_stomach2", "beta_die_legs1", "beta_die_legs2", "beta_die_legs3", "beta_die_legs4"}

    if cshostagedeath:GetBool() then
        if hitgroup == HITGROUP_HEAD then
            anim = table.Random({"hostage_die6", "hostage_die4"})
        elseif hitgroup == HITGROUP_CHEST then
            anim = "hostage_die5"
        elseif hitgroup == HITGROUP_STOMACH then
            anim = "hostage_die2"
        elseif hitgroup == HITGROUP_LEFTARM then
            anim = "hostage_die3"
        elseif hitgroup == HITGROUP_RIGHTARM then
            anim = "hostage_die3"
        elseif hitgroup == HITGROUP_LEFTLEG or hitgroup == HITGROUP_RIGHTLEG then
            anim = "hostage_die1"
        else
            anim = table.Random(hostageDeathAnimations)
        end
    elseif csbetadeath:GetBool() then
        if hitgroup == HITGROUP_HEAD then
            anim = table.Random({"beta_die_head1", "beta_die_head2", "beta_die_head3", "beta_die_head4","beta_die_spin"})
        elseif hitgroup == HITGROUP_CHEST then
            anim = table.Random({"beta_die_chest1", "beta_die_chest2"})
        elseif hitgroup == HITGROUP_STOMACH then
            anim = table.Random({"beta_die_stomach1", "beta_die_stomach2", "beta_die_crouch1"})
        elseif hitgroup == HITGROUP_LEFTARM then
            anim = table.Random({"beta_die_leftarm1", "beta_die_leftarm2", "beta_die_leftarm3"})
        elseif hitgroup == HITGROUP_RIGHTARM then
            anim = table.Random({"beta_die_rightarm1", "beta_die_rightarm2"})
        elseif hitgroup == HITGROUP_LEFTLEG then 
		    anim = table.Random({"beta_die_legs1", "beta_die_legs4"})
		elseif hitgroup == HITGROUP_RIGHTLEG then
            anim = table.Random({"beta_die_legs2", "beta_die_legs3"})
        else
            anim = table.Random(csbetaDeathAnimations)
        end
	elseif csdeath:GetBool() then
        if hitgroup == HITGROUP_HEAD then
            anim = table.Random({"head", "gutshot2"})
        elseif hitgroup == HITGROUP_CHEST then
            anim = table.Random({"back", "death1", "death3","forward"})
        elseif hitgroup == HITGROUP_STOMACH then
            anim = table.Random({"crouch_die", "left"})
        elseif hitgroup == HITGROUP_LEFTARM then
            anim = "left"
        elseif hitgroup == HITGROUP_RIGHTARM then
            anim = "right"
        elseif hitgroup == HITGROUP_LEFTLEG or hitgroup == HITGROUP_RIGHTLEG then
            anim = "death2"
        else
            anim = table.Random(deathAnimations)
        end
    end

    return anim
end

hook.Add('PlayerDeath', 'DeathAnimation', function(victim, inflictor, attacker)
    if not csdeath:GetBool() and not cshostagedeath:GetBool() and not csbetadeath:GetBool() then return end
    if not IsValid(victim) then return end
    if onground:GetBool() and not victim:OnGround() then return end

    victim.LetRespawn = false

    if IsValid(victim:GetRagdollEntity()) then
        victim:GetRagdollEntity():Remove()
    end

    local animent = ents.Create('base_gmodentity')
    SetEntityStuff(animent, victim)
    animent:Spawn()
    animent:Activate()

    victim:Spectate(OBS_MODE_CHASE)
    victim:SpectateEntity(animent)

    victim.Ragdoll = animent

    animent:SetSolid(SOLID_OBB)
    animent:PhysicsInit(SOLID_OBB)
    animent:SetMoveType(MOVETYPE_VPHYSICS)
    animent:SetCollisionGroup(COLLISION_GROUP_DEBRIS)
    local physobj = animent:GetPhysicsObject()
    if IsValid(physobj) then
        physobj:Wake()
        physobj:SetVelocity(victim:GetVelocity())
        physobj:AddAngleVelocity(Vector(0, 0, 0))
        physobj:SetDamping(0, 1000)
        physobj:SetMass(1000)
    end

    local keepUpright = constraint.Keepupright(animent, Angle(0, 0, 0), 0, 999999)

    local hitgroup = victim:LastHitGroup()
    local seq = ChooseDeathAnimation(victim, hitgroup)

    animent:SetSequence(animent:LookupSequence(seq))
    animent:SetPlaybackRate(1)
    animent.AutomaticFrameAdvance = true

    function animent:Think()
        if self.ApplyForce and IsValid(self:GetPhysicsObject()) then
            local physobj = self:GetPhysicsObject()
            physobj:SetVelocityInstantaneous(victim:GetVelocity())
            physobj:SetAngles(self:GetAngles()) -- Ensure the angles remain consistent
            physobj:AddAngleVelocity(Vector(0, 0, 0)) -- Prevent rotation

            local angles = self:GetAngles()
            angles.p = 0 -- Prevent pitch rotation
            angles.r = 0 -- Prevent roll rotation
            self:SetAngles(angles)
            physobj:SetAngles(angles)
        end
        self:NextThink(CurTime())
        return true
    end

    if not cs_pose_death:GetBool() then
        timer.Simple(animent:SequenceDuration(seq), function()
            if not IsValid(animent) then return end
            local rag = ents.Create('prop_ragdoll')
            SetEntityStuff(rag, animent)
            rag:Spawn()
            rag:Activate()
            TransferBones(animent, rag)
            TransferPhysicsData(animent, rag)
            animent:Remove()
            if IsValid(keepUpright) then
                keepUpright:Remove() -- Remover o constraint após a animação
            end
            victim:SpectateEntity(rag)
            victim.Ragdoll = rag
            victim.LetRespawn = true
        end)
    else
        victim.LetRespawn = true
    end
end)

hook.Add('PlayerDeathThink', 'DeathAnimationThink', function(ply)
    if csdeath:GetBool() or cshostagedeath:GetBool() or csbetadeath:GetBool() then
        if not ply.LetRespawn then return false end
    end
end)

hook.Add('PlayerSpawn', 'DeathAnimationRemoveRagdoll', CheckAndRemoveRagdoll)
hook.Add('PlayerDisconnected', 'DeathAnimationRemoveRagdoll', CheckAndRemoveRagdoll)