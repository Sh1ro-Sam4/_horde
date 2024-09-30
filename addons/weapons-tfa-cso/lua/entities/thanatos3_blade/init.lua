AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include('shared.lua')

ENT.Damage = 800 -- overridden by weapon damage later

function ENT:Initialize()
	self.Entity:SetModel("models/weapons/tfa_cso/thanatos3_knife.mdl")
	//self.Entity:PhysicsInit(SOLID_VPHYSICS)
	self.Entity:SetMoveType(MOVETYPE_VPHYSICS)
	self.Entity:SetSolid(SOLID_VPHYSICS)
	self.Entity:SetCollisionGroup( COLLISION_GROUP_PROJECTILE )
	self:PhysicsInitSphere( 8, "solidmetal" )
	local phys = self:GetPhysicsObject()
	if IsValid(phys) then
		phys:Wake()
		phys:SetMass(1)
		phys:EnableDrag(false)
		phys:EnableGravity(false)
		phys:SetBuoyancyRatio(0)
	end
end

function ENT:Think()
end

function ENT:SpawnFunction(ply, tr)
	if (!tr.Hit) then return end
	local SpawnPos = tr.HitPos + tr.HitNormal * 16
	local ent = ents.Create("thanatos3_blade")
	ent:SetPos(SpawnPos)
	ent:Spawn()
	ent:Activate()
	ent:SetOwner(ply)
	return ent
end

function ENT:PhysicsCollide(data)
	local pos = self.Entity:GetPos()
	local damagetodo = self.mydamage or self.Damage

	local dmg = DamageInfo()
	dmg:SetDamagePosition(self:GetPos())
	dmg:SetDamage(damagetodo)
	dmg:SetDamageType(DMG_SLASH)
	dmg:SetAttacker(self:GetOwner())
	dmg:SetInflictor(self)

	data.HitObject:ApplyForceCenter(self:GetPhysicsObject():GetVelocity() * 10)

	data.HitObject:GetEntity():TakeDamageInfo(dmg)

	local effectdata = EffectData()
	effectdata:SetOrigin(self.Entity:GetPos())

	self:EmitSound(Sound("weapons/tfa_cso/thanatos3/swish.wav", 256))
	self.Entity:Remove()
end 