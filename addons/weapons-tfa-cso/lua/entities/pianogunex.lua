ENT.Type 			= "anim"
ENT.Base 			= "base_anim"
ENT.PrintName		= "Pianogunex"
ENT.Category		= "None"

ENT.Spawnable		= false
ENT.AdminSpawnable	= false


ENT.MyModel = "models/hunter/misc/sphere025x025.mdl"
ENT.MyModelScale = 0
ENT.Damage = 500
ENT.Radius = 128
if SERVER then

	AddCSLuaFile()

	function ENT:Initialize()

		local model = self.MyModel and self.MyModel or "models/hunter/misc/sphere025x025.mdl"
		
		self.Class = self:GetClass()
		
		self:SetModel(model)
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetMoveType(MOVETYPE_VPHYSICS)
		self:SetSolid(SOLID_VPHYSICS)
		self:DrawShadow(false)
		self:SetHealth(1)
		self:SetCollisionGroup(COLLISION_GROUP_PROJECTILE)
		self:SetModelScale(self.MyModelScale,0)
        local phys = self:GetPhysicsObject()
		if IsValid(phys) then
			phys:Wake()
			phys:SetMass(1)
			phys:EnableDrag(false)
			phys:EnableGravity(false)
			phys:SetBuoyancyRatio(0)
		end
				
	end

	function ENT:PhysicsCollide(data, physobj)	
	    local owent = self.Owner and self.Owner or self
		util.BlastDamage(self,owent,self:GetPos(),self.Radius,self.Damage)
		local fx = EffectData()
		fx:SetOrigin(self:GetPos())
		fx:SetNormal(data.HitNormal)
		util.Effect("exp_pianogunex_a",fx)
		self:Remove()
	    self.Entity:EmitSound("weapons/tfa_cso/pianogunex/exp.wav", 100, 100 )
	end
end

if CLIENT then
	
	function ENT:Draw()
		self:DrawModel()
	end

end

function ENT:Draw()
render.SetMaterial(Material("sprites/0b_wave2ex"))
render.DrawSprite(self.Entity:GetPos() + ((Vector(0,0,0))),128,128,Color(255, 255, 255))
end