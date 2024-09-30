ENT.Type 			= "anim"
ENT.Base 			= "base_anim"
ENT.PrintName		= "Dragon-Flame"
ENT.Category		= "None"

ENT.Spawnable		= false
ENT.AdminSpawnable	= false

ENT.MyModel = "models/items/ar2_grenade.mdl"
ENT.MyModelScale = 0
ENT.Damage = 300
ENT.Radius = 50
ENT.StartFade = false
ENT.vAlpha = 255
ENT.KillTime = 0
ENT.DamageInterval = 0


if SERVER then

	AddCSLuaFile()

	function ENT:Initialize()
		local model = self.MyModel and self.MyModel or "models/items/ar2_grenade.mdl"
		self.Class = self:GetClass()
		self:SetModel(model)
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetSolid(SOLID_VPHYSICS)
		self:DrawShadow(false)
		self:SetCollisionGroup(COLLISION_GROUP_NONE)
		self:SetModelScale(self.MyModelScale,0)
		self:SetRenderMode(RENDERMODE_TRANSALPHA)
		self.KillTime = CurTime() + 0.7
        local phys = self:GetPhysicsObject()
		if IsValid(phys) then
			phys:Wake()
			phys:SetMass(1)
			phys:EnableDrag(false)
			phys:EnableGravity(false)
			phys:SetBuoyancyRatio(0)
		end
		local phys = self:GetPhysicsObject()
		if (phys:IsValid()) then
			phys:Wake()
		end
		self:SetMoveType(MOVETYPE_NOCLIP)
		self:SetCollisionGroup(1)
	end
	function ENT:Think()
		if(self.StartFade or self.KillTime < CurTime()) then
			if(self.DamageInterval < CurTime()) then
				for k,v in pairs(ents.FindInSphere(self:GetPos() + self:GetAngles():Forward(), 256)) do
					if(!IsValid(v)) then continue end
					if(v:Health() <= 0) then continue end
					if(v == self:GetOwner()) then continue end
					local d = DamageInfo()
						d:SetDamage((engine.ActiveGamemode() == "sandbox" and 30) or 480)
						d:SetDamageType(DMG_BLAST)
						d:SetDamagePosition(v:GetPos())
						d:SetAttacker(self:GetOwner())
						d:SetInflictor(self:GetOwner():GetActiveWeapon())
					v:TakeDamageInfo(d)
				end
				self.DamageInterval = CurTime() + 0.05
			end
			if(self.vAlpha <= 0) then
				self:Remove()
			end
			self.vAlpha = self.vAlpha - 15
		end
		self:NextThink(CurTime())
		return true
	end
end

if CLIENT then
	function ENT:Draw()
		self:DrawModel()
	end
end

function ENT:Draw()
	render.SetMaterial(Material("sprites/flame_puff01"))
	render.DrawSprite(self.Entity:GetPos() + ((Vector(0,0,0))), 86, 86,Color(255, 255, 255, vAlpha))
end
