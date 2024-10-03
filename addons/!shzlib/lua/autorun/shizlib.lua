shizlib = shizlib or {}

function shizlib.msg(txt)
    print( string.format('[#] %s - %s', os.date( '%H:%M:%S', os.time()), txt ) )
end

function shizlib.client(path)
    path = string.format( '%s.lua', path )
    if SERVER then AddCSLuaFile(path) end
    if CLIENT then include(path) end
end

function shizlib.server(path)
    path = string.format( '%s.lua', path )
    if SERVER then include(path) end
end

function shizlib.shared(path)
    path = string.format( '%s.lua', path )
    if SERVER then AddCSLuaFile(path) end
    include(path)
end

/*
    i have no idea how to do that
    but i have crester Kate Administration system!
*/

local vendor = {
    ['_sv'] = function( fileName, fileDir )
        if SERVER then
            include(fileDir .. fileName)
        end
    end,
    ['_cl'] = function( fileName, fileDir )
        if SERVER then
            AddCSLuaFile( fileDir .. fileName )
        else
            include( fileDir .. fileName )
        end
    end,
    ['_sh'] = function( fileName, fileDir )
        if SERVER then
            AddCSLuaFile( fileDir .. fileName )
        end
    
        include( fileDir .. fileName )
    end,
}

function shizlib._includeFile( fileName, fileDir )
    fileName = string.lower( fileName )
    local filePrefix = string.sub( fileName, 1, string.len( fileName ) - 4 )
    filePrefix = string.Right( filePrefix, 3 )
    local includeFunc = vendor[filePrefix]

    if includeFunc == nil then
        return
    end
    
    includeFunc( fileName, fileDir )
end

function shizlib._includeDir( curDir, isRecursive )
    curDir = curDir .. '/'
  
    local filesOfDir, dirsOfDir = file.Find( curDir .. '*', 'LUA' )
  
    for _, includable in ipairs( filesOfDir ) do
        shizlib._includeFile( includable, curDir )
        shizlib.msg( string.format('Including: %s', curDir .. includable) )
    end
  
    if isRecursive then
        for _, includable in ipairs( dirsOfDir ) do
            shizlib._includeDir( curDir .. includable, true )
        end
    end
end

hook.Run('shizlib-loaded')

shizlib._includeDir( 'config', true )

shizlib._includeDir( 'shizlib', true )
shizlib._includeDir( 'shizlib-addons', true  )