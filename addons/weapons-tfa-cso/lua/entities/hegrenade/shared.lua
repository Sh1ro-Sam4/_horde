ENT.Type = "anim"
ENT.PrintName			= "explosive Grenade"
ENT.Author			= ""
ENT.Contact			= ""
ENT.Purpose			= ""
ENT.Instructions			= ""
ENT.DoNotDuplicate = true 
ENT.DisableDuplicator = true

/*---------------------------------------------------------
OnRemove
---------------------------------------------------------*/
function ENT:OnRemove()
end

/*---------------------------------------------------------
PhysicsUpdate
---------------------------------------------------------*/
function ENT:PhysicsUpdate()
end

/*---------------------------------------------------------
PhysicsCollide
---------------------------------------------------------*/

function ENT:PhysicsCollide(data,phys)
	if data.Speed > 60 then
		self.Entity:EmitSound(Sound("HEGrenade.Bounce"))
	
		local impulse = (data.OurOldVelocity - 2 * data.OurOldVelocity:Dot(data.HitNormal) * data.HitNormal)*0.25
		phys:ApplyForceCenter(impulse)
	end
	
end

function ENT:PhysicsCollide(data, phys)
    if data.Speed > 60 then
        self:EmitSound(Sound("HEGrenade.Bounce"))
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