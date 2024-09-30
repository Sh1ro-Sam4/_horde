ENT.PrintName = "Smoke Grenade"
ENT.Spawnable = false
ENT.Type = "anim"
ENT.AdminOnly = true
ENT.Category = "TFA CS:O"
ENT.RenderGroup = RENDERGROUP_BOTH
ENT.DisableDuplicator = true

if SERVER then
	AddCSLuaFile()
end

ENT.Delay = 1

function ENT:Initialize()
	if CLIENT then return end
	self:SetModel("models/weapons/tfa_cso/w_smokegrenade.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetCollisionGroup(COLLISION_GROUP_PROJECTILE)
	local phys = self:GetPhysicsObject()

	if (phys:IsValid()) then
		phys:Wake()
	end

	self:SetFriction(1)
	self.timeleft = CurTime() + self.Delay
	self.Smoke = 0
	self.SmokeTimer = CurTime()
	self.Explode = 0
	self.ExplodeTimer = CurTime() + 2
	
	if SERVER then
		timer.Simple(30, function()
			if IsValid(self) then
				self:Remove()
			end
		end)
	end
end

function ENT:Think()
if self.Explode == 0 and self.ExplodeTimer <= CurTime() and self.Entity:GetVelocity():Length() < 50 then
if SERVER then
self.Entity:EmitSound( "weapons/tfa_cso/smokegrenade/exp.wav", 360 )
end
self.Smoke = 1
self.SmokeTimer = CurTime() + 1
self.Explode = 1
end
if self.Smoke == 1 and self.SmokeTimer > CurTime() then
EffectData():SetOrigin( self:GetPos() )
util.Effect( "exp_smokegrenade", EffectData() )
end
end

function ENT:EntityFacingFactor(ent)
	local dir = ent:EyeAngles():Forward()
	local facingdir = (self:GetPos() - (ent.GetShootPos and ent:GetShootPos() or ent:GetPos())):GetNormalized()

	return (facingdir:Dot(dir) + 1) / 2
end

function ENT:EntityFacingUs(ent)
	local dir = ent:EyeAngles():Forward()
	local facingdir = (self:GetPos() - (ent.GetShootPos and ent:GetShootPos() or ent:GetPos())):GetNormalized()
	if facingdir:Dot(dir) > -0.25 then return true end
end

function ENT:Explosion()
	if CLIENT then return end
	self:EmitSound( "weapons/tfa_cso/smokegrenade/exp.wav", 360 )
	local fx = EffectData()
	fx:SetAngles( self:GetAngles() )
	fx:SetOrigin( self:GetPos() )
	util.Effect( "exp_smokegrenade", fx )
	self.deactivated = true
end

function ENT:PhysicsCollide(data, phys)
    if data.Speed > 60 then
        self:EmitSound(Sound("weapons/tfa_cso/smokegrenade/hit" ..math.random(1, 3) ..".wav", 76))
        local impulse = (data.OurOldVelocity - 2 * data.OurOldVelocity:Dot(data.HitNormal) * data.HitNormal) * 0.25
        phys:ApplyForceCenter(impulse)
    end

    local pos = self.Entity:GetPos()
    local damagetodo = self.mydamage or self.Damage

    local dmg = DamageInfo()
    dmg:SetDamagePosition(self:GetPos())
    dmg:SetDamage(1)
    dmg:SetDamageType(DMG_CLUB)
    dmg:SetAttacker(self:GetOwner())
    dmg:SetInflictor(self)

    data.HitObject:ApplyForceCenter(self:GetPhysicsObject():GetVelocity() * 10)

    data.HitObject:GetEntity():TakeDamageInfo(dmg)
end