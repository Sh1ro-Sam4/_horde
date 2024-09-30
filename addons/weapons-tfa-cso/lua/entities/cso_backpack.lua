AddCSLuaFile()

ENT.Base = "cso_supplybox_base"

ENT.Type = "anim"
ENT.PrintName = "C4 Package"
ENT.Category = "TFA CS:O"
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.AdminOnly = true
ENT.MyModel = "models/tfa_cso/entities/w_backpack.mdl" -- model to use
ENT.MyModelScale = 1 -- model scale. 1 is normal size
ENT.ImpactSound = "Plastic_Box.ImpactSoft" -- physics impact sound
ENT.ShouldDrawShadow = true

ENT.GiveOnTouch = true -- give stuff if touched?
ENT.Backpack = true -- c4 package
ENT.UsedSound = "entities/tfa_cso/item_pickup.wav" -- sound to play when used

if SERVER then
    AddCSLuaFile()
    function ENT:GiveStuff(activator)
        if self.Backpack then
			for k, v in ipairs(ents.FindInSphere(self:GetPos(), 64)) do
				if v:IsPlayer() and v:Alive() and !v:HasWeapon("tfa_cso_c4") then
				v:Give("tfa_cso_c4")
           		self.WasUsed = true -- did something, flag for deletion
        	end
		end
	end
        if self.WasUsed then
            self.Entity:EmitSound(self.UsedSound, 64)
            SafeRemoveEntity(self)
        end
    end
end

hook.Add("PlayerDeath" , "CSO_Drop_C4" , function(ply)
	if ply:HasWeapon( "tfa_cso_c4" ) and GetConVar( "sv_tfa_cso_drop_stuff_on_death" ):GetBool() then	
		local backpack = ents.Create( "cso_backpack" )	
		backpack:SetPos( ply:GetShootPos() )
		backpack:Spawn()
		backpack:PhysWake()
	end
end)