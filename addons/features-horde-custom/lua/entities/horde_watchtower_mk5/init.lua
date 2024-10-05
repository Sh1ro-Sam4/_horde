AddCSLuaFile("shared.lua")
AddCSLuaFile("cl_init.lua")
include("shared.lua")
ENT.CleanupPriority = 2

function ENT:Initialize()
    self:SetModel("models/props_combine/combine_light001a.mdl")
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetCollisionGroup(COLLISION_GROUP_WORLD)
    local phys = self:GetPhysicsObject()
    if phys:IsValid() then
        phys:Wake()
        phys:EnableGravity(true)
        phys:SetMass(10)
    end

    self.Horde_NextThink = CurTime()
    self.Horde_Owner = self:GetNWEntity("HordeOwner")
    self.Horde_ThinkInterval = 30
    self.Horde_EnableShockwave = nil
    self.Horde_NextShockWave = CurTime()
    self.Horde_ShockwaveInterval = 2
    self.Horde_WatchTower = true
    self.Horde_NextShockAttack = CurTime()
    self.Horde_ShockAttackInterval = 2
    self:SetColor(Color(125, 50, 50))

    if self.Horde_Owner:Horde_GetPerk("warden_restock") then
        self.Horde_ThinkInterval = 15
    end
    if self.Horde_Owner:Horde_GetPerk("warden_ex_machina") then
        self:Horde_AddWardenAura()
        self.Horde_EnableShockwave = true
    end
end

function ENT:Think()
    if CurTime() >= self.Horde_NextThink + self.Horde_ThinkInterval then
        if SERVER then
            if self.Horde_Owner:IsPlayer() then
                hook.Run("Horde_WardenWatchtower", self.Horde_Owner, self)
            end
        end
        self.Horde_NextThink = CurTime()
    end

    if self.Horde_EnableShockwave then
        if CurTime() >= self.Horde_NextShockWave + self.Horde_ShockwaveInterval then
            local dmg = DamageInfo()
            dmg:SetAttacker(self.Horde_Owner)
            dmg:SetInflictor(self)
            dmg:SetDamageType(DMG_SHOCK)
            dmg:SetDamage(50)
            local e = EffectData()
            e:SetOrigin(self:GetPos())
            util.Effect("explosion_shock", e, true, true)
            util.BlastDamageInfo(dmg, self:GetPos(), 160)
            self.Horde_NextShockWave = CurTime()
        end
    end

    if CurTime() >= self.Horde_NextShockAttack + self.Horde_ShockAttackInterval then
local dmg = DamageInfo()
            dmg:SetAttacker(self.Horde_Owner)
            dmg:SetInflictor(self)
            dmg:SetDamageType(DMG_BURN)
            dmg:SetDamage(80)
            local e = EffectData()
            e:SetOrigin(self:GetPos())
            util.Effect("m2_flame_explosion", e, true, true)
			self:EmitSound("horde/weapons/inferno_blade/flame.ogg")
            util.BlastDamageInfo(dmg, self:GetPos(), 160)
            self.Horde_NextShockAttack = CurTime()
    end
end
