AddCSLuaFile()

ENT.Type = 'anim'
ENT.Base = 'base_gmodentity'

ENT.PrintName = 'Верстак'
ENT.Author = 'shizlib'
ENT.Category = 'SHZ | Workbench'

ENT.Spawnable = true
ENT.AdminSpawnable = true

if CLIENT then
    function ENT:Draw()
        self:DrawModel()
    end
end

if SERVER then
    function ENT:Initialize()
        self:SetModel('models/props/CS_militia/table_shed.mdl')
        self:PhysicsInit( SOLID_VPHYSICS )
        self:SetMoveType( MOVETYPE_VPHYSICS )
        self:SetSolid( SOLID_VPHYSICS )
        local phys = self:GetPhysicsObject()
        if phys:IsValid() then
            phys:Wake()
        end
    end

    function ENT:Use(activator, caller)
        if not self.cd or self.cd < CurTime() then
            self.cd = CurTime() + 1
            if self:GetPos():Distance(activator:GetPos()) >= CFG.useDist then return end

            netstream.Start(caller, 'shizlib-crafting.open', {ent = self})
        end
    end
end