ENT.Type 			= "anim"
ENT.Base 			= "base_anim"
ENT.PrintName		= "Heart"
ENT.Category		= "None"

ENT.Spawnable		= false
ENT.AdminSpawnable	= false


ENT.MyModel = "models/hunter/misc/sphere1x1.mdl"
ENT.MyModelScale = 0
ENT.Damage = 2500
ENT.Radius = 312
if SERVER then

	AddCSLuaFile()

	function ENT:Initialize()

		local model = self.MyModel and self.MyModel or "models/hunter/misc/sphere1x1.mdl"
		
		self.Class = self:GetClass()
		
		self:SetModel(model)
		
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetMoveType(MOVETYPE_VPHYSICS)
		self:SetSolid(SOLID_VPHYSICS)
		self:DrawShadow(true)
		self:SetCollisionGroup(COLLISION_GROUP_NONE)		
		self:SetHealth(1)
		self:SetModelScale(self.MyModelScale,0)	
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
	end
	
	function ENT:PhysicsCollide(data, physobj)
		local owent = self.Owner and self.Owner or self
		util.BlastDamage(self,owent,self:GetPos(),self.Radius,self.Damage)
		local fx = EffectData()
		fx:SetOrigin(self:GetPos())
		fx:SetNormal(data.HitNormal)
		util.Effect("exp_magic_rodb",fx)
		self:Remove()
	    self.Entity:EmitSound("MagicRod.Exp2", self.Pos, 100, 100 )
	end
end

if CLIENT then
	
	function ENT:Draw()
		self:DrawModel()
	end

end

function ENT:Draw()
render.SetMaterial(Material("sprites/magicmg_sprite2"))
render.DrawSprite(self.Entity:GetPos() + ((Vector(0,0,0))),128,128,Color(255, 255, 255))
end