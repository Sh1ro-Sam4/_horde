AddCSLuaFile()

ENT.Base = "cso_supplybox_base"

ENT.Type = "anim"
ENT.PrintName = "Defuse Kit"
ENT.Category = "TFA CS:O"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.MyModel = "models/tfa_cso/entities/w_defusekit.mdl" -- model to use
ENT.MyModelScale = 1 -- model scale. 1 is normal size
ENT.ImpactSound = "Plastic_Box.ImpactSoft" -- physics impact sound
ENT.ShouldDrawShadow = true

ENT.GiveOnTouch = true -- give stuff if touched?
ENT.Defuser = true -- defuser kit
ENT.UsedSound = "entities/tfa_cso/kevlar_vest/pickup.wav" -- sound to play when used

if SERVER then
    AddCSLuaFile()
    function ENT:GiveStuff(activator)
	if !activator:IsPlayer() then return end
        if self.Defuser then
            if !activator:GetNW2Bool("CSO_HasDefuseKit") then
            activator:SetNW2Bool("CSO_HasDefuseKit", true)
            self.WasUsed = true -- did something, flag for deletion
        end
        end
        if self.WasUsed then
            self.Entity:EmitSound(self.UsedSound, 64)
            SafeRemoveEntity(self)
        end
    end
end

hook.Add("PlayerDeath" , "CSO_Drop_Defuser" , function(ply)
	if ply:GetNW2Bool("CSO_HasDefuseKit", false) and GetConVar("sv_tfa_cso_drop_stuff_on_death"):GetBool() then
		local defuser = ents.Create("cso_defuser")
		defuser:SetPos(ply:GetShootPos())
		defuser:Spawn()
		defuser:PhysWake()
	end
end)