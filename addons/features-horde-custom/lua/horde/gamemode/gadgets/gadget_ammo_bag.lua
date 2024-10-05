GADGET.PrintName = "Ammo Bag"
GADGET.Description = "Deploys an ammo bag. Use to gain ammo for all of your weapons. \nCan be used 6 times before being used up. \nCan be used by other players."
GADGET.Icon = "items/gadgets/ammo_bag.png"
GADGET.Duration = 30
GADGET.Cooldown = 30
GADGET.Active = true
GADGET.Params = {
}
GADGET.Hooks = {}

GADGET.Hooks.Horde_UseActiveGadget = function (ply)
    if CLIENT then return end
    if ply:Horde_GetGadget() ~= "gadget_ammo_bag" then return end
    local ent = ents.Create("horde_ammo_bag")
    local pos = ply:GetPos()
    local dir = (ply:GetEyeTrace().HitPos - pos)
    dir:Normalize()
    local drop_pos = pos + dir * 50
    drop_pos.z = pos.z + 15
    ent:SetPos(drop_pos)
    ent:SetAngles(Angle(0, ply:GetAngles().y, 0))
    ply:Horde_AddDropEntity(ent:GetClass(), ent)
    --ent:SetNWEntity("HordeOwner", ply)
    ent:Spawn()

end