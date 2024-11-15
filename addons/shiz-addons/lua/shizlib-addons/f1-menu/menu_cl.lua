F1 = F1 or {}

local s = shizlib.surface.s
local DTR = shizlib.surface.DTR
local cols = CFG.skinColors

function F1.OpenGUI()
    F1.frame = vgui.Create('DFrame')
    
    local a = F1.frame
    a:SetSize(s(900), s(900))
    a:Center()
    a:SetTitle(GetHostName())
    a:MakePopup()
    function a:Think()
        if input.IsKeyDown(KEY_ESCAPE) and self:IsKeyboardInputEnabled() then
            a:Remove()
        end
    end

    local sheet = a:Add('DPropertySheet')
    sheet:Dock(FILL)

    local help = sheet:Add('DPanel')
        help:Dock(FILL)
        help.Paint = function(self, w, h)
            draw.SimpleText('В будующем здесь будут подсказки по игре', 'font.20', 0, 0, color_white, 0, 0)
        end
    sheet:AddSheet('Помощь', help, 'icon16/information.png')

    local inventory = sheet:Add('DPanel')
        inventory:Dock(FILL)
        inventory.Paint = function(self, w, h)
            draw.SimpleText('Я знаю что выглядит колхозно.. Но это только сейчас', 'font.20', 0, h, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM)
        end

        local inv = inventory:Add( "shz-ISContainerWindow" )
        inv:SetContainerID( LocalPlayer().InventoryID )
        inv:SetTitle( itemstore.Translate( "inventory" ) )
        inv:ShowCloseButton( false )
        inv:Dock(FILL)
        inv:InvalidateLayout( true )
    sheet:AddSheet('Инвентарь', inventory, 'icon16/box.png')

    local craft = sheet:Add('DPanel')
        craft:Dock(FILL)
        local scroll = craft:Add('DScrollPanel')
        scroll:Dock(LEFT)
        scroll:SetWide(s(200))
        scroll:DockMargin(s(4),s(4),s(4),s(4))

        local pnl = craft:Add('Panel')
        pnl:Dock(FILL)

        for k, v in pairs(shizlib.Crafting.Recipes) do
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
                    draw.RoundedBox(4, 0, off, w, h-off, cols.g)
                    draw.RoundedBox(4, 0, off, w, h-off, cols.hvr)
                else
                    draw.RoundedBox(4, 0, 0, w, h, ColorAlpha(cols.g, 150))
                    draw.RoundedBox(4, 0, 0, w, h-off, cols.g)
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
    sheet:AddSheet('Крафты', craft, 'icon16/bricks.png')

    local settings = sheet:Add('DPanel')
        local under_scroll = settings:Add('Panel')
        under_scroll:Dock(LEFT)
        under_scroll:SetWide(s(200))
        function under_scroll:Paint(w, h)
            draw.RoundedBoxEx(6, 0, 0, w, h, cols.hvr, true, false, true)
        end

        local scroll = under_scroll:Add('DScrollPanel')
        scroll:Dock(FILL)

        local pnl = settings:Add('Panel')
        pnl:Dock(FILL)
        pnl:DockPadding(s(10), s(10), s(10), s(10))

        for name, info in SortedPairs(SETTINGS.Config) do
            local categoryBtn = scroll:Add('DButton')
            categoryBtn:Dock(TOP)
            categoryBtn:SetText(name)
            categoryBtn.Icon = info.Icon and info.Icon or nil
            function categoryBtn:Paint(w, h)
                local off = h > 20 and 2 or 1
                if self.Depressed then
                    draw.RoundedBox(4, 0, off, w, h-off, cols.g)
                    draw.RoundedBox(4, 0, off, w, h-off, cols.hvr)
                else
                    draw.RoundedBox(4, 0, 0, w, h, ColorAlpha(cols.g, 150))
                    draw.RoundedBox(4, 0, 0, w, h-off, cols.g)
                end
                if self.Icon then
                    DTR(4, 4, self:GetTall()-8, self:GetTall()-8, colsor_white, self.Icon)
                end
            end
            function categoryBtn:DoClick()
                pnl:Clear()

                SETTINGS.openSettingsCategoryMenu(pnl, info)
            end
        end
    sheet:AddSheet('Настройки', settings, 'icon16/cog.png')
end

hook.Add('Think', 'F1-OpenGUI', function(ply, key)
    if not input.IsKeyDown(KEY_F1) then return end
    if IsValid(F1.frame) then return end
    F1.OpenGUI()
end)



// some vgui for future

-- shz-ISContainer
local PANEL = {}

function PANEL:Init()
	self.Pages = {}
	self.Slots = {}

	table.insert( itemstore.containers.Panels, self )
end

function PANEL:SetContainerID( id )
	self.ContainerID = id
	self:Refresh()
end

function PANEL:GetContainerID()
	return self.ContainerID
end

function PANEL:Refresh()
	local id = self:GetContainerID()
	local con = itemstore.containers.Get( id )

	if con then
		for i = 1, con:GetSize() do
			local page_id = con:GetPageFromSlot( i )
			local page = self.Pages[ page_id ]

			if not page then
				page = vgui.Create( "DIconLayout" )
				page:SetSpaceX( 1 )
				page:SetSpaceY( 1 )

				self.Pages[ page_id ] = page

				self:AddSheet( itemstore.Translate( "page", page_id ), page )
			end

			local slot = self.Slots[ i ]

			if not slot then
				slot = page:Add( "ItemStoreSlot" )
				slot:SetSize( 40, 40 )
				slot:SetContainerID( self:GetContainerID() )
				slot:SetSlot( i )

				self.Slots[ i ] = slot
			end

			slot:SetItem( con:GetItem( i ) )
			slot:Refresh()
		end
	end

	self:SizeToContents()
end

function PANEL:SizeToContents()
	local id = self:GetContainerID()
	local con = itemstore.containers.Get( id )

	-- if con then
	-- 	local w = con:GetWidth() * 41 + 15
	-- 	local h = con:GetHeight() * 41 + 35

	-- 	self:SetSize( w, h )
	-- end
    self:SetSize(s(870), s(870))
    if con then
        for i = 1, con:GetSize() do
            local max_size = itemstore.config.InventorySizes['default']
            local x, y = self:GetSize()
            local w = ((x - 15) / max_size[1] - max_size[1] * 1)
            local h = ((y - 35) / max_size[2] - max_size[2] * 1)
            self.Slots[i]:SetSize(h, h)
        end
    end
end

vgui.Register( "shz-ISContainer", PANEL, "DPropertySheet" )


-- shz-ISContainerWindow
local PANEL = {}

function PANEL:Init()
	self:SetSkin('shizlib')
	self:SetAlpha(0)
	self:AlphaTo(255, .4, 0)

	self.Container = vgui.Create( "shz-ISContainer", self )
	self.Container:SizeToContents()
end

function PANEL:PerformLayout()
	self:SetSize( self.Container:GetWide() + 10, self.Container:GetTall() + 32 )
	self.Container:SetPos( 5, 27 )

	self.BaseClass.PerformLayout( self )
end

function PANEL:Refresh()
	self.Container:Refresh()
end

function PANEL:SetContainerID( id )
	self.Container:SetContainerID( id )
end

function PANEL:GetContainerID()
	return self.Container:GetContainerID()
end

vgui.Register( "shz-ISContainerWindow", PANEL, "DFrame" )