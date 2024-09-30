local PANEL = {}
local class_panel_active = nil

function PANEL:Init()
    if ScrW() <= 1600 or ScrH() < 1080 then
        self:SetSize(ScrW(), ScrH())
    else
        self:SetSize(ScrW() / 1.25, ScrH() / 1.5)
    end
    self:SetPos((ScrW() / 2) - (self:GetWide() / 2), (ScrH() / 2) - (self:GetTall() / 2))

    local close_btn = vgui.Create("DButton", self)
    close_btn:SetFont("marlett")
    close_btn:SetText("r")
    close_btn.Paint = function() end
    close_btn:SetColor(Color(255, 255, 255))
    close_btn:SetSize(32, 32)
    close_btn:SetPos(self:GetWide() - 40, 8)
    close_btn.DoClick = function() HORDE:ToggleShop() end

    local btn_container = vgui.Create("DHorizontalScroller", self)
    btn_container:SetTall(32)
    btn_container:Dock(TOP)
    btn_container:DockMargin(0, 48, 0, 0)
    btn_container.Paint = function(pnl, w, h)
        surface.SetDrawColor(40, 40, 40, 0)
        surface.DrawRect(0, 0, self:GetWide(), 32)
    end

    local container = vgui.Create("DPanel", self)
    container:Dock(LEFT)
    container:SetSize(self:GetWide() / 2, self:GetTall() - 100)
    container:SetBackgroundColor(HORDE.color_hollow)

    local description_panel = vgui.Create("HordeDescription", self)
    description_panel:Dock(LEFT)
    description_panel:SetSize(self:GetWide() / 2, self:GetTall() - 100)

    local infusion_panel = vgui.Create("HordeInfusion", self)
    infusion_panel:Dock(LEFT)
    infusion_panel:SetSize(self:GetWide() / 2, self:GetTall() - 100)
    infusion_panel:SetVisible(false)

    local btns = {}
    local firstBtn = true
    local attachments = {}
    local function createBtn(text, panel, dock)
        panel:SetParent(container)
        panel:Dock(FILL)
        panel.Paint = function(pnl, w, h)
            surface.SetDrawColor(40, 40, 40, 200)
            surface.DrawRect(0, 0, w, h)
        end

        if firstBtn then
            panel:SetZPos(100)
            panel:SetVisible(true)
        else
            panel:SetZPos(1)
            panel:SetVisible(false)
        end

        local btn
        if text == "Class/Perks" then
            btn = vgui.Create("DButton", self)
            btn:SetPos(9, 9)
            btn:SetTall(44)
            btn.PerformLayout = function(pnl)
                pnl:SizeToContents()
                pnl:SetWide(pnl:GetWide() + 34)
                pnl:SetTall(pnl:GetTall() + 5)
                DLabel.PerformLayout(pnl)
                pnl:SetContentAlignment(4)
                pnl:SetTextInset(12, 0)
            end
        else
            btn = vgui.Create("DButton", btn_container)
            btn_container:AddPanel(btn)
            btn:Dock(dock)
            btn.PerformLayout = function(pnl)
                pnl:SizeToContents()
                pnl:SetWide(pnl:GetWide() + 12)
                pnl:SetTall(pnl:GetParent():GetTall())
                DLabel.PerformLayout(pnl)
                pnl:SetContentAlignment(4)
                pnl:SetTextInset(12, 0)
            end
        end

        local loc_text = translate.Get("Shop_" .. text) or text
        btn:SetText(loc_text)
        btn:SetFont("Category")

        local p = 50
        local t = 0
        btn.Paint = function(pnl, w, h)
            if text == "Class/Perks" then
                if pnl:GetActive() then
                    draw.RoundedBox(5, 0, 0, w, h, Color(40, 40, 40, 230))
                else
                    draw.RoundedBox(5, 0, 0, w, h, Color(220, 20, 60, p % 225))
                    if p >= 224 then
                        t = 1
                    elseif p < 50 then
                        t = 0
                    end

                    if t == 0 then
                        p = p + 1.5
                    else
                        p = p - 1.5
                    end
                end

                local class_mat = Material(HORDE.subclasses[MySelf:Horde_GetCurrentSubclass()].Icon, "mips smooth")
                surface.SetMaterial(class_mat)
                if pnl:GetActive() then
                    surface.SetDrawColor(HORDE.color_crimson)
                else
                    surface.SetDrawColor(color_white)
                end

                surface.DrawTexturedRect(w - h - 10, 0, h, h)
            else
                surface.SetDrawColor(0, 0, 0, 0)
                surface.DrawRect(0, 0, w, h)
                if pnl:GetActive() then
                    surface.SetDrawColor(Color(40, 40, 40, 230))
                    surface.DrawRect(0, 0, w, h)
                end
            end
        end

        btn.UpdateColours = function(pnl)
            if pnl:GetActive() then
                pnl:SetTextColor(HORDE.color_crimson)
                return
            end
            if pnl.Hovered then
                if text == "Class/Perks" then
                    --pnl:SetTextColor(Color(220,220,220))
                else
                    pnl:SetTextColor(HORDE.color_crimson)
                end
                return
            end
            pnl:SetTextColor(Color(255, 255, 255))
        end

        btn.GetActive = function(pnl) return pnl.Active or false end
        btn.SetActive = function(pnl, state) pnl.Active = state end

        if firstBtn then
            firstBtn = false; btn:SetActive(true)
        end

        btn.DoClick = function(pnl)
            description_panel:SetData(nil)
            for k, v in pairs(btns) do
                v:SetActive(false)
                v:OnDeactivate()
            end
            pnl:SetActive(true)
            pnl:OnActivate()
            surface.PlaySound("UI/buttonclick.wav")
            if text == "Attachment" then
                -- Reload attachments everytime a player click this
                self:ReloadAttachments(attachments, container, description_panel)
            end

            if text == "Class/Perks" then
                if ScrW() <= 1280 then
                    description_panel:SetSize(self:GetWide() * 5 / 6, self:GetTall() - 100)
                    container:SetSize(self:GetWide() / 6, self:GetTall() - 100)
                else
                    description_panel:SetSize(self:GetWide() * 3 / 4, self:GetTall() - 100)
                    container:SetSize(self:GetWide() / 4, self:GetTall() - 100)
                end
                infusion_panel:SetVisible(false)
                description_panel:SetVisible(true)
            else
                description_panel:SetSize(self:GetWide() / 2, self:GetTall() - 100)
                container:SetSize(self:GetWide() / 2, self:GetTall() - 100)
            end
        end

        btn.OnDeactivate = function()
            panel:SetVisible(false)
            panel:SetZPos(1)
        end
        btn.OnActivate = function()
            panel:SetVisible(true)
            panel:SetZPos(100)
        end
        btn.OnCursorEntered = function()
            surface.PlaySound("UI/buttonrollover.wav")
        end

        table.insert(btns, btn)

        return btn
    end

    local class = MySelf:Horde_GetClass()

    for _, category in pairs(HORDE.categories) do
        local items = {}

        for _, item in pairs(HORDE.items) do
            if item.category == category and ((item.whitelist == nil) or (item.whitelist and item.whitelist[class.name]) or (MySelf:Horde_GetCurrentSubclass() == "Gunslinger" and item.category == "Pistol")) then
                if (item.category == "Gadget" and MySelf:Horde_GetGadget() == item.class) or MySelf:HasWeapon(item.class) then
                    item.cmp = -1
                else
                    if item.hidden == true then goto cont end
                    item.cmp = item.price
                end
                if not item.skull_tokens then item.skull_tokens = 0 end
                if not item.total_levels then item.total_levels = 0 end
                if MySelf:Horde_GetCurrentSubclass() == "Overlord" and string.match(item.class, "watchtower") then
                else
                    table.insert(items, item)
                end

                ::cont::
            end
        end

        if table.IsEmpty(items) then goto cont end

        table.sort(items, function(a, b)
            if a.cmp == b.cmp then
                if a.skull_tokens == b.skull_tokens then
                    if a.weight == b.weight then
                        if a.total_levels == b.total_levels then
                            return a.name < b.name
                        else
                            return a.total_levels < b.total_levels
                        end
                    else
                        return a.weight < b.weight
                    end
                else
                    return a.skull_tokens < b.skull_tokens
                end
            else
                return a.cmp < b.cmp
            end
        end)

        local ShopCategoryTab = vgui.Create("DPanel", self)
        ShopCategoryTab.Paint = function() end

        if category ~= "Attachment" then
            local DScrollPanel = vgui.Create("DScrollPanel", ShopCategoryTab)
            DScrollPanel:Dock(FILL)
            local ShopCategoryTabLayout = vgui.Create("DIconLayout", DScrollPanel)
            ShopCategoryTabLayout:Dock(FILL)
            ShopCategoryTabLayout:SetBorder(8)
            ShopCategoryTabLayout:SetSpaceX(8)
            ShopCategoryTabLayout:SetSpaceY(8)

            DScrollPanel:AddItem(ShopCategoryTabLayout)

            for _, item in pairs(items) do
                if item.category == category then
                    local model = vgui.Create("HordeShopItem")
                    model:SetSize(container:GetWide() - 16, 40)
                    model:SetData(item, description_panel, infusion_panel)
                    ShopCategoryTabLayout:Add(model)
                end
            end

            createBtn(category, ShopCategoryTab, LEFT)
        else
            for _, item in pairs(items) do
                if item.entity_properties and item.entity_properties.is_arccw_attachment then
                    if not attachments[item.entity_properties.arccw_attachment_type] then attachments[item.entity_properties.arccw_attachment_type] = {} end
                    table.insert(attachments[item.entity_properties.arccw_attachment_type], item)
                end
            end
        end

        ::cont::
    end

    -- Class tab
    local ClassTab = vgui.Create("DPanel", self)
    local ClassScrollPanel = vgui.Create("DScrollPanel", ClassTab)
    ClassScrollPanel:Dock(FILL)

    local ClassTabLayout = vgui.Create("DIconLayout", ClassScrollPanel)
    ClassTabLayout:Dock(FILL)
    ClassTabLayout:SetBorder(8)
    ClassTabLayout:SetSpaceX(8)
    ClassTabLayout:SetSpaceY(8)

    local classes = {}
    for _, horde_class in pairs(HORDE.classes) do
        classes[horde_class.order] = horde_class
    end
    table.sort(classes, function(a, b)
        return a.order < b.order
    end)
    for _, horde_class in pairs(classes) do
        local model = vgui.Create("HordeClass")
        model:SetSize(container:GetWide() - 16, 40)
        model:SetData(horde_class, description_panel)
        ClassTabLayout:Add(model)
    end

    createBtn("Class/Perks", ClassTab, RIGHT)

    -- ArcCW Attachment Tab
    if ArcCWInstalled and not table.IsEmpty(attachments) and GetConVar("horde_arccw_attinv_free"):GetInt() == 0 then
        self.AttachmentTab = vgui.Create("DPanel", self)
        self.AttachmentTab.Paint = function() end
        self.AttachmentTabLayout = vgui.Create("DCategoryList", self.AttachmentTab)
        self.AttachmentTabLayout:Dock(FILL)
        self.AttachmentTabLayout:DockMargin(8, 8, 8, 8)
        self.AttachmentTabLayout.Paint = function() end
        self:ReloadAttachments(attachments, container, description_panel)
        createBtn("Attachment", self.AttachmentTab, LEFT)
    end
end

function PANEL:ReloadAttachments(attachments, container, description_panel)
    self.AttachmentTabLayout:Clear()
    for _, attachment_category in pairs(HORDE.arccw_attachment_categories) do
        local cat = self.AttachmentTabLayout:Add(attachment_category)
        cat:SetHeaderHeight(40)
        cat:SetPaintBackground(false)
        cat:SetExpanded(false)
        cat.Paint = function()
            surface.SetDrawColor(50, 50, 50, 255)
            surface.DrawRect(0, 0, self:GetWide(), 40)
        end
        cat.Header:SetFont("Item")
        cat.Header:SetTextColor(Color(255, 255, 255))
        cat.Header:SetSize(container:GetWide() - 16, 40)

        local ShopCategoryTabLayout = vgui.Create("DIconLayout")
        ShopCategoryTabLayout:SetBorder(8)
        ShopCategoryTabLayout:SetSpaceX(8)
        ShopCategoryTabLayout:SetSpaceY(8)

        if attachments[attachment_category] then
            for _, item in pairs(attachments[attachment_category]) do
                if item.entity_properties.arccw_attachment_wpn then
                    if not MySelf:HasWeapon(item.entity_properties.arccw_attachment_wpn) then
                        goto cont
                    end
                end
                local model = vgui.Create("HordeShopItem")
                model:SetSize(cat.Header:GetWide() - 16, 40)
                model:SetData(item, description_panel)
                ShopCategoryTabLayout:Add(model)

                ::cont::
            end
            cat:SetContents(ShopCategoryTabLayout)
            local tall = 40
            if attachments[attachment_category] then
                tall = 40 * (#attachments[attachment_category])
            end
            cat:SetTall(tall)
        end
    end
    self.AttachmentTabLayout:InvalidateLayout(true)
end

local skull_mat = Material("skull.png", "mips smooth")
local weight_mat = Material("weight.png", "mips smooth")
function PANEL:Paint(w, h)
    -- Derma_DrawBackgroundBlur(self)

    -- Entire
    if ScrH() < 1080 then
        draw.RoundedBox(0, 0, 0, w, h, Color(40, 40, 40))
    else
        draw.RoundedBox(0, 0, 0, w, h, HORDE.color_hollow)
    end

    local text
    local weight_text
    weight_text = translate.Get("Shop_Weight") ..
        ': ' ..
        tostring(MySelf:Horde_GetMaxWeight() - MySelf:Horde_GetWeight()) .. "/" .. MySelf:Horde_GetMaxWeight() .. ""
    surface.SetMaterial(weight_mat)
    surface.SetDrawColor(Color(255, 255, 255))
    surface.DrawTexturedRect(self:GetWide() - 60, 14, 20, 20)

    local text2 = translate.Get("Shop_Cash") ..
        ": " .. tostring(MySelf:Horde_GetMoney()) .. '$ ' .. ' ' .. tostring(MySelf:Horde_GetSkullTokens())
    text = text2 .. '       ' .. weight_text
    draw.SimpleText(text, 'Heading', self:GetWide() - 60, 24, color_white, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)

    surface.SetMaterial(skull_mat)
    surface.SetDrawColor(Color(255, 255, 255))
    surface.DrawTexturedRect(self:GetWide() - surface.GetTextSize(text) + surface.GetTextSize(text2) - 55, 14, 20, 20)
end

vgui.Register("HordeShop", PANEL)
