AddCSLuaFile()

ENT.Type = 'anim'
ENT.Base = 'base_gmodentity'

ENT.PrintName = 'base_accessory'
ENT.Author = 'shizlib'
ENT.Category = 'Developer'

ENT.Spawnable = true
ENT.AdminSpawnable = true

function ENT:SetupDataTables()
    self:NetworkVar('String', 0, 'ID')
end

if CLIENT then
    function ENT:Draw()
        self:DrawModel()
    end
end

if SERVER then
    function ENT:Initialize()
        self:SetModel('models/gmod_tower/afro.mdl')
        self:PhysicsInit( SOLID_VPHYSICS )
        self:SetMoveType( MOVETYPE_VPHYSICS )
        self:SetSolid( SOLID_VPHYSICS )
        local phys = self:GetPhysicsObject()
        if phys:IsValid() then
            phys:Wake()
        end

        self:SetID('afro')

        -- local ent = ents.Create('prop_physics')
        -- ent:SetModel('models/hunter/blocks/cube025x025x025.mdl')
        -- ent:SetNoDraw(true)
        -- ent:SetPos(self:GetPos())
        -- ent:Spawn()
        -- ent:Activate()
        -- ent.ID = self:GetID()

        -- self:SetParent(ent)
        -- self.Prikol = ent

        self:SetModel(SH_ACC.List[self:GetID()].mdl)
    end

    function ENT:OnRemove()
        if IsValid(self.Prikol) then self.Prikol:Remove() end
    end
end