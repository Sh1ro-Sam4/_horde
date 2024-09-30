ENT.Type 			= "anim"
ENT.Base 			= "base_anim"
ENT.PrintName		= "Crimson Hunter Expert Grenade"
ENT.Category		= "None"

ENT.Spawnable		= false
ENT.AdminSpawnable	= false


ENT.MyModel = "models/weapons/tfa_cso/w_crimsonhunter_nade_expert.mdl"
ENT.MyModelScale = 1
ENT.Damage = 700
ENT.Radius = 256
if SERVER then

	AddCSLuaFile()

	function ENT:Initialize()

		local model = self.MyModel and self.MyModel or "models/weapons/tfa_cso/w_crimsonhunter_nade_expert.mdl"
		
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
		util.Effect("exp_bloodhunter",fx)
		self.Entity:EmitSound("weapons/tfa_cso/fragnade/exp1.wav", 100, 100 )
		self:Remove()
	end
end

if CLIENT then
	
	function ENT:Draw()
		self:DrawModel()
	end

end