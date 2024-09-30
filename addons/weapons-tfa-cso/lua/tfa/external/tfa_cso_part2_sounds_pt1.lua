//This is just here to make sure gun sounds are loaded on clients properly
//somehow 2 of these aren't enough
//NEED MORE
  
//Mosin Nagant.
local soundData = {
	name		= "MOSIN.After" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/mosin/after_reload.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "MOSIN.Start" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/mosin/start_reload.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "MOSIN.Insert" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/mosin/insert.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "MOSIN.Fire" ,
	channel	 = CHAN_USER_BASE+11,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/mosin/fire.wav"
}
 
sound.Add(soundData)

//M1Garand.
local soundData = {
	name		= "GARAND.ClipIn1" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/m1garand/clipin1.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "GARAND.ClipIn2" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/m1garand/clipin2.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "GARAND.Empty" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/m1918bar/shoota_empty.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "GARAND.Fire" ,
	channel	 = CHAN_USER_BASE+11,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/m1garand/fire.wav"
}
 
sound.Add(soundData)

local soundData = {
	name		= "GARAND.Fire2" ,
	channel	 = CHAN_USER_BASE+11,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/m1garand/fire2.wav"
}
 
sound.Add(soundData)

//M1918Bar.
local soundData = {
	name		= "BAR.ClipIn" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/m1918bar/clipin.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "BAR.ClipOut" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/m1918bar/clipout.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "BAR.BoltPull" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/m1918bar/boltpull.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "BAR.Fire" ,
	channel	 = CHAN_USER_BASE+11,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/m1918bar/fire.wav"
}
 
sound.Add(soundData)

//M95. Anti Chopper Rifle
local soundData = {
	name		= "M95.ClipIn" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/m95/clipin.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "M95.ClipOut" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/m95/clipout.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "M95.BoltPull" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/m95/boltpull.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "M95.Fire" ,
	channel	 = CHAN_USER_BASE+11,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/m95/fire.wav"
}
 
sound.Add(soundData)

//MG36 XMAS. SpitBalls
local soundData = {
	name		= "MG36XMAS.ClipOut" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/mg36_xmas/clipout.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "MG36XMAS.ClipIn" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/mg36_xmas/clipin.wav"
}
 
sound.Add(soundData)

local soundData = {
	name		= "MG36XMAS.BoltFull" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/mg36_xmas/boltfull.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "MG36XMAS.Draw" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/mg36_xmas/draw.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "MG36XMAS.Fire" ,
	channel	 = CHAN_USER_BASE+11,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/mg36_xmas/fire.wav"
}
 
sound.Add(soundData)
 
//M2. Big fucking gun

TFA.AddWeaponSound( "M2.Open", "weapons/tfa_cso/m2/open.wav" )
TFA.AddWeaponSound( "M2.Close", "weapons/tfa_cso/m2/close.wav" )
TFA.AddWeaponSound( "M2.ClipLock", "weapons/tfa_cso/m2/cliplock.wav" )
TFA.AddWeaponSound( "M2.ClipIn", "weapons/tfa_cso/m2/clipin.wav" )
TFA.AddWeaponSound( "M2.ClipIn2", "weapons/tfa_cso/m2/clipin2.wav" )
TFA.AddWeaponSound( "M2.ClipOut", "weapons/tfa_cso/m2/clipout.wav" )
TFA.AddWeaponSound( "M2.Draw", "weapons/tfa_cso/m2/draw.wav" )
TFA.AddWeaponSound( "M2.Foley1", "weapons/tfa_cso/m2/foley1.wav" )
TFA.AddWeaponSound( "M2.Foley2", "weapons/tfa_cso/m2/foley2.wav" )
TFA.AddFireSound( "M2.Fire", "weapons/tfa_cso/m2/fire.wav", false, "^" )
TFA.AddFireSound( "M2.Fire2", "weapons/tfa_cso/m2/fire2.wav", false, "^" )
 
//M16A1.
local soundData = {
	name		= "M16A1.Deploy" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/m16a1/deploy.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "M16A1.ClipOut" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/m16a1/clipout.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "M16A1.BoltPull" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/m16a1/boltpull.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "M16A1.ClipIn" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/m16a1/clipin.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "M16A1.Fire" ,
	channel	 = CHAN_USER_BASE+11,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/m16a1/fire.wav"
}
 
sound.Add(soundData)

local soundData = {
	name		= "M16A1.Fire2" ,
	channel	 = CHAN_USER_BASE+11,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/m16a1/fire2.wav"
}
 
sound.Add(soundData)
 
//CROW-1. A pistol with a drum magazine? Oh god.
local soundData = {
	name		= "CROW1.Draw" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/crow1/draw.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "CROW1.ClipOut" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/crow1/clipout.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "CROW1.ClipIn1" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/crow1/clipin_1.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "CROW1.ClipIn2" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/crow1/clipin_2.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "CROW1.Fire" ,
	channel	 = CHAN_USER_BASE+11,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/crow1/fire.wav"
}
 
sound.Add(soundData)
 
//Desperado. There's 14 textures with these guns. FOURTEEN.
local soundData = {
	name		= "Desperado.Reload" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/desperado/reload.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "Desperado.Fire" ,
	channel	 = CHAN_USER_BASE+11,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/desperado/fire.wav"
}
 
sound.Add(soundData)
 
//Negev. For my favorite cyka
local soundData = {
	name		= "NGNegev.ClipOut1" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/negev/clipout_1.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "NGNegev.ClipOut2" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/negev/clipout_2.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "NGNegev.ClipIn" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/negev/clipin.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "NGNegev.Fire" ,
	channel	 = CHAN_USER_BASE+11,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/negev/fire.wav"
}
 
sound.Add(soundData)
 
//Guardian. Hide from Nathan.
local soundData = {
	name		= "Guardian.Reload" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/guardian/reload.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "Guardian.Draw" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/guardian/draw.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "Guardian.Idle" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/guardian/idle.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "Guardian.Fire" ,
	channel	 = CHAN_USER_BASE+11,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/guardian/fire.wav"
}
 
sound.Add(soundData)
 
//CHARGER-7. A new anti-zombie series!
local soundData = {
	name		= "CHARGER7.Draw" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/charger7/draw.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "CHARGER7.ClipOut1" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/charger7/clipout_1.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "CHARGER7.ClipOut2" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/charger7/clipout_2.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "CHARGER7.ClipIn1" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/charger7/clipin_1.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "CHARGER7.ClipIn2" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/charger7/clipin_2.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "CHARGER7.ClipIn3" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/charger7/clipin_3.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "CHARGER7.Fire" ,
	channel	 = CHAN_USER_BASE+11,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/charger7/fire.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "CHARGER7.FireLaser" ,
	channel	 = CHAN_USER_BASE+11,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/charger7/fire_laser.wav"
}
 
sound.Add(soundData)
 
//M79. Hand-held grenade launcher.
local soundData = {
	name		= "M79.ClipIn" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/m79/clipin.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "M79.ClipOn" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/m79/clipon.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "M79.ClipOut" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/m79/clipout.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "M79.Draw" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/m79/draw.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "M79.Fire" ,
	channel	 = CHAN_USER_BASE+11,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/m79/fire.wav"
}
 
sound.Add(soundData)
 
//Luger. In service since World War 1!
local soundData = {
	name		= "Luger.ClipOut1" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/luger/clipout_1.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "Luger.ClipOut2" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/luger/clipout_2.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "Luger.ClipIn" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/luger/clipin.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "Luger.SlideBack" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/luger/slideback.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "Luger.Fire" ,
	channel	 = CHAN_USER_BASE+11,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/luger/fire.wav"
}
 
sound.Add(soundData)
 
//QBB95. Ching Chong Machinegun
local soundData = {
	name		= "Qbb95.ClipOut" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/qbb95/clipout.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "Qbb95.ClipIn" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/qbb95/clipin.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "Qbb95.ClipOn" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/qbb95/clipon.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "Qbb95.Draw" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/qbb95/draw.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "Qbb95.Fire" ,
	channel	 = CHAN_USER_BASE+11,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/qbb95/fire.wav"
}
 
sound.Add(soundData)
 
//M24
local soundData = {
	name		= "M24.Draw" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/m24/draw.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "M24.ClipOut" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/m24/clipout.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "M24.ClipIn" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/m24/clipin.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "M24.Foley1" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/m24/foley1.wav"
}
 
sound.Add(soundData)

local soundData = {
	name		= "M24.Foley2" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/m24/foley2.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "M24.Fire" ,
	channel	 = CHAN_USER_BASE+11,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/m24/fire.wav"
}
 
sound.Add(soundData)
 
//Magnum Lancer. A FUCKING FOUR SIGHT ROCKET SHOTGUN LAUNCHER THINGY DEATH MACHINE.
local soundData = {
	name		= "MagnumLancer.ClipOut" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/magnum_lancer/clipout.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "MagnumLancer.ClipIn" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/magnum_lancer/clipin.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "MagnumLancer.Draw" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/magnum_lancer/draw.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "MagnumLancer.DrawB" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/magnum_lancer/draw_b_mode.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "MagnumLancer.MissileExplode" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/magnum_lancer/missile_explode.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "MagnumLancer.MissileReady" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/magnum_lancer/missile_ready.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "MagnumLancer.MissileReload" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/magnum_lancer/missile_reload.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "MagnumLancer.MissileShotLast" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/magnum_lancer/missile_shot_last.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "MagnumLancer.Fire" ,
	channel	 = CHAN_USER_BASE+11,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/magnum_lancer/fire.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "MagnumLancer.Fire2" ,
	channel	 = CHAN_USER_BASE+11,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/magnum_lancer/fire_2.wav"
}
 
sound.Add(soundData)
 
//K3 . Cyka Blyat!
local soundData = {
	name		= "K3.ClipOut1" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/k3/clipout_1.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "K3.ClipOut2" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/k3/clipout_2.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "K3.ClipIn1" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/k3/clipin_1.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "K3.ClipIn2" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/k3/clipin_2.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "K3.ClipIn3" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/k3/clipin_3.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "K3.Fire1" ,
	channel	 = CHAN_USER_BASE+11,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/k3/fire.wav"
}

sound.Add(soundData)
 
 //Ak47 . Make Stalin proud.
local soundData = {
	name		= "Ak47.ClipOut" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/ak47/clipout.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "Ak47.ClipIn" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/ak47/clipin.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "Ak47.Draw" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/ak47/draw.wav"
}

sound.Add(soundData)
 
local soundData = {
	name		= "Ak47.Fire" ,
	channel	 = CHAN_USER_BASE+11,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/ak47/fire1.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "Ak47.Fire2" ,
	channel	 = CHAN_USER_BASE+11,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/ak47/fire2.wav"
}

sound.Add(soundData)

 //Ak47_long . USSR Intensified.
local soundData = {
	name		= "Ak47_long.ClipOut" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/ak47_long/clipout.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "Ak47_long.ClipIn" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/ak47_long/clipin.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "Ak47_long.Draw" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/ak47_long/draw.wav"
}

sound.Add(soundData)
 
local soundData = {
	name		= "Ak47_long.Fire" ,
	channel	 = CHAN_USER_BASE+11,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/ak47_long/fire.wav"
}
 
sound.Add(soundData)
 
 //XM8
local soundData = {
	name		= "XM8.ClipOn" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/xm8/clipon.wav"
}

sound.Add(soundData)

local soundData = {
	name		= "XM8.ClipOut" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/xm8/clipout.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "XM8.ClipIn" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/xm8/clipin.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "XM8.Draw" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/xm8/draw.wav"
}

sound.Add(soundData)
 
local soundData = {
	name		= "XM8.Fire" ,
	channel	 = CHAN_USER_BASE+11,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/xm8/fire.wav"
}
 
sound.Add(soundData)

local soundData = {
	name		= "XM8.Fire2" ,
	channel	 = CHAN_USER_BASE+11,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/xm8/fire2.wav"
}
 
sound.Add(soundData)

TFA.AddWeaponSound( "XM8.Foley1", "weapons/tfa_cso/xm8/foley1.wav" )
TFA.AddWeaponSound( "XM8.Foley2", "weapons/tfa_cso/xm8/foley2.wav" )
TFA.AddWeaponSound( "XM8.Foley3", "weapons/tfa_cso/xm8/foley3.wav" )
TFA.AddWeaponSound( "XM8.Foley4", "weapons/tfa_cso/xm8/foley4.wav" )
TFA.AddWeaponSound( "XM8.Foley5", "weapons/tfa_cso/xm8/foley5.wav" )
TFA.AddWeaponSound( "XM8.Foley6", "weapons/tfa_cso/xm8/foley6.wav" )

//Skull7. m249ex
local soundData = {
	name		= "M249EX.ClipOut1" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/m249ex/clipout1.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "M249EX.ClipOut2" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/m249ex/clipout2.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "M249EX.ClipIn1" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/m249ex/clipin1.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "M249EX.ClipIn2" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/m249ex/clipin2.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "M249EX.ClipIn3" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/m249ex/clipin3.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "M249EX.Fire" ,
	channel	 = CHAN_USER_BASE+11,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/m249ex/fire.wav"
}

sound.Add(soundData)

//Dual Mp7a1. Double the fun
local soundData = {
	name		= "DMP7A1.Draw" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/dmp7a1/draw.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "DMP7A1.Drop" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/dmp7a1/drop.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "DMP7A1.Foley2" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/dmp7a1/foley2.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "DMP7A1.Foley4" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/dmp7a1/foley4.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "DMP7A1.Fire" ,
	channel	 = CHAN_USER_BASE+11,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/dmp7a1/fire.wav"
}

sound.Add(soundData)

//Mp7a1. Crappy SMG
local soundData = {
	name		= "MP7A1.Draw" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/mp7a1/draw.wav"
}
 
sound.Add(soundData)

local soundData = {
	name		= "MP7A1.ClipIn" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/mp7a1/clipin.wav"
}
 
sound.Add(soundData)

local soundData = {
	name		= "MP7A1.ClipOut" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/mp7a1/clipout.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "MP7A1.Foley1" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/mp7a1/foley1.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "MP7A1.Foley4" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/mp7a1/foley4.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "MP7A1.Fire" ,
	channel	 = CHAN_USER_BASE+11,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/mp7a1/fire.wav"
}

sound.Add(soundData)

//Mp7a160r. More bullets
local soundData = {
	name		= "MP7A160R.Draw" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/mp7a160r/draw.wav"
}
 
sound.Add(soundData)

local soundData = {
	name		= "MP7A160R.ClipIn" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/mp7a160r/clipin.wav"
}
 
sound.Add(soundData)

local soundData = {
	name		= "MP7A160R.ClipOut" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/mp7a160r/clipout.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "MP7A160R.Foley1" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/mp7a160r/foley1.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "MP7A160R.Fire" ,
	channel	 = CHAN_USER_BASE+11,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/mp7a160r/fire.wav"
}

sound.Add(soundData)

//MG3. Buzzsaw
local soundData = {
	name		= "MG3.Open" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/mg3/open.wav"
}
 
sound.Add(soundData)

local soundData = {
	name		= "MG3.ClipIn" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/mg3/clipin.wav"
}
 
sound.Add(soundData)

local soundData = {
	name		= "MG3.ClipOut" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/mg3/clipout.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "MG3.Close" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/mg3/close.wav"
}
 
sound.Add(soundData)

local soundData = {
	name		= "MG3.ClipLock" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/mg3/cliplock.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "MG3.Fire" ,
	channel	 = CHAN_USER_BASE+11,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/mg3/fire.wav"
}

sound.Add(soundData)

//an94
local soundData = {
	name		= "AN94.Draw" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/an94/draw.wav"
}
 
sound.Add(soundData)

local soundData = {
	name		= "AN94.ClipIn" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/an94/clipin.wav"
}
 
sound.Add(soundData)

local soundData = {
	name		= "AN94.ClipOut" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/an94/clipout.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "AN94.Boltpull" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/an94/boltpull.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "AN94.Fire" ,
	channel	 = CHAN_USER_BASE+11,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/an94/fire.wav"
}

sound.Add(soundData)

//Arx160
local soundData = {
	name		= "ARX160.ClipIn" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/arx160/clipin.wav"
}
 
sound.Add(soundData)

local soundData = {
	name		= "ARX160.ClipOut" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/arx160/clipout.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "ARX160.Draw" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/arx160/draw.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "ARX160.Fire" ,
	channel	 = CHAN_USER_BASE+11,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/arx160/fire.wav"
}

sound.Add(soundData)

//Deagle. One Deagle
local soundData = {
	name		= "DEAGLE.ClipIn" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/deagle/clipin.wav"
}
 
sound.Add(soundData)

local soundData = {
	name		= "DEAGLE.ClipOut" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/deagle/clipout.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "DEAGLE.Draw" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/deagle/draw.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "DEAGLE.Fire" ,
	channel	 = CHAN_USER_BASE+11,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/deagle/fire.wav"
}

sound.Add(soundData)

local soundData = {
	name		= "DEAGLE.Fire2" ,
	channel	 = CHAN_USER_BASE+11,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/deagle/fire2.wav"
}

sound.Add(soundData)

//M16A1EP. WIFI needed
local soundData = {
	name		= "M16A1EP.ClipIn" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/m16a1ep/clipin.wav"
}
 
sound.Add(soundData)

local soundData = {
	name		= "M16A1EP.ClipOut" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/m16a1ep/clipout.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "M16A1EP.Draw" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/m16a1ep/draw.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "M16A1EP.Fire" ,
	channel	 = CHAN_USER_BASE+11,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/m16a1ep/fire1.wav"
}

sound.Add(soundData)

local soundData = {
	name		= "M16A1EP.Fire2" ,
	channel	 = CHAN_USER_BASE+11,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/m16a1ep/fire2.wav"
}

sound.Add(soundData)

local soundData = {
	name		= "M16A1EP.Fire3" ,
	channel	 = CHAN_USER_BASE+11,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/m16a1ep/fire3.wav"
}

sound.Add(soundData)

local soundData = {
	name		= "M16A1EP.Fire4" ,
	channel	 = CHAN_USER_BASE+11,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/m16a1ep/fire4.wav"
}

sound.Add(soundData)

//P90
local soundData = {
	name		= "P90.ClipIn" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/p90/clipin.wav"
}
 
sound.Add(soundData)

local soundData = {
	name		= "P90.ClipOut" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/p90/clipout.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "P90.Draw" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/p90/draw.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "P90.Fire" ,
	channel	 = CHAN_USER_BASE+11,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/p90/fire.wav"
}

sound.Add(soundData)

local soundData = {
	name		= "P90.ClipRelease" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/p90/cliprelease.wav"
}
 
sound.Add(soundData)

//SVD
local soundData = {
	name		= "SVD.ClipIn" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/svd/clipin.wav"
}
 
sound.Add(soundData)

local soundData = {
	name		= "SVD.ClipOut" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/svd/clipout.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "SVD.Draw" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/svd/draw.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "SVD.Fire" ,
	channel	 = CHAN_USER_BASE+11,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/svd/fire.wav"
}

sound.Add(soundData)

local soundData = {
	name		= "SVD.ClipOn" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/svd/clipon.wav"
}
 
sound.Add(soundData)

//MG42. Modern Buzzsaw
local soundData = {
	name		= "MG42.Open" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/mg42/open.wav"
}
 
sound.Add(soundData)

local soundData = {
	name		= "MG42.ClipIn1" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/mg42/clipin1.wav"
}
 
sound.Add(soundData)

local soundData = {
	name		= "MG42.ClipIn2" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/mg42/clipin2.wav"
}
 
sound.Add(soundData)

local soundData = {
	name		= "MG42.ClipOut" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/mg42/clipout.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "MG42.Close" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/mg42/close.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "MG42.Fire" ,
	channel	 = CHAN_USER_BASE+11,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/mg42/fire.wav"
}

sound.Add(soundData)

//M16A4. 
local soundData = {
	name		= "M16A4.ClipIn" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/m16a4/clipin.wav"
}
 
sound.Add(soundData)

local soundData = {
	name		= "M16A4.ClipOut" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/m16a4/clipout.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "M16A4.Draw" ,
	channel	 = CHAN_WEAPON,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/m16a4/draw.wav"
}
 
sound.Add(soundData)
 
local soundData = {
	name		= "M16A4.Fire" ,
	channel	 = CHAN_USER_BASE+11,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/m16a4/fire1.wav"
}

sound.Add(soundData)

local soundData = {
	name		= "M16A4.Fire2" ,
	channel	 = CHAN_USER_BASE+11,
	volume	  = 1,
	soundlevel  = 80,
	pitchstart  = 100,
	pitchend	= 100,
	sound	   = "weapons/tfa_cso/m16a4/fire2.wav"
}

sound.Add(soundData)