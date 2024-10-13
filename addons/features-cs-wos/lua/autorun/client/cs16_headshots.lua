net.Receive("EmitHelmetImpact", function()
    local particle = net.ReadString()
    local position = net.ReadVector()
    local angle = net.ReadAngle()

    ParticleEffect(particle, position, angle, nil)
end)


net.Receive("EmitBloodParticles", function()
    local particle = net.ReadString()
    local position = net.ReadVector()
    local angle = net.ReadAngle()

    ParticleEffect(particle, position, angle, nil)
end)