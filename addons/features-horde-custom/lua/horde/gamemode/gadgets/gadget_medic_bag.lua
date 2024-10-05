GADGET.PrintName = "Medic Bag"
GADGET.Description = "Deploys a medic bag. Use to heal yourself to full health. \nCan be used 4 times before being used up. \nCan be used by other players. \nCannot be used if your current health is equal to or greater than your max health."
GADGET.Icon = "items/gadgets/medic_bag.png"
GADGET.Duration = 30
GADGET.Cooldown = 60
GADGET.Active = true
GADGET.Params = {
}
GADGET.Hooks = {}

GADGET.Hooks.Horde_UseActiveGadget = function (ply)
    if CLIENT then return end
    if ply:Horde_GetGadget() ~= "gadget_medic_bag" then return end
    local ent = ents.Create("horde_medic_bag")
    local pos = ply:GetPos()
    local dir = (ply:GetEyeTrace().HitPos - pos)
    dir:Normalize()
    local drop_pos = pos + dir * 50
    drop_pos.z = pos.z + 15
    ent:SetPos(drop_pos)
    ent:SetAngles(Angle(0, ply:GetAngles().y, 0))
    ply:Horde_AddDropEntity(ent:GetClass(), ent)
    ent:Spawn()

end