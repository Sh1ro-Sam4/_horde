--[[
             /|  
,           /||  
\\ /` -_-_   ||  
 \\   || \\  ||  
 /\\  || ||  ||  
/  \; ||-'  ,/-' 
      |/         
      '          
Xp1 criador do addon 

]]--

if SERVER then
    -- Adiciona os sons ao download do cliente
    resource.AddFile("sound/Death_Screams/death1.wav")
    resource.AddFile("sound/Death_Screams/death2.wav")
    resource.AddFile("sound/Death_Screams/death3.wav")
    resource.AddFile("sound/Death_Screams/death4.wav")
    resource.AddFile("sound/Death_Screams/death5.wav")
    resource.AddFile("sound/Death_Screams/death6.wav")
	resource.AddFile("sound/Death_Screams/death7.wav")

    -- Cria um ConVar para ativar/desativar os sons de morte personalizados
    CreateConVar("sv_cs_death", "1", FCVAR_ARCHIVE, "Enable or disable custom death sounds")

    -- Função para tocar um som de morte aleatório
    local function playerDies(ply)
        if GetConVar("sv_cs_death"):GetBool() then
            local pitch = 100 * GetConVarNumber("host_timescale")
            local soundPath = "Death_Screams/death" .. math.random(1, 6) .. ".wav"
            local pos = ply:GetPos()

            -- Emite um som ambiente 3D na posição do jogador
            sound.Play(soundPath, pos, 75, pitch, 1)
        end
    end

    -- Hook para tocar o som de morte
    hook.Add("PlayerDeath", "playerDeathTest", playerDies)

    -- Hook para suprimir o som de morte padrão
    hook.Add("PlayerDeathSound", "DeFlatline", function()
        if GetConVar("sv_cs_death"):GetBool() then
            return true
        end
    end)

    -- Função para notificar jogadores sobre a mudança de estado
    local function NotifyPlayers(state)
        local message = "cs 1.6 death sounds " .. (state and "enabled" or "disabled")
        PrintMessage(HUD_PRINTTALK, message)
    end

    -- Hook para monitorar mudanças no valor do ConVar
    cvars.AddChangeCallback("sv_cs_death", function(convar_name, value_old, value_new)
        local state = tobool(value_new)
        NotifyPlayers(state)
    end)
end