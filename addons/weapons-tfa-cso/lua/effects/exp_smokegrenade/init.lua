function EFFECT:Init(data)
	self.Pos = data:GetOrigin()
	self.Emitter = ParticleEmitter(self.Pos)
	self.StartTime = CurTime()
	self.StartFade = CurTime() + 15
	self.Alpha = 160
	self.Particles = {}

	for i = 1, 6 do
		local pos = self.Pos + Vector(math.Rand(-100, 100), math.Rand(-100, 100), 30)
		local dir = (pos - self.Pos):Angle():Forward()
		if i < 6 then
			pos = self.Pos
		end

		self.Particles[i] = self.Emitter:Add("sprites/gas_puff_01", self.Pos)

		if self.Particles[i] then
			self.Particles[i]:SetVelocity(dir * 2048)
			self.Particles[i]:SetAirResistance(1024)
			self.Particles[i]:SetGravity(Vector(math.Rand(-5, 5), math.Rand(-5, 5), 0))
			if i < 6 then
				self.Particles[i]:SetGravity(Vector(math.Rand(-5, 5), math.Rand(-5, 5), math.Rand(-1, 1)) * 40)
			end
			self.Particles[i]:SetDieTime(120)
			self.Particles[i]:SetStartAlpha(128)
			self.Particles[i]:SetEndAlpha(0)
			self.Particles[i]:SetStartSize(32 * 5)
			self.Particles[i]:SetEndSize(32 * 5)
			self.Particles[i]:SetRoll(math.Rand(-360, 360))
			self.Particles[i]:SetRollDelta(math.random(-1, 1) / 5)
			self.Particles[i]:SetColor(math.random(210, 230), math.random(210, 230), math.random(210, 230))
		end
	end
end

function EFFECT:Think()
	if CurTime() > self.StartFade then
		local a = math.Clamp(255 - (CurTime() - self.StartFade) * 18, 0, 255) / 255

		for i = 1, 6 do
			self.Particles[i]:SetStartAlpha(self.Alpha * a)
			self.Particles[i]:SetEndAlpha(self.Alpha * a)
		end

		if a <= 0 then
			for i = 1, 6 do
				self.Particles[i]:SetDieTime(1)
			end

			self.Emitter:Finish()

			return false
		end
	end

	return true
end

function EFFECT:Render()
end