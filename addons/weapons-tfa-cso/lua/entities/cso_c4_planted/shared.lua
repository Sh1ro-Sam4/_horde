AddCSLuaFile()
ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.Spawnable = false

function ENT:Draw()
	self:DrawModel()
end

function ENT:Initialize()
	if SERVER then
		self:SetModel( "models/weapons/tfa_cso/w_c4_planted.mdl" )
		self:SetMoveType( MOVETYPE_VPHYSICS )
		self:SetSolid( SOLID_VPHYSICS )
		self:PhysicsInit( SOLID_VPHYSICS )
		self:SetCollisionGroup( COLLISION_GROUP_DEBRIS )
		self:DrawShadow( true )
		self:EmitSound( "C4.Plant" )
		self:SetUseType(SIMPLE_USE)
		self:SetModelScale(1)

		local phys = self:GetPhysicsObject()
		if phys:IsValid() then
			phys:Wake()
			phys:SetBuoyancyRatio(0)
		end
	end

	if SERVER then
		if GetConVar( "sv_tfa_cso_c4_radio_snd" ):GetBool() then
			self:EmitSound( "radio/bombpl.wav", -1 )
		end

		self.BeepTimer = CurTime() + 1
		self.FinalBeep = 0
		self.FinalBeepTimer = CurTime()
		self.ExplodeTimer = CurTime() + GetConVar( "sv_tfa_cso_c4_timer" ):GetInt()
	end
end

function ENT:PhysicsCollide(data, physobj)
	if SERVER then
		self:SetMoveType(MOVETYPE_NONE)
	end
end

function ENT:Think()

	if SERVER then
		if CurTime() > self.ExplodeTimer then
			self:Explode()
			self:Remove()

			return
		end

		if self.BeepTimer <= CurTime() and self.ExplodeTimer > CurTime() + 0 then

			local fx = EffectData()
			fx:SetOrigin(self:GetPos())
			util.Effect("cso_c4_beep",fx)

			local efdata = EffectData()
			efdata:SetEntity(self)
			efdata:SetFlags(1) -- regular beep

			self:EmitSound( "weapons/c4/c4_beep1.wav", 360 )
			self.BeepTimer = CurTime() + ( self.ExplodeTimer - CurTime() ) / 35
			
		end

		if self.FinalBeep == 0 then
			self.FinalBeep = 1
			self.FinalBeepTimer = CurTime()
		end

		if self.FinalBeep == 1 and self.FinalBeepTimer <= CurTime() then
			local efdata = EffectData()
			efdata:SetEntity(self)
			efdata:SetFlags(2) -- trigger

			self.FinalBeep = 2
			self.FinalBeepTimer = CurTime() + 1
		end

		if self.FinalBeep == 2 and self.FinalBeepTimer <= CurTime() then
			local efdata = EffectData()
			efdata:SetEntity(self)
			efdata:SetFlags(3) -- last beep right before explosion

			self.FinalBeep = 3
		end
	end
end

function ENT:Use(activator,caller,useType,value)
	if CLIENT then return end

	if IsValid(activator) and activator:IsPlayer() then
		self:EmitSound("C4.DisarmStart")

		activator:SetNW2Entity("CSO_DefuseTarget", self)
		activator:SetNW2Float("CSO_DefuseProgress", 0)
	end
end

function ENT:OnRemove()
end

function ENT:Explode()
	local ply = IsValid(self:GetOwner()) and self:GetOwner() or self
	if SERVER then
	local explode = ents.Create( "info_particle_system" )
		explode:SetKeyValue( "effect_name", "explosion_silo" )
		explode:SetOwner( self.Owner )
		explode:SetPos( self:GetPos() )
		explode:Spawn()
		explode:Activate()
		explode:Fire( "start", "", 0 )
		explode:Fire( "kill", "", 30 )
		self:EmitSound( "C4.Explode" )
	end

	if GetConVar( "sv_tfa_cso_c4_radio_snd" ):GetBool() then
		self:EmitSound( "radio/terwin.wav", -1 )
	end
	
	util.BlastDamage( self, ply, self:GetPos(), 2048, 80000 )
	local spos = self:GetPos()
	local trs = util.TraceLine({start=spos + Vector(0,0,64), endpos=spos + Vector(0,0,-32), filter=self})
	util.Decal("Scorch", trs.HitPos + trs.HitNormal, trs.HitPos - trs.HitNormal)
end