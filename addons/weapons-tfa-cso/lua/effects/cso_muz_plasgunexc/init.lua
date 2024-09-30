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

	local dlight = DynamicLight(ownerent:EntIndex())

	if (dlight) then
		dlight.pos = self.vOffset - ownerent:EyeAngles():Right() * 5 + 1.05 * ownerent:GetVelocity() * FrameTime()
		dlight.r = 0
		dlight.g = 225
		dlight.b = 225
		dlight.brightness = 5
		dlight.Decay = 1000
		dlight.Size = 96
		dlight.DieTime = CurTime() + 0.5
	end

	local emitter = ParticleEmitter(self.vOffset)
	local sparticle = emitter:Add("sprites/ef_y20s3plasmaexc_ball", self.vOffset)

	if (sparticle) then
		sparticle:SetVelocity(dir * 4 + 1.05 * AddVel)
		sparticle:SetLifeTime(0)
		sparticle:SetDieTime(0.15)
		sparticle:SetStartAlpha(math.Rand(200, 255))
		sparticle:SetEndAlpha(0)
		--particle:SetStartSize( 8 * (halofac*0.8+0.2), 0, 1)
		--particle:SetEndSize( 0 )
		sparticle:SetStartSize(4 * (halofac * 0.8 + 0.2), 0, 1)
		sparticle:SetEndSize(10 * (halofac * 0.8 + 0.2), 0, 1)
		local r = math.Rand(-10, 10) * 3.14 / 180
		sparticle:SetRoll(r)
		sparticle:SetRollDelta(r / 5)
		sparticle:SetColor(255, 255, 255)
		sparticle:SetLighting(false)
		sparticle.FollowEnt = self.WeaponEnt
		sparticle.Att = self.Attachment
		TFA.Particles.RegisterParticleThink(sparticle, TFA.Particles.FollowMuzzle)
		sparticle:SetPos(vector_origin)
	end

	for i = 0, 4 do
		local particle = emitter:Add("particles/smokey", self.vOffset + dir * math.Rand(6, 10))

		if (particle) then
			particle:SetVelocity(VectorRand() * 10 + dir * math.Rand(15, 20) + 1.05 * AddVel)
			particle:SetLifeTime(0)
			particle:SetDieTime(math.Rand(0.6, 0.7))
			particle:SetStartAlpha(math.Rand(7, 11))
			particle:SetEndAlpha(0)
			particle:SetStartSize(math.Rand(5, 7))
			particle:SetEndSize(math.Rand(12, 14))
			particle:SetRoll(math.rad(math.Rand(0, 360)))
			particle:SetRollDelta(math.Rand(-0.8, 0.8))
			particle:SetLighting(true)
			particle:SetAirResistance(10)
			particle:SetGravity(Vector(0, 0, 60))
			particle:SetColor(25, 180, 255)
		end
	end

	emitter:Finish()
end

function EFFECT:Think()
	return false
end

function EFFECT:Render()
end
