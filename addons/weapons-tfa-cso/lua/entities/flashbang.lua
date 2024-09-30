ENT.PrintName = "Flashbang"
ENT.Spawnable = false
ENT.Type = "anim"
ENT.AdminOnly = true
ENT.Category = "TFA CS:O"
ENT.RenderGroup = RENDERGROUP_BOTH
ENT.DisableDuplicator = true

if SERVER then
	AddCSLuaFile()
end

ENT.Delay = 1.2

function ENT:Initialize()
	if CLIENT then return end
	self:SetModel("models/weapons/tfa_cso/w_flashbang.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetCollisionGroup(COLLISION_GROUP_PROJECTILE)
	local phys = self:GetPhysicsObject()

	if (phys:IsValid()) then
		phys:Wake()
	end

	self:SetFriction(3)
	self.timeleft = CurTime() + self.Delay

end

function ENT:Think()
	if CLIENT then return end

	if self.timeleft < CurTime() and not self.deactivated then
		self:Explosion()
	end

	self:NextThink(CurTime())

	return true
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
	self:EmitSound( "weapons/tfa_cso/flashbang/exp.wav", 360 )
	local tr = {}
	tr.start = self:GetPos()
	tr.mask = MASK_SOLID

	for k, v in pairs(player.GetAll()) do
		tr.endpos = v:GetShootPos()
		tr.filter = {self, v, v:GetActiveWeapon()}
		local traceres = util.TraceLine(tr)

		if not traceres.Hit or traceres.Fraction >= 1 or traceres.Fraction <= 0 then
			local dist = v:GetShootPos():Distance(self:GetPos())
			v.SetNW2Float = v.SetNW2Float or v.SetNWFloat --Incase Rubat deprecates and I'm gone
			v:SetNW2Float("LastFlashCSO", CurTime())
			v:SetNW2Float("FlashDistanceCSO", dist )
			v:SetNW2Float("FlashFactorCSO", self:EntityFacingFactor(v))
		end
	end

	for k, v in pairs(ents.FindByClass("npc_*")) do
		if self:EntityFacingUs(v) then
			tr.endpos = v.GetShootPos and v:GetShootPos() or v:GetPos()
			tr.filter = {self, v, v.GetActiveWeapon and v:GetActiveWeapon() or v}
			local traceres = util.TraceLine(tr)

			if not traceres.Hit or traceres.Fraction >= 1 or traceres.Fraction <= 0 then
				local flashdistance = tr.endpos:Distance(self:GetPos())
				local flashtime = CurTime()
				local distancefac = (1 - math.Clamp((flashdistance - cso_flashdistance + cso_flashdistancefade) / cso_flashdistancefade, 0, 1))
				local intensity = (1 - math.Clamp(((CurTime() - flashtime) / distancefac - cso_flashtime + cso_flashfade) / cso_flashfade, 0, 1))

				if intensity > 0.8 then
					if v.ClearSchedule then
						v:ClearSchedule()
					end

					if v.SetEnemy then
						v:SetEnemy(nil)
					end

					if v.AddEntityRelationship and IsValid(self.Owner) then
						local oldrel = v.GetRelationship and v:GetRelationship(self.Owner) or ((IsFriendEntityName(v:GetClass()) and not game.GetMap() == "gm_raid") and D_LI or D_HT)
						v:AddEntityRelationship(self.Owner, D_NU, 99)

						timer.Simple(cso_flashtime / 2, function()
							if IsValid(v) and v:IsNPC() and IsValid(self) and IsValid(self.Owner) then
								v:AddEntityRelationship(self.Owner, oldrel, 99)
							end
						end)
					end

					if v.ClearEnemyMemory then
						v:ClearEnemyMemory()
					end
				end
			end
		end
	end
	self.Entity:Remove()
	self.deactivated = true
end

function ENT:PhysicsCollide(data, phys)
    if data.Speed > 60 then
        self:EmitSound(Sound("weapons/tfa_cso/flashbang/hit" ..math.random(1, 3) ..".wav", 76))
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

function ENT:OnRemove()
if CLIENT then
local light = DynamicLight( self:EntIndex() )
light.Pos = self:GetPos()
light.r = 255
light.g = 255
light.b = 255
light.Brightness = 5
light.Size = 512
light.Decay = 1000
light.DieTime = CurTime() + 0.1
end
end

cso_flashtime = 5
cso_flashfade = 2
cso_flashdistance = 1500
cso_flashdistancefade = 500

local tab = {
	["$pp_colour_addr"] = 0,
	["$pp_colour_addg"] = 0,
	["$pp_colour_addb"] = 0,
	["$pp_colour_brightness"] = 0.0,
	["$pp_colour_contrast"] = 1.0,
	["$pp_colour_colour"] = 1.0,
	["$pp_colour_mulr"] = 0,
	["$pp_colour_mulg"] = 0,
	["$pp_colour_mulb"] = 0
}

hook.Add("RenderScreenspaceEffects", "TFA_CSO_FLASHBANG", function()
	local ply = LocalPlayer()
	if not IsValid(ply) then return end
	if not ply.HasCheckedNW2 then
		ply.GetNW2Float = ply.GetNW2Float or ply.GetNWFloat
		ply.HasCheckedNW2 = true
	end
	local flashtime = ply:GetNW2Float("LastFlashCSO", -999)
	local flashdistance = ply:GetNW2Float("FlashDistanceCSO", 0)
	local flashfac = ply:GetNW2Float("FlashFactorCSO", 1)
	local distancefac = 1 - math.Clamp((flashdistance - cso_flashdistance + cso_flashdistancefade) / cso_flashdistancefade, 0, 1)
	local intensity = 1 - math.Clamp(((CurTime() - flashtime) / distancefac - cso_flashtime + cso_flashfade) / cso_flashfade, 0, 1)
	intensity = intensity * distancefac
	intensity = intensity * math.Clamp(flashfac + 0.1, 0.35, 1)

	if intensity > 0.01 then
		tab["$pp_colour_brightness"] = math.pow(intensity, 3)
		tab["$pp_colour_colour"] = 1 - intensity * 0.33
		DrawColorModify(tab) --Draws Color Modify effect
		DrawMotionBlur(0.2, intensity, 0.03)
	end
end)