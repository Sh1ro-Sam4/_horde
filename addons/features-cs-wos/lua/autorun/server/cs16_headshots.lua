AddCSLuaFile()

include("autorun/client/cs16_s_precache.lua")

util.AddNetworkString("EmitHelmetImpact")
util.AddNetworkString("EmitBloodParticles")

CreateConVar("sv_cs_particles", "1", { FCVAR_ARCHIVE, FCVAR_NOTIFY }, "Enable or disable CS particles")

local function CS16_ParticlesEnabled()
    return GetConVar("sv_cs_particles"):GetBool()
end

local function EmitParticle(particle, dmgpos, plyangle)
    if not CS16_ParticlesEnabled() then return end
    net.Start("EmitHelmetImpact")
    net.WriteString(particle)
    net.WriteVector(dmgpos)
    net.WriteAngle(plyangle)
    net.Broadcast()
end

local function EmitBloodParticles(dmgpos, plyangle)
    EmitParticle("myblood", dmgpos, plyangle)
end

local function CS16_EntityHeadshot(ent, hitgroup, dmginfo)
    if not IsValid(ent) then return end
    if hitgroup ~= HITGROUP_HEAD then return end
    if ent:IsPlayer() then
        if ent:Armor() <= 0 then
            EmitBloodParticles(dmginfo:GetDamagePosition(), ent:EyeAngles())
            return
        end
        EmitParticle("cs16_helmet_impact", dmginfo:GetDamagePosition(), ent:EyeAngles())
    elseif ent:IsNPC() and (ent:GetClass() == "npc_combine_s" or ent:GetClass() == "npc_citizen" or ent:GetClass() == "npc_metropolice" or ent:GetClass() == "npc_zombie" or ent:GetClass() == "npc_fastzombie") then
        EmitBloodParticles(dmginfo:GetDamagePosition(), ent:EyeAngles())
    end
end

local function CS16_EntityDeath(ent, inflictor, attacker)
    if not IsValid(ent) then return end
    local dmginfo = ent.LastHitDamageInfo
    if not dmginfo then return end

    if dmginfo:IsBulletDamage() and dmginfo:GetDamageType() == DMG_HEADSHOT then
        EmitBloodParticles(ent:GetPos() + Vector(0, 0, 32), Angle(0, 0, 0))
    end
end

local function CS16_EntityDamage(ent, hitgroup, dmginfo)
    if not IsValid(ent) then return end
    local damage = dmginfo:GetDamage()
    
    if damage > 65 then
        EmitBloodParticles(dmginfo:GetDamagePosition(), ent:EyeAngles())
    end
end

hook.Add("ScalePlayerDamage", "CS16_EntityHeadshot", CS16_EntityHeadshot)
hook.Add("ScaleNPCDamage", "CS16_EntityHeadshot", CS16_EntityHeadshot)
hook.Add("PlayerDeath", "CS16_EntityDeath", CS16_EntityDeath)
hook.Add("OnNPCKilled", "CS16_EntityDeath", CS16_EntityDeath)
hook.Add("EntityTakeDamage", "CS16_EntityDamage", function(target, dmginfo)
    if target:IsPlayer() or target:IsNPC() then
        CS16_EntityDamage(target, nil, dmginfo)
    end
end)