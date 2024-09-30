att.PrintName = "30-Round 5.7mm FN"
att.Icon = Material("entities/acwatt_go_fiveseven_mag_30.png", "mips smooth")
att.Description = "Extended magazine for the Five-seveN pistol. Heavy, but may be worth the extra ammo."
att.Desc_Pros = {
    "pro.magcap"
}
att.Desc_Cons = {
}
att.SortOrder = 30
att.AutoStats = true
att.Slot = "go_fiveseven_mag"

att.Override_ClipSize = 30

att.Mult_MoveSpeed = 0.95
att.Mult_SightTime = 1.15
att.Mult_ReloadTime = 1.25

att.Hook_SelectReloadAnimation = function(wep, anim)
    if anim == "reload" then
        return "reload_long"
    elseif anim == "reload_empty" then
        return "reload_long_empty"
    end
end