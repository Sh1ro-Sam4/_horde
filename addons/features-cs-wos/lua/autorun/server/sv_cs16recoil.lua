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


local recoilEnabled = CreateConVar("sv_cs_recoil", "1", FCVAR_ARCHIVE, "Enable or disable cs 1.6 recoil")

local function NotifyPlayers(state)
    local message = "sv_cs_recoil " .. (state and "enabled" or "disabled")
    PrintMessage(HUD_PRINTTALK, message)
end

local function ApplyRecoil(ply, damage, isHeadshot)
    if not recoilEnabled:GetBool() then return end

    local health = ply:Health()

    -- Verifique se a vida do jogador está abaixo de 45 e acima de 20
    if health < 5 and health >= 6 then
        -- Gere um valor de recoil aleatório entre -30 e 50
        local maxRecoil = math.random(-30, 80)
        
        local recoilAmount = 0
        if isHeadshot and damage > 80 then
            recoilAmount = maxRecoil
        else
            recoilAmount = math.Clamp((45 - health) * 0.5, 0, math.abs(maxRecoil))
        end
        local randomAngle = Angle(math.random(-1, 1), math.random(-1, 1), 0) * recoilAmount / math.abs(maxRecoil)
        
        -- Defina a duração do recoil com base no dano
        local minRecoilDuration = 0.2
        local maxRecoilDuration = 1.5
        local recoilDuration = math.Clamp((1 - health / 30) * damage * 0.02, minRecoilDuration, maxRecoilDuration)

        -- Função para aplicar o recoil suavemente
        local function ApplyRecoilSmoothly()
            local currentEyeAngles = ply:EyeAngles()
            local targetEyeAngles = currentEyeAngles + Angle(-recoilAmount, randomAngle.y, 0)

            ply:SetEyeAngles(targetEyeAngles)

            -- Aplica um ViewPunch para desalinhar o modelo de visão das mãos
            local viewPunchAngle = Angle(math.random(-recoilAmount, recoilAmount) * 0.1, math.random(-recoilAmount, recoilAmount) * 0.1, 0)
            ply:ViewPunch(viewPunchAngle)

            -- Função para retornar a visão ao normal
            local function ReturnRecoil()
                local elapsed = 0

                timer.Create("ReturnRecoilTimer", 0.01, recoilDuration * 100, function()
                    if not IsValid(ply) then timer.Remove("ReturnRecoilTimer") return end

                    elapsed = elapsed + 0.01
                    local t = elapsed / recoilDuration
                    local newEyeAngles = LerpAngle(t ^ 2, targetEyeAngles, currentEyeAngles) -- Square easing

                    ply:SetEyeAngles(newEyeAngles)

                    if t >= 1 then
                        timer.Remove("ReturnRecoilTimer")
                    end
                end)
            end

            -- Chama a função para retornar o recoil após um breve intervalo
            timer.Simple(0.05, ReturnRecoil)
        end

        -- Aplica o recoil com um breve atraso para suavizar
        timer.Simple(0.01, ApplyRecoilSmoothly)
    end
end

-- Função para ativar ou desativar o recoil
local function ToggleRecoil(ply, enable)
    if IsValid(ply) and not ply:IsSuperAdmin() then return end -- Apenas superadmins podem usar este comando
    
    RunConsoleCommand("sv_cs_recoil", enable and "1" or "0")
    if IsValid(ply) then
        if enable then
            ply:ChatPrint("cs 1.6 recoil enabled.")
        else
            ply:ChatPrint("cs 1.6 recoil disabled.")
        end
    else
        if enable then
            print("cs 1.6 recoil enabled.")
        else
            print("cs 1.6 recoil disabled.")
        end
    end
end

-- Comando para ativar ou desativar o recoil
concommand.Add("sv_cs_recoil", function(ply, cmd, args)
    if not IsValid(ply) or ply:IsSuperAdmin() then
        local toggle = tonumber(args[1])
        if toggle == 1 then
            ToggleRecoil(ply, true)
        elseif toggle == 0 then
            ToggleRecoil(ply, false)
        else
            if IsValid(ply) then
                ply:ChatPrint("Use 'sv_cs_recoil 1' para ativar ou 'sv_cs_recoil 0' para desativar o recoil.")
            else
                print("Use 'sv_cs_recoil 1' para ativar ou 'sv_cs_recoil 0' para desativar o recoil.")
            end
        end
    end
end)

hook.Add("ScalePlayerDamage", "IncreaseRecoilOnDamage", function(ply, hitgroup, dmginfo)
    local health = ply:Health()

    local isHeadshot = hitgroup == HITGROUP_HEAD
    local damage = dmginfo:GetDamage()

    if damage >= 60 then
        if isHeadshot then
            print("Headshot detected, increasing recoil for player " .. ply:Nick() .. " with damage " .. damage)
        else
            print("Non-headshot damage detected, increasing recoil for player " .. ply:Nick() .. " with damage " .. damage)
        end

        -- Aplica recoil na visão do jogador
        ApplyRecoil(ply, damage, isHeadshot)
    end
end)

-- Callback para notificar mudanças na ConVar
cvars.AddChangeCallback("sv_cs_recoil", function(name, oldValue, newValue)
    local state = tobool(newValue)
    NotifyPlayers(state)
end)