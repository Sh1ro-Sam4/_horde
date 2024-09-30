AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include('shared.lua')

ENT.Damage = 300 -- overridden by weapon damage later

local color_trail = Color(255, 56, 38) -- referencing a color variable is much faster then just using it directly

function ENT:Initialize()
	self.Entity:SetModel("models/weapons/tfa_cso/w_catapult_ball.mdl")
	//self.Entity:PhysicsInit(SOLID_VPHYSICS)
	self.Entity:SetMoveType(MOVETYPE_VPHYSICS)
	self.Entity:SetSolid(SOLID_VPHYSICS)
	self.Entity:SetCollisionGroup( COLLISION_GROUP_PROJECTILE )
	self:PhysicsInitSphere( 8, "solidmetal" )
	local phys = self:GetPhysicsObject()
	if phys:IsValid() then
		phys:Wake()
		phys:EnableGravity(true)
		phys:SetBuoyancyRatio(0)
	end
	self.Trail = util.SpriteTrail(self, 0, color_trail, false, 4, 0.5, 0.135, 0.125, "trails/smoke.vmt")
end

function ENT:Think()
end

function ENT:SpawnFunction(ply, tr)
	if (!tr.Hit) then return end
	local SpawnPos = tr.HitPos + tr.HitNormal * 16
	local ent = ents.Create("cso_wildwing_ball")
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
	dmg:SetDamageType(DMG_CLUB)
	dmg:SetAttacker(self:GetOwner())
	dmg:SetInflictor(self)

	data.HitObject:ApplyForceCenter(self:GetPhysicsObject():GetVelocity() * 10)

	data.HitObject:GetEntity():TakeDamageInfo(dmg)

	self:EmitSound(Sound("CSO.HitSound.Blabhlahblabhlabh"))
	self.Entity:Remove()
end 