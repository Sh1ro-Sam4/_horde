att.PrintName = "60-Round 5.45mm Poly"
att.Icon = Material("entities/acwatt_go_ak_mag_60_545.png", "mips smooth")
att.Description = "AK-74 conversion for the AKM. Huge casket magazine that can hold 60 rounds, though very cumbersome."
att.SortOrder = 60
att.Desc_Pros = {
    "pro.magcap"
}
att.Desc_Cons = {
}
att.AutoStats = true
att.Slot = "go_ammo_ak74"

att.Mult_MoveSpeed = 0.85
att.Mult_SightTime = 1.25
att.Override_ClipSize = 60
att.Mult_ReloadTime = 1.25

att.Mult_Range = 0.8
att.Mult_Penetration = 0.8
att.Mult_Recoil = 0.85
att.Mult_RPM = 1.15
att.Mult_AccuracyMOA = 0.8
att.Mult_Damage = 0.9
att.Mult_DamageMin = 0.9

att.Override_Ammo = "smg1"

att.Override_Trivia_Calibre = "5.45x39mm Soviet"

att.Hook_GetShootSound = function(wep, fsound)
    if fsound == "arccw_go/ak47/ak47_01.wav" then return "arccw_go/ak74/ak74_fp.wav"
    elseif fsound == "arccw_go/m4a1/m4a1_silencer_01.wav" then return "arccw_go/ak74/ak74_suppressed_fp.wav"
    elseif fsound == "arccw_go/ak47/ak47-1-distant.wav" then return "arccw_go/ak74/ak74_dist.wav"
    end
end