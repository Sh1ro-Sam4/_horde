--TFA.AddFireSound( "Gun.Fire", "weapons/tfa_cso/gun/fire.wav", false, "^" )
--TFA.AddWeaponSound( "Gun.Reload", "weapons/tfa_cso/gun/reload.wav" )

--Galil maverick
TFA.AddFireSound( "GalilCraft.Fire", "weapons/tfa_cso/galilcraft/fire.wav", false, "^" )
TFA.AddWeaponSound( "GalilCraft.ClipIn", "weapons/tfa_cso/galilcraft/clipin.wav")
TFA.AddWeaponSound( "GalilCraft.ClipOut", "weapons/tfa_cso/galilcraft/clipout.wav")
TFA.AddWeaponSound( "GalilCraft.Boltpull", "weapons/tfa_cso/galilcraft/boltpull.wav")

--Hunter Killer X-12
TFA.AddFireSound( "X-12.Fire", "weapons/tfa_cso/x-12/fire.wav", false, "^" )
TFA.AddWeaponSound( "X-12.Draw", "weapons/tfa_cso/x-12/draw.wav" )
TFA.AddWeaponSound( "X-12.ClipIn1", "weapons/tfa_cso/x-12/clipin1.wav" )
TFA.AddWeaponSound( "X-12.ClipIn2", "weapons/tfa_cso/x-12/clipin2.wav" )
TFA.AddWeaponSound( "X-12.ClipOut1", "weapons/tfa_cso/x-12/clipout1.wav" )
TFA.AddWeaponSound( "X-12.ClipOut2", "weapons/tfa_cso/x-12/clipout2.wav" )


//StarChaser AR. Shooting AUG

TFA.AddFireSound( "StarAR.Fire2", "weapons/tfa_cso/starchaserar/fire2.wav", false, "^" )

local soundData = {
    name        = "StarAR.Idle" ,
    channel     = CHAN_WEAPON,
    volume      = 1,
    soundlevel  = 80,
    pitchstart  = 100,
    pitchend    = 100,
    sound       = "weapons/tfa_cso/starchaserar/idle.wav"
}

sound.Add(soundData)

--Electron-V
TFA.AddFireSound( "ElectronV.Fire", "weapons/tfa_cso/electronv/fire.wav", false, "^" )
TFA.AddFireSound( "ElectronV.Fire2", "weapons/tfa_cso/electronv/fire2.wav", false, "^" )
TFA.AddFireSound( "ElectronV.Fire3", "weapons/tfa_cso/electronv/fire3.wav", false, "^" )
TFA.AddFireSound( "ElectronV.Exp2", "weapons/tfa_cso/electronv/exp2.wav", false, "^" )
TFA.AddFireSound( "ElectronV.Exp3", "weapons/tfa_cso/electronv/exp3.wav", false, "^" )
TFA.AddWeaponSound( "ElectronV.Draw", "weapons/tfa_cso/electronv/draw.wav" )
TFA.AddWeaponSound( "ElectronV.Idle1", "weapons/tfa_cso/electronv/idle1.wav" )
TFA.AddWeaponSound( "ElectronV.Idle2", "weapons/tfa_cso/electronv/idle2.wav" )
TFA.AddWeaponSound( "ElectronV.Idle3", "weapons/tfa_cso/electronv/idle3.wav" )
TFA.AddWeaponSound( "ElectronV.ClipIn", "weapons/tfa_cso/electronv/clipin.wav" )
TFA.AddWeaponSound( "ElectronV.ClipOut", "weapons/tfa_cso/electronv/clipout.wav" )

--Sepctre M4
TFA.AddFireSound( "Spectre.Fire", "weapons/tfa_cso/spectre/fire.wav", false, "^" )
TFA.AddWeaponSound ( "Spectre.ClipOut", "weapons/tfa_cso/spectre/clipout.wav" )
TFA.AddWeaponSound ( "Spectre.ClipIn", "weapons/tfa_cso/spectre/clipin.wav" )
TFA.AddWeaponSound ( "Spectre.Foley1", "weapons/tfa_cso/spectre/foley1.wav" )
TFA.AddWeaponSound ( "Spectre.Draw", "weapons/tfa_cso/spectre/draw.wav" )

--Lightning Fury
TFA.AddFireSound( "Jetgun.Fire", "weapons/tfa_cso/jetgun/fire.wav", false, "^" )
TFA.AddWeaponSound( "Jetgun.Fire_End", "weapons/tfa_cso/jetgun/fire_end.wav", false, "^" )
TFA.AddWeaponSound( "Jetgun.Dash", "weapons/tfa_cso/jetgun/dash.wav", false, "^" )
TFA.AddWeaponSound( "Jetgun.Idle", "weapons/tfa_cso/jetgun/idle.wav" )
TFA.AddWeaponSound( "Jetgun.Draw", "weapons/tfa_cso/jetgun/draw.wav" )
TFA.AddWeaponSound( "Jetgun.Reload", "weapons/tfa_cso/jetgun/reload.wav" )
TFA.AddWeaponSound( "Jetgun.Beep", "weapons/tfa_cso/jetgun/beep.wav" )

--Bear Buster
TFA.AddFireSound( "BearBuster.Fire", "weapons/tfa_cso/bearbuster/fire.wav", false, "^" )
TFA.AddWeaponSound( "BearBuster.Fire2", "weapons/tfa_cso/bearbuster/fire2.wav", false, "^" )
TFA.AddWeaponSound( "BearBuster.Draw", "weapons/tfa_cso/bearbuster/draw.wav" )
TFA.AddWeaponSound( "BearBuster.Reload", "weapons/tfa_cso/bearbuster/reload.wav" )
TFA.AddWeaponSound( "BearBuster.Beep", "weapons/tfa_cso/bearbuster/beep.wav" )

--Bear Fury MK-1
TFA.AddFireSound( "BearFuryMK1.Fire", "weapons/tfa_cso/bearfurymk1/fire.wav", false, "^" )
TFA.AddWeaponSound( "BearFuryMK1.Dash", "weapons/tfa_cso/bearfurymk1/dash.wav", false, "^" )
TFA.AddWeaponSound( "BearFuryMK1.Draw", "weapons/tfa_cso/bearfurymk1/draw.wav" )
TFA.AddWeaponSound( "BearFuryMK1.Reload", "weapons/tfa_cso/bearfurymk1/reload.wav" )

--Bear Fury MK-2
TFA.AddWeaponSound( "BearFuryMK2.Dash", "weapons/tfa_cso/bearfurymk2/dash.wav", false, "^" )
TFA.AddWeaponSound( "BearFuryMK2.Draw", "weapons/tfa_cso/bearfurymk2/draw.wav" )
TFA.AddWeaponSound( "BearFuryMK2.Reload", "weapons/tfa_cso/bearfurymk2/reload.wav" )

--Bear Fury MK-3
TFA.AddFireSound( "BearFuryMK3.Fire", "weapons/tfa_cso/bearfurymk3/fire.wav", false, "^" )
TFA.AddWeaponSound( "BearFuryMK3.Fire_End", "weapons/tfa_cso/bearfurymk3/fire_end.wav", false, "^" )
TFA.AddWeaponSound( "BearFuryMK3.Dash", "weapons/tfa_cso/bearfurymk3/dash.wav", false, "^" )
TFA.AddWeaponSound( "BearFuryMK3.Draw", "weapons/tfa_cso/bearfurymk3/draw.wav" )
TFA.AddWeaponSound( "BearFuryMK3.Reload", "weapons/tfa_cso/bearfurymk3/reload.wav" )

--Twin Hawk
TFA.AddFireSound( "RocketPistol.Fire_Loop", "weapons/tfa_cso/rocketpistol/fire_loop.wav", false, "^" )
TFA.AddWeaponSound( "RocketPistol.Fire_End", "weapons/tfa_cso/rocketpistol/fire_end.wav", false, "^" )
TFA.AddWeaponSound( "RocketPistol.Fire2", "weapons/tfa_cso/rocketpistol/fire2.wav", false, "^" )
TFA.AddWeaponSound( "RocketPistol.Draw", "weapons/tfa_cso/rocketpistol/draw.wav" )
TFA.AddWeaponSound( "RocketPistol.Reload", "weapons/tfa_cso/rocketpistol/reload.wav" )
TFA.AddWeaponSound( "RocketPistol.Fire1", "weapons/tfa_cso/rocketpistol/fire1.wav" )