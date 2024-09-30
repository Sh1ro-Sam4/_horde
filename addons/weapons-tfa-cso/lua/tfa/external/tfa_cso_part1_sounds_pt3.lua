//This is just here to make sure gun sounds are loaded on clients properly
//somehow 2 of these aren't enough
//NEED MORE

//M32 Venom.
TFA.AddFireSound( "M32Venom.Fire", "weapons/tfa_cso/m32_venom/fire.wav", false, "^" )

//THANATOS-1. The beginning of porting all of'em.
TFA.AddFireSound( "THANATOS1.Fire", "weapons/tfa_cso/thanatos1/fire.wav", false, "^" )
TFA.AddFireSound( "THANATOS1.Fire2", "weapons/tfa_cso/thanatos1/fire2.wav", false, "^" )
TFA.AddFireSound( "THANATOS1.FireB", "weapons/tfa_cso/thanatos1/fire_b.wav", false, "^" )
TFA.AddWeaponSound( "THANATOS1.BIdle", "weapons/tfa_cso/thanatos1/b_idle.wav")
TFA.AddWeaponSound( "THANATOS1.ClipOut", "weapons/tfa_cso/thanatos1/clipout.wav")
TFA.AddWeaponSound( "THANATOS1.ClipIn", "weapons/tfa_cso/thanatos1/clipin.wav")
TFA.AddWeaponSound( "THANATOS1.BoltPull", "weapons/tfa_cso/thanatos1/boltpull.wav")
TFA.AddWeaponSound( "THANATOS1.DrawB", "weapons/tfa_cso/thanatos1/draw_b.wav")
TFA.AddWeaponSound( "THANATOS1.ChangeB", "weapons/tfa_cso/thanatos1/changeb.wav")
TFA.AddWeaponSound( "THANATOS1.ReloadB", "weapons/tfa_cso/thanatos1/reload_b.wav")

//THANATOS-3. More. MORE. MORE!
TFA.AddFireSound( "THANATOS3.Fire", "weapons/tfa_cso/thanatos3/fire.wav", false, "^" )
TFA.AddFireSound( "THANATOS3.Fly_Shoot", "weapons/tfa_cso/thanatos3/fly_shoot.wav", false, "^" )
TFA.AddFireSound( "THANATOS3.FireB", "weapons/tfa_cso/thanatos3/fire_b.wav", false, "^" )
TFA.AddWeaponSound( "THANATOS3.Fly_W3", "weapons/tfa_cso/thanatos3/fly_w3.wav")
TFA.AddWeaponSound( "THANATOS3.Idle_W3", "weapons/tfa_cso/thanatos3/idle_w3.wav")
TFA.AddWeaponSound( "THANATOS3.ClipOut", "weapons/tfa_cso/thanatos3/clipout.wav")
TFA.AddWeaponSound( "THANATOS3.ClipIn", "weapons/tfa_cso/thanatos3/clipin.wav")
TFA.AddWeaponSound( "THANATOS3.BoltPull", "weapons/tfa_cso/thanatos3/boltpull.wav")
TFA.AddWeaponSound( "THANATOS3.Draw", "weapons/tfa_cso/thanatos3/draw.wav")
TFA.AddWeaponSound( "THANATOS3.Draw_W3", "weapons/tfa_cso/thanatos3/draw_w3.wav")
TFA.AddWeaponSound( "THANATOS3.ChangeB", "weapons/tfa_cso/thanatos3/changeb.wav")
TFA.AddWeaponSound( "THANATOS3.Reload_W3", "weapons/tfa_cso/thanatos3/reload_w3.wav")
TFA.AddWeaponSound( "THANATOS3.Spread_W1", "weapons/tfa_cso/thanatos3/spread_w1.wav")
TFA.AddWeaponSound( "THANATOS3.Spread_W2", "weapons/tfa_cso/thanatos3/spread_w2.wav")
TFA.AddWeaponSound( "THANATOS3.Spread_W3", "weapons/tfa_cso/thanatos3/spread_w3.wav")

sound.Add({
	['name'] = "Thanatos3.Hit1",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/thanatos3/hit1.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "Thanatos3.Hit2",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/thanatos3/hit2.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "Thanatos3.Metal1",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/thanatos3/metal1.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "Thanatos3.Metal2",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/thanatos3/metal2.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "Thanatos3.Stone1",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/thanatos3/stone1.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "Thanatos3.Stone2",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/thanatos3/stone2.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "Thanatos3.Swish",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/thanatos3/swish.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "Thanatos3.Wood1",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/thanatos3/wood1.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "Thanatos3.Wood2",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/thanatos3/wood2.wav"},
	['pitch'] = {100,100}
})

//THANATOS-7.
TFA.AddFireSound( "THANATOS7.Fire", "weapons/tfa_cso/thanatos7/fire.wav", false, "^" )
TFA.AddFireSound( "THANATOS7.ScytheShoot", "weapons/tfa_cso/thanatos7/scytheshoot.wav", false, "^" )
TFA.AddWeaponSound( "THANATOS7.ScytheReload", "weapons/tfa_cso/thanatos7/scythereload.wav")
TFA.AddWeaponSound( "THANATOS7.Idle_B", "weapons/tfa_cso/thanatos7/idle_b.wav")
TFA.AddWeaponSound( "THANATOS7.ClipOut1", "weapons/tfa_cso/thanatos7/clipout1.wav")
TFA.AddWeaponSound( "THANATOS7.ClipOut2", "weapons/tfa_cso/thanatos7/clipout2.wav")
TFA.AddWeaponSound( "THANATOS7.ClipIn1", "weapons/tfa_cso/thanatos7/clipin1.wav")
TFA.AddWeaponSound( "THANATOS7.ClipIn2", "weapons/tfa_cso/thanatos7/clipin2.wav")
TFA.AddWeaponSound( "THANATOS7.Draw", "weapons/tfa_cso/thanatos7/draw.wav")
TFA.AddWeaponSound( "THANATOS7.DrawB", "weapons/tfa_cso/thanatos7/draw_b.wav")

//THANATOS-11.
TFA.AddFireSound( "THANATOS11.Fire", "weapons/tfa_cso/thanatos11/fire.wav", false, "^" )
TFA.AddFireSound( "THANATOS11.Fire2", "weapons/tfa_cso/thanatos11/fire2.wav", false, "^" )
TFA.AddWeaponSound( "THANATOS11.Idle1_B", "weapons/tfa_cso/thanatos11/idle1_b.wav")
TFA.AddWeaponSound( "THANATOS11.Idle2_B", "weapons/tfa_cso/thanatos11/idle2_b.wav")
TFA.AddWeaponSound( "THANATOS11.IdleB_Reload", "weapons/tfa_cso/thanatos11/idleb_reload.wav")
TFA.AddWeaponSound( "THANATOS11.Insert", "weapons/tfa_cso/thanatos11/insert.wav")
TFA.AddWeaponSound( "THANATOS11.Pump", "weapons/tfa_cso/thanatos11/pump.wav")
TFA.AddWeaponSound( "THANATOS11.ChangeA", "weapons/tfa_cso/thanatos11/changea.wav")
TFA.AddWeaponSound( "THANATOS11.ChangeB", "weapons/tfa_cso/thanatos11/changeb.wav")

sound.Add({
	['name'] = "THANATOS11.Exp",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/thanatos11/exp.wav"},
	['pitch'] = {100,100}
})

//Burning AUG. Nathan approved!
local soundData = {
	name 		= "BurningAUG.ClipOut" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/burning_aug/clipout.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "BurningAUG.ClipIn1" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/burning_aug/clipin_1.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "BurningAUG.ClipIn2" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/burning_aug/clipin_2.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "BurningAUG.Fire" ,
	channel 	= CHAN_USER_BASE+11,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/burning_aug/fire.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "BurningAUG.FireNade" ,
	channel 	= CHAN_USER_BASE+11,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/burning_aug/fire_2.wav"
}

sound.Add(soundData)

//M134-Vulcan. Pata-tat-tat.
local soundData = {
	name 		= "M134Vulcan.ClipOff" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/m134_vulcan/clipoff.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "M134Vulcan.ClipOn" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/m134_vulcan/clipon.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "M134Vulcan.Draw" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/m134_vulcan/draw.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "M134Vulcan.Fire" ,
	channel 	= CHAN_USER_BASE+11,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/m134_vulcan/fire.wav"
}

sound.Add(soundData)

//TURBULENT-5.
local soundData = {
	name 		= "TURBULENT5.Draw" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/turbulent5/draw.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "TURBULENT5.ClipOut" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/turbulent5/clipout.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "TURBULENT5.ClipIn1" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/turbulent5/clipin_1.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "TURBULENT5.ClipIn2" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/turbulent5/clipin_2.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "TURBULENT5.BoltPull" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/turbulent5/boltpull.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "TURBULENT5.Idle" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/turbulent5/idle.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "TURBULENT5.Fire" ,
	channel 	= CHAN_USER_BASE+11,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/turbulent5/fire.wav"
}

sound.Add(soundData)

//CROW-1. A pistol with a drum magazine? Oh god.
local soundData = {
	name 		= "CROW1.Draw" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/crow1/draw.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "CROW1.ClipOut" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/crow1/clipout.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "CROW1.ClipIn1" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/crow1/clipin_1.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "CROW1.ClipIn2" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/crow1/clipin_2.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "CROW1.Fire" ,
	channel 	= CHAN_USER_BASE+11,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/crow1/fire.wav"
}

sound.Add(soundData)

//Desperado. There's 14 textures with these guns. FOURTEEN.
local soundData = {
	name 		= "Desperado.Reload" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/desperado/reload.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "Desperado.Fire" ,
	channel 	= CHAN_USER_BASE+11,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/desperado/fire.wav"
}

sound.Add(soundData)

//Negev. For my favorite cyka
local soundData = {
	name 		= "NGNegev.ClipOut1" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/negev/clipout_1.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "NGNegev.ClipOut2" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/negev/clipout_2.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "NGNegev.ClipIn" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/negev/clipin.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "NGNegev.Fire" ,
	channel 	= CHAN_USER_BASE+11,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/negev/fire.wav"
}

sound.Add(soundData)

//Guardian. Hide from Nathan.
local soundData = {
	name 		= "Guardian.Reload" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/guardian/reload.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "Guardian.Draw" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/guardian/draw.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "Guardian.Idle" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/guardian/idle.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "Guardian.Fire" ,
	channel 	= CHAN_USER_BASE+11,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/guardian/fire.wav"
}

sound.Add(soundData)

//CHARGER-7. A new anti-zombie series!
local soundData = {
	name 		= "CHARGER7.Draw" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/charger7/draw.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "CHARGER7.ClipOut1" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/charger7/clipout_1.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "CHARGER7.ClipOut2" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/charger7/clipout_2.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "CHARGER7.ClipIn1" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/charger7/clipin_1.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "CHARGER7.ClipIn2" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/charger7/clipin_2.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "CHARGER7.ClipIn3" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/charger7/clipin_3.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "CHARGER7.Fire" ,
	channel 	= CHAN_USER_BASE+11,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/charger7/fire.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "CHARGER7.FireLaser" ,
	channel 	= CHAN_USER_BASE+11,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/charger7/fire_laser.wav"
}

sound.Add(soundData)

//M79. Hand-held grenade launcher.
local soundData = {
	name 		= "M79.ClipIn" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/m79/clipin.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "M79.ClipOn" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/m79/clipon.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "M79.ClipOut" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/m79/clipout.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "M79.Draw" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/m79/draw.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "M79.Fire" ,
	channel 	= CHAN_USER_BASE+11,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/m79/fire.wav"
}

sound.Add(soundData)

//Luger. In service since World War 1!
local soundData = {
	name 		= "Luger.ClipOut1" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/luger/clipout_1.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "Luger.ClipOut2" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/luger/clipout_2.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "Luger.ClipIn" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/luger/clipin.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "Luger.SlideBack" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/luger/slideback.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "Luger.Fire" ,
	channel 	= CHAN_USER_BASE+11,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/luger/fire.wav"
}

sound.Add(soundData)

//Ultimax-100. Big Fucking Gun.
local soundData = {
	name 		= "Ultimax100.ClipOut" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/ultimax100/clipout.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "Ultimax100.ClipIn1" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/ultimax100/clipin_1.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "Ultimax100.ClipIn2" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/ultimax100/clipin_2.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "Ultimax100.BoltPull" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/ultimax100/boltpull.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "Ultimax100.Fire" ,
	channel 	= CHAN_USER_BASE+11,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/ultimax100/fire.wav"
}

sound.Add(soundData)

//SPAS-12 Maverick.
local soundData = {
	name 		= "SPAS12Maverick.BoltPull" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/spas12maverick/boltpull.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "SPAS12Maverick.ClipOut" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/spas12maverick/clipout.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "SPAS12Maverick.ClipIn" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/spas12maverick/clipin.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "SPAS12Maverick.Draw" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/spas12maverick/draw.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "SPAS12Maverick.Fire" ,
	channel 	= CHAN_USER_BASE+11,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/spas12maverick/fire.wav"
}

sound.Add(soundData)

//Magnum Drill. A fucking drill shotgun.
local soundData = {
	name 		= "MagnumDrill.Draw" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/magnum_drill/draw.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "MagnumDrill.DrawExpert" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 150,
	pitchend 	= 150,
	sound 		= "weapons/tfa_cso/magnum_drill/draw.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "MagnumDrill.ClipOut" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/magnum_drill/clipout.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "MagnumDrill.ClipIn" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/magnum_drill/clipin.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "MagnumDrill.Idle" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/magnum_drill/idle.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "MagnumDrill.IdleExpert" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 150,
	pitchend 	= 150,
	sound 		= "weapons/tfa_cso/magnum_drill/idle.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "MagnumDrill.Fire" ,
	channel 	= CHAN_USER_BASE+11,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/magnum_drill/fire.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "MagnumDrill.Drill" ,
	channel 	= CHAN_USER_BASE+11,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/magnum_drill/drill.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "MagnumDrill.DrillExpert" ,
	channel 	= CHAN_USER_BASE+11,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 150,
	pitchend 	= 150,
	sound 		= "weapons/tfa_cso/magnum_drill/drill.wav"
}

sound.Add(soundData)

//Sten-MK2. Wallet fed SMGs!
local soundData = {
	name 		= "StenMK2.Clipout" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/sten_mk2/clipout.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "StenMK2.BoltPull" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/sten_mk2/boltpull.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "StenMK2.Clipin" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/sten_mk2/clipin.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "StenMK2.Fire" ,
	channel 	= CHAN_USER_BASE+11,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/sten_mk2/fire.wav"
}

sound.Add(soundData)

//MP40.
local soundData = {
	name 		= "MP40.Clipin" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/mp40/clipin.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "MP40.ClipOut" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/mp40/clipout.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "MP40.BoltPull" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/mp40/boltpull.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "MP40.Fire" ,
	channel 	= CHAN_USER_BASE+11,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/mp40/fire.wav"
}

sound.Add(soundData)

//Magnum Lancer. A FUCKING FOUR SIGHT ROCKET SHOTGUN LAUNCHER THINGY DEATH MACHINE.
local soundData = {
	name 		= "MagnumLancer.ClipOut" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/magnum_lancer/clipout.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "MagnumLancer.ClipIn" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/magnum_lancer/clipin.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "MagnumLancer.Draw" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/magnum_lancer/draw.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "MagnumLancer.DrawB" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/magnum_lancer/draw_b_mode.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "MagnumLancer.MissileExplode" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/magnum_lancer/missile_explode.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "MagnumLancer.MissileReady" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/magnum_lancer/missile_ready.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "MagnumLancer.MissileReload" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/magnum_lancer/missile_reload.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "MagnumLancer.MissileShotLast" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/magnum_lancer/missile_shot_last.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "MagnumLancer.Fire" ,
	channel 	= CHAN_USER_BASE+11,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/magnum_lancer/fire.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "MagnumLancer.Fire2" ,
	channel 	= CHAN_USER_BASE+11,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/magnum_lancer/fire_2.wav"
}

sound.Add(soundData)

//TURBULENT-1. Pew pew!!
local soundData = {
	name 		= "TURBULENT1.ClipOut" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/turbulent_1/clipout.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "TURBULENT1.ClipIn1" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/turbulent_1/clipin_1.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "TURBULENT1.ClipIn2" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/turbulent_1/clipin_2.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "TURBULENT1.ClipIn3" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/turbulent_1/clipin_3.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "TURBULENT1.Draw" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/turbulent_1/draw.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "TURBULENT1.Draw_Empty" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/turbulent_1/draw_empty.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "TURBULENT1.Motor" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/turbulent_1/motor.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "TURBULENT1.Idle" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/turbulent_1/idle.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "TURBULENT1.Fire" ,
	channel 	= CHAN_USER_BASE+11,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/turbulent_1/fire.wav"
}

sound.Add(soundData)

//Crimson Hunter. Blood!
local soundData = {
	name 		= "CrimsonHunter.Draw" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/crimson_hunter/draw.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "CrimsonHunter.ClipOut" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/crimson_hunter/clipout.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "CrimsonHunter.ClipIn" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/crimson_hunter/clipin.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "CrimsonHunter.Idle" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1, --OH MY GOD SHUT THE FUCK UP ALREADY
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/elvenranger/idle.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "CrimsonHunter.Fire" ,
	channel 	= CHAN_USER_BASE+11,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/crimson_hunter/fire.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "CrimsonHunter.Throw" ,
	channel 	= CHAN_USER_BASE+11,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/crimson_hunter/throw.wav"
}

sound.Add(soundData)

-- Shooting Star

sound.Add({
	['name'] = "ShootingStar.Fire",
	['channel'] = CHAN_USER_BASE+11,
	['sound'] = { "weapons/tfa_cso/shooting_star/fire.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "ShootingStar.Exp",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/shooting_star/exp.wav"},
	['pitch'] = {100,100}
})

TFA.AddWeaponSound ( "ShootingStar.Draw", "weapons/tfa_cso/shooting_star/draw.wav" )

-- Balrog Alt Firing Sound

sound.Add({
	['name'] = "Balrog3.Fire2",
	['channel'] = CHAN_USER_BASE+11,
	['sound'] = { "weapons/tfa_cso/balrog3/fire2.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "Balrog7.Fire2",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/balrog7/fire2.wav"},
	['pitch'] = {100,100}
})