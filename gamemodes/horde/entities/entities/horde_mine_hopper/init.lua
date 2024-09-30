AddCSLuaFile("shared.lua")
AddCSLuaFile("cl_init.lua")
include("shared.lua")
ENT.CleanupPriority = 2

function ENT:Initialize()
    self:SetModel("models/props_combine/combine_mine01.mdl")
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetCollisionGroup(COLLISION_GROUP_WORLD)
    self:SetBodygroup(0, 1)

    timer.Simple(0.75, function ()
        if self:IsValid() then
            self:SetTrigger(true)
            self:UseTriggerBounds(true, 50)

            self.entSpriteEye = ents.Create("env_sprite")
            self.entSpriteEye:SetKeyValue("model","sprites/glow01.spr")
            self.entSpriteEye:SetKeyValue("rendermode","5")
            self.entSpriteEye:SetKeyValue("rendercolor","235 50 50")
            self.entSpriteEye:SetKeyValue("scale","0.5") 
            self.entSpriteEye:SetKeyValue("spawnflags","1")
            self.entSpriteEye:SetParent(self)
            self.entSpriteEye:Spawn()
            self.entSpriteEye:Activate()
            self.entSpriteEye:SetPos(self:GetPos() + Vector(0,0,10))
            self:DeleteOnRemove(self.entSpriteEye)

            self:EmitSound("npc/roller/mine/combine_mine_deploy1.wav", 100)
        end
    end)

    self.Removing = false
    self:PhysWake()
end

local snd = Sound("npc/roller/mine/rmine_predetonate.wav")
function ENT:StartTouch(ent)
    if self.Removing then return end
    if ent:IsNPC() and (not ent:GetNWEntity("HordeOwner"):IsValid()) then
        self.Removing = true
        self:EmitSound(snd, 100)
        --self.entSpriteEye:SetKeyValue("rendercolor","255 0 0")

        timer.Simple(0.8, function ()
            if not self:IsValid() then return end
            self:Detonate()
        end)
    end
end

function ENT:Detonate()
    self.Removing = true
    local pos = self:GetPos()
    local eff = EffectData()
    eff:SetStart(pos)
    eff:SetOrigin(pos)
    util.Effect("Explosion", eff)
    util.BlastDamage(self, self.Horde_Owner, pos, 200, 250)

    for _, e in pairs(ents.FindInSphere(self:GetPos(), 150)) do
        if e:GetClass() == "horde_hopper_mine" and e ~= self then
            if not e.Removing and e.Horde_Owner == self.Horde_Owner then
                e:Detonate()
            end
        end
    end

    local ply = self.Horde_Owner
    timer.Simple(2, function ()
        if !ply:IsValid() then return end
        if ply:Horde_GetGadget() ~= "gadget_ied" then return end
        ply:Horde_SetGadgetCharges(ply:Horde_GetGadgetCharges() + 1)
    end)
    self:Remove()
end