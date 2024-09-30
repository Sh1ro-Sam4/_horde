-- 'Borrowed' from Zombie Survival's explosion_fusordisc effect
-- https://github.com/JetBoom/zombiesurvival/blob/master/gamemodes/zombiesurvival/entities/effects/explosion_fusordisc.lua

function EFFECT:Init(effectdata)
	local pos = effectdata:GetOrigin()
	local normal = effectdata:GetNormal()

	local particle

	local emitter = ParticleEmitter(pos, true)
	emitter:SetNearClip(24, 32)
	
	local ringstart = pos + normal * -3
	for i=1, 1 do
		particle = emitter:Add("effects/select_ring", ringstart)
		particle:SetDieTime(0.1)
		particle:SetColor(255, 96, 0)
		particle:SetStartAlpha(255)
		particle:SetEndAlpha(255)
		particle:SetStartSize(130)
		particle:SetEndSize(114)
		particle:SetAngles(Angle(90,0,0))
		particle:SetPos( Vector(pos) + Vector(0,0,4) )
	end

	emitter:Finish()
end

function EFFECT:Think()
	return false
end

function EFFECT:Render()
end
