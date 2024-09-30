ENT.Type 			= "anim"
ENT.Base 			= "base_anim"
ENT.PrintName		= "Trinity - Flame"
ENT.Category		= "None"

ENT.Spawnable		= false
ENT.AdminSpawnable	= false


ENT.MyModel = "models/weapons/tfa_cso/w_trinity_flame.mdl"
ENT.MyModelScale = 1
ENT.Damage = 400
ENT.Radius = 325

ENT.IsArmed = false

if SERVER then

	AddCSLuaFile()

	function ENT:Initialize()

		local model = self.MyModel and self.MyModel or "models/weapons/tfa_cso/w_trinity_flame.mdl"
		
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
	
	function ENT:Think()
		--print("Inital Think")
		if !self.IsArmed then return end
		--print("Armed Think")
		for k,v in pairs(ents.FindInSphere(self.Entity:GetPos(),275)) do
			if GetConVar( "sv_tfa_cso_dmg_trinity_detect_player" ):GetInt() == 0 then
				if v:IsNPC() or v:IsNextBot() then
					if v:Health() > 0 then
						self:Explode()
					end
				end
			else
				if v != self.Owner and (v:IsNPC() or v:IsPlayer() or v:IsNextBot()) then
					if v:Health() > 0 then
						self:Explode()
					end
				end	
			end
		end
	end


	function ENT:PhysicsCollide(data, physobj)
		physobj:EnableMotion(false)
		--print("Motion disabled!")
		if self.IsArmed then return end
		--print("Playing impact sound.")
		self:EmitSound(Sound("Trinity.TransformRed"))
		--print("Arming!")
		self.IsArmed = true
	end
	
	function ENT:Explode()
		local owent = self.Owner and self.Owner or self
		util.BlastDamage(self,owent,self:GetPos(),self.Radius,self.Damage)
		local fx = EffectData()
		fx:SetOrigin(self:GetPos())
		--fx:SetNormal(data.HitNormal)
		util.Effect("exp_trinity_flame",fx)
		for k,v in pairs(ents.FindInSphere(self.Entity:GetPos(),350)) do
			if GetConVar( "sv_tfa_cso_dmg_trinity_detect_player" ):GetInt() == 0 then
				if v:IsNPC() or v:IsNextBot() or v:GetClass() == "prop_physics" then
					v:Ignite(60)
					--print(v)
				end
			else
				if v:IsNPC() or v:IsNextBot() or v:IsPlayer() or v:GetClass() == "prop_physics" then
					v:Ignite(60)
					--print("ply")
				end
			end
		end
		self:EmitSound(Sound("Trinity.ExplodeRed"))
		self:Remove()
	end
end

if CLIENT then
	function ENT:Draw()
		self:DrawModel()
	end
end