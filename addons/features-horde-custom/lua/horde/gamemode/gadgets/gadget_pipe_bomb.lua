GADGET.PrintName = "Pipe Bomb"
GADGET.Description = "Throws a bomb that attracts nearby enemies, then explodes for up to 200 damage."
GADGET.Icon = "items/gadgets/butane_can.png"
GADGET.Duration = 5
GADGET.Cooldown = 20
GADGET.Active = true
GADGET.Params = {
}
GADGET.Hooks = {}

GADGET.Hooks.Horde_UseActiveGadget = function (ply)
    if CLIENT then return end
    if ply:Horde_GetGadget() ~= "gadget_pipe_bomb" then return end
   local rocket = ents.Create("projectile_horde_pipe_bomb")
    local vel = 10
    local ang = ply:EyeAngles()

    local src = ply:GetPos() + Vector(0,0,50) + ply:GetEyeTrace().Normal * 5

    if !rocket:IsValid() then print("!!! INVALID ROUND " .. rocket) return end

    local rocketAng = Angle(ang.p, ang.y, ang.r)

    rocket:SetAngles(rocketAng)
    rocket:SetPos(src)

    rocket:SetOwner(ply)
    rocket.Owner = ply
 -- rocket:SetNWEntity("HordeOwner", ply)
    rocket.Inflictor = rocket

    local RealVelocity = ang:Forward() * vel / 0.0254
    rocket.CurVel = RealVelocity -- for non-physical projectiles that move themselves

    rocket:Spawn()
    rocket:Activate()
    if !rocket.NoPhys and rocket:GetPhysicsObject():IsValid() then
        rocket:SetCollisionGroup(rocket.CollisionGroup or COLLISION_GROUP_DEBRIS)
        rocket:GetPhysicsObject():SetVelocityInstantaneous(RealVelocity)
    end

    if rocket.Launch and rocket.SetState then
        rocket:SetState(1)
        rocket:Launch()
    end

    --sound.Play("weapons/physcannon/superphys_launch1.wav", ply:GetPos())

end