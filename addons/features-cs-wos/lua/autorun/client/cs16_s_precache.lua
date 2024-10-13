if ( SERVER ) then 

	game.AddParticles("particles/cs16.pcf")
	game.AddParticles("particles/blood_impact.pcf")
	game.AddParticles("particles/antlion_blood.pcf")
	game.AddParticles("particles/myblood.pcf")
	PrecacheParticleSystem("cs16_helmet_impact")
	PrecacheParticleSystem("myblood")
	
end

if ( CLIENT ) then 

	game.AddParticles("particles/cs16.pcf")
	game.AddParticles("particles/blood_impact.pcf")
	game.AddParticles("particles/antlion_blood.pcf")
	game.AddParticles("particles/myblood.pcf")
	PrecacheParticleSystem("cs16_helmet_impact")
	PrecacheParticleSystem("myblood")
	
end