AddCSLuaFile()

ENT.Type = 'anim'
ENT.Base = 'base_gmodentity'

ENT.PrintName = 'base_looting'
ENT.Author = 'shizlib'
ENT.Category = 'Developer'

ENT.Spawnable = true
ENT.AdminSpawnable = true

function ENT:SetupDataTables()
    self:NetworkVar('Int', 0, 'Amount')
end

ENT.LootType = ''

if CLIENT then
    function ENT:Draw()
        self:DrawModel()
    end
end

if SERVER then
    function ENT:Initialize()
        if shizlib.Looting[self.LootType] then
            self:SetModel(shizlib.Looting[self.LootType].model)
        else
            self:SetModel('models/error.mdl')
        end
        
        self:PhysicsInit( SOLID_VPHYSICS )
        self:SetMoveType( MOVETYPE_VPHYSICS )
        self:SetSolid( SOLID_VPHYSICS )
        local phys = self:GetPhysicsObject()
        if phys:IsValid() then
            phys:Wake()
        end

        self:SetAmount( 1 )
    end
end