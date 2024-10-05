/*
    StormFox2.Time.Pause()
    StormFox2.Time.Resume()
    StormFox2.Time.Set(nsTime) | 720 == 12:00 | 60 == 1:00
*/

shizlib.horde = shizlib.horde or {}
shizlib.horde.night_health_multiplier = 1
shizlib.horde.enemy_count_multiplier = 1

hook.Add('HordeWaveStart', 'shizlib-StormFoxAndHorde', function(wave)
    if math.random(1, 2) == 1 then
        shizlib.Broadcast(Color(163,12,12), '[Оповещение] ', 'Наступила ночь! Будте бдительны, зомби стали сильнее!')
        shizlib.horde.night_health_multiplier = 1.4
        shizlib.horde.enemy_count_multiplier = 1.5

        StormFox2.Time.Set(60)
    else
        StormFox2.Time.Set(720)
    end
end)

hook.Add('HordeWaveEnd', 'shizlib-StormFoxAndHorde2', function(wave)
    StormFox2.Time.Set(720)

    shizlib.horde.night_health_multiplier = 1
    shizlib.horde.enemy_count_multiplier = 1
end)

hook.Add('InitPostEntity', 'shizlib-StormFoxAndHordInit', function()
    StormFox2.Time.Set(720)

    StormFox2.Time.Pause()
end)

hook.Add('Horde_OnPlayerShouldRespawnDuringWave', 'shizlib-RespawnForSome', function(ply)
    return true
end)