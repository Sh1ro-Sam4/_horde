AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )
include('shared.lua')

function ENT:Initialize()
	
	local model = self.MyModel and self.MyModel or "models/weapons/tfa_cso/thanatos5_nade.mdl"
	
	self:SetModel(model)
	
	self:PhysicsInit(SOLID_VPHYSICS)
	--self.Entity:PhysicsInitSphere( ( self:OBBMaxs() - self:OBBMins() ):Length()/4, "metal" )
	self.Entity:SetMoveType( MOVETYPE_VPHYSICS )
	self.Entity:SetSolid( SOLID_VPHYSICS )
	self.Entity:DrawShadow( false )
	self.Entity:SetCollisionGroup( COLLISION_GROUP_WEAPON )
	self:SetModelScale(self.MyModelScale,0)
	
	local phys = self.Entity:GetPhysicsObject()
	if (phys:IsValid()) then
		phys:Wake()
		phys:SetMass(6)
		phys:SetDamping(0.1,5)
	end
	
	self:SetFriction(3)
	
	self.timeleft = CurTime() + 2 -- HOW LONG BEFORE EXPLOSION
	self:Think()
	self.NextExplode = CurTime() + self.MidDelay
end

ENT.MyModel = "models/weapons/tfa_cso/thanatos5_nade.mdl"
ENT.MyModelScale = 1.25
ENT.Delay = 2
ENT.MidDelay = 0.35
ENT.MaxExplodes = 0

ENT.IsArmed = true

function ENT:Think()
if self.timeleft < CurTime() then
  if CurTime()>self.NextExplode then
	self:Explosion()
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
						self:Explosion()
					end
				end

			end
end

	function ENT:PhysicsCollide(data, physobj)
		physobj:EnableMotion(true)
		if self.IsArmed then return end
		self.IsArmed = true
	end

function ENT:Explosion()

	if not IsValid(self.Owner) then
		self.Entity:Remove()
		return
	end

	local effectdata = EffectData()
		effectdata:SetOrigin(self.Entity:GetPos())
	util.Effect("exp_thanatos5_2", effectdata)

	util.BlastDamage(self.Entity, self.Owner, self.Entity:GetPos(), 128, 150)

		local owent = self.Owner and self.Owner or self
		util.BlastDamage(self,owent,self:GetPos(), 128, 150)
		local fx = EffectData()
		fx:SetOrigin(self:GetPos())
		--fx:SetNormal(data.HitNormal)
		for k,v in pairs(ents.FindInSphere(self.Entity:GetPos(),64)) do
				if v:IsNPC() or v:IsPlayer() or v:GetClass() == "prop_physics" then
					--print(v)
				end
		end
		self:Remove()
	end


function ENT:OnRemove ( entity )
    for i=1,4 do
          local ent = ents.Create( "thanatos5_nade_end" )
        if ( !IsValid( ent ) ) then return end

        ent:SetOwner(self:GetOwner())
        ent:SetPos( self.Entity:GetPos() + Vector(math.random(-60, 60), math.random(-60, 60), 8))
        ent:Spawn()
        ent:Activate()

        local directionVec = Vector(math.Rand(-1.0, 1.0), math.Rand(-1.0, 1.0), math.Rand(0.0, 0.05)) * 2500
        ent:SetAngles(directionVec:Angle())
        ent:SetVelocity( directionVec )
    end
end

/*---------------------------------------------------------
OnTakeDamage
---------------------------------------------------------*/
function ENT:OnTakeDamage( dmginfo )
end


/*---------------------------------------------------------
Use
---------------------------------------------------------*/
function ENT:Use( activator, caller, type, value )
end


/*---------------------------------------------------------
StartTouch
---------------------------------------------------------*/
function ENT:StartTouch( entity )
end


/*---------------------------------------------------------
EndTouch
---------------------------------------------------------*/
function ENT:EndTouch( entity )
end


/*---------------------------------------------------------
Touch
---------------------------------------------------------*/
function ENT:Touch( entity )
end