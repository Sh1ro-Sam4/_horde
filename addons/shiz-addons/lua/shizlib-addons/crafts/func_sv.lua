shizlib = shizlib or {}
shizlib.Crafting = shizlib.Crafting or {}

function shizlib.Crafting.TypeHandler(tbl, ply)
    local base = tbl.base
    local entity = tbl.entity
    if base == 'weapon' then
        local id = ply.Inventory:GetID()
        local con = itemstore.containers.Get( id )

        local item = itemstore.Item('spawned_weapon')
        local wep = weapons.Get(entity)
        item:SetData( "Class", entity )
		item:SetData( "Amount", 1 )
		item:SetData( "Model", wep.WorldModel )
		item:SetData( "Clip1", wep.Primary.ClipSize )
		item:SetData( "Clip2", wep.Primary.DefaultClip )
        for i = 1, tbl.amount do
            con:AddItem(item, true)
        end
    elseif base == 'resource' then
        local id = ply.Inventory:GetID()
        local con = itemstore.containers.Get( id )

        local data = {
            ['Model'] = shizlib.Resources[entity].model,
            ['Class'] = string.format('shizlib_resource_%s', entity),
            ['FPPOwnerID'] = ply:SteamID(),
        }
        local item = itemstore.Item(string.format('shizlib_resource_%s', entity))
        item:SetModel(shizlib.Resources[entity].model)
        for i = 1, tbl.amount do
            con:AddItem(item, true)
        end
    elseif base == 'accessory' then
        local ent = ents.Create('base_accessory')
        ent:SetPos(ply:GetPos())
        ent:Spawn()
        ent:Activate()
        ent:SetID(entity)
        ent:SetModel(SH_ACC.List[ent:GetID()].mdl)

        ply:PickupItem(ent)
    else
        shizlib.msg(string.format('Игрок %s(%s) обошел почти все проверки и попытался скрафтить предмет с базой - "%s", которой нет в TypeHandler-е', ply:Name(), ply:SteamID(), base))
    end
end

function shizlib.Crafting.ValidTable(k, tbl)
    local temp
    for kk, v in pairs(tbl) do
        if tbl[k].id == v.id then
            temp = v
            break
        end
        if v.id == #tbl then return false end
    end
    return temp
end

function shizlib.Crafting.CheckResources(tbl, ply, base)
    local resources = tbl.resources
    local id = ply.Inventory:GetID()
    local con = itemstore.containers.Get( id )

    local preCacheHasItems = {}
    local i = 1
    for k, info in pairs(resources) do
        if con:CountItems( string.format('%s_%s', base, info.class) ) >= info.amount then
            table.insert(preCacheHasItems, i, info.class)
            i = i + 1
        end
    end
    if #resources ~= #preCacheHasItems then return false end

    return tbl
end

local ValidTableTbl = {
    ['weapon'] = shizlib.Crafting.Recipes,
    ['resource'] = shizlib.Crafting.Recipes,
    ['accessory'] = shizlib.Crafting.Recipes,
}

local CheckResourcesTbl = {
    ['weapon'] = 'shizlib_resource',
    ['resource'] = 'shizlib_resource',
    ['accessory'] = 'shizlib_resource',
}

function shizlib.Crafting.CraftItem(kk, ply, cfg)
    -- if ent:GetClass() ~= 'shizlib_workbench' and ent:GetClass() ~= 'shizlib_stove' then return end
    -- if ply:GetPos():Distance(ent:GetPos()) > CFG.useDist then return end

    if not shizlib.Crafting.ValidTable(kk, ValidTableTbl[cfg]) then shizlib.notify(ply, Color(189,0,0), 'Крафты', 'Такого крафта нет!') end
    local tbl = shizlib.Crafting.ValidTable(kk, ValidTableTbl[cfg])

    if not shizlib.Crafting.CheckResources(tbl, ply, CheckResourcesTbl[cfg]) then return shizlib.notify(ply, Color(189,0,0), 'Крафты', 'У вас не достаточно ресурсов!') end

    local id = ply.Inventory:GetID()
    local con = itemstore.containers.Get( id )
    for k, v in pairs(tbl.resources) do
        con:TakeItems(string.format('%s_%s', CheckResourcesTbl[cfg], v.class), v.amount)
    end

    shizlib.Crafting.TypeHandler(tbl, ply)
    ply:ChatPrint(string.format('Вы скрафтили "%s"', tbl.name))

    hook.Run('shizlib:crafting', ply, tbl)
end