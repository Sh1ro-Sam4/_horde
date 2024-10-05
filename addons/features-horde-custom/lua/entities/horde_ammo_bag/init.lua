AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:Initialize()

    self:SetModel("models/props/g_ammo_bag_6.mdl")
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(SOLID_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)

    self:SetUseType(3)

    self:SetVar(1, 6)

    local phys = self:GetPhysicsObject()

    if phys:IsValid() then
        phys:Wake()
    end
	
	self.Removing = false
	
	timer.Simple(30, function ()
        if self:IsValid() then
            self:Remove()
        end
    end)

end

function ENT:Use( ply )
    local tab = self:GetTable() //get table of keys to be referenced
	local given_ammo = false
	
	if not self.Removing and ply:Alive() and not ply:IsBot() then

	for _, wpn in pairs(ply:GetWeapons()) do
            if wpn.Primary and wpn.Primary.MaxAmmo and wpn.Primary.MaxAmmo <= ply:GetAmmoCount(wpn:GetPrimaryAmmoType()) then
                goto cont
            end
            local given = HORDE:GiveAmmo(ply, wpn, 6)
            given_ammo = given_ammo or given
            ::cont::
        end

        if given_ammo then
            self.Removing = true
            self:Remove()
        end
end
end

