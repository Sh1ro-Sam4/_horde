-- 'Borrowed' from Zombie Survival's explosion_fusordisc effect
-- https://github.com/JetBoom/zombiesurvival/blob/master/gamemodes/zombiesurvival/entities/effects/explosion_fusordisc.lua

function EFFECT:Init(effectdata)
	local pos = effectdata:GetOrigin()
	local normal = effectdata:GetNormal()

	local particle

	sound.Play("Gungnir.Shoot_Exp", pos, 180, 100)

	local emitter = ParticleEmitter(pos)
	local emitter2 = ParticleEmitter(pos, true)
	emitter:SetNearClip(24, 32)
	emitter2:SetNearClip(24, 32)

	for i=1, 100 do
		particle = emitter:Add("effects/splash2", pos)
		particle:SetDieTime(1.2)
		particle:SetColor(50, 150, 255)
		particle:SetStartAlpha(255)
		particle:SetEndAlpha(0)
		particle:SetStartSize(6)
		particle:SetEndSize(6)
		particle:SetStartLength(60)
		particle:SetEndLength(60)
		particle:SetVelocity(VectorRand():GetNormal() * 440)
	end
	for i=1, 160 do
		particle = emitter:Add("effects/blueflare1", pos)
		particle:SetDieTime(1.2)
		particle:SetColor(50, 150, 255)
		particle:SetStartAlpha(255)
		particle:SetEndAlpha(0)
		particle:SetStartSize(9)
		particle:SetEndSize(9)
		particle:SetVelocity(VectorRand():GetNormal() * 732)
	end
	for i=1, 24 do
		particle = emitter:Add("particles/smokey", pos + Vector(math.Rand(-10, 10), math.Rand(-10, 10), math.Rand(0, 10)))
		particle:SetVelocity(VectorRand():GetNormal() * 480)
		particle:SetDieTime(math.Rand(1.2, 1.8))
		particle:SetStartAlpha(math.Rand(70, 90))
		particle:SetStartSize(1)
		particle:SetEndSize(math.Rand(150, 160))
		particle:SetRoll(math.Rand(-360, 360))
		particle:SetRollDelta(math.Rand(-4.5, 4.5))
		particle:SetColor(50, 150, 255)
	end
	local ringstart = pos + normal * -3
	for i=1, 6 do
		particle = emitter2:Add("effects/select_ring", ringstart)
		particle:SetDieTime(2.4 + i * 0.1)
		particle:SetColor(55, 155, 255)
		particle:SetStartAlpha(255)
		particle:SetEndAlpha(0)
		particle:SetStartSize(0)
		particle:SetEndSize(50)
		particle:SetAngles(normal:Angle())
		particle = emitter2:Add("effects/select_ring", ringstart)
		particle:SetDieTime(2.4 + i * 0.1)
		particle:SetColor(55, 155, 255)
		particle:SetStartAlpha(255)
		particle:SetEndAlpha(0)
		particle:SetStartSize(0)
		particle:SetEndSize(70)
		particle:SetAngles(normal:Angle())
	end

	emitter:Finish()
	emitter2:Finish()
end

function EFFECT:Think()
	return false
end

function EFFECT:Render()
end