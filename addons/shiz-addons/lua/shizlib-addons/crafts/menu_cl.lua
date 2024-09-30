local s = shizlib.surface.s
local DTR = shizlib.surface.DTR

local col = CFG.theme  
local snd = CFG.skinSound

shizlib.Crafting = shizlib.Crafting or {}

surface.CreateFont('shz-craft-big', {
    font = 'Roboto',
    size = s(30),
})

surface.CreateFont('shz-craft-medium', {
    font = 'Roboto',
    size = s(20),
})

surface.CreateFont('shz-craft-small', {
    font = 'Roboto',
    size = s(13),
})

local function openRecipeMenu(pnl, tbl, ent, base)
    function pnl:Paint(w, h)
        draw.SimpleText('Ингридиенты: ', 'shz-craft-big', pnl:GetWide()/4,s(50), col.text, 1, 0)
        draw.SimpleText('Итог: ', 'shz-craft-big', pnl:GetWide()/2 + pnl:GetWide()/4, s(150), col.text, 1, 1)
    end

    local resourcesList = pnl:Add('DIconLayout')
    resourcesList:Dock(LEFT)
    resourcesList:SetWide(pnl:GetWide()/2)
    resourcesList:DockMargin(s(25), s(150), 0, 0)
    resourcesList:SetSpaceX(s(5))
    resourcesList:SetSpaceY(s(5))

    for k, v in pairs(tbl.resources) do
        local icon = resourcesList:Add('Panel')
        icon:SetSize(s(75), s(75))
        function icon:Paint(w, h)
            draw.RoundedBox(4, 0, 0, w, h, col.focus)
        end
        if base == 'food' then
            local mdl = icon:Add('DModelPanel')
            mdl:SetModel(shizlib.Food[v.class].model)
            mdl:Dock(FILL)
            mdl:DockMargin(s(2),s(2),s(2),s(2))
            mdl.LayoutEntity = function() end
            mdl:SetLookAt(Vector(0, 0, 0))
            mdl:SetFOV(10)
        end
        local a = icon:Add('Panel')
        a:Dock(FILL)
        function a:Paint(w, h)
            if v.amount > 1 then
                draw.RoundedBoxEx(8, w-s(15), 0, s(15), s(15), col.bg,  false, false, true, false)
                draw.SimpleText(v.amount, 'shz-craft-small', w-s(7.5), s(7.5), col.text, 1, 1)
            end
            if base ~= 'food' then
                DTR(s(15), s(15), s(45), s(45), color_white, Material(string.format('shizlib/icon17/64/%s.png', shizlib.Resources[v.class].icon)))
                draw.SimpleText(shizlib.Resources[v.class].name, 'shz-craft-small', s(5), h-s(5), col.text, 0, 4)
            else
                draw.SimpleText(shizlib.Food[v.class].name, 'shz-craft-small', s(5), h-s(5), col.text, 0, 4)
            end
        end
    end

    local icon
    if tbl.base == 'weapon' then
        icon = string.format('shizlib/icon17/64/%s.png', CFG.icon17[tbl.entity])
    elseif tbl.base == 'resource' then
        icon = string.format('shizlib/icon17/64/%s.png', shizlib.Resources[tbl.entity].icon)
    end
    local uGot = pnl:Add('Panel')
    uGot:SetSize(s(75), s(75))
    uGot:SetPos(pnl:GetWide()/2 + pnl:GetWide()/4-s(37.5), s(175))
    function uGot:Paint(w, h)
        draw.RoundedBox(4, 0, 0, w, h, col.focus)
        if tbl.amount > 1 then
            draw.RoundedBoxEx(8, w-s(15), 0, s(15), s(15), col.bg,  false, false, true, false)
            draw.SimpleText(tbl.amount, 'shz-craft-small', w-s(7.5), s(7.5), col.text, 1, 1)
        end
        if base ~= 'food' and base ~= 'accessory' then
            DTR(s(15), s(15), s(45), s(45), color_white, Material(icon))
            draw.SimpleText(tbl.name, 'shz-craft-small', s(5), h-s(5), col.text, 0, 4)
        else
            draw.SimpleText(tbl.name, 'shz-craft-small', s(5), h-s(5), col.text, 0, 4)
        end
    end
    if base == 'food' or base == 'accessory' then
        local mdl = uGot:Add('DModelPanel')
        mdl:SetModel(shizlib.Food[tbl.entity] and shizlib.Food[tbl.entity].model or SH_ACC.List[tbl.entity].mdl)
        mdl:Dock(FILL)
        mdl:DockMargin(s(2),s(2),s(2),s(2))
        mdl.LayoutEntity = function() end
        mdl:SetLookAt(Vector(0, 0, 0))
        if shizlib.Food[tbl.entity] then mdl:SetFOV(10) else mdl:SetFOV(25) end
    end

    local craftBtn = pnl:Add('SHZButton')
    craftBtn:SetSize(s(150), s(25))
    craftBtn:SetPos(pnl:GetWide()/2 + pnl:GetWide()/4-s(75), s(260))
    craftBtn:SetText('Скрафтить')

    function craftBtn:DoClick()
        if LocalPlayer():GetPos():Distance(ent:GetPos()) > CFG.useDist then return end
        netstream.Start('Crafting.Craft', {id = tbl.id, Ent = ent, Cfg = base})
    end
end

function shizlib.Crafting.Menu(tbl, ent)
    local fr = vgui.Create('SHZFrame')
    fr:SetSize(s(900), s(600))
    fr:Center()
    fr:SetTitle('Крафты')
    fr:MakePopup()
    
    local scroll = fr:Add('SHZScrollPanel')
    scroll:Dock(LEFT)
    scroll:SetWide(s(200))
    scroll:DockMargin(s(4),s(4),s(4),s(4))

    local pnl = fr:Add('Panel')
    pnl:Dock(FILL)

    for k, v in pairs(tbl) do
        local icon
        if v.base == 'weapon' then
            icon = string.format('shizlib/icon17/64/%s.png', CFG.icon17[v.entity])
        elseif v.base == 'resource' then
            icon = string.format('shizlib/icon17/64/%s.png', shizlib.Resources[v.entity].icon)
        end
        local recipeBtn = scroll:Add('SHZButton')
        recipeBtn:Dock(TOP)
        if v.base ~= 'food' and v.base ~= 'accessory' then
            recipeBtn:SetIcon(Material(icon))
        end
        recipeBtn:SetText(v.name)
        function recipeBtn:DoClick()
            pnl:Clear()

            openRecipeMenu(pnl, v, ent, v.base)
        end
    end
end

concommand.Add('shizlib_craftmenu', function()
    if not LocalPlayer():IsSuperAdmin() then return end
    shizlib.Crafting.Menu(shizlib.Crafting.Recipes, Entity(1))
end)

netstream.Hook('shizlib-crafting.open', function(data)
    if data.ent:GetClass() == 'shizlib_stove' then
        shizlib.Crafting.Menu(shizlib.Crafting.RecipesCook, data.ent)
    else
        shizlib.Crafting.Menu(shizlib.Crafting.Recipes, data.ent)
    end
end)