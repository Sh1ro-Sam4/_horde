EFFECT.g_sModelIndexFireball3 = Material("sprites/ef_c4_beep")

function EFFECT:Init(data)
	self.Pos = data:GetOrigin()
	local tracedata = {}
	local m_pTrace
	tracedata.start = self.Pos
	tracedata.endpos = self.Pos + Vector(0, 0, 0)
	tracedata.filter = self
	tracedata.mask = MASK_SOLID
	m_pTrace = util.TraceLine(tracedata)

	if m_pTrace.Fraction != 1 then
		self.Pos = m_pTrace.HitPos + (m_pTrace.HitNormal * (100 - 24) * 0.6)
	end

	self.Pos2 = Vector(math.Rand(-64, 64), math.Rand(-64, 64), math.Rand(30, 35))

	local light = DynamicLight( data:GetEntity():EntIndex() )
	light.pos = self.Pos
	light.r = 255
	light.g = 32
	light.b = 32
	light.brightness = 3
	light.Decay = 1000
	light.Size = 32
	light.DieTime = CurTime() + 0.1
end


function EFFECT:Render()
	render.SetMaterial(self.g_sModelIndexFireball3)
	render.DrawSprite(self.Pos + Vector(0, 0, 5), 32, 32, Color(255, 32, 32, 255))
end