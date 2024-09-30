//Main function
function EFFECT:Init(data)


//Default performance settings
local DrawFlame = 1
local DrawRefraction = 0

//Adjust performance depending on user settings
local PerfIndex = GetConVar("cso_airburster_fx"):GetInt()
if PerfIndex == 1 then DrawSmoke = 0 end
if PerfIndex == 3 then DrawRefraction = 1 end


//Muzzle and desired position vectors
local StartPos = self:GetTracerShootPos(self.Position, data:GetEntity(), data:GetAttachment())
local HitPos = data:GetOrigin()

//Check if the weapon is still there
if data:GetEntity():IsValid() && StartPos && HitPos then


	//Draw burst of flame
	if DrawFlame == 1 then

	//Create particle emmiter
	local FlameEmitter = ParticleEmitter(StartPos)

		//Amount of particles to create
		for i=0, 8 do

			//Safeguard
			if !FlameEmitter then return end

			//Pool of flame sprites
			local FlameMat = {}
			FlameMat[1] = "sprites/ef_aircyclone"
			FlameMat[2] = "sprites/ef_aircyclone"
			FlameMat[3] = "sprites/ef_aircyclone"

			local FlameParticle = FlameEmitter:Add( FlameMat[math.random(1,3)], StartPos )

			//Refraction is too expensive to render on most machines
			if DrawRefraction == 1 then
			if math.random(1,16) == 16 then
			FlameParticle = FlameEmitter:Add( "sprites/heatwave", StartPos )
			end
			end

			if (FlameParticle) then

				FlameParticle:SetVelocity( ((HitPos - StartPos):GetNormal() * math.random(1720,1820)) + (VectorRand() * 0) )

				FlameParticle:SetLifeTime(0)
				FlameParticle:SetDieTime(0.52)

				FlameParticle:SetStartAlpha(255)
				FlameParticle:SetEndAlpha(0)

				FlameParticle:SetStartSize(16)
				FlameParticle:SetEndSize(32)

				FlameParticle:SetRoll(math.Rand(-360, 360))
				FlameParticle:SetRollDelta(math.Rand(-7.2, 7.2))

				FlameParticle:SetAirResistance(math.random(128, 256))

				FlameParticle:SetCollide(true)

				FlameParticle:SetGravity( Vector(0, 0, 64) )

			end
		end

	//We're done with this emmiter
	FlameEmitter:Finish()

	//Finished with flame
	end


end
end

//Kill effect
function EFFECT:Think()
return false
end

//Unused
function EFFECT:Render()
end