att.PrintName = "30-Round 5.56mm STANAG"
att.Icon = Material("entities/acwatt_go_scar_mag_30.png", "mips smooth")
att.Description = "5.56mm conversion makes gun effectively into a SCAR-L pattern, improving fire rate and recoil at the cost of damage. Reduced capacity magazine improves handling."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.SortOrder = 30
att.AutoStats = true
att.Slot = "go_scar_mag"

att.InvAtt = "go_g3_mag_30"

att.Override_Ammo = "smg1"

att.Override_ClipSize = 30
att.Mult_Damage = 0.6
att.Mult_DamageMin = 0.9
att.Mult_Range = 0.8
att.Mult_Recoil = 0.35

att.Override_Trivia_Class = "Assault Rifle"
att.Override_Trivia_Calibre = "5.56x45mm NATO"

att.Hook_GetShootSound = function(wep, fsound)
    if fsound == "arccw_go/scar20/scar20_02.wav" then return "arccw_go/m4a1/m4a1_us_04.wav" end
    if fsound == "arccw_go/scar20/scar20_01.wav" then return "arccw_go/m4a1/m4a1_us_02.wav" end
end

att.Hook_SelectReloadAnimation = function(wep, anim)
    if anim == "reload" then
        return "reload_longmag"
    elseif anim == "reload_empty" then
        return "reload_longmag_empty"
    end
end