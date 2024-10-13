shizlib.Achievements = shizlib.Achievements or {}

sql.Query('CREATE TABLE IF NOT EXISTS plyAch(sid VARCHAR (25) NOT NULL PRIMARY KEY, achs TEXT, custom TEXT)')
sql.Query('CREATE TABLE IF NOT EXISTS plyAchData(sid VARCHAR (25) NOT NULL PRIMARY KEY, id TEXT, custom TEXT)')

function shizlib.Achievements.SaveData(ply, id, amount)
    if not shizlib.Achievements.CFG[id].needToGet then return end

    local data = sql.Query( string.format( 'SELECT * FROM plyAchData WHERE sid = %s AND id = %s;', SQLStr(ply:SteamID64()), SQLStr(id) ) )
    if data then
        if tonumber(data[1].custom) + amount == shizlib.Achievements.CFG[id].needToGet then
            ply.Achs[id] = true
            shizlib.Achievements.Save(ply, id)
            netstream.Start(ply, 'shizlib.Achievements', shizlib.Achievements.CFG[id])
        end
        sql.Query( string.format( 'UPDATE plyAchData SET custom = %s WHERE sid = %s', SQLStr(tonumber(data[1].custom) + amount), SQLStr(ply:SteamID64()) ) )
    else
        sql.Query( string.format( 'INSERT INTO plyAchData (sid, id, custom) VALUES(%s, %s, %s)', SQLStr(ply:SteamID64()), SQLStr(id), SQLStr(amount) ) )
    end
end

function shizlib.Achievements.Save(ply, id, custom)
    ply.Achs[id] = true
    local data = sql.Query( string.format( 'SELECT * FROM plyAch WHERE sid = %s;', SQLStr(ply:SteamID64()) ) )
    if data then
        sql.Query( string.format( 'UPDATE plyAch SET achs = %s WHERE sid = %s', SQLStr(util.TableToJSON(ply.Achs)), SQLStr(ply:SteamID64()) ) )
    else
        sql.Query( string.format( 'INSERT INTO plyAch (sid, achs) VALUES(%s, %s)', SQLStr(ply:SteamID64()), SQLStr(util.TableToJSON(ply.Achs)) ) )
    end
    netstream.Start(ply, 'shizlib.Achievements', shizlib.Achievements.CFG[id])
    shizlib.Broadcast(Color(0,0,0), '(АЧИВКИ)', string.format('%s получил достижение: %s', ply:Name(), shizlib.Achievements.CFG[id].name))
end

function shizlib.Achievements.Load(ply)
    local data = sql.Query( string.format( 'SELECT * FROM plyAch WHERE sid = %s;', SQLStr(ply:SteamID64()) ) )
    if data then
        ply.Achs = util.JSONToTable(data[1].achs)
    else
        ply.Achs = {}
    end
end

function shizlib.Achievements.Give(ply, id, amount)
    if ply.Achs[id] then return end
    if shizlib.Achievements.CFG[id].needToGet then
        shizlib.Achievements.SaveData(ply, id, amount and amount or 1)
    else
        shizlib.Achievements.Save(ply, id)
    end
end

hook.Add('PlayerInitialSpawn', 'shizlib.Achievements', function(ply)
    shizlib.Achievements.Load(ply)
end)