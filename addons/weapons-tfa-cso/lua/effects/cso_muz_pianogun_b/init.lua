local AddVel = Vector()
local ang

function EFFECT:Init(data)
	self.WeaponEnt = data:GetEntity()
	if not IsValid(self.WeaponEnt) then return end
	self.Attachment = data:GetAttachment()
	self.Position = self:GetTracerShootPos(data:GetOrigin(), self.WeaponEnt, self.Attachment)

	if IsValid(self.WeaponEnt.Owner) then
		if self.WeaponEnt.Owner == LocalPlayer() then
			if self.WeaponEnt.Owner:ShouldDrawLocalPlayer() then
				ang = self.WeaponEnt.Owner:EyeAngles()
				ang:Normalize()
				--ang.p = math.max(math.min(ang.p,55),-55)
				self.Forward = ang:Forward()
			else
				self.WeaponEnt = self.WeaponEnt.Owner:GetViewModel()
			end
			--ang.p = math.max(math.min(ang.p,55),-55)
		else
			ang = self.WeaponEnt.Owner:EyeAngles()
			ang:Normalize()
			self.Forward = ang:Forward()
		end
	end

	self.Forward = self.Forward or data:GetNormal()
	self.Angle = self.Forward:Angle()
	self.Right = self.Angle:Right()
	self.vOffset = self.Position
	dir = self.Forward

	if IsValid(LocalPlayer()) then
		AddVel = LocalPlayer():GetVelocity()
	end

	AddVel = AddVel * 0.05
	self.vOffset = self.Position
	dir = self.Forward
	AddVel = AddVel * 0.05
	local dot = dir:GetNormalized():Dot(EyeAngles():Forward())
	local dotang = math.deg(math.acos(math.abs(dot)))
	local halofac = math.Clamp(1 - (dotang / 90), 0, 1)

	if CLIENT and not IsValid(ownerent) then
		ownerent = LocalPlayer()
	end

	local emitter = ParticleEmitter(self.vOffset)
	
	for i = 1, 1 do
		local particle = emitter:Add("sprites/ef_pianogun_muzzle02", self.vOffset + dir * 0.4 * i + FrameTime() * AddVel)

		if (particle) then
			particle:SetVelocity(dir * 4 + 1.05 * AddVel)
			particle:SetLifeTime(0)
			particle:SetDieTime(0.29)
			particle:SetStartAlpha(math.Rand(255, 255))
			particle:SetEndAlpha(0)
			--particle:SetStartSize( 7.5 * (halofac*0.8+0.2), 0, 1)
			--particle:SetEndSize( 0 )
			particle:SetStartSize(5)
			particle:SetEndSize(5)
			particle:SetRoll(math.rad(math.Rand(90, 0)))
			particle:SetRollDelta(math.rad(math.Rand(0, 0)))
			particle:SetColor(255, 255, 255)
			particle:SetLighting(false)
			particle.FollowEnt = self.WeaponEnt
			particle.Att = self.Attachment
			TFA.Particles.RegisterParticleThink(particle, TFA.Particles.FollowMuzzle)
		end
	end

	emitter:Finish()
end

function EFFECT:Think()
	return false
end

function EFFECT:Render()
end
