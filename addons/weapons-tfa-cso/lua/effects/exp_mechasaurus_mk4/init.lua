EFFECT.g_sModelIndexFireball3 = Material("sprites/ef_y21s4janus_explosion")
EFFECT.g_sModelIndexSmoke = Material("sprites/steam1")

function EFFECT:Init(data)
	self.Pos = data:GetOrigin()
	local tracedata = {}
	local m_pTrace
	tracedata.start = self.Pos
	tracedata.endpos = self.Pos + Vector(0, 0, -32)
	tracedata.filter = self
	tracedata.mask = MASK_SOLID
	m_pTrace = util.TraceLine(tracedata)

	if m_pTrace.Fraction != 1 then
		self.Pos = m_pTrace.HitPos + (m_pTrace.HitNormal * (100 - 24) * 0.6)
	end

	self.Pos2 = Vector(math.Rand(-64, 64), math.Rand(-64, 64), math.Rand(30, 35))
	self.Frame = 0
	self.Entity:EmitSound("weapons/tfa_cso/thunderstorm/explode.wav", 512 )
end

function EFFECT:Think()
	self.Frame = self.Frame + FrameTime()

	return self.Frame < 1
end

function EFFECT:Render()
	render.SetMaterial(self.g_sModelIndexFireball3)
	self.g_sModelIndexFireball3:SetInt("$frame", math.Clamp(math.floor(self.Frame * 47), 0, 47))
	render.DrawSprite(self.Pos + Vector(0, 0, 80), 200, 200, Color(255, 255, 255, 255))
	render.SetMaterial(self.g_sModelIndexSmoke)
	self.g_sModelIndexSmoke:SetInt("$frame", math.Clamp(math.floor(self.Frame * 15), 0, 15))
	render.DrawSprite(self.Pos + Vector(0, 0, 80), 200, 200, Color(0, 0, 0, 255))
end