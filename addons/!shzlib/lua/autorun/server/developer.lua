hook.Add('KeyPress', 'shizlib-doubleJump', function(ply, key)
    if not ply:IsValidPlayer() then return end
    if not CFG.djump[ply:GetUserGroup()] then return end

    -- if not ply:IsSuperAdmin() then return end

    if not ply.dJump or ply:IsOnGround() then ply.dJump = 0 end
    
    if key ~= 2 then return end

    if ply.dJump >= 2 then return end

    ply.dJump = ply.dJump + 1
    if ply.dJump >= 2 then
        local vel = Vector(0, 0, ply:GetVelocity().z * -1)
        vel = vel + Vector(0, 0, 300)

        ply:SetVelocity(vel)
    end
end)

hook.Add('PlayerSpawn', 'shizlib-premiumKit', function(ply)
    if CFG.canHook[ply:GetUserGroup()] then
        timer.Simple(.1, function()
            ply:Give('weapon_grapplehook')
        end)
    end
end)