AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )
include('shared.lua')

function ENT:Initialize()
	
	self.Entity:SetModel("models/weapons/tfa_cso/w_basketball.mdl")
	
	self:PhysicsInit(SOLID_VPHYSICS)
	--self.Entity:PhysicsInitSphere( ( self:OBBMaxs() - self:OBBMins() ):Length()/4, "metal" )
	self.Entity:SetMoveType( MOVETYPE_VPHYSICS )
	self.Entity:SetSolid( SOLID_VPHYSICS )
	self:SetModelScale(1)
	self.Entity:DrawShadow( false )
	self.Entity:SetCollisionGroup( COLLISION_GROUP_PROJECTILE )
	
	local phys = self.Entity:GetPhysicsObject()
	if (phys:IsValid()) then
		phys:Wake()
		phys:SetMass(1)
		phys:SetDamping(0.1,1)
	end
	
	self:SetFriction(1)
	
	self.timeleft = CurTime() + 1 -- HOW LONG BEFORE EXPLOSION
	self:Think()
	self.NextExplode = CurTime() + self.MidDelay
end

ENT.Delay = 3
ENT.MidDelay = 0.35
ENT.MaxExplodes = 0

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
end

function ENT:Explosion()

	if not IsValid(self.Owner) then
		self.Entity:Remove()
		return
	end

	local effectdata = EffectData()
		effectdata:SetOrigin(self.Entity:GetPos())
	util.Effect("exp_grenade", effectdata)

	util.BlastDamage(self.Entity, self.Owner, self.Entity:GetPos(), 150, 450) // Radius followed by Damage
	
	local shake = ents.Create("env_shake")
		shake:SetOwner(self.Owner)
		shake:SetPos(self.Entity:GetPos())
		shake:SetKeyValue("amplitude", "2200")	// Power of the shake
		shake:SetKeyValue("radius", "1400")		// Radius of the shake
		shake:SetKeyValue("duration", "3")	// Time of shake
		shake:SetKeyValue("frequency", "255")	// How har should the screenshake be
		shake:SetKeyValue("spawnflags", "4")	// Spawnflags(In Air)
		shake:Spawn()
		shake:Activate()

end

function ENT:PhysicsCollide(data, phys)
    if data.Speed > 60 then
        self:EmitSound(Sound("weapons/tfa_cso/basketball/bounce" ..math.random(1, 2) ..".wav", 76))
        local impulse = (data.OurOldVelocity - 2 * data.OurOldVelocity:Dot(data.HitNormal) * data.HitNormal) * 0.25
        phys:ApplyForceCenter(impulse)
    end

    local pos = self.Entity:GetPos()
    local damagetodo = self.mydamage or self.Damage

    local dmg = DamageInfo()
    dmg:SetDamagePosition(self:GetPos())
    dmg:SetDamage(10)
    dmg:SetDamageType(DMG_CLUB)
    dmg:SetAttacker(self:GetOwner())
    dmg:SetInflictor(self)

    data.HitObject:ApplyForceCenter(self:GetPhysicsObject():GetVelocity() * 10)

    data.HitObject:GetEntity():TakeDamageInfo(dmg)
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