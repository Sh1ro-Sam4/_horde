ENT.Type 			= "anim"
ENT.Base 			= "base_anim"
ENT.PrintName		= "Water Balloon Grenade"
ENT.Category		= "None"

ENT.Spawnable		= false
ENT.AdminSpawnable	= false


ENT.MyModel = "models/weapons/tfa_cso/w_waterballoon.mdl"
ENT.MyModelScale = 1.2
ENT.Damage = 100
ENT.Radius = 128
if SERVER then

	AddCSLuaFile()

	function ENT:Initialize()

		local model = self.MyModel and self.MyModel or "models/weapons/tfa_cso/w_waterballoon.mdl"
		
		self.Class = self:GetClass()
		
		self:SetModel(model)
		
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetMoveType(MOVETYPE_VPHYSICS)
		self:SetSolid(SOLID_VPHYSICS)
		self:DrawShadow(true)
		self:SetCollisionGroup(COLLISION_GROUP_PROJECTILE)
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
		self:Remove()
		self:Explosion()
	end
end

function ENT:Explosion()

	pos = self.Entity:GetPos()
	local splash = EffectData()
	splash:SetOrigin(pos)
	splash:SetEntity(self.Owner)
	splash:SetScale(16)
	util.Effect("watersplash", splash)
	for id, prop in pairs( ents.FindInSphere( pos, 64 ) ) do
		if ( prop:GetPos():Distance( self:GetPos() ) < 256 ) then
			if ( prop:IsValid() ) then
				if ( prop:IsOnFire() ) then prop:Extinguish() end

				local class = prop:GetClass()
				if ( string.find( class, "env_fire" ) ) then
					prop:Fire( "Extinguish" )
				elseif ( string.find( class, "npc_manhack") or string.find( class, "npc_combine_camera") or string.find( class, "npc_cscanner") or string.find( class, "npc_rollermine") or string.find( class, "npc_clawscanner") or string.find( class, "npc_turret_floor") or string.find( class, "npc_turret_ceiling")) then
					local sparks = EffectData()
					sparks:SetOrigin(prop:GetPos())
					sparks:SetEntity(prop)
					sparks:SetScale(10)
					util.Effect("ManhackSparks", sparks)
					prop:EmitSound( Sound( "ambient/energy/zap1.wav" ), 50)
					prop:TakeDamage( 12, prop, prop )
					timer.Simple(1.66,function() if not IsValid(prop) then return end sparks:SetOrigin(prop:GetPos()) util.Effect("ManhackSparks", sparks)
					prop:EmitSound( Sound( "ambient/energy/zap1.wav" ), 50) prop:TakeDamage( 12, prop, prop ) end)
					timer.Simple(3.33,function() if not IsValid(prop) then return end sparks:SetOrigin(prop:GetPos()) util.Effect("ManhackSparks", sparks)
					prop:EmitSound( Sound( "ambient/energy/zap1.wav" ), 50) prop:TakeDamage( 12, prop, prop ) end)
					timer.Simple(5,function() if not IsValid(prop) then return end prop:TakeDamage( 99, prop, prop ) end)
					timer.Simple(5.5,function() if not IsValid(prop) then return end sparks:SetOrigin(prop:GetPos()) util.Effect("Explosion", sparks) prop:Remove() end)
				end
			end
		end
	end
	self.Entity:EmitSound("weapons/tfa_cso/waterballoon/exp.wav", 360 )
end

if CLIENT then
	function ENT:Draw()
		self:DrawModel()
	end
end