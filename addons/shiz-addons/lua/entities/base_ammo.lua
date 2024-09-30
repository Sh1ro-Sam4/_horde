AddCSLuaFile()

ENT.Type = 'anim'
ENT.Base = 'base_gmodentity'

ENT.PrintName = 'base_ammo'
ENT.Author = 'shizlib'
ENT.Category = 'Developer'

ENT.Spawnable = true
ENT.AdminSpawnable = true

if CLIENT then
    function ENT:Draw()
        self:DrawModel()
    end
end

if SERVER then
    function ENT:Initialize()
        if shizlib.ammo.CFG[self.AmmoType] then
            self:SetModel(shizlib.ammo.CFG[self.AmmoType].model)
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
    end
end