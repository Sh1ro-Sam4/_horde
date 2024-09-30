ENT.Type 			= "anim"
ENT.Base 			= "base_anim"
ENT.PrintName		= "Starlight Sword Skill"
ENT.Category		= "None"

ENT.Spawnable		= false
ENT.AdminSpawnable	= false


ENT.MyModel = "models/hunter/misc/sphere075x075.mdl"
ENT.MyModelScale = 1
ENT.Damage = 25
ENT.Radius = 64

ENT.IsArmed = false

if SERVER then

	AddCSLuaFile()

function ENT:Initialize()
	
	local model = self.MyModel and self.MyModel or "models/hunter/misc/sphere075x075.mdl"
	
	self:SetModel(model)
	
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	self.Entity:DrawShadow( false )
	self.Entity:SetCollisionGroup( COLLISION_GROUP_PROJECTILE )
	self:SetModelScale(self.MyModelScale,0)
	
	local phys = self.Entity:GetPhysicsObject()
	if (phys:IsValid()) then
			phys:Wake()
			phys:SetMass(1)
			phys:EnableDrag(false)
			phys:EnableGravity(false)
			phys:SetBuoyancyRatio(0)
	end
	
	self.timeleft = CurTime() + 0.1 -- HOW LONG BEFORE EXPLOSION
	self:Think()
	self.NextExplode = CurTime() + self.MidDelay
end

ENT.MyModel = "models/hunter/misc/sphere075x075.mdl"
ENT.MyModelScale = 0.5
ENT.Delay = 0.1
ENT.MidDelay = 0.35
ENT.MaxExplodes = 0

ENT.IsArmed = true

function ENT:Think()
if self.timeleft < CurTime() then
  if CurTime()>self.NextExplode then
	self:Explode()
	self.NextExplode = CurTime() + self.MidDelay
	self.exp = ( self.exp or 0 ) + 1
	if self.exp > self.MaxExplodes then
	  self:Remove()
	end
  end
end
		--print("Inital Think")
		if !self.IsArmed then return end
		--print("Armed Think")
		for k,v in pairs(ents.FindInSphere(self.Entity:GetPos(),64)) do
				if v:IsNPC() then
					if v:Health() > 0 then
						self:Explode()
					end
				end

			end
end

	function ENT:PhysicsCollide(data, physobj)
		physobj:EnableMotion(false)
		if self.IsArmed then return end
		self.IsArmed = true
	end

	function ENT:Explode()
		local owent = self.Owner and self.Owner or self
		util.BlastDamage(self,owent,self:GetPos(),64,25)
		
		local phys_force = 2048
		local push_force = 1250
		for k, target in pairs( ents.FindInSphere( self.Entity:GetPos(), 64 ) ) do
			if GetConVar( "sv_tfa_cso_dmg_trinity_detect_player" ):GetInt() == 0 then
				if IsValid( target ) then
					local tpos = target:LocalToWorld( target:OBBCenter() )
					local dir = ( tpos - self.Entity:GetPos() ):GetNormal()
					local phys = target:GetPhysicsObject()

					if target:IsNPC() then

						dir.z = math.abs( dir.z ) + 1

						local push = dir * push_force

						local vel = target:GetVelocity() + push
						vel.z = math.min( vel.z, push_force / 3 )

						target:SetVelocity( vel )

						target.was_pushed = { att=self.Entity, t=CurTime(), wep="weapon_fraggrenade" }

					elseif IsValid( phys ) then
						phys:ApplyForceCenter( dir * -1 * phys_force )
					end
				end
			else
				if IsValid( target ) then
					local tpos = target:LocalToWorld( target:OBBCenter() )
					local dir = ( tpos - self.Entity:GetPos() ):GetNormal()
					local phys = target:GetPhysicsObject()

					if target != self.Owner and ( target:IsPlayer() && !target:IsFrozen() && ( !target.was_pushed || target.was_pushed.t != CurTime() ) or target:IsNPC() ) then

						dir.z = math.abs( dir.z ) + 1

						local push = dir * push_force

						local vel = target:GetVelocity() + push
						vel.z = math.min( vel.z, push_force / 3 )

						target:SetVelocity( vel )

						target.was_pushed = { att=self.Entity, t=CurTime(), wep="weapon_fraggrenade" }

					elseif IsValid( phys ) then
						phys:ApplyForceCenter( dir * -1 * phys_force )
					end
				end
			end
		self:Remove()
	end
end
end

if CLIENT then
	function ENT:Draw()
		self:DrawModel()
	end
end

function ENT:Draw()
render.SetMaterial(Material("sprites/ef_y22s2sfsword_muzzleflash01"))
render.DrawSprite(self.Entity:GetPos() + ((Vector(0,0,0))),64,64,Color(math.random(0,255), math.random(0,255), math.random(0,255)))
end