//This is just here to make sure gun sounds are loaded on clients properly
//Just make this so i don't get confused
//AAF

//Brick Piece V2
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

//Newcomen Update 2023
TFA.AddFireSound( "Newcomen.Fire2", "weapons/tfa_cso/newcomen/fire2.wav", false, "^" )

TFA.AddFireSound( "M79_Summer.Fire", "weapons/tfa_cso/summersplash/m79_fire.wav", false, "^" )
TFA.AddFireSound( "UTS15_Summer.Fire", "weapons/tfa_cso/summersplash/uts15_fire.wav", false, "^" )

//M134 Minigun
TFA.AddFireSound( "M134.Fire", "weapons/tfa_cso/m134/fire.wav", false, "^" )
TFA.AddWeaponSound( "M134.PinPull", "weapons/tfa_cso/m134/pinpull.wav")
TFA.AddWeaponSound( "M134.ClipOff", "weapons/tfa_cso/m134/clipoff.wav")
TFA.AddWeaponSound( "M134.ClipOn", "weapons/tfa_cso/m134/clipon.wav")