local s = shizlib.surface.s
local DTR = shizlib.surface.DTR

local col = CFG.skinColors  
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

function shizlib.Crafting.openRecipeMenu(pnl, tbl, ent, base)
    function pnl:Paint(w, h)
        draw.SimpleText('Ингридиенты: ', 'shz-craft-big', pnl:GetWide()/4,s(50), color_white, 1, 0)
        draw.SimpleText('Итог: ', 'shz-craft-big', pnl:GetWide()/2 + pnl:GetWide()/4, s(150), color_white, 1, 1)
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
            draw.RoundedBox(4, 0, 0, w, h, col.hvr)
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
                draw.SimpleText(v.amount, 'shz-craft-small', w-s(7.5), s(7.5), color_white, 1, 1)
            end
            if base ~= 'food' then
                DTR(s(15), s(15), s(45), s(45), color_white, Material(string.format('shizlib/icon17/64/%s.png', shizlib.Resources[v.class].icon)))
                draw.SimpleText(shizlib.Resources[v.class].name, 'shz-craft-small', s(5), h-s(5), color_white, 0, 4)
            else
                draw.SimpleText(shizlib.Food[v.class].name, 'shz-craft-small', s(5), h-s(5), color_white, 0, 4)
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
        draw.RoundedBox(4, 0, 0, w, h, col.hvr)
        if tbl.amount > 1 then
            draw.RoundedBoxEx(8, w-s(15), 0, s(15), s(15), col.hvr,  false, false, true, false)
            draw.SimpleText(tbl.amount, 'shz-craft-small', w-s(7.5), s(7.5), color_white, 1, 1)
        end
        if base ~= 'food' and base ~= 'accessory' then
            DTR(s(15), s(15), s(45), s(45), color_white, Material(icon))
            draw.SimpleText(tbl.name, 'shz-craft-small', s(5), h-s(5), color_white, 0, 4)
        else
            draw.SimpleText(tbl.name, 'shz-craft-small', s(5), h-s(5), color_white, 0, 4)
        end
    end
    if base == 'food' or base == 'accessory' then
        local mdl = uGot:Add('DModelPanel')
        mdl:SetModel(SH_ACC.List[tbl.entity].mdl)
        mdl:Dock(FILL)
        mdl:DockMargin(s(2),s(2),s(2),s(2))
        mdl.LayoutEntity = function() end
        mdl:SetLookAt(Vector(0, 0, 0))
    end

    local craftBtn = pnl:Add('DButton')
    craftBtn:SetSize(s(150), s(25))
    craftBtn:SetPos(pnl:GetWide()/2 + pnl:GetWide()/4-s(75), s(260))
    craftBtn:SetText('Скрафтить')

    function craftBtn:DoClick()
        netstream.Start('Crafting.Craft', {id = tbl.id, Ent = ent, Cfg = base})
    end
end

function shizlib.Crafting.Menu(tbl, ent)
    shizlib.Crafting.fr = vgui.Create('DFrame')

    local fr = shizlib.Crafting.fr
    fr:SetSize(s(900), s(600))
    fr:Center()
    fr:SetTitle('Крафты')
    fr:MakePopup()
    fr:SetDraggable(true)
    function fr:Think()
        if input.IsKeyDown(KEY_ESCAPE) and self:IsKeyboardInputEnabled() then
            fr:Remove()
        end
    end
    
    local scroll = fr:Add('DScrollPanel')
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
        local recipeBtn = scroll:Add('DButton')
        recipeBtn:Dock(TOP)
        function recipeBtn:Paint(w, h)
            local off = h > 20 and 2 or 1
            if pnl.Depressed then
                draw.RoundedBox(4, 0, off, w, h-off, col.g)
                draw.RoundedBox(4, 0, off, w, h-off, col.hvr)
            else
                draw.RoundedBox(4, 0, 0, w, h, ColorAlpha(col.g, 150))
                draw.RoundedBox(4, 0, 0, w, h-off, col.g)
            end
            if recipeBtn.Icon then
                DTR(4, 4, self:GetTall()-8, self:GetTall()-8, color_white, recipeBtn.Icon)
            end
        end
        if v.base ~= 'accessory' then
            recipeBtn.Icon = Material(icon)
        end
        recipeBtn:SetText(v.name)
        function recipeBtn:DoClick()
            pnl:Clear()

            shizlib.Crafting.openRecipeMenu(pnl, v, ent, v.base)
        end
    end
end

concommand.Add('shizlib_craftmenu', function()
    shizlib.Crafting.Menu(shizlib.Crafting.Recipes, Entity(1))
end)

hook.Add('PlayerButtonUp', 'shizlib-OpenCraftMenu', function(ply, key)
    if not IsFirstTimePredicted() then return end
    if ply ~= LocalPlayer() then return end
    if key ~= KEY_O then return end
    if gui.IsGameUIVisible() then return end
    if ply:IsTyping() then return end
    RunConsoleCommand('shizlib_craftmenu')
end)

netstream.Hook('shizlib-crafting.open', function(data)
    if data.ent:GetClass() == 'shizlib_stove' then
        shizlib.Crafting.Menu(shizlib.Crafting.RecipesCook, data.ent)
    else
        shizlib.Crafting.Menu(shizlib.Crafting.Recipes, data.ent)
    end
end)