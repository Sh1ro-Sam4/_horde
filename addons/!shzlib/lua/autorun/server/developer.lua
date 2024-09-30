-- hook.Add('KeyPress', 'shizlib-doubleJump', function(ply, key)
--     if not ply:IsValidPlayer() then return end

--     -- if not ply:IsSuperAdmin() then return end

--     if not ply.dJump or ply:IsOnGround() then ply.dJump = 0 end
    
--     if key ~= 2 then return end

--     if ply.dJump >= 2 then return end

--     ply.dJump = ply.dJump + 1
--     if ply.dJump >= 2 then
--         local vel = Vector(0, 0, ply:GetVelocity().z * -1)
--         vel = vel + Vector(0, 0, 300)

--         ply:SetVelocity(vel)
--     end
-- end)