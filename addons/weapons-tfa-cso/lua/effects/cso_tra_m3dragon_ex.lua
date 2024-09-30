EFFECT.Mat = Material("effects/laser_tracer")
EFFECT.Col1 = Color( 255, 251, 85) --Color(225,225,225,225)
EFFECT.Col2 = Color( 59, 64, 255)
EFFECT.Speed = 8192
EFFECT.TracerLength = 256
EFFECT.ChosenColor = 1

--[[---------------------------------------------------------
Init( data table )
-----------------------------------------------------------]]
function EFFECT:Init(data)
	self.ChosenColor = math.random(2)
	self.Position = data:GetStart()
	self.WeaponEnt = data:GetEntity()
	self.Attachment = data:GetAttachment()
	-- Keep the start and end pos - we're going to interpolate between them
	self.StartPos = self:GetTracerShootPos(self.Position, self.WeaponEnt, self.Attachment)
	self.EndPos = data:GetOrigin()
	self.Normal = (self.EndPos - self.StartPos):GetNormalized()
	self.Length = (self.EndPos - self.StartPos):Length()
	--self.Alpha = 255
	self.Life = 0
	self.MaxLife = self.Length / self.Speed
	self:SetRenderBoundsWS(self.StartPos, self.EndPos)
	self.CurPos = self.StartPos
end

--[[---------------------------------------------------------
THINK
-----------------------------------------------------------]]
function EFFECT:Think()
	self.Life = self.Life + FrameTime() * (1 / self.MaxLife)
	--self.Alpha = 255 * ( 1 - self.Life )

	return self.Life < 1
end

--[[---------------------------------------------------------
Draw the effect
-----------------------------------------------------------]]
local color_to_use = Color(255,255,255,255)

function EFFECT:Render()
	render.SetMaterial(self.Mat)
	if self.ChosenColor == 1 then
		color_to_use = self.Col1
	else
		color_to_use = self.Col2
	end
	
	local startbeampos = Lerp(self.Life, self.StartPos, self.EndPos)
	local endbeampos = Lerp(self.Life + self.TracerLength / self.Length, self.StartPos, self.EndPos)
	render.DrawBeam(startbeampos, endbeampos, 8, 0, 1, color_to_use)
end