AddCSLuaFile("shared.lua")
AddCSLuaFile("cl_init.lua")
include("shared.lua")
ENT.CleanupPriority = 2

function ENT:Initialize()
    self:SetModel("models/horde/token/skull_2015.mdl")
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetTrigger(true)
    self:UseTriggerBounds(true, 4)
    self:PhysWake()
    self:SetCollisionGroup(COLLISION_GROUP_WEAPON)
	self:SetColor( Color(255, 0, 0, 255) )

    self.light = ents.Create("light_dynamic")
	self.light:SetKeyValue("brightness", "3")
	self.light:SetKeyValue("distance", "150")
	self.light:SetLocalPos(self:GetPos())
	self.light:SetLocalAngles(self:GetAngles())
	self.light:Fire("Color", "255 0 1")
	self.light:SetParent(self)
	self.light:Spawn()
	self.light:Activate()
	self.light:Fire("TurnOn", "", 0)
	self:DeleteOnRemove(self.light)

    timer.Simple(60, function ()
        if self:IsValid() then
            self:Remove()
        end
    end)
end

function ENT:Think()
    self.light:SetLocalPos(self:GetPos())
end

function ENT:StartTouch(ent)
    if ent:IsPlayer() then
        ent:Horde_AddSkullTokens(GetConVar("horde_difficulty"):GetInt() + 1)
		ent:Horde_SyncEconomy()
        sound.Play("items/battery_pickup.wav", self:GetPos())
        self:Remove()
    end
end