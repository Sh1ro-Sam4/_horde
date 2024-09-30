--TFA.AddFireSound( "Gun.Fire", "weapons/tfa_cso/gun/fire.wav", false, "^" )
--TFA.AddWeaponSound( "Gun.Reload", "weapons/tfa_cso/gun/reload.wav" )

--Gunkata
TFA.AddFireSound( "Gunkata.Fire", "weapons/tfa_cso/gunkata/fire.wav", false, "^" )
TFA.AddFireSound( "Gunkata.Skill_Explode", "weapons/tfa_cso/gunkata/skill_last_exp.wav", false, "^" )
TFA.AddWeaponSound( "Gunkata.Reload", "weapons/tfa_cso/gunkata/reload.wav" )
TFA.AddWeaponSound( "Gunkata.Reload2", "weapons/tfa_cso/gunkata/reload2.wav" )
TFA.AddWeaponSound( "Gunkata.Draw2", "weapons/tfa_cso/gunkata/draw2.wav" )
TFA.AddWeaponSound( "Gunkata.Draw", "weapons/tfa_cso/gunkata/draw.wav" )
TFA.AddWeaponSound( "Gunkata.Idle", "weapons/tfa_cso/gunkata/idle.wav" )
TFA.AddWeaponSound( "Gunkata.Skill1", "weapons/tfa_cso/gunkata/skill_01.wav" )
TFA.AddWeaponSound( "Gunkata.Skill2", "weapons/tfa_cso/gunkata/skill_02.wav" )
TFA.AddWeaponSound( "Gunkata.Skill3", "weapons/tfa_cso/gunkata/skill_03.wav" )
TFA.AddWeaponSound( "Gunkata.Skill4", "weapons/tfa_cso/gunkata/skill_04.wav" )
TFA.AddWeaponSound( "Gunkata.Skill5", "weapons/tfa_cso/gunkata/skill_05.wav" )
TFA.AddWeaponSound( "Gunkata.Skilllast", "weapons/tfa_cso/gunkata/skill_last.wav" )
TFA.AddWeaponSound( "Gunkata.SkilllastExp", "weapons/tfa_cso/gunkata/skill_last_exp.wav" )
TFA.AddWeaponSound( "Gunkata.Hit1", "weapons/tfa_cso/gunkata/hit1.wav" )
TFA.AddWeaponSound( "Gunkata.Hit2", "weapons/tfa_cso/gunkata/hit2.wav" )

--Laserfist
TFA.AddFireSound( "Laserfist.FireA", "weapons/tfa_cso/laserfist/fire_a.wav", false, "^" )
TFA.AddFireSound( "Laserfist.FireB", "weapons/tfa_cso/laserfist/fire_b.wav", false, "^" )
TFA.AddWeaponSound( "Laserfist.ClipIn1", "weapons/tfa_cso/laserfist/clipin1.wav" )
TFA.AddWeaponSound( "Laserfist.ClipIn2", "weapons/tfa_cso/laserfist/clipin2.wav" )
TFA.AddWeaponSound( "Laserfist.ClipOut", "weapons/tfa_cso/laserfist/clipout.wav" )
TFA.AddWeaponSound( "Laserfist.Draw", "weapons/tfa_cso/laserfist/draw.wav" )
TFA.AddWeaponSound( "Laserfist.Idle", "weapons/tfa_cso/laserfist/idle.wav" )
TFA.AddWeaponSound( "Laserfist.Charge", "weapons/tfa_cso/laserfist/charge.wav" )
TFA.AddWeaponSound( "Laserfist.Empty_End", "weapons/tfa_cso/laserfist/shoot_empty_end.wav" )
TFA.AddWeaponSound( "Laserfist.Empty_Loop", "weapons/tfa_cso/laserfist/shoot_empty_loop.wav" )
TFA.AddWeaponSound( "Laserfist.Boom", "weapons/tfa_cso/laserfist/shootb_exp.wav" )
TFA.AddWeaponSound( "Laserfist.Ready", "weapons/tfa_cso/laserfist/shootb_ready.wav" )
TFA.AddWeaponSound( "Laserfist.ShootB_Shoot", "weapons/tfa_cso/laserfist/shootb_shoot.wav" )
TFA.AddWeaponSound( "Laserfist.ShootB_Loop", "weapons/tfa_cso/laserfist/shootb_loop.wav" )

--Holy Bomb
TFA.AddFireSound ( "Holybomb.Explode", "weapons/tfa_cso/holybomb/explode.wav", false, "^" )
TFA.AddWeaponSound ( "HolyBomb.PullPin", "weapons/tfa_cso/holybomb/pullpin.wav" )
TFA.AddWeaponSound ( "HolyBomb.Draw", "weapons/tfa_cso/holybomb/draw.wav" )

--Dark Legacy Luger
TFA.AddFireSound ( "Luger_Legacy.Fire", "weapons/tfa_cso/luger_legacy/fire.wav", false, "^" )

--Trinity Grenade
TFA.AddFireSound ( "Trinity.ExplodeRed", "weapons/tfa_cso/trinity/red_explode.wav", false, "^" )
TFA.AddFireSound ( "Trinity.ExplodeGreen", "weapons/tfa_cso/trinity/green_explode.wav", false, "^" )
TFA.AddFireSound ( "Trinity.ExplodeWhite", "weapons/tfa_cso/trinity/white_explode.wav", false, "^" )
--TFA.AddWeaponSound ( "Trinity.IdleRed", "weapons/tfa_cso/trinity/red_idle.wav" )
--TFA.AddWeaponSound ( "Trinity.IdleGreen", "weapons/tfa_cso/trinity/green_idle.wav" )
--TFA.AddWeaponSound ( "Trinity.IdleWhite", "weapons/tfa_cso/trinity/white_idle.wav" )
--This fixes idle sounds looping over themselves

sound.Add({
	['name'] = "Trinity.IdleRed",
	['channel'] = CHAN_WEAPON,
	['sound'] = { "weapons/tfa_cso/trinity/red_idle.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "Trinity.IdleGreen",
	['channel'] = CHAN_WEAPON,
	['sound'] = { "weapons/tfa_cso/trinity/green_idle.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "Trinity.IdleWhite",
	['channel'] = CHAN_WEAPON,
	['sound'] = { "weapons/tfa_cso/trinity/white_idle.wav"},
	['pitch'] = {100,100}
})

TFA.AddWeaponSound ( "Trinity.TransformRed", "weapons/tfa_cso/trinity/red_transform.wav" )
TFA.AddWeaponSound ( "Trinity.TransformGreen", "weapons/tfa_cso/trinity/green_transform.wav" )
TFA.AddWeaponSound ( "Trinity.TransformWhite", "weapons/tfa_cso/trinity/white_transform.wav" )
TFA.AddWeaponSound ( "Trinity.TransformBase", "weapons/tfa_cso/trinity/transform_base.wav" )
TFA.AddWeaponSound ( "Trinity.PullPin", "weapons/tfa_cso/trinity/pullpin.wav" )
TFA.AddWeaponSound ( "Trinity.Draw", "weapons/tfa_cso/trinity/draw.wav" )

--Zhubajie Minigun
TFA.AddFireSound( "Zhubajie.Fire", "weapons/tfa_cso/monkeywpset1/fire.wav", false, "^" )
TFA.AddWeaponSound( "Zhubajie.Spindown", "weapons/tfa_cso/monkeywpset1/spindown.wav" )
TFA.AddWeaponSound( "Zhubajie.ClipIn", "weapons/tfa_cso/monkeywpset1/clipin.wav" )
TFA.AddWeaponSound( "Zhubajie.ClipOut", "weapons/tfa_cso/monkeywpset1/clipout.wav" )
TFA.AddWeaponSound( "Zhubajie.ClipOut1", "weapons/tfa_cso/monkeywpset1/clipout1.wav" )
TFA.AddWeaponSound( "Zhubajie.ClipOut2", "weapons/tfa_cso/monkeywpset1/clipout2.wav" )

--Sha Wujing Dual Handgun
TFA.AddFireSound( "Wujing.Fire", "weapons/tfa_cso/monkeywpset2/fire.wav", false, "^" )
TFA.AddWeaponSound( "Wujing.Draw", "weapons/tfa_cso/monkeywpset2/draw.wav" )
TFA.AddWeaponSound( "Wujing.ClipIn", "weapons/tfa_cso/monkeywpset2/clipin.wav" )
TFA.AddWeaponSound( "Wujing.ClipOut", "weapons/tfa_cso/monkeywpset2/clipout.wav" )

--X-Tracker
TFA.AddFireSound( "XTracker.Fire", "weapons/tfa_cso/xtracker/fire.wav", false, "^" )
TFA.AddFireSound( "XTracker.ShootB", "weapons/tfa_cso/xtracker/shootb.wav", false, "^" )
TFA.AddFireSound( "XTracker.Exp", "weapons/tfa_cso/xtracker/exp.wav", false, "^" )
TFA.AddWeaponSound( "XTracker.Reload", "weapons/tfa_cso/xtracker/reload.wav" )
TFA.AddWeaponSound( "XTracker.ZoomIn", "weapons/tfa_cso/xtracker/zoom_in.wav" )
TFA.AddWeaponSound( "XTracker.ZoomOut", "weapons/tfa_cso/xtracker/zoom_out.wav" )
TFA.AddWeaponSound( "XTracker.ScopeOn", "weapons/tfa_cso/xtracker/scope_on.wav" )
TFA.AddWeaponSound( "XTracker.ScopeOff", "weapons/tfa_cso/xtracker/scope_off.wav" )
TFA.AddWeaponSound( "XTracker.Shoot_On1", "weapons/tfa_cso/xtracker/shootb_on1.wav" )
TFA.AddWeaponSound( "XTracker.Shoot_On2", "weapons/tfa_cso/xtracker/shootb_on2.wav" )
TFA.AddWeaponSound( "XTracker.Beep", "weapons/tfa_cso/xtracker/beep.wav" )
TFA.AddWeaponSound( "XTracker.Draw", "weapons/tfa_cso/xtracker/draw.wav" )

--Janus 1
TFA.AddFireSound( "Janus1.Fire", "weapons/tfa_cso/janus1/fire.wav", false, "^" )
TFA.AddFireSound( "Janus1.Fire2", "weapons/tfa_cso/janus1/fire2.wav", false, "^" )
TFA.AddFireSound( "Janus1.Exp", "weapons/tfa_cso/janus1/exp.wav", false, "^" )
TFA.AddWeaponSound( "Janus1.Change1", "weapons/tfa_cso/janus1/change1.wav" )
TFA.AddWeaponSound( "Janus1.Change2", "weapons/tfa_cso/janus1/change2.wav" )
TFA.AddWeaponSound( "Janus1.Draw", "weapons/tfa_cso/janus1/draw.wav" )

--Bazooka
TFA.AddFireSound( "Bazooka.Fire", "weapons/tfa_cso/bazooka/fire.wav", false, "^" )
TFA.AddFireSound( "Bazooka.Exp1", "weapons/tfa_cso/bazooka/exp1.wav", false, "^" )
TFA.AddFireSound( "Bazooka.Exp2", "weapons/tfa_cso/bazooka/exp2.wav", false, "^" )
TFA.AddFireSound( "Bazooka.Exp3", "weapons/tfa_cso/bazooka/exp3.wav", false, "^" )
TFA.AddWeaponSound( "Bazooka.Draw", "weapons/tfa_cso/bazooka/draw.wav" )
TFA.AddWeaponSound( "Bazooka.ClipOut", "weapons/tfa_cso/bazooka/clipout.wav" )
TFA.AddWeaponSound( "Bazooka.ClipIn", "weapons/tfa_cso/bazooka/clipin.wav" )

--Petrol Boomer
TFA.AddFireSound( "PetrolBoomer.Fire", "weapons/tfa_cso/petrolboomer/fire.wav", false, "^" )
TFA.AddFireSound( "PetrolBoomer.Exp", "weapons/tfa_cso/petrolboomer/exp.wav", false, "^" )
TFA.AddWeaponSound( "PetrolBoomer.Draw", "weapons/tfa_cso/petrolboomer/draw.wav" )
TFA.AddWeaponSound( "PetrolBoomer.Reload", "weapons/tfa_cso/petrolboomer/reload.wav" )
TFA.AddWeaponSound( "PetrolBoomer.Draw_Empty", "weapons/tfa_cso/petrolboomer/draw_empty.wav" )
TFA.AddWeaponSound( "PetrolBoomer.Idle", "weapons/tfa_cso/petrolboomer/idle.wav" )

--Lightning Bazzi-1
TFA.AddFireSound( "CartRed.Fire", "weapons/tfa_cso/cartred/fire.wav", false, "^" )
TFA.AddFireSound( "CartRed.Fire2", "weapons/tfa_cso/cartred/fire2.wav", false, "^" )
TFA.AddWeaponSound( "CartRed.ClipIn", "weapons/tfa_cso/cartred/clipin.wav" )
TFA.AddWeaponSound( "CartRed.ClipOut", "weapons/tfa_cso/cartred/clipout.wav" )
TFA.AddWeaponSound( "CartRed.Foley5", "weapons/tfa_cso/cartred/foley5.wav" )
TFA.AddWeaponSound( "CartRed.HeadOpen", "weapons/tfa_cso/cartred/headopen.wav" )
TFA.AddWeaponSound( "CartRed.HeadClose", "weapons/tfa_cso/cartred/headclose.wav" )

--UMP45 Snake
TFA.AddFireSound( "Snakegun.Fire", "weapons/tfa_cso/snakegun/fire.wav", false, "^" )
TFA.AddWeaponSound( "Snakegun.ClipIn", "weapons/tfa_cso/snakegun/clipin.wav" )
TFA.AddWeaponSound( "Snakegun.ClipOut1", "weapons/tfa_cso/snakegun/clipout1.wav" )
TFA.AddWeaponSound( "Snakegun.ClipOut2", "weapons/tfa_cso/snakegun/clipout2.wav" )
TFA.AddWeaponSound( "Snakegun.Draw", "weapons/tfa_cso/snakegun/draw.wav" )
TFA.AddWeaponSound( "Snakegun.Boltpull", "weapons/tfa_cso/snakegun/boltpull.wav" )

--Lightning Dao-1
TFA.AddFireSound( "CartBlue.Fire", "weapons/tfa_cso/cartblue/fire.wav", false, "^" )
TFA.AddFireSound( "CartBlue.Fire2", "weapons/tfa_cso/cartblue/fire2.wav", false, "^" )
TFA.AddWeaponSound( "CartBlue.ClipIn", "weapons/tfa_cso/cartblue/clipin.wav" )
TFA.AddWeaponSound( "CartBlue.ClipOut", "weapons/tfa_cso/cartblue/clipout.wav" )
TFA.AddWeaponSound( "CartBlue.ClipOut2", "weapons/tfa_cso/cartblue/clipout2.wav" )
TFA.AddWeaponSound( "CartBlue.Foley1", "weapons/tfa_cso/cartblue/foley1.wav" )
TFA.AddWeaponSound( "CartBlue.Foley2", "weapons/tfa_cso/cartblue/foley2.wav" )
TFA.AddWeaponSound( "CartBlue.Foley3", "weapons/tfa_cso/cartblue/foley3.wav" )
TFA.AddWeaponSound( "CartBlue.Foley4", "weapons/tfa_cso/cartblue/foley4.wav" )
TFA.AddWeaponSound( "CartBlue.Draw", "weapons/tfa_cso/cartblue/draw.wav" )
TFA.AddWeaponSound( "CartBlue.Draw2", "weapons/tfa_cso/cartblue/draw2.wav" )
TFA.AddWeaponSound( "CartBlue.Hit", "weapons/tfa_cso/cartblue/hit.wav" )
TFA.AddWeaponSound( "CartBlue.Jump", "weapons/tfa_cso/cartblue/jump.wav" )
TFA.AddWeaponSound( "CartBlue.Spindown", "weapons/tfa_cso/cartblue/spindown.wav" )
TFA.AddWeaponSound( "CartBlue.Turn", "weapons/tfa_cso/cartblue/turn.wav" )
TFA.AddWeaponSound( "CartBlue.Yaho", "weapons/tfa_cso/cartblue/yaho.wav" )

--MP7 Unicorn
TFA.AddFireSound( "Horsegun.Fire", "weapons/tfa_cso/horsegun/fire.wav", false, "^" )
TFA.AddWeaponSound( "Horsegun.ClipIn", "weapons/tfa_cso/horsegun/clipin.wav" )
TFA.AddWeaponSound( "Horsegun.ClipOut", "weapons/tfa_cso/horsegun/clipout.wav" )
TFA.AddWeaponSound( "Horsegun.Idle", "weapons/tfa_cso/horsegun/idle.wav" )
TFA.AddWeaponSound( "Horsegun.Draw", "weapons/tfa_cso/horsegun/draw.wav" )
TFA.AddWeaponSound( "Horsegun.Boltpull", "weapons/tfa_cso/horsegun/boltpull.wav" )

--M95 Ghost Knight
TFA.AddFireSound( "M95Ghost.Fire", "weapons/tfa_cso/m95ghost/fire.wav", false, "^" )
TFA.AddFireSound( "M95Ghost.Fire2", "weapons/tfa_cso/m95ghost/fire2.wav", false, "^" )
TFA.AddWeaponSound( "M95Ghost.ClipIn", "weapons/tfa_cso/m95ghost/clipin.wav" )
TFA.AddWeaponSound( "M95Ghost.ClipOut", "weapons/tfa_cso/m95ghost/clipout.wav" )
TFA.AddWeaponSound( "M95Ghost.Idle", "weapons/tfa_cso/m95ghost/idle.wav" )
TFA.AddWeaponSound( "M95Ghost.Draw", "weapons/tfa_cso/m95ghost/draw.wav" )
TFA.AddWeaponSound( "M95Ghost.Point", "weapons/tfa_cso/m95ghost/point.wav" )
TFA.AddWeaponSound( "M95Ghost.Net1", "weapons/tfa_cso/m95ghost/shoot_net1.wav" )
TFA.AddWeaponSound( "M95Ghost.Net2", "weapons/tfa_cso/m95ghost/shoot_net2.wav" )

--M3 Big Shark
TFA.AddFireSound( "M3Shark.Fire", "weapons/tfa_cso/m3shark/fire.wav", false, "^" )
TFA.AddWeaponSound( "M3Shark.Insert", "weapons/tfa_cso/m3shark/insert.wav" )
TFA.AddWeaponSound( "M3Shark.After_Reload", "weapons/tfa_cso/m3shark/after_reload.wav" )
TFA.AddWeaponSound( "M3Shark.Idle", "weapons/tfa_cso/m3shark/idle.wav" )
TFA.AddWeaponSound( "M3Shark.Draw", "weapons/tfa_cso/m3shark/draw.wav" )

--Newcomen Expert
TFA.AddFireSound( "NewcomenV6.Fire", "weapons/tfa_cso/newcomen_v6/fire.wav", false, "^" )
TFA.AddWeaponSound( "NewcomenV6.Draw", "weapons/tfa_cso/newcomen_v6/draw.wav" )
TFA.AddWeaponSound( "NewcomenV6.Reload", "weapons/tfa_cso/newcomen_v6/reload.wav" )
TFA.AddWeaponSound( "NewcomenV6.Idle", "weapons/tfa_cso/newcomen_v6/idle.wav" )

--Dart Pistol
TFA.AddFireSound( "Dartpistol.Fire", "weapons/tfa_cso/dartpistol/fire.wav", false, "^" )
TFA.AddFireSound( "Dartpistol.Explosion1", "weapons/tfa_cso/dartpistol/explosion1.wav", false, "^" )
TFA.AddFireSound( "Dartpistol.Explosion2", "weapons/tfa_cso/dartpistol/explosion2.wav", false, "^" )
TFA.AddWeaponSound( "Dartpistol.Draw", "weapons/tfa_cso/dartpistol/draw.wav" )
TFA.AddWeaponSound( "Dartpistol.ClipOut1", "weapons/tfa_cso/dartpistol/clipout1.wav" )
TFA.AddWeaponSound( "Dartpistol.ClipOut2", "weapons/tfa_cso/dartpistol/clipout2.wav" )
TFA.AddWeaponSound( "Dartpistol.ClipIn1", "weapons/tfa_cso/dartpistol/clipin1.wav" )
TFA.AddWeaponSound( "Dartpistol.ClipIn2", "weapons/tfa_cso/dartpistol/clipin2.wav" )
TFA.AddWeaponSound( "Dartpistol.ClipIn3", "weapons/tfa_cso/dartpistol/clipin3.wav" )

--Magnum Drill Gold

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

--Heaven Scorcher
TFA.AddFireSound( "HeavenScorcher.Fire", "weapons/tfa_cso/heaven_scorcher/fire.wav", false, "^" )
TFA.AddFireSound( "HeavenScorcher.Mine_Shoot", "weapons/tfa_cso/heaven_scorcher/mine_shoot.wav", false, "^" )
TFA.AddFireSound( "HeavenScorcher.Mine_Explosion", "weapons/tfa_cso/heaven_scorcher/mine_exp.wav", false, "^" )
TFA.AddFireSound( "HeavenScorcher.Explosion1", "weapons/tfa_cso/heaven_scorcher/exp.wav", false, "^" )
TFA.AddFireSound( "HeavenScorcher.Explosion2", "weapons/tfa_cso/heaven_scorcher/exp2.wav", false, "^" )
TFA.AddWeaponSound( "HeavenScorcher.Draw", "weapons/tfa_cso/heaven_scorcher/draw.wav" )
TFA.AddWeaponSound( "HeavenScorcher.Idle", "weapons/tfa_cso/heaven_scorcher/idle.wav" )
TFA.AddWeaponSound( "HeavenScorcher.BMod_On", "weapons/tfa_cso/heaven_scorcher/bmod_on.wav" )
TFA.AddWeaponSound( "HeavenScorcher.BMod_Exp", "weapons/tfa_cso/heaven_scorcher/bmod_on_exp.wav" )
TFA.AddWeaponSound( "HeavenScorcher.Mine_Set", "weapons/tfa_cso/heaven_scorcher/mine_set.wav" )
TFA.AddWeaponSound( "HeavenScorcher.Mine_Mode", "weapons/tfa_cso/heaven_scorcher/mine_mode.wav" )
TFA.AddWeaponSound( "HeavenScorcher.ClipOut", "weapons/tfa_cso/heaven_scorcher/clipout.wav" )
TFA.AddWeaponSound( "HeavenScorcher.ClipIn", "weapons/tfa_cso/heaven_scorcher/clipin.wav" )

--Mac-10
TFA.AddFireSound( "MAC10.Fire", "weapons/tfa_cso/mac10/fire.wav", false, "^" )
TFA.AddWeaponSound( "MAC10.ClipOut", "weapons/tfa_cso/mac10/clipout.wav")
TFA.AddWeaponSound( "MAC10V2.ClipIn", "weapons/tfa_cso/mac10/clipin_v2.wav")
TFA.AddWeaponSound( "MAC10.ClipRelease", "weapons/tfa_cso/mac10/cliprelease.wav")
TFA.AddWeaponSound( "MAC10.Boltpull", "weapons/tfa_cso/mac10/boltpull.wav")

--P228
TFA.AddFireSound( "P228.Fire", "weapons/tfa_cso/p228/fire.wav", false, "^" )
TFA.AddWeaponSound( "P228.ClipIn", "weapons/tfa_cso/p228/clipin.wav")
TFA.AddWeaponSound( "P228.ClipOut", "weapons/tfa_cso/p228/clipout.wav")
TFA.AddWeaponSound( "P228.Deploy", "weapons/tfa_cso/p228/deploy.wav")
TFA.AddWeaponSound( "P228.SlidePull", "weapons/tfa_cso/p228/slidepull.wav")
TFA.AddWeaponSound( "P228.SlideRelease1", "weapons/tfa_cso/p228/sliderelease1.wav")

--Ballista
TFA.AddWeaponSound( "Ballista.Exp2", "weapons/tfa_cso/ballista/exp2.wav")
TFA.AddWeaponSound( "Ballista.Exp3", "weapons/tfa_cso/ballista/exp3.wav")
TFA.AddWeaponSound( "Ballista.Reload1", "weapons/tfa_cso/ballista/reload1.wav")
TFA.AddWeaponSound( "Ballista.Reload2", "weapons/tfa_cso/ballista/reload2.wav")
TFA.AddWeaponSound( "Ballista.Draw", "weapons/tfa_cso/ballista/draw.wav")
TFA.AddWeaponSound( "Ballista.Missile", "weapons/tfa_cso/ballista/missile.wav")
TFA.AddWeaponSound( "Ballista.Missile_Last", "weapons/tfa_cso/ballista/missile_last.wav")
TFA.AddWeaponSound( "Ballista.Missile_On", "weapons/tfa_cso/ballista/missile_on.wav")

sound.Add({
	['name'] = "Ballista.Exp1",
	['channel'] = CHAN_WEAPON,
	['sound'] = { "weapons/tfa_cso/ballista/exp1.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "Ballista.Missile_Reload",
	['channel'] = CHAN_WEAPON,
	['sound'] = { "weapons/tfa_cso/ballista/missile_reload.wav"},
	['pitch'] = {100,100}
})

local soundData = {
	name 		= "Ballista.Fire" ,
	channel 	= CHAN_USER_BASE+11,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/ballista/fire.wav"
}

sound.Add(soundData)

local soundData = {
	name 		= "Ballista.Fire2" ,
	channel 	= CHAN_USER_BASE+11,
	volume 		= 1,
	soundlevel 	= 80,
	pitchstart 	= 100,
	pitchend 	= 100,
	sound 		= "weapons/tfa_cso/ballista/fire2.wav"
}

sound.Add(soundData)

--Heart Bomb

sound.Add({
	['name'] = "Heartbomb.Explode",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/heartbomb/explode.wav"},
	['pitch'] = {100,100}
})

TFA.AddWeaponSound ( "HeartBomb.Pin", "weapons/tfa_cso/heartbomb/pin.wav" )
TFA.AddWeaponSound ( "HeartBomb.Arrow", "weapons/tfa_cso/heartbomb/arrow.wav" )
TFA.AddWeaponSound ( "HeartBomb.Draw", "weapons/tfa_cso/heartbomb/draw.wav" )

--ThunderStorm

sound.Add({
	['name'] = "Thunderstorm.Explode",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/thunderstorm/explode.wav"},
	['pitch'] = {100,100}
})

TFA.AddWeaponSound ( "Thunderstorm.Throw", "weapons/tfa_cso/thunderstorm/throw.wav" )
TFA.AddWeaponSound ( "Thunderstorm.Pullpin", "weapons/tfa_cso/thunderstorm/pullpin.wav" )
TFA.AddWeaponSound ( "Thunderstorm.Idle", "weapons/tfa_cso/thunderstorm/idle.wav" )
TFA.AddWeaponSound ( "Thunderstorm.Draw", "weapons/tfa_cso/thunderstorm/draw.wav" )
TFA.AddWeaponSound ( "Thunderstorm.Charge", "weapons/tfa_cso/thunderstorm/charge.wav" )

-- Scar Oz

sound.Add({
	['name'] = "ScarA.Fire",
	['channel'] = CHAN_USER_BASE+11,
	['sound'] = { "weapons/tfa_cso/scar_oz/scara_fire.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "ScarB.Fire",
	['channel'] = CHAN_USER_BASE+11,
	['sound'] = { "weapons/tfa_cso/scar_oz/scarb_fire.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "ScarC.Fire",
	['channel'] = CHAN_USER_BASE+11,
	['sound'] = { "weapons/tfa_cso/scar_oz/scarc_fire.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "ScarD.Fire1",
	['channel'] = CHAN_USER_BASE+11,
	['sound'] = { "weapons/tfa_cso/scar_oz/scard_fire1.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "ScarD.Fire2",
	['channel'] = CHAN_USER_BASE+11,
	['sound'] = { "weapons/tfa_cso/scar_oz/scard_fire2.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "ScarD.Exp",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/scar_oz/scard_exp.wav"},
	['pitch'] = {100,100}
})

TFA.AddWeaponSound ( "ScarA.Boltpull", "weapons/tfa_cso/scar_oz/scara_boltpull.wav" )
TFA.AddWeaponSound ( "ScarA.ClipIn", "weapons/tfa_cso/scar_oz/scara_clipin.wav" )
TFA.AddWeaponSound ( "ScarA.ClipOut", "weapons/tfa_cso/scar_oz/scara_clipout.wav" )
TFA.AddWeaponSound ( "ScarA.Draw", "weapons/tfa_cso/scar_oz/scara_draw.wav" )
TFA.AddWeaponSound ( "ScarC.ClipIn", "weapons/tfa_cso/scar_oz/scarc_clipin.wav" )
TFA.AddWeaponSound ( "ScarC.ClipOut", "weapons/tfa_cso/scar_oz/scarc_clipout.wav" )
TFA.AddWeaponSound ( "ScarC.Draw", "weapons/tfa_cso/scar_oz/scarc_draw.wav" )
TFA.AddWeaponSound ( "ScarD.ClipIn1", "weapons/tfa_cso/scar_oz/scard_clipin1.wav" )
TFA.AddWeaponSound ( "ScarD.ClipIn2", "weapons/tfa_cso/scar_oz/scard_clipin2.wav" )
TFA.AddWeaponSound ( "ScarD.ClipOut", "weapons/tfa_cso/scar_oz/scard_clipout.wav" )
TFA.AddWeaponSound ( "ScarD.Draw", "weapons/tfa_cso/scar_oz/scard_draw.wav" )

-- Void Avenger

sound.Add({
	['name'] = "Voidpistol.Fire",
	['channel'] = CHAN_USER_BASE+11,
	['sound'] = { "weapons/tfa_cso/voidpistol/fire.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "Voidpistol.Fire2",
	['channel'] = CHAN_USER_BASE+11,
	['sound'] = { "weapons/tfa_cso/voidpistol/fire2.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "Voidpistol.Fire_2",
	['channel'] = CHAN_USER_BASE+11,
	['sound'] = { "weapons/tfa_cso/voidpistol/fire_2.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "Voidpistol.Idle",
	['channel'] = CHAN_WEAPON,
	['sound'] = { "weapons/tfa_cso/voidpistol/idle.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "Voidpistol.Idle2",
	['channel'] = CHAN_WEAPON,
	['sound'] = { "weapons/tfa_cso/voidpistol/idle2.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "Voidpistol.Blackhole_Exp",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/voidpistol/blackhole_exp.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "Voidpistol.Blackhole_Start",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/voidpistol/blackhole_start.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "Voidpistol.Blackhole_Idle",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/voidpistol/blackhole_idle.wav"},
	['pitch'] = {100,100}
})

TFA.AddWeaponSound ( "Voidpistol.Reload1", "weapons/tfa_cso/voidpistol/reload1.wav" )
TFA.AddWeaponSound ( "Voidpistol.Reload2A", "weapons/tfa_cso/voidpistol/reload2a.wav" )
TFA.AddWeaponSound ( "Voidpistol.Reload2C", "weapons/tfa_cso/voidpistol/reload2c.wav" )
TFA.AddWeaponSound ( "Voidpistol.DrawA", "weapons/tfa_cso/voidpistol/draw.wav" )
TFA.AddWeaponSound ( "Voidpistol.DrawB", "weapons/tfa_cso/voidpistol/drawb.wav" )
TFA.AddWeaponSound ( "Voidpistol.Change", "weapons/tfa_cso/voidpistol/change.wav" )
TFA.AddWeaponSound ( "Voidpistol.Beep", "weapons/tfa_cso/voidpistol/beep.wav" )

-- Inferno Cannon

sound.Add({
	['name'] = "Volcanoex.Fire",
	['channel'] = CHAN_USER_BASE+11,
	['sound'] = { "weapons/tfa_cso/volcanoex/fire.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "Volcanoex.Fire2",
	['channel'] = CHAN_USER_BASE+11,
	['sound'] = { "weapons/tfa_cso/volcanoex/fire2.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "Volcanoex.Exp",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/volcanoex/exp.wav"},
	['pitch'] = {100,100}
})

TFA.AddWeaponSound ( "Volcanoex.ClipOut1", "weapons/tfa_cso/volcanoex/clipout1.wav" )
TFA.AddWeaponSound ( "Volcanoex.ClipOut2", "weapons/tfa_cso/volcanoex/clipout2.wav" )
TFA.AddWeaponSound ( "Volcanoex.ClipIn1", "weapons/tfa_cso/volcanoex/clipin1.wav" )
TFA.AddWeaponSound ( "Volcanoex.ClipIn2", "weapons/tfa_cso/volcanoex/clipin2.wav" )
TFA.AddWeaponSound ( "Volcanoex.Boltpull", "weapons/tfa_cso/volcanoex/boltpull.wav" )
TFA.AddWeaponSound ( "Volcanoex.Draw", "weapons/tfa_cso/volcanoex/draw.wav" )

--Rail Buster

sound.Add({
	['name'] = "RailBuster.Fire",
	['channel'] = CHAN_USER_BASE+11,
	['sound'] = { "weapons/tfa_cso/rail_buster/fire.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "RailBuster.Fire2",
	['channel'] = CHAN_USER_BASE+11,
	['sound'] = { "weapons/tfa_cso/rail_buster/fire2.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "RailBuster.Idle_Charge",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/rail_buster/idle_charged.wav"},
	['pitch'] = {100,100}
})

TFA.AddWeaponSound( "RailBuster.Charge", "weapons/tfa_cso/rail_buster/charge.wav")
TFA.AddWeaponSound( "RailBuster.Charge_Finish", "weapons/tfa_cso/rail_buster/charging_finish.wav")

--Shining Heart Rod

sound.Add({
	['name'] = "MagicRod.Fire",
	['channel'] = CHAN_USER_BASE+11,
	['sound'] = { "weapons/tfa_cso/magic_rod/fire.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "MagicRod.Fire2",
	['channel'] = CHAN_USER_BASE+11,
	['sound'] = { "weapons/tfa_cso/magic_rod/fire2.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "MagicRod.Exp1",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/magic_rod/exp1.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "MagicRod.Exp2",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/magic_rod/exp2.wav"},
	['pitch'] = {100,100}
})

TFA.AddWeaponSound( "MagicRod.Reload1", "weapons/tfa_cso/magic_rod/reload1.wav")
TFA.AddWeaponSound( "MagicRod.Reload2", "weapons/tfa_cso/magic_rod/reload2.wav")
TFA.AddWeaponSound( "MagicRod.Draw", "weapons/tfa_cso/magic_rod/draw.wav")
TFA.AddWeaponSound( "MagicRod.Alarm", "weapons/tfa_cso/magic_rod/alarm.wav")
TFA.AddWeaponSound( "MagicRod.Idle", "weapons/tfa_cso/magic_rod/idle.wav")

--Magical lolipop shooter

sound.Add({
	['name'] = "MagicSG.Idle",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/magicsg/idle.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "MagicSG.Fire",
	['channel'] = CHAN_USER_BASE+11,
	['sound'] = { "weapons/tfa_cso/magicsg/fire.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "MagicSG.Fire2",
	['channel'] = CHAN_USER_BASE+11,
	['sound'] = { "weapons/tfa_cso/magicsg/fire2.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "MagicSG.Exp",
	['channel'] = CHAN_STATIC+10,
	['sound'] = { "weapons/tfa_cso/magicsg/exp.wav"},
	['pitch'] = {100,100}
})

TFA.AddWeaponSound( "MagicSG.Reload", "weapons/tfa_cso/magicsg/reload.wav")
TFA.AddWeaponSound( "MagicSG.Draw", "weapons/tfa_cso/magicsg/draw.wav")
TFA.AddWeaponSound( "MagicSG.Charge1", "weapons/tfa_cso/magicsg/charge1.wav")
TFA.AddWeaponSound( "MagicSG.Charge2", "weapons/tfa_cso/magicsg/charge2.wav")
TFA.AddWeaponSound( "MagicSG.Charge3", "weapons/tfa_cso/magicsg/charge3.wav")
TFA.AddWeaponSound( "MagicSG.Charge4", "weapons/tfa_cso/magicsg/charge4.wav")
TFA.AddWeaponSound( "MagicSG.Charge5", "weapons/tfa_cso/magicsg/charge5.wav")

--Megev NG-7 Ajax

sound.Add({
	['name'] = "NG_Ajax.Fire",
	['channel'] = CHAN_USER_BASE+11,
	['sound'] = { "weapons/tfa_cso/negev_ajax/fire.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "NG_Ajax.Fire2",
	['channel'] = CHAN_USER_BASE+11,
	['sound'] = { "weapons/tfa_cso/negev_ajax/fire2.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "NG_Ajax.Idle",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/negev_ajax/idle.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "NG_Ajax.Charge_Exp",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/negev_ajax/charge_exp.wav"},
	['pitch'] = {100,100}
})

TFA.AddWeaponSound( "NG_Ajax.ClipOut", "weapons/tfa_cso/negev_ajax/clipout.wav")
TFA.AddWeaponSound( "NG_Ajax.ClipIn1", "weapons/tfa_cso/negev_ajax/clipin1.wav")
TFA.AddWeaponSound( "NG_Ajax.ClipIn2", "weapons/tfa_cso/negev_ajax/clipin2.wav")
TFA.AddWeaponSound( "NG_Ajax.ClipIn3", "weapons/tfa_cso/negev_ajax/clipin3.wav")
TFA.AddWeaponSound( "NG_Ajax.Draw", "weapons/tfa_cso/negev_ajax/draw.wav")
TFA.AddWeaponSound( "NG_Ajax.Change_A", "weapons/tfa_cso/negev_ajax/change_a.wav")
TFA.AddWeaponSound( "NG_Ajax.Change_B", "weapons/tfa_cso/negev_ajax/change_b.wav")

-- Plasma Rifle MK-1

sound.Add({
	['name'] = "PlasmaMK1.Fire",
	['channel'] = CHAN_USER_BASE+11,
	['sound'] = { "weapons/tfa_cso/plasmagunexa/fire.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "PlasmaMK1.Exp",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/plasmagunexa/exp.wav"},
	['pitch'] = {100,100}
})

TFA.AddWeaponSound ( "PlasmaMK1.ClipOut1", "weapons/tfa_cso/plasmagunexa/clipout1.wav" )
TFA.AddWeaponSound ( "PlasmaMK1.ClipOut2", "weapons/tfa_cso/plasmagunexa/clipout2.wav" )
TFA.AddWeaponSound ( "PlasmaMK1.ClipIn1", "weapons/tfa_cso/plasmagunexa/clipin1.wav" )
TFA.AddWeaponSound ( "PlasmaMK1.ClipIn2", "weapons/tfa_cso/plasmagunexa/clipin2.wav" )
TFA.AddWeaponSound ( "PlasmaMK1.Draw", "weapons/tfa_cso/plasmagunexa/draw.wav" )

-- Plasma Rifle MK-2

sound.Add({
	['name'] = "PlasmaMK2.Fire",
	['channel'] = CHAN_USER_BASE+11,
	['sound'] = { "weapons/tfa_cso/plasmagunexb/fire.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "PlasmaMK2.Exp",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/plasmagunexb/exp.wav"},
	['pitch'] = {100,100}
})

TFA.AddWeaponSound ( "PlasmaMK2.ClipOut1", "weapons/tfa_cso/plasmagunexb/clipout1.wav" )
TFA.AddWeaponSound ( "PlasmaMK2.ClipOut2", "weapons/tfa_cso/plasmagunexb/clipout2.wav" )
TFA.AddWeaponSound ( "PlasmaMK2.ClipIn1", "weapons/tfa_cso/plasmagunexb/clipin1.wav" )
TFA.AddWeaponSound ( "PlasmaMK2.ClipIn2", "weapons/tfa_cso/plasmagunexb/clipin2.wav" )
TFA.AddWeaponSound ( "PlasmaMK2.Draw", "weapons/tfa_cso/plasmagunexb/draw.wav" )

-- Tiamat MK-3

sound.Add({
	['name'] = "TiamatMK3.Fire",
	['channel'] = CHAN_USER_BASE+11,
	['sound'] = { "weapons/tfa_cso/plasmagunexc/fire.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "TiamatMK3.Fire2",
	['channel'] = CHAN_USER_BASE+11,
	['sound'] = { "weapons/tfa_cso/plasmagunexc/fire2.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "TiamatMK3.Fire3",
	['channel'] = CHAN_USER_BASE+11,
	['sound'] = { "weapons/tfa_cso/plasmagunexc/fire3.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "TiamatMK3.Exp",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/plasmagunexc/exp.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "TiamatMK3.Exp2",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/plasmagunexc/exp2.wav"},
	['pitch'] = {100,100}
})

TFA.AddWeaponSound ( "TiamatMK3.ClipOut1", "weapons/tfa_cso/plasmagunexc/clipout1.wav" )
TFA.AddWeaponSound ( "TiamatMK3.ClipOut2", "weapons/tfa_cso/plasmagunexc/clipout2.wav" )
TFA.AddWeaponSound ( "TiamatMK3.ClipIn1", "weapons/tfa_cso/plasmagunexc/clipin1.wav" )
TFA.AddWeaponSound ( "TiamatMK3.ClipIn2", "weapons/tfa_cso/plasmagunexc/clipin2.wav" )
TFA.AddWeaponSound ( "TiamatMK3.Draw", "weapons/tfa_cso/plasmagunexc/draw.wav" )
TFA.AddWeaponSound ( "TiamatMK3.Charge", "weapons/tfa_cso/plasmagunexc/charge.wav" )
TFA.AddWeaponSound ( "TiamatMK3.Charge_Shoot", "weapons/tfa_cso/plasmagunexc/charge_shoot.wav" )

-- Tiamat MK-4

sound.Add({
	['name'] = "TiamatMK4.Fire",
	['channel'] = CHAN_USER_BASE+11,
	['sound'] = { "weapons/tfa_cso/plasmagunexd/fire.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "TiamatMK4.Fire2",
	['channel'] = CHAN_USER_BASE+11,
	['sound'] = { "weapons/tfa_cso/plasmagunexd/fire2.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "TiamatMK4.Fire3",
	['channel'] = CHAN_USER_BASE+11,
	['sound'] = { "weapons/tfa_cso/plasmagunexd/fire3.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "TiamatMK4.Exp",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/plasmagunexd/exp.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "TiamatMK4.Exp2",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/plasmagunexd/exp2.wav"},
	['pitch'] = {100,100}
})

TFA.AddWeaponSound ( "TiamatMK4.ClipOut1", "weapons/tfa_cso/plasmagunexd/clipout1.wav" )
TFA.AddWeaponSound ( "TiamatMK4.ClipOut2", "weapons/tfa_cso/plasmagunexd/clipout2.wav" )
TFA.AddWeaponSound ( "TiamatMK4.ClipIn1", "weapons/tfa_cso/plasmagunexd/clipin1.wav" )
TFA.AddWeaponSound ( "TiamatMK4.ClipIn2", "weapons/tfa_cso/plasmagunexd/clipin2.wav" )
TFA.AddWeaponSound ( "TiamatMK4.Draw", "weapons/tfa_cso/plasmagunexd/draw.wav" )
TFA.AddWeaponSound ( "TiamatMK4.Charge", "weapons/tfa_cso/plasmagunexd/charge.wav" )
TFA.AddWeaponSound ( "TiamatMK4.Charge_Shoot", "weapons/tfa_cso/plasmagunexd/charge_shoot.wav" )

-- Divine Blaster

sound.Add({
	['name'] = "Divine_Blaster.Fire",
	['channel'] = CHAN_USER_BASE+11,
	['sound'] = { "weapons/tfa_cso/divine_blaster/fire.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "Divine_Blaster.Fire2",
	['channel'] = CHAN_USER_BASE+11,
	['sound'] = { "weapons/tfa_cso/divine_blaster/fire2.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "Divine_Blaster.Start",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/divine_blaster/start.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "Divine_Blaster.Loop",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/divine_blaster/loop.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "Divine_Blaster.Loop_End",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/divine_blaster/loop_end.wav"},
	['pitch'] = {100,100}
})

TFA.AddWeaponSound ( "Divine_Blaster.ClipOut", "weapons/tfa_cso/divine_blaster/clipout.wav" )
TFA.AddWeaponSound ( "Divine_Blaster.ClipIn", "weapons/tfa_cso/divine_blaster/clipin.wav" )
TFA.AddWeaponSound ( "Divine_Blaster.Draw", "weapons/tfa_cso/divine_blaster/draw.wav" )
TFA.AddWeaponSound ( "Divine_Blaster.WingStart", "weapons/tfa_cso/divine_blaster/wingstart.wav" )
TFA.AddWeaponSound ( "Divine_Blaster.WingEnd", "weapons/tfa_cso/divine_blaster/wingend.wav" )
TFA.AddWeaponSound ( "Divine_Blaster.Special", "weapons/tfa_cso/divine_blaster/special.wav" )

-- Thunder Force

sound.Add({
	['name'] = "ThunderForce.Fire",
	['channel'] = CHAN_USER_BASE+11,
	['sound'] = { "weapons/tfa_cso/thunder_force/fire.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "ThunderForce.Fire2",
	['channel'] = CHAN_USER_BASE+11,
	['sound'] = { "weapons/tfa_cso/thunder_force/fire2.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "ThunderForce.Exp",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/thunder_force/exp.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "ThunderForce.Exp2",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/thunder_force/exp2.wav"},
	['pitch'] = {100,100}
})

TFA.AddWeaponSound ( "ThunderForce.ClipOut1", "weapons/tfa_cso/thunder_force/clipout1.wav" )
TFA.AddWeaponSound ( "ThunderForce.ClipOut2", "weapons/tfa_cso/thunder_force/clipout2.wav" )
TFA.AddWeaponSound ( "ThunderForce.ClipIn1", "weapons/tfa_cso/thunder_force/clipin1.wav" )
TFA.AddWeaponSound ( "ThunderForce.ClipIn2", "weapons/tfa_cso/thunder_force/clipin2.wav" )
TFA.AddWeaponSound ( "ThunderForce.Draw", "weapons/tfa_cso/thunder_force/draw.wav" )
TFA.AddWeaponSound ( "ThunderForce.ZoomIn", "weapons/tfa_cso/thunder_force/zoom_in.wav" )
TFA.AddWeaponSound ( "ThunderForce.ZoomOut", "weapons/tfa_cso/thunder_force/zoom_out.wav" )
TFA.AddWeaponSound ( "ThunderForce.Zoom", "weapons/tfa_cso/thunder_force/zoom.wav" )
TFA.AddWeaponSound ( "ThunderForce.Beep", "weapons/tfa_cso/thunder_force/beep.wav" )

-- M2 Devastator

sound.Add({
	['name'] = "M2Devastator.Fire",
	['channel'] = CHAN_USER_BASE+11,
	['sound'] = { "weapons/tfa_cso/m2_devastator/fire.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "M2Devastator.Fire2",
	['channel'] = CHAN_USER_BASE+11,
	['sound'] = { "weapons/tfa_cso/m2_devastator/fire2.wav"},
	['pitch'] = {100,100}
})

TFA.AddFireSound( "M2Devastator.Fire2_Exp", "weapons/tfa_cso/m2_devastator/fire2_exp.wav", false, "^" )

sound.Add({
	['name'] = "M2Devastator.Exp",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/m2_devastator/exp.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "M2Devastator.Exp2",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/m2_devastator/exp2.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "M2Devastator.Exp3",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/m2_devastator/exp3.wav"},
	['pitch'] = {100,100}
})

TFA.AddWeaponSound ( "M2Devastator.ClipOut1", "weapons/tfa_cso/m2_devastator/clipout1.wav" )
TFA.AddWeaponSound ( "M2Devastator.ClipOut2", "weapons/tfa_cso/m2_devastator/clipout2.wav" )
TFA.AddWeaponSound ( "M2Devastator.ClipIn1", "weapons/tfa_cso/m2_devastator/clipin1.wav" )
TFA.AddWeaponSound ( "M2Devastator.ClipIn2", "weapons/tfa_cso/m2_devastator/clipin2.wav" )
TFA.AddWeaponSound ( "M2Devastator.Draw", "weapons/tfa_cso/m2_devastator/draw.wav" )
TFA.AddWeaponSound ( "M2Devastator.Launcher_On", "weapons/tfa_cso/m2_devastator/launcher_on.wav" )
TFA.AddWeaponSound ( "M2Devastator.Launcher_Fire", "weapons/tfa_cso/m2_devastator/launcher_fire.wav" )
TFA.AddWeaponSound ( "M2Devastator.Launcher_Ready", "weapons/tfa_cso/m2_devastator/launcher_ready.wav" )

-- Water Pistol

sound.Add({
	['name'] = "BigEye.Fire",
	['channel'] = CHAN_USER_BASE+11,
	['sound'] = { "weapons/tfa_cso/waterpistol/fire.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "BigEye.Idle",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/waterpistol/idle.wav"},
	['pitch'] = {100,100}
})

TFA.AddWeaponSound ( "BigEye.ClipOut1", "weapons/tfa_cso/waterpistol/clipout1.wav" )
TFA.AddWeaponSound ( "BigEye.ClipIn1", "weapons/tfa_cso/waterpistol/clipin1.wav" )
TFA.AddWeaponSound ( "BigEye.ClipIn2", "weapons/tfa_cso/waterpistol/clipin2.wav" )
TFA.AddWeaponSound ( "BigEye.Draw", "weapons/tfa_cso/waterpistol/draw.wav" )

-- Psychic Harmonium

sound.Add({
	['name'] = "Harmonium.Fire1",
	['channel'] = CHAN_USER_BASE+11,
	['sound'] = { "weapons/tfa_cso/harmonium/fire1.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "Harmonium.Fire2",
	['channel'] = CHAN_USER_BASE+11,
	['sound'] = { "weapons/tfa_cso/harmonium/fire2.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "Harmonium.Fire3",
	['channel'] = CHAN_USER_BASE+11,
	['sound'] = { "weapons/tfa_cso/harmonium/fire3.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "Harmonium.Idle",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/harmonium/idle.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "Harmonium.ShootA",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/harmonium/shoot_a.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "Harmonium.ShootB",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/harmonium/shoot_b.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "Harmonium.ShootC1",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/harmonium/shoot_c1.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "Harmonium.ShootC2",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/harmonium/shoot_c2.wav"},
	['pitch'] = {100,100}
})

TFA.AddWeaponSound ( "Harmonium.Reload", "weapons/tfa_cso/harmonium/reload.wav" )
TFA.AddWeaponSound ( "Harmonium.Draw", "weapons/tfa_cso/harmonium/draw.wav" )
TFA.AddWeaponSound ( "Harmonium.Exp", "weapons/tfa_cso/harmonium/exp.wav" )

-- Bird Canon MK1

sound.Add({
	['name'] = "BirdCanonMK1.Fire",
	['channel'] = CHAN_USER_BASE+11,
	['sound'] = { "weapons/tfa_cso/bird_canon_mk1/fire.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "BirdCanonMK1.Idle",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/bird_canon_mk1/idle.wav"},
	['pitch'] = {100,100}
})

TFA.AddWeaponSound ( "BirdCanonMK1.Draw", "weapons/tfa_cso/bird_canon_mk1/draw.wav" )

-- SG552 Cerberus

sound.Add({
	['name'] = "SG552Cerberus.Fire",
	['channel'] = CHAN_USER_BASE+11,
	['sound'] = { "weapons/tfa_cso/sg552_cerberus/fire.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "SG552Cerberus.Idle",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/sg552_cerberus/idle.wav"},
	['pitch'] = {100,100}
})

TFA.AddWeaponSound ( "SG552Cerberus.Claw", "weapons/tfa_cso/sg552_cerberus/claw.wav" )
TFA.AddWeaponSound ( "SG552Cerberus.Draw", "weapons/tfa_cso/sg552_cerberus/draw.wav" )
TFA.AddWeaponSound ( "SG552Cerberus.ClipOut", "weapons/tfa_cso/sg552_cerberus/clipout.wav" )
TFA.AddWeaponSound ( "SG552Cerberus.ClipIn1", "weapons/tfa_cso/sg552_cerberus/clipin1.wav" )
TFA.AddWeaponSound ( "SG552Cerberus.ClipIn2", "weapons/tfa_cso/sg552_cerberus/clipin2.wav" )

-- Laevatein

sound.Add({
	['name'] = "Laevatein.Fire",
	['channel'] = CHAN_USER_BASE+11,
	['sound'] = { "weapons/tfa_cso/laevatein/fire.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "Laevatein.Exp",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/laevatein/exp.wav"},
	['pitch'] = {100,100}
})

TFA.AddWeaponSound ( "Laevatein.ChangeAB", "weapons/tfa_cso/laevatein/changeAB.wav" )
TFA.AddWeaponSound ( "Laevatein.ChangeBC", "weapons/tfa_cso/laevatein/changeBC.wav" )
TFA.AddWeaponSound ( "Laevatein.ChangeCA", "weapons/tfa_cso/laevatein/changeCA.wav" )
TFA.AddWeaponSound ( "Laevatein.Draw", "weapons/tfa_cso/laevatein/draw.wav" )
TFA.AddWeaponSound ( "Laevatein.ClipOut", "weapons/tfa_cso/laevatein/clipout.wav" )
TFA.AddWeaponSound ( "Laevatein.ClipIn1", "weapons/tfa_cso/laevatein/clipin1.wav" )
TFA.AddWeaponSound ( "Laevatein.ClipIn2", "weapons/tfa_cso/laevatein/clipin2.wav" )
TFA.AddWeaponSound ( "Laevatein.ClipIn3", "weapons/tfa_cso/laevatein/clipin3.wav" )

-- Psychic Sizer

sound.Add({
	['name'] = "Pianogunex.Fire1",
	['channel'] = CHAN_USER_BASE+11,
	['sound'] = { "weapons/tfa_cso/pianogunex/fire1.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "Pianogunex.Fire2",
	['channel'] = CHAN_USER_BASE+11,
	['sound'] = { "weapons/tfa_cso/pianogunex/fire2.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "Pianogunex.Fire3",
	['channel'] = CHAN_USER_BASE+11,
	['sound'] = { "weapons/tfa_cso/pianogunex/fire3.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "Pianogunex.Idle",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/pianogunex/idle.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "Pianogunex.ShootA",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/pianogunex/shoot_a.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "Pianogunex.ShootB",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/pianogunex/shoot_b.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "Pianogunex.ShootC1",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/pianogunex/shoot_c1.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "Pianogunex.ShootC2",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/pianogunex/shoot_c2.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "Pianogunex.ShootC3",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/pianogunex/shoot_c3.wav"},
	['pitch'] = {100,100}
})

TFA.AddWeaponSound ( "Pianogunex.Reload", "weapons/tfa_cso/pianogunex/reload.wav" )
TFA.AddWeaponSound ( "Pianogunex.Draw", "weapons/tfa_cso/pianogunex/draw.wav" )
TFA.AddWeaponSound ( "Pianogunex.Exp", "weapons/tfa_cso/pianogunex/exp.wav" )

-- Mechasaurus-Mk1 - 4

sound.Add({
	['name'] = "MechasaurusMK.Fire1",
	['channel'] = CHAN_USER_BASE+11,
	['sound'] = { "weapons/tfa_cso/mechasaurus_mk/fire1.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "MechasaurusMK.Fire2",
	['channel'] = CHAN_USER_BASE+11,
	['sound'] = { "weapons/tfa_cso/mechasaurus_mk/fire2.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "MechasaurusMK.Fire3",
	['channel'] = CHAN_USER_BASE+11,
	['sound'] = { "weapons/tfa_cso/mechasaurus_mk/fire3.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "MechasaurusMK.Ready",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/mechasaurus_mk/ready.wav"},
	['pitch'] = {100,100}
})

TFA.AddWeaponSound ( "MechasaurusMK.ChangeAB", "weapons/tfa_cso/mechasaurus_mk/changeAB.wav" )
TFA.AddWeaponSound ( "MechasaurusMK.ChangeBA", "weapons/tfa_cso/mechasaurus_mk/changeBA.wav" )
TFA.AddWeaponSound ( "MechasaurusMK.ChangeBA_MK3", "weapons/tfa_cso/mechasaurus_mk/changeBA_mk3.wav" )
TFA.AddWeaponSound ( "MechasaurusMK.Draw", "weapons/tfa_cso/mechasaurus_mk/draw.wav" )
TFA.AddWeaponSound ( "MechasaurusMK.Boltpull", "weapons/tfa_cso/mechasaurus_mk/boltpull.wav" )
TFA.AddWeaponSound ( "MechasaurusMK.ClipOut", "weapons/tfa_cso/mechasaurus_mk/clipout.wav" )
TFA.AddWeaponSound ( "MechasaurusMK.ClipIn1", "weapons/tfa_cso/mechasaurus_mk/clipin1.wav" )
TFA.AddWeaponSound ( "MechasaurusMK.ClipIn2", "weapons/tfa_cso/mechasaurus_mk/clipin2.wav" )

-- Lightning HZ-1

sound.Add({
	['name'] = "HeavyZG.Fire",
	['channel'] = CHAN_USER_BASE+11,
	['sound'] = { "weapons/tfa_cso/heavyzg/fire.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "HeavyZG.DryFire",
	['channel'] = CHAN_USER_BASE+11,
	['sound'] = { "weapons/tfa_cso/heavyzg/dryfire.wav"},
	['pitch'] = {100,100}
})

TFA.AddWeaponSound ( "HeavyZG.Idle1", "weapons/tfa_cso/heavyzg/idle1.wav" )
TFA.AddWeaponSound ( "HeavyZG.Idle2", "weapons/tfa_cso/heavyzg/idle2.wav" )
TFA.AddWeaponSound ( "HeavyZG.Reload", "weapons/tfa_cso/heavyzg/reload.wav" )
TFA.AddWeaponSound ( "HeavyZG.Draw", "weapons/tfa_cso/heavyzg/draw.wav" )

-- Lightning LZ-1

sound.Add({
	['name'] = "LightZG.Fire",
	['channel'] = CHAN_USER_BASE+11,
	['sound'] = { "weapons/tfa_cso/lightzg/fire.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "LightZG.DryFire",
	['channel'] = CHAN_USER_BASE+11,
	['sound'] = { "weapons/tfa_cso/lightzg/dryfire.wav"},
	['pitch'] = {100,100}
})

TFA.AddWeaponSound ( "LightZG.Idle", "weapons/tfa_cso/lightzg/idle.wav" )
TFA.AddWeaponSound ( "LightZG.Reload", "weapons/tfa_cso/lightzg/reload.wav" )
TFA.AddWeaponSound ( "LightZG.Draw", "weapons/tfa_cso/lightzg/draw.wav" )

-- Ripper

sound.Add({
	['name'] = "Chainsaw.Attack_Start",
	['channel'] = CHAN_USER_BASE+11,
	['sound'] = { "weapons/tfa_cso/chainsaw/attack_start.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "Chainsaw.Attack_Loop",
	['channel'] = CHAN_USER_BASE+11,
	['sound'] = { "weapons/tfa_cso/chainsaw/attack_loop.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "Chainsaw.Attack_End",
	['channel'] = CHAN_USER_BASE+11,
	['sound'] = { "weapons/tfa_cso/chainsaw/attack_end.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "Chainsaw.Slash1",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/chainsaw/slash1.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "Chainsaw.Slash2",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/chainsaw/slash2.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "Chainsaw.Slash3",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/chainsaw/slash3.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "Chainsaw.Slash4",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/chainsaw/slash4.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "Chainsaw.HitFleshSlash1",
	['channel'] = CHAN_WEAPON,
	['sound'] = { "weapons/tfa_cso/chainsaw/hit1.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "Chainsaw.HitFleshSlash2",
	['channel'] = CHAN_WEAPON,
	['sound'] = { "weapons/tfa_cso/chainsaw/hit2.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "Chainsaw.HitFleshSlash3",
	['channel'] = CHAN_WEAPON,
	['sound'] = { "weapons/tfa_cso/chainsaw/hit3.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "Chainsaw.HitFleshSlash4",
	['channel'] = CHAN_WEAPON,
	['sound'] = { "weapons/tfa_cso/chainsaw/hit4.wav"},
	['pitch'] = {100,100}
})

TFA.AddWeaponSound ( "Chainsaw.Idle", "weapons/tfa_cso/chainsaw/idle.wav" )
TFA.AddWeaponSound ( "Chainsaw.Reload", "weapons/tfa_cso/chainsaw/reload.wav" )
TFA.AddWeaponSound ( "Chainsaw.Draw", "weapons/tfa_cso/chainsaw/draw.wav" )
TFA.AddWeaponSound ( "Chainsaw.Draw_Empty", "weapons/tfa_cso/chainsaw/draw_empty.wav" )

-- Last Stand Ripper

sound.Add({
	['name'] = "HeroChainsaw.Attack_Start",
	['channel'] = CHAN_USER_BASE+11,
	['sound'] = { "weapons/tfa_cso/herochainsaw/attack_start.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "HeroChainsaw.Attack_Loop",
	['channel'] = CHAN_USER_BASE+11,
	['sound'] = { "weapons/tfa_cso/herochainsaw/attack_loop.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "HeroChainsaw.Attack_End",
	['channel'] = CHAN_USER_BASE+11,
	['sound'] = { "weapons/tfa_cso/herochainsaw/attack_end.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "HeroChainsaw.Slash1",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/herochainsaw/slash1.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "HeroChainsaw.Slash2",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/herochainsaw/slash2.wav"},
	['pitch'] = {100,100}
})

TFA.AddWeaponSound ( "HeroChainsaw.Idle", "weapons/tfa_cso/herochainsaw/idle.wav" )
TFA.AddWeaponSound ( "HeroChainsaw.Draw", "weapons/tfa_cso/herochainsaw/draw.wav" )

-- Salamander / Poison Gun

sound.Add({
	['name'] = "Flamethrower.Fire",
	['channel'] = CHAN_USER_BASE+11,
	['sound'] = { "weapons/tfa_cso/flamethrower/fire.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "Flamethrower.Fire_End",
	['channel'] = CHAN_USER_BASE+11,
	['sound'] = { "weapons/tfa_cso/flamethrower/fire_end.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "Poisongun.Fire",
	['channel'] = CHAN_USER_BASE+11,
	['sound'] = { "weapons/tfa_cso/poisongun/fire.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "Poisongun.Fire_End",
	['channel'] = CHAN_USER_BASE+11,
	['sound'] = { "weapons/tfa_cso/poisongun/fire_end.wav"},
	['pitch'] = {100,100}
})

TFA.AddWeaponSound ( "Flamethrower.ClipIn1", "weapons/tfa_cso/flamethrower/clipin1.wav" )
TFA.AddWeaponSound ( "Flamethrower.ClipIn2", "weapons/tfa_cso/flamethrower/clipin2.wav" )
TFA.AddWeaponSound ( "Flamethrower.ClipOut1", "weapons/tfa_cso/flamethrower/clipout1.wav" )
TFA.AddWeaponSound ( "Flamethrower.ClipOut2", "weapons/tfa_cso/flamethrower/clipout2.wav" )
TFA.AddWeaponSound ( "Flamethrower.Draw", "weapons/tfa_cso/flamethrower/draw.wav" )

-- Death Eater

sound.Add({
	['name'] = "DeathEater.Fire",
	['channel'] = CHAN_USER_BASE+11,
	['sound'] = { "weapons/tfa_cso/death_eater/fire.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "DeathEater.Fire_Laser",
	['channel'] = CHAN_USER_BASE+11,
	['sound'] = { "weapons/tfa_cso/death_eater/fire_laser.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "DeathEater.Fire2",
	['channel'] = CHAN_USER_BASE+11,
	['sound'] = { "weapons/tfa_cso/death_eater/fire2.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "DeathEater.Fire_Laser_Start",
	['channel'] = CHAN_USER_BASE+11,
	['sound'] = { "weapons/tfa_cso/death_eater/fire_laser_start.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "DeathEater.Fire2_End",
	['channel'] = CHAN_USER_BASE+11,
	['sound'] = { "weapons/tfa_cso/death_eater/fire2_end.wav"},
	['pitch'] = {100,100}
})

TFA.AddWeaponSound ( "DeathEater.ClipIn1", "weapons/tfa_cso/death_eater/clipin1.wav" )
TFA.AddWeaponSound ( "DeathEater.ClipIn2", "weapons/tfa_cso/death_eater/clipin2.wav" )
TFA.AddWeaponSound ( "DeathEater.ClipOut1", "weapons/tfa_cso/death_eater/clipout1.wav" )
TFA.AddWeaponSound ( "DeathEater.Draw", "weapons/tfa_cso/death_eater/draw.wav" )

-- Lunar Cannon

sound.Add({
	['name'] = "LunarCannon.Fire",
	['channel'] = CHAN_USER_BASE+11,
	['sound'] = { "weapons/tfa_cso/volcanoex/fire.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "LunarCannon.Fire2",
	['channel'] = CHAN_USER_BASE+11,
	['sound'] = { "weapons/tfa_cso/volcanoex/fire2.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "LunarCannon.Exp",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/lunarcannon/exp.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "LunarCannon.Exp_Start",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/lunarcannon/exp_start.wav"},
	['pitch'] = {100,100}
})

TFA.AddWeaponSound ( "LunarCannon.ClipOut1", "weapons/tfa_cso/lunarcannon/clipout1.wav" )
TFA.AddWeaponSound ( "LunarCannon.ClipOut2", "weapons/tfa_cso/lunarcannon/clipout2.wav" )
TFA.AddWeaponSound ( "LunarCannon.ClipIn1", "weapons/tfa_cso/lunarcannon/clipin1.wav" )
TFA.AddWeaponSound ( "LunarCannon.ClipIn2", "weapons/tfa_cso/lunarcannon/clipin2.wav" )
TFA.AddWeaponSound ( "LunarCannon.Boltpull", "weapons/tfa_cso/lunarcannon/boltpull.wav" )
TFA.AddWeaponSound ( "LunarCannon.Draw", "weapons/tfa_cso/lunarcannon/draw.wav" )

-- Star Taylor

sound.Add({
	['name'] = "StarTaylor.Fire",
	['channel'] = CHAN_USER_BASE+11,
	['sound'] = { "weapons/tfa_cso/star_taylor/fire.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "StarTaylor.Fire_End",
	['channel'] = CHAN_USER_BASE+11,
	['sound'] = { "weapons/tfa_cso/star_taylor/fire_end.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "StarTaylor.Fire2",
	['channel'] = CHAN_USER_BASE+11,
	['sound'] = { "weapons/tfa_cso/star_taylor/fire2.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "StarTaylor.MilkyWay",
	['channel'] = CHAN_USER_BASE+11,
	['sound'] = { "weapons/tfa_cso/star_taylor/milkyway.wav"},
	['pitch'] = {100,100}
})

TFA.AddWeaponSound ( "StarTaylor.ClipOut", "weapons/tfa_cso/star_taylor/clipout.wav" )
TFA.AddWeaponSound ( "StarTaylor.ClipIn", "weapons/tfa_cso/star_taylor/clipin.wav" )
TFA.AddWeaponSound ( "StarTaylor.Draw", "weapons/tfa_cso/star_taylor/draw.wav" )
TFA.AddWeaponSound ( "StarTaylor.Idle", "weapons/tfa_cso/star_taylor/idle.wav" )

-- Quantum Horizon

sound.Add({
	['name'] = "Quantum.Fire",
	['channel'] = CHAN_USER_BASE+11,
	['sound'] = { "weapons/tfa_cso/quantum_horizon/fire.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "Quantum.Fire2",
	['channel'] = CHAN_USER_BASE+11,
	['sound'] = { "weapons/tfa_cso/quantum_horizon/fire2.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "Quantum.Exp",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/quantum_horizon/exp.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "Quantum.Idle1",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/quantum_horizon/idle1.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "Quantum.Idle2",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/quantum_horizon/idle2.wav"},
	['pitch'] = {100,100}
})

TFA.AddWeaponSound ( "Quantum.ShootB_Start", "weapons/tfa_cso/quantum_horizon/shootB_start.wav" )
TFA.AddWeaponSound ( "Quantum.ShootB", "weapons/tfa_cso/quantum_horizon/shootB.wav" )
TFA.AddWeaponSound ( "Quantum.Draw", "weapons/tfa_cso/quantum_horizon/draw.wav" )
TFA.AddWeaponSound ( "Quantum.ClipOutA", "weapons/tfa_cso/quantum_horizon/clipoutA.wav" )
TFA.AddWeaponSound ( "Quantum.ClipOutB", "weapons/tfa_cso/quantum_horizon/clipoutB.wav" )
TFA.AddWeaponSound ( "Quantum.ClipIn", "weapons/tfa_cso/quantum_horizon/clipin.wav" )

-- Gigantic Drill

sound.Add({
	['name'] = "Magnumdrillex.Fire",
	['channel'] = CHAN_USER_BASE+11,
	['sound'] = { "weapons/tfa_cso/magnumdrillex/fire.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "Magnumdrillex.Idle1",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/magnumdrillex/idle1.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "Magnumdrillex.Idle2",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/magnumdrillex/idle2.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "Magnumdrillex.Slash1",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/magnumdrillex/slash1.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "Magnumdrillex.Slash2",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/magnumdrillex/slash2.wav"},
	['pitch'] = {100,100}
})

TFA.AddWeaponSound ( "Magnumdrillex.ClipOut", "weapons/tfa_cso//magnumdrillex/clipout.wav" )
TFA.AddWeaponSound ( "Magnumdrillex.ClipIn", "weapons/tfa_cso//magnumdrillex/clipin.wav" )
TFA.AddWeaponSound ( "Magnumdrillex.Draw", "weapons/tfa_cso//magnumdrillex/draw.wav" )

-- Laser Ripper

sound.Add({
	['name'] = "LaserChainsaw.Attack_Start",
	['channel'] = CHAN_USER_BASE+11,
	['sound'] = { "weapons/tfa_cso/laserchainsaw/attack_start.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "LaserChainsaw.Attack_Loop",
	['channel'] = CHAN_USER_BASE+11,
	['sound'] = { "weapons/tfa_cso/laserchainsaw/attack_loop.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "LaserChainsaw.Attack_End",
	['channel'] = CHAN_USER_BASE+11,
	['sound'] = { "weapons/tfa_cso/laserchainsaw/attack_end.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "LaserChainsaw.Fire2",
	['channel'] = CHAN_USER_BASE+11,
	['sound'] = { "weapons/tfa_cso/laserchainsaw/fire2.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "LaserChainsaw.Slash1",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/laserchainsaw/slash1.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "LaserChainsaw.Slash2",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/laserchainsaw/slash2.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "LaserChainsaw.Slash3",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/laserchainsaw/slash3.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "LaserChainsaw.Slash4",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/laserchainsaw/slash4.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "LaserChainsaw.Spin",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/laserchainsaw/spin.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "LaserChainsaw.Spin_End",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/laserchainsaw/spin_end.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "LaserChainsaw.HitFleshSlash1",
	['channel'] = CHAN_WEAPON,
	['sound'] = { "weapons/tfa_cso/laserchainsaw/hit1.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "LaserChainsaw.HitFleshSlash2",
	['channel'] = CHAN_WEAPON,
	['sound'] = { "weapons/tfa_cso/laserchainsaw/hit2.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "LaserChainsaw.HitWall",
	['channel'] = CHAN_WEAPON,
	['sound'] = { "weapons/tfa_cso/laserchainsaw/wall.wav"},
	['pitch'] = {100,100}
})

TFA.AddWeaponSound ( "LaserChainsaw.Idle", "weapons/tfa_cso/laserchainsaw/idle.wav" )
TFA.AddWeaponSound ( "LaserChainsaw.Reload", "weapons/tfa_cso/laserchainsaw/reload.wav" )
TFA.AddWeaponSound ( "LaserChainsaw.Draw", "weapons/tfa_cso/laserchainsaw/draw.wav" )
TFA.AddWeaponSound ( "LaserChainsaw.Skill_Start", "weapons/tfa_cso/laserchainsaw/skill_start.wav" )
TFA.AddWeaponSound ( "LaserChainsaw.Skill_End", "weapons/tfa_cso/laserchainsaw/skill_end.wav" )
TFA.AddWeaponSound ( "LaserChainsaw.Slash_End", "weapons/tfa_cso/laserchainsaw/slash_end.wav" )
TFA.AddWeaponSound ( "LaserChainsaw.Charge", "weapons/tfa_cso/laserchainsaw/charge.wav" )
TFA.AddWeaponSound ( "LaserChainsaw.Charge_End", "weapons/tfa_cso/laserchainsaw/charge_end.wav" )

--Hecate II Umbra
TFA.AddFireSound( "ChainSR.Fire", "weapons/tfa_cso/chainsr/fire.wav", false, "^" )
TFA.AddWeaponSound ( "ChainSR.Idle", "weapons/tfa_cso/chainsr/idle.wav" )
TFA.AddWeaponSound ( "ChainSR.Draw", "weapons/tfa_cso/chainsr/draw.wav" )
TFA.AddWeaponSound ( "ChainSR.Reload1", "weapons/tfa_cso/chainsr/reload1.wav" )
TFA.AddWeaponSound ( "ChainSR.Reload2", "weapons/tfa_cso/chainsr/reload2.wav" )
TFA.AddWeaponSound ( "ChainSR.BoltPull", "weapons/tfa_cso/chainsr/boltpull.wav" )

-- Cyclops
TFA.AddFireSound( "Cyclops.Fire", "weapons/tfa_cso/cyclops/fire1.wav", false, "^" )
TFA.AddFireSound( "Cyclops.Fire2", "weapons/tfa_cso/cyclops/fire2.wav", false, "^" )
TFA.AddFireSound( "Cyclops.Fire2_End", "weapons/tfa_cso/cyclops/fire2_end.wav", false, "^"  )
TFA.AddFireSound( "Cyclops.Fire3", "weapons/tfa_cso/cyclops/fire3.wav", false, "^" )
TFA.AddWeaponSound( "Cyclops.Idle", "weapons/tfa_cso/cyclops/idle.wav" )
TFA.AddWeaponSound( "Cyclops.Draw", "weapons/tfa_cso/cyclops/draw.wav" )
TFA.AddWeaponSound( "Cyclops.ClipOut", "weapons/tfa_cso/cyclops/clipout.wav" )
TFA.AddWeaponSound( "Cyclops.ClipIn", "weapons/tfa_cso/cyclops/clipin.wav" )
TFA.AddWeaponSound( "Cyclops.Kill", "weapons/tfa_cso/cyclops/Kill.wav" )

--Divine Flintlock
TFA.AddFireSound( "Musket.Fire", "weapons/tfa_cso/musket/fire.wav", false, "^" )
TFA.AddWeaponSound ( "Musket.ClipIn1", "weapons/tfa_cso/musket/clipin1.wav" )
TFA.AddWeaponSound ( "Musket.ClipIn2", "weapons/tfa_cso/musket/clipin2.wav" )

-- Ancient Keeper
TFA.AddFireSound( "AncientKeeper.Fire2", "weapons/tfa_cso/ancient_keeper/fire2.wav", false, "^" )
TFA.AddWeaponSound( "AncientKeeper.Ready", "weapons/tfa_cso//ancient_keeper/ready.wav" )

--Arbalest
sound.Add({
	['name'] = "Halogun.Exp",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/halogun/exp.wav"},
	['pitch'] = {100,100}
})
sound.Add({
	['name'] = "Halogun.Exp2",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/halogun/exp2.wav"},
	['pitch'] = {100,100}
})

TFA.AddFireSound( "Halogun.Fire", "weapons/tfa_cso/halogun/fire.wav", false, "^" )
TFA.AddFireSound( "Halogun.Fire2", "weapons/tfa_cso/halogun/fire2.wav", false, "^" )
TFA.AddFireSound( "Halogun.Fire3", "weapons/tfa_cso/halogun/fire3.wav", false, "^" )
TFA.AddWeaponSound ( "Halogun.Idle", "weapons/tfa_cso/halogun/idle.wav" )
TFA.AddWeaponSound ( "Halogun.Reload", "weapons/tfa_cso/halogun/reload.wav" )
TFA.AddWeaponSound ( "Halogun.Draw", "weapons/tfa_cso/halogun/draw.wav" )
TFA.AddWeaponSound ( "Halogun.ShootB_Start", "weapons/tfa_cso/halogun/shootb_start.wav" )
TFA.AddFireSound( "Halogun.ShootB_Loop", "weapons/tfa_cso/halogun/shootb_loop.wav", false, "^" )
TFA.AddWeaponSound ( "Halogun.ShootB_End", "weapons/tfa_cso/halogun/shootb_end.wav" )
TFA.AddWeaponSound ( "Halogun.ShootB_Charging_End", "weapons/tfa_cso/halogun/shootb_charging_end.wav" )

-- Rock Breaker
sound.Add({
	['name'] = "RockBreaker.HitWall",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/rockbreaker/wall.wav"},
	['pitch'] = {100,100}
})

TFA.AddFireSound( "RockBreaker.Attack", "weapons/tfa_cso/rockbreaker/attack.wav", false, "^" )
TFA.AddFireSound( "RockBreaker.Attack_Start", "weapons/tfa_cso/rockbreaker/attack_start.wav", false, "^" )
TFA.AddFireSound( "RockBreaker.Attack_End", "weapons/tfa_cso/rockbreaker/attack_end.wav", false, "^" )
TFA.AddWeaponSound( "RockBreaker.Draw", "weapons/tfa_cso/rockbreaker/draw.wav" )
TFA.AddWeaponSound( "RockBreaker.Reload", "weapons/tfa_cso/rockbreaker/reload.wav" )
TFA.AddWeaponSound( "RockBreaker.Slash1", "weapons/tfa_cso/rockbreaker/slash1.wav" )
TFA.AddWeaponSound( "RockBreaker.Slash2", "weapons/tfa_cso/rockbreaker/slash2.wav" )

-- Rock Breaker
sound.Add({
	['name'] = "RockBreaker.HitWall",
	['channel'] = CHAN_STATIC,
	['sound'] = { "weapons/tfa_cso/rockbreaker/wall.wav"},
	['pitch'] = {100,100}
})

TFA.AddFireSound( "RockBreaker.Attack", "weapons/tfa_cso/rockbreaker/attack.wav", false, "^" )
TFA.AddFireSound( "RockBreaker.Attack_Start", "weapons/tfa_cso/rockbreaker/attack_start.wav", false, "^" )
TFA.AddFireSound( "RockBreaker.Attack_End", "weapons/tfa_cso/rockbreaker/attack_end.wav", false, "^" )
TFA.AddWeaponSound( "RockBreaker.Draw", "weapons/tfa_cso/rockbreaker/draw.wav" )
TFA.AddWeaponSound( "RockBreaker.Reload", "weapons/tfa_cso/rockbreaker/reload.wav" )
TFA.AddWeaponSound( "RockBreaker.Slash1", "weapons/tfa_cso/rockbreaker/slash1.wav" )
TFA.AddWeaponSound( "RockBreaker.Slash2", "weapons/tfa_cso/rockbreaker/slash2.wav" )

--Pierrot Chameleon Gun
TFA.AddFireSound( "ChameleonGun.Fire", "weapons/tfa_cso/chameleongun/fire.wav", false, "^" )
TFA.AddWeaponSound( "ChameleonGun.Idle", "weapons/tfa_cso/chameleongun/idle.wav")
TFA.AddWeaponSound ( "ChameleonGun.ClipOut1", "weapons/tfa_cso/chameleongun/clipout1.wav" )
TFA.AddWeaponSound ( "ChameleonGun.ClipIn1", "weapons/tfa_cso/chameleongun/clipin1.wav" )
TFA.AddWeaponSound ( "ChameleonGun.ClipIn2", "weapons/tfa_cso/chameleongun/clipin2.wav" )
TFA.AddWeaponSound ( "ChameleonGun.Draw", "weapons/tfa_cso/chameleongun/draw.wav" )