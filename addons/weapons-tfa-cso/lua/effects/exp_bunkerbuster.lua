EFFECT.g_sModelIndexFireball3 = Material("sprites/bunkerbuster_explosion")
EFFECT.g_sModelIndexFireball2 = Material("sprites/bunkerbuster_smoke")

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
	self.Entity:EmitSound("weapons/tfa_cso/bunkerbuster/exp" ..math.random(1,2) ..".wav", 512 )

	local light = DynamicLight( data:GetEntity():EntIndex() )
	light.pos = self.Pos
	light.r = 255
	light.g = 100
	light.b = 10
	light.brightness = 3
	light.Decay = 2 ^ 9
	light.Size = 512
	light.DieTime = CurTime() + 1
end

function EFFECT:Think()
	self.Frame = self.Frame + FrameTime()

	return self.Frame < 1
end

function EFFECT:Render()
	render.SetMaterial(self.g_sModelIndexFireball3)
	self.g_sModelIndexFireball3:SetInt("$frame", math.Clamp(math.floor(self.Frame * 42), 0, 42))
	render.DrawSprite(self.Pos + Vector(0, 0, 150), 512, 512, Color(255, 255, 255, 255))

	render.SetMaterial(self.g_sModelIndexFireball2)
	self.g_sModelIndexFireball2:SetInt("$frame", math.Clamp(math.floor(self.Frame * 45), 0, 45))
	render.DrawSprite(self.Pos + Vector(0, 0, 150), 512, 512, Color(255, 255, 255, 255))
end