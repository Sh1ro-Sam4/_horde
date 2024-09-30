-- 'Borrowed' from Zombie Survival's explosion_fusordisc effect
-- https://github.com/JetBoom/zombiesurvival/blob/master/gamemodes/zombiesurvival/entities/effects/explosion_fusordisc.lua

function EFFECT:Init(effectdata)
	local pos = effectdata:GetOrigin()
	local normal = effectdata:GetNormal()

	local particle
	
	sound.Play("Gunkata.SkilllastExp", pos, 180, 100)

	local emitter = ParticleEmitter(pos)
	local emitter2 = ParticleEmitter(pos, true)
	emitter:SetNearClip(24, 32)
	emitter2:SetNearClip(24, 32)

	for i=1, 20 do
		particle = emitter:Add("effects/splash2", pos)
		particle:SetDieTime(0.2)
		particle:SetColor(255, 243, 112)
		particle:SetStartAlpha(255)
		particle:SetEndAlpha(0)
		particle:SetStartSize(6)
		particle:SetEndSize(6)
		particle:SetStartLength(60)
		particle:SetEndLength(60)
		particle:SetVelocity(VectorRand():GetNormal() * 220)
	end
	for i=1, 30 do
		particle = emitter:Add("effects/splash2", pos)
		particle:SetDieTime(0.2)
		particle:SetColor(255, 193, 0)
		particle:SetStartAlpha(255)
		particle:SetEndAlpha(0)
		particle:SetStartSize(6)
		particle:SetEndSize(6)
		particle:SetStartLength(60)
		particle:SetEndLength(60)
		particle:SetVelocity(VectorRand():GetNormal() * 220)
	end
	for i=1, 15 do
		particle = emitter:Add("effects/blueflare1", pos)
		particle:SetDieTime(0.2)
		particle:SetColor(255, 243, 112)
		particle:SetStartAlpha(255)
		particle:SetEndAlpha(0)
		particle:SetStartSize(9)
		particle:SetEndSize(9)
		particle:SetVelocity(VectorRand():GetNormal() * 366)
	end
	for i=1, 25 do
		particle = emitter:Add("effects/blueflare1", pos)
		particle:SetDieTime(0.2)
		particle:SetColor(255, 193, 0)
		particle:SetStartAlpha(255)
		particle:SetEndAlpha(0)
		particle:SetStartSize(9)
		particle:SetEndSize(9)
		particle:SetVelocity(VectorRand():GetNormal() * 366)
	end
	for i=1, 5 do
		particle = emitter:Add("particles/smokey", pos + Vector(math.Rand(-10, 10), math.Rand(-10, 10), math.Rand(0, 10)))
		particle:SetVelocity(VectorRand():GetNormal() * 240)
		particle:SetDieTime(math.Rand(0.3, 0.7))
		particle:SetStartAlpha(math.Rand(70, 90))
		particle:SetStartSize(1)
		particle:SetEndSize(math.Rand(75, 80))
		particle:SetRoll(math.Rand(-360, 360))
		particle:SetRollDelta(math.Rand(-4.5, 4.5))
		particle:SetColor(255, 243, 112)
	end
	for i=1, 7 do
		particle = emitter:Add("particles/smokey", pos + Vector(math.Rand(-10, 10), math.Rand(-10, 10), math.Rand(0, 10)))
		particle:SetVelocity(VectorRand():GetNormal() * 240)
		particle:SetDieTime(math.Rand(0.3, 0.7))
		particle:SetStartAlpha(math.Rand(70, 90))
		particle:SetStartSize(1)
		particle:SetEndSize(math.Rand(75, 80))
		particle:SetRoll(math.Rand(-360, 360))
		particle:SetRollDelta(math.Rand(-4.5, 4.5))
		particle:SetColor(255, 193, 0)
	end
	
	local ringstart = pos + normal * -3
	for i=1, 6 do
		particle = emitter2:Add("effects/select_ring", ringstart)
		particle:SetDieTime(0.1 + i * 0.1)
		particle:SetColor(255, 193, 0)
		particle:SetStartAlpha(255)
		particle:SetEndAlpha(0)
		particle:SetStartSize(0)
		particle:SetEndSize(128)
		particle:SetAngles(Angle(90,0,0))
		particle:SetPos( Vector(pos) + Vector(0,0,4) )
		particle = emitter2:Add("effects/select_ring", ringstart)
		particle:SetDieTime(0.1 + i * 0.1)
		particle:SetColor(255, 243, 112)
		particle:SetStartAlpha(255)
		particle:SetEndAlpha(0)
		particle:SetStartSize(0)
		particle:SetEndSize(132)
		particle:SetAngles(Angle(90,0,0))
		particle:SetPos( Vector(pos) + Vector(0,0,4) )
	end

	emitter:Finish()
	emitter2:Finish()
end

function EFFECT:Think()
	return false
end

function EFFECT:Render()
end
