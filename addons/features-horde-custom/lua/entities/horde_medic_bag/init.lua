AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:Initialize()

    self:SetModel("models/props/g_medic_bag.mdl")
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(SOLID_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)

    self:SetUseType(3)

    self:SetVar(1, 4)

    local phys = self:GetPhysicsObject()

    if phys:IsValid() then
        phys:Wake()
    end
	
	timer.Simple(30, function ()
        if self:IsValid() then
            self:Remove()
        end
    end)

end

function ENT:Use( ply )
    local tab = self:GetTable()
	
	if ply:Health() >= ply:GetMaxHealth() then ply:EmitSound("items/suitchargeno1.wav") return end
	
    if (tab[1] > 1) then
	ply:EmitSound("items/medshot4.wav")
        HORDE:SelfHeal(ply, ply:GetMaxHealth() )
        tab[1] = tab[1] - 1
        x = 4-tab[1]
        s = tostring(x)
        self:SetBodyGroups(s)
    elseif (tab[1] == 1) then
	ply:EmitSound("items/medshot4.wav")
        HORDE:SelfHeal(ply, ply:GetMaxHealth())
        self:Remove()
    end
end