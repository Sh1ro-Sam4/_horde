att.PrintName = "Magnum Shells"
att.Icon = Material("entities/acwatt_go_ammo_sg_magnum.png", "mips smooth")
att.Description = "A heavy loading of the default buckshot shell, improving close range damage at the cost of range, recoil, and spread."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.AutoStats = true
att.Slot = "go_ammo"

att.Mult_Range = 0.75
att.Mult_AccuracyMOA = 2

att.Mult_Damage = 1.15
att.Mult_DamageMin = 0.75

att.Override_Num_Priority = 2

att.Hook_Compatible = function(wep)
    if !wep:GetIsShotgun() then return false end
end