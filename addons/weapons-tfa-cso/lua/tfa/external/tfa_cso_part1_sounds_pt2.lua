//This is just here to make sure gun sounds are loaded on clients properly
//because I don't know how to make good autorun lua that works on clients in MP
//Yes I had to make two, I hit the local limit on the first one

//K1A Maverick. A shame I had to skip the K1A itself. It's skeleton wouldn't cooperate.
local soundData = {
	name 		= "K1AMaverick.ClipOut" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/k1amaverick/clipout.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "K1AMaverick.ClipOut2" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/k1amaverick/clipout2.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "K1AMaverick.ClipIn" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/k1amaverick/clipin.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "K1AMaverick.BoltPull" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/k1amaverick/boltpull.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "K1AMaverick.Draw" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/k1amaverick/draw.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "K1AMaverick.Fire" ,
	channel 	= CHAN_USER_BASE+11,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/k1amaverick/fire.wav"
}

sound.Add(soundData)

//AK-74. Gotta love that snub barrel.
local soundData = {
	name 		= "AK74U.ClipOut" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/ak74u/clipout.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "AK74U.ClipIn" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/ak74u/clipin.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "AK74U.BoltPull" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/ak74u/boltpull.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "AK74U.Draw" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/ak74u/draw.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "AK74U.Fire" ,
	channel 	= CHAN_USER_BASE+11,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/ak74u/fire.wav"
}

sound.Add(soundData)

//Colt M1911-A1. An American classic.
local soundData = {
	name 		= "M1911A1.ClipIn" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/m1911a1/clipin.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "M1911A1.SlideBack" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/m1911a1/slideback.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "M1911A1.ClipOut" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/m1911a1/clipout.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "M1911A1.Fire" ,
	channel 	= CHAN_USER_BASE+11,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/m1911a1/fire.wav"
}

sound.Add(soundData)

//Thompson M1928.  This actually gives sounds to four guns.
local soundData = {
	name 		= "Thompson.ClipIn" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/thompson/clipin.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "Thompson.Draw" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/thompson/draw.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "Thompson.ClipOut" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/thompson/clipout.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "Thompson.Fire" ,
	channel 	= CHAN_USER_BASE+11,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/thompson/fire.wav"
}

sound.Add(soundData)

//HK G11. Gotta love that unique tube magazine.
local soundData = {
	name 		= "G11.ClipOut" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/g11/clipout.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "G11.ClipIn1" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/g11/clipin_1.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "G11.ClipIn2" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/g11/clipin_2.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "G11.Draw" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/g11/draw.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "G11.Fire" ,
	channel 	= CHAN_USER_BASE+11,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/g11/fire.wav"
}

sound.Add(soundData)

//QBS-09. Not the best of shotguns...
local soundData = {
	name 		= "QBS09.Insert" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/qbs09/insert.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "QBS09.Reload" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/qbs09/reload.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "QBS09.StartReload" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/qbs09/start_reload.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "QBS09.Draw" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/qbs09/draw.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "QBS09.Fire" ,
	channel 	= CHAN_USER_BASE+11,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/qbs09/fire.wav"
}

sound.Add(soundData)

//Gilboa Viper. Double the barrels, double the fun!
local soundData = {
	name 		= "GilboaViper.ClipOut" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/gilboaviper/clipout.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "GilboaViper.ClipIn1" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/gilboaviper/clipin_1.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "GilboaViper.ClipIn2" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/gilboaviper/clipin_2.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "GilboaViper.Fire" ,
	channel 	= CHAN_USER_BASE+11,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/gilboaviper/fire.wav"
}

sound.Add(soundData)

//FNP-45. Gotta love those animations.
local soundData = {
	name 		= "FNP45.ClipOut" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/fnp45/clipout.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "FNP45.ClipIn1" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/fnp45/clipin_1.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "FNP45.ClipIn2" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/fnp45/clipin_2.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "FNP45.Draw" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/fnp45/draw.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "FNP45.Fire" ,
	channel 	= CHAN_USER_BASE+11,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/fnp45/fire.wav"
}

sound.Add(soundData)

//MK3A1 Flame. I decided to not make it burn things, because it makes zombies unkillable.
local soundData = {
	name 		= "MK3A1Flame.ClipIn" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/mk3a1flame/clipin.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "MK3A1Flame.BoltPull" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/mk3a1flame/boltpull.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "MK3A1Flame.Draw" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/mk3a1flame/draw.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "MK3A1Flame.Fire" ,
	channel 	= CHAN_USER_BASE+11,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/mk3a1flame/fire.wav"
}

sound.Add(soundData)

//TURBULENT-7. The first of the new ANTI-ZOMBIE series.
local soundData = {
	name 		= "TURBULENT7.ClipIn1" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/turbulent7/clipin_1.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "TURBULENT7.ClipOut" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/turbulent7/clipout.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "TURBULENT7.BoltPull" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/turbulent7/boltpull.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "TURBULENT7.Draw" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/turbulent7/draw.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "TURBULENT7.ClipIn2" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/turbulent7/clipin_2.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "TURBULENT7.Idle" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/turbulent7/idle.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "TURBULENT7.Fire" ,
	channel 	= CHAN_USER_BASE+11,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/turbulent7/fire.wav"
}

sound.Add(soundData)

//Lycamthrope. This thing uses 9 materials. NINE!
local soundData = {
	name 		= "Lycanthrope.Draw" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/lycanthrope/draw.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "Lycanthrope.Reload" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/lycanthrope/reload.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "Lycanthrope.Idle" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/lycanthrope/idle.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "Lycanthrope.Fire" ,
	channel 	= CHAN_USER_BASE+11,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/lycanthrope/fire.wav"
}

sound.Add(soundData)

//Chain Grenade. No idea how I'm going to make this work.
local soundData = {
	name 		= "ChainGrenade.Draw" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/chaingrenade/draw.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "ChainGrenade.PullPin" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/chaingrenade/pullpin.wav"
}

sound.Add(soundData)

//Cake Grenade. HAPPY BIRTHDAY TO THE GROUND

local soundData = {
	name 		= "Cake.HAPPYBIRTHDAYTOTHEGROUND" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/cake/happybirthdaytotheground.wav"
}

sound.Add(soundData)

//Uzi. Getting all L4D1 up in here.
local soundData = {
	name 		= "UZI.Draw" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/uzi/draw.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "UZI.ClipOut" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/uzi/clipout.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "UZI.ClipIn" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/uzi/clipin.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "UZI.BoltPull" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/uzi/boltpull.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "UZI.Fire" ,
	channel 	= CHAN_USER_BASE+11,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/uzi/fire.wav"
}

sound.Add(soundData)

//Black Dragon Cannon. Woo.
local soundData = {
	name 		= "Cannon.Draw" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/blackdragoncannon/draw.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "Cannon.Fire" ,
	channel 	= CHAN_USER_BASE+11,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/blackdragoncannon/fire.wav"
}

sound.Add(soundData)

//MG36. Those dual drum mags tho
local soundData = {
	name 		= "MG36.Draw" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/mg36/draw.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "MG36.ClipOut" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/mg36/clipout.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "MG36.ClipIn" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/mg36/clipin.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "MG36.BoltPull" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/mg36/boltpull.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "MG36.Fire" ,
	channel 	= CHAN_USER_BASE+11,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/mg36/fire.wav"
}

sound.Add(soundData)

//Mauser C96. Great pistol.
local soundData = {
	name 		= "MauserC96.Draw" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/mauserc96/draw.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "MauserC96.ClipOut" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/mauserc96/clipout.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "MauserC96.ClipIn" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/mauserc96/clipin.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "MauserC96.BoltPull" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/mauserc96/boltpull.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "MauserC96.Fire" ,
	channel 	= CHAN_USER_BASE+11,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/mauserc96/fire.wav"
}

sound.Add(soundData)

//SCAR-L.
local soundData = {
	name 		= "SCAR.ClipOut" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/scar_l/clipout.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "SCAR.ClipIn" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/scar_l/clipin.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "SCAR.Draw" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/scar_l/draw.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "SCAR.Fire" ,
	channel 	= CHAN_USER_BASE+11,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/scar_l/fire.wav"
}

sound.Add(soundData)

//Norinco Type 86S.
local soundData = {
	name 		= "Norinco86s.ClipOut" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/norinco_86s/clipout.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "Norinco86s.ClipIn" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/norinco_86s/clipin.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "Norinco86s.BoltPull" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/norinco_86s/boltpull.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "Norinco86s.Draw" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/norinco_86s/draw.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "Norinco86s.Fire" ,
	channel 	= CHAN_USER_BASE+11,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/norinco_86s/fire.wav"
}

sound.Add(soundData)

//TAR-21.
local soundData = {
	name 		= "TAR21.ClipIn" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/tar_21/clipin.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "TAR21.BoltPull" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/tar_21/boltpull.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "TAR21.ClipOut" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/tar_21/clipout.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "TAR21.Fire" ,
	channel 	= CHAN_USER_BASE+11,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/tar_21/fire.wav"
}

sound.Add(soundData)

//Batista.
local soundData = {
	name 		= "Batista.Draw" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/batista/draw.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "Batista.Idle" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/batista/idle.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "Batista.Reload" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/batista/reload.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "Batista.Fire" ,
	channel 	= CHAN_USER_BASE+11,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/batista/fire.wav"
}

sound.Add(soundData)

//KSG-12.
local soundData = {
	name 		= "KSG12.AfterReload" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/ksg_12/after_reload.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "KSG12.StartReload" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/ksg_12/start_reload.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "KSG12.Insert" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/ksg_12/insert.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "KSG12.Fire" ,
	channel 	= CHAN_USER_BASE+11,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/ksg_12/fire.wav"
}

sound.Add(soundData)

//M950 Attack.
local soundData = {
	name 		= "M950Attack.ClipOut" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/m950_attack/clipout.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "M950Attack.ClipIn1" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/m950_attack/clipin_1.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "M950Attack.ClipIn2" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/m950_attack/clipin_2.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "M950Attack.BoltPull" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/m950_attack/boltpull.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "M950Attack.Fire" ,
	channel 	= CHAN_USER_BASE+11,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/m950_attack/fire.wav"
}

sound.Add(soundData)

//UTS-15.
local soundData = {
	name 		= "UTS15.AfterReload" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/uts_15/reload.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "UTS15.Insert" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/uts_15/insert.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "UTS15.Draw" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/uts_15/draw.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "UTS15.Fire" ,
	channel 	= CHAN_USER_BASE+11,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/uts_15/fire.wav"
}

sound.Add(soundData)

//Plasma Gun. Green goo versus the world! (sounds like some hentai concept :v)
local soundData = {
	name 		= "PlasmaGun.Idle" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/plasma_gun/idle.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "PlasmaGun.ClipOut" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/plasma_gun/clipout.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "PlasmaGun.ClipIn1" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/plasma_gun/clipin_1.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "PlasmaGun.ClipIn2" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/plasma_gun/clipin_2.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "PlasmaGun.Draw" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/plasma_gun/draw.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "PlasmaGun.Fire" ,
	channel 	= CHAN_USER_BASE+11,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/plasma_gun/fire.wav"
}

sound.Add(soundData)

//Fabrique Nationale F2000. The AUG's older brother.
local soundData = {
	name 		= "F2000.BoltPull" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/f2000/boltpull.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "F2000.ClipOut" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/f2000/clipout.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "F2000.ClipIn" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/f2000/clipin.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "F2000.ClipOn" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/f2000/clipon.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "F2000.Draw" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/f2000/draw.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "F2000.Fire" ,
	channel 	= CHAN_USER_BASE+11,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/f2000/fire.wav"
}

sound.Add(soundData)

//Special Duck Foot Gun. Oh boy.
local soundData = {
	name 		= "DuckGun.BoltPull" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/duck_gun/boltpull.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "DuckGun.ClipOut1" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/duck_gun/clipout1.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "DuckGun.ClipOut2" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/duck_gun/clipout2.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "DuckGun.ClipIn1" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/duck_gun/clipin1.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "DuckGun.ClipIn2" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/duck_gun/clipin2.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "DuckGun.Draw" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/duck_gun/clipin2.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "DuckGun.Fire" ,
	channel 	= CHAN_USER_BASE+11,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/duck_gun/fire.wav"
}

sound.Add(soundData)

//M-1887. Pew pew like it's MW2.
local soundData = {
	name 		= "M1887.ReStart" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/m1887/restart.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "M1887.Insert" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/m1887/insert.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "M1887.Draw" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/m1887/draw.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "M1887.Fire" ,
	channel 	= CHAN_USER_BASE+11,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/m1887/fire.wav"
}

sound.Add(soundData)

//HK121 Custom. First ported gun to support a fucking grenade launcher.
local soundData = {
	name 		= "HK121_Custom.ClipOut1" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/hk121_custom/clipout_1.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "HK121_Custom.ClipOut2" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/hk121_custom/clipout_2.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "HK121_Custom.ClipIn1" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/hk121_custom/clipin_1.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "HK121_Custom.ClipIn2" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/hk121_custom/clipin_2.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "HK121_Custom.ClipIn3" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/hk121_custom/clipin_3.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "HK121_Custom.ClipIn4" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/hk121_custom/clipin_4.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "HK121_Custom.Draw" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/hk121_custom/draw.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "HK121_Custom.Fire1" ,
	channel 	= CHAN_USER_BASE+11,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/hk121_custom/fire_1.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "HK121_Custom.Fire2" ,
	channel 	= CHAN_USER_BASE+11,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/hk121_custom/fire_2.wav"
}

sound.Add(soundData)

//M-1887 Maverick.
local soundData = {
	name 		= "M1887_Maverick.AfterReload" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/m1887_craft/after_reload.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "M1887_Maverick.Insert" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/m1887_craft/insert.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "M1887_Maverick.Draw" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/m1887_craft/draw.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "M1887_Maverick.StartReload" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/m1887_craft/draw.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "M1887_Maverick.Fire" ,
	channel 	= CHAN_USER_BASE+11,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/m1887_craft/fire.wav"
}

sound.Add(soundData)

//Rail Cannon. Chances are I can't code the secondary fire.
local soundData = {
	name 		= "RailCannon.Draw" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/railcannon/draw.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "RailCannon.ClipOut" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/railcannon/clipout.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "RailCannon.ClipIn" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/railcannon/clipin.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "RailCannon.Charge.Stage1_Start" ,
	channel 	= CHAN_USER_BASE+11,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/railcannon/charge_stage1_start.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "RailCannon.Charge.Stage2" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/railcannon/charge_stage2.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "RailCannon.Charge.Stage3" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/railcannon/charge_stage3.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "RailCannon.Charge.Stage3_Loop" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/railcannon/charge_stage3_loop.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "RailCannon.Fire" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/railcannon/fire.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "RailCannon.Fire2" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/railcannon/fire2.wav"
}

sound.Add(soundData)

//Anaconda. More revolvers!
local soundData = {
	name 		= "Anaconda.Foley1" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/anaconda/foley_1.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "Anaconda.Foley2" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/anaconda/foley_2.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "Anaconda.Foley3" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/anaconda/foley_3.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "Anaconda.Foley4" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/anaconda/foley_4.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "Anaconda.Foley5" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/anaconda/foley_5.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "Anaconda.Fire" ,
	channel 	= CHAN_USER_BASE+11,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/anaconda/fire.wav"
}

sound.Add(soundData)

//FG-Launcher. Can you help me make it shoot actual fireworks? Let me know!
local soundData = {
	name 		= "FGLauncher.ClipOut1" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/fglauncher/clipout_1.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "FGLauncher.ClipOut2" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/fglauncher/clipout_2.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "FGLauncher.ClipIn1" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/fglauncher/clipin_1.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "FGLauncher.ClipIn2" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/fglauncher/clipin_2.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "FGLauncher.ClipIn3" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/fglauncher/clipin_3.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "FGLauncher.Draw" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/fglauncher/draw.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "FGLauncher.Fire" ,
	channel 	= CHAN_USER_BASE+11,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/fglauncher/fire.wav"
}

sound.Add(soundData)

//Thunderbolt. Pew-pew

local soundData = {
	name 		= "ThunderBolt.Draw" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/thunderbolt/draw.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "ThunderBolt.Idle" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/thunderbolt/idle.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "ThunderBolt.Fire" ,
	channel 	= CHAN_USER_BASE+11,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/thunderbolt/fire.wav"
}

sound.Add(soundData)

//VULCANUS-1. Dual M1911s anyone?

TFA.AddWeaponSound( "VULCANUS1.Draw", "weapons/tfa_cso/vulcanus1/draw.wav" )
TFA.AddWeaponSound( "VULCANUS1.ClipOut", "weapons/tfa_cso/vulcanus1/clipout.wav" )
TFA.AddWeaponSound( "VULCANUS1.ClipInA", "weapons/tfa_cso/vulcanus1/clipin_a.wav" )
TFA.AddWeaponSound( "VULCANUS1.Reload", "weapons/tfa_cso/vulcanus1/reload.wav" )
TFA.AddWeaponSound( "VULCANUS1.DrawB", "weapons/tfa_cso/vulcanus1/draw_b.wav" )
TFA.AddWeaponSound( "VULCANUS1.ClipInB", "weapons/tfa_cso/vulcanus1/clipin_b.wav" )
TFA.AddWeaponSound( "VULCANUS1.ChangeToA", "weapons/tfa_cso/vulcanus1/change_to_a.wav" )
TFA.AddWeaponSound( "VULCANUS1.ChangeToB", "weapons/tfa_cso/vulcanus1/change_to_b.wav" )

local soundData = {
	name 		= "VULCANUS1.Fire" ,
	channel 	= CHAN_USER_BASE+11,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/vulcanus1/fire_a.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "VULCANUS1.FireB" ,
	channel 	= CHAN_USER_BASE+11,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/vulcanus1/fire_b.wav"
}

sound.Add(soundData)

//Camera Gun. Here comes the paparazii
local soundData = {
	name 		= "CameraGun.Draw" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/camera_gun/draw.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "CameraGun.Reload" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/camera_gun/reload.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "CameraGun.Fire" ,
	channel 	= CHAN_USER_BASE+11,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/camera_gun/fire.wav"
}

sound.Add(soundData)

//Water Gun. Not safe, though!
local soundData = {
	name 		= "WaterGun.Draw" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/water_gun/draw.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "WaterGun.Pump" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/water_gun/pump.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "WaterGun.ClipOut" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/water_gun/clipout.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "WaterGun.ClipIn" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/water_gun/clipin.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "WaterGun.Fire" ,
	channel 	= CHAN_USER_BASE+11,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/water_gun/fire.wav"
}

sound.Add(soundData)

//Mk 48. MORE LMGS!
local soundData = {
	name 		= "MK48.ClipOut1" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/mk48/clipout_1.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "MK48.ClipOut2" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/mk48/clipout_2.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "MK48.ClipIn1" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/mk48/clipin_1.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "MK48.ClipIn2" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/mk48/clipin_2.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "MK48.ClipIn3" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/mk48/clipin_3.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "MK48.Fire" ,
	channel 	= CHAN_USER_BASE+11,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/mk48/fire.wav"
}

sound.Add(soundData)

//WA-2000. Great sniper.
local soundData = {
	name 		= "WA2000.ClipOut1" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/wa2000/clipout_1.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "WA2000.ClipIn1" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/wa2000/clipin_1.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "WA2000.ClipIn2" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/wa2000/clipin_2.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "WA2000.BoltPull" ,
	channel 	= CHAN_WEAPON,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/wa2000/boltpull.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "WA2000.Fire" ,
	channel 	= CHAN_USER_BASE+11,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/wa2000/fire.wav"
}

sound.Add(soundData)

//OICW. Complete with grenade launcher.

sound.Add({
	['name'] = "OICW.Fire",
	['channel'] = CHAN_USER_BASE+11,
	['sound'] = { "weapons/tfa_cso/oicw/fire.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "OICW.Fire_Nade",
	['channel'] = CHAN_USER_BASE+11,
	['sound'] = { "weapons/tfa_cso/oicw/fire_nade.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "OICW.Fire_Nade_Last",
	['channel'] = CHAN_USER_BASE+11,
	['sound'] = { "weapons/tfa_cso/oicw/fire_nade_last.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "OICW.Foley1",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/oicw/foley_1.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "OICW.Foley2",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/oicw/foley_2.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "OICW.Foley3",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/oicw/foley_3.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "OICW.Move_G",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/oicw/move_grenade.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "OICW.Move_C",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/oicw/move_carbine.wav"},
	['pitch'] = {100,100}
})