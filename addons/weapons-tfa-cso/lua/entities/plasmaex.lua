ENT.Type 			= "anim"
ENT.Base 			= "base_anim"
ENT.PrintName		= "PlasmaEX"
ENT.Category		= "None"

ENT.Spawnable		= false
ENT.AdminSpawnable	= false


ENT.MyModel = "models/items/ar2_grenade.mdl"
ENT.MyModelScale = 0
ENT.Damage = 1500
ENT.Radius = 200
if SERVER then

	AddCSLuaFile()

	function ENT:Initialize()

		local model = self.MyModel and self.MyModel or "models/items/ar2_grenade.mdl"
		
		self.Class = self:GetClass()
		
		self:SetModel(model)
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetMoveType(MOVETYPE_VPHYSICS)
		self:SetSolid(SOLID_VPHYSICS)
		self:DrawShadow(false)
		self:SetHealth(1)
		self:SetCollisionGroup(COLLISION_GROUP_NONE)
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
		--fx:SetNormal(data.HitNormal)
		util.Effect("exp_plasmaex",fx)
		self:Remove()
	end

	function ENT:Think()
		for key,thing in pairs(ents.FindInSphere(self:GetPos(),250))do
            if((thing:IsNPC())and(self:Visible(thing)))then
                if(table.HasValue({"npc_combinegunship","npc_helicopter","npc_turret_floor","npc_turret_ground","npc_turret_ceiling"},thing:GetClass())) then
                    thing:SetHealth(1)
                    thing:Fire("selfdestruct","",.1)
					self:PhysicsCollide()
                end
            end
        end
	end
end

if CLIENT then
	
	function ENT:Draw()
		self:DrawModel()
	end

end

function ENT:Draw()
render.SetMaterial(Material("sprites/ef_y20s3plasmaex"))
render.DrawSprite(self.Entity:GetPos() + ((Vector(0,0,0))),64,64,Color(255, 255, 255))
end