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
    resource.AddFile("sound/cs16/headshot1.wav")
    resource.AddFile("sound/cs16/headshot2.wav")
    resource.AddFile("sound/cs16/headshot3.wav")
    resource.AddFile("sound/cs16/headshot4.wav")
    resource.AddFile("sound/cs16/bhit_flesh1.wav")
    resource.AddFile("sound/cs16/bhit_flesh2.wav")
    resource.AddFile("sound/cs16/bhit_flesh3.wav")
    resource.AddFile("sound/cs16/bhit_helmet1.wav")
    resource.AddFile("sound/cs16/bhit_kevlar1.wav")

    -- Cria um ConVar para ativar/desativar os sons de dor personalizados
    CreateConVar("sv_cs_pain", "1", FCVAR_ARCHIVE, "Enable or disable custom pain sounds")

    -- Função para tocar um som de dor aleatório
    local function PlayPainSound(pos, sounds)
        -- Escolhe um som aleatório da lista fornecida
        local soundPath = sounds[math.random(#sounds)]

        -- Emite um som ambiente para todos os jogadores próximos
        sound.Play(soundPath, pos, 75, 100, 1)
    end

    -- Função para notificar jogadores sobre a mudança de estado
    local function NotifyPlayers(state)
        local message = "cs 1.6 pain sounds " .. (state and "enabled" or "disabled")
        PrintMessage(HUD_PRINTTALK, message)
    end


  -- Hook para detectar quando um jogador leva um tiro ou dano de queda
    hook.Add("EntityTakeDamage", "PlayPainSoundOnHit", function(target, dmginfo)
        if GetConVar("sv_cs_pain"):GetBool() then
            if target:IsPlayer() then
                local damageType = dmginfo:GetDamageType()

                if damageType == DMG_FALL then
                    -- Lista de sons para dano de queda
                    local fallSounds = {
                        "cs16/bhit_flesh1.wav",
                        "cs16/bhit_flesh2.wav",
                        "cs16/bhit_flesh3.wav"
                    }
                    -- Toca o som de dor na posição do jogador
                    PlayPainSound(target:GetPos(), fallSounds)
                    -- Define a animação de dor genérica
                    target:DoAnimationEvent(ACT_FLINCH_PHYSICS)
                elseif dmginfo:IsBulletDamage() then
                    local hitgroup = target:LastHitGroup()

                    if hitgroup == HITGROUP_HEAD then
                        if target:Armor() > 0 then
                            -- Lista de sons para headshots com colete
                            local helmetSounds = {
                                "cs16/bhit_helmet1.wav"
                            }
                            -- Toca o som de dor na posição do jogador
                            PlayPainSound(target:GetPos(), helmetSounds)
                        else
                            -- Lista de sons para headshots sem colete
                            local headshotSounds = {
                                "cs16/headshot1.wav",
                                "cs16/headshot2.wav",
                                "cs16/headshot3.wav",
                                "cs16/headshot4.wav"
                            }
                            -- Toca o som de dor na posição do jogador
                            PlayPainSound(target:GetPos(), headshotSounds)
                        end
                        -- Define a animação de dor da cabeça
                        target:DoAnimationEvent(ACT_FLINCH_HEAD)

                    elseif hitgroup == HITGROUP_STOMACH then
                        if target:Armor() > 0 then
                            -- Lista de sons para tiros no estômago com colete
                            local kevlarSounds = {
                                "cs16/bhit_kevlar1.wav"
                            }
                            -- Toca o som de dor na posição do jogador
                            PlayPainSound(target:GetPos(), kevlarSounds)
                        else
                            -- Lista de sons para tiros no estômago/peito sem colete
                            local fleshSounds = {
                                "cs16/bhit_flesh1.wav",
                                "cs16/bhit_flesh2.wav",
                                "cs16/bhit_flesh3.wav"
                            }
                            -- Toca o som de dor na posição do jogador
                            PlayPainSound(target:GetPos(), fleshSounds)
                        end
                        -- Define a animação de dor no estômago/peito
                        target:DoAnimationEvent(ACT_FLINCH_STOMACH)

                    elseif hitgroup == HITGROUP_LEFTARM or hitgroup == HITGROUP_RIGHTARM or 
                           hitgroup == HITGROUP_LEFTLEG or hitgroup == HITGROUP_RIGHTLEG then
                        -- Lista de sons para tiros nos braços/pernas
                        local fleshSounds = {
                            "cs16/bhit_flesh1.wav",
                            "cs16/bhit_flesh2.wav",
                            "cs16/bhit_flesh3.wav"
                        }
                        -- Toca o som de dor na posição do jogador
                        PlayPainSound(target:GetPos(), fleshSounds)
                        -- Define a animação de dor no braço/perna
                        if hitgroup == HITGROUP_LEFTARM or hitgroup == HITGROUP_RIGHTARM then
                            target:DoAnimationEvent(ACT_FLINCH_LEFTARM)
                        else
                            target:DoAnimationEvent(ACT_FLINCH_LEFTLEG)
                        end
                    end
                end
            end
        end
    end)

    -- Hook para monitorar mudanças no valor do ConVar
    cvars.AddChangeCallback("sv_cs_pain", function(convar_name, value_old, value_new)
        local state = tobool(value_new)
        NotifyPlayers(state)
    end)
end