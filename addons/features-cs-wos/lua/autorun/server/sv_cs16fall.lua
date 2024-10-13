if SERVER then
    resource.AddFile("sound/cs16_fall.wav")

    local fallSoundEnabled = CreateConVar("sv_cs_fall", "1", FCVAR_ARCHIVE, "Enable or disable CS16 Fall Scream sound")

    -- Armazena o estado da última queda do jogador
    local lastFallState = false

    local function NotifyPlayers(state)
        local message = "CS16 Fall Scream " .. (state and "enabled" or "disabled")
        PrintMessage(HUD_PRINTTALK, message)
    end

    hook.Add("SetupMove", "CheckPlayerFall", function(ply, move)
        if not IsValid(ply) or not ply:Alive() or ply:IsOnGround() or ply:GetMoveType() == MOVETYPE_NOCLIP then
            return
        end

        if fallSoundEnabled:GetBool() then
            local velocity = ply:GetVelocity()
            local fallState = velocity.z < -600 -- Ajuste este valor conforme necessário
            if fallState and not lastFallState then
                ply:EmitSound("cs16_fall.wav", 75, 100)
            end
            lastFallState = fallState
        else
            lastFallState = false
        end
    end)

    -- Hook para monitorar mudanças no valor do ConVar
    cvars.AddChangeCallback("sv_cs_fall", function(convar_name, value_old, value_new)
        local state = tobool(value_new)
        NotifyPlayers(state)
    end)
end