shizlib.Resources = {
    ['can'] = {
        name = 'Банка',
        description = 'Это банка!?',
        icon = 'can',
        model = 'models/props_junk/PopCan01a.mdl',
    },
    ['dev'] = {
        name = 'Куб разработчика',
        description = 'Откуда и ззачем?',
        icon = 'can',
        model = 'models/hunter/blocks/cube025x025x025.mdl',
    },



    ['steel'] = {
        name = 'Сталь',
        description = 'Прогресс в сфере металлургии',
        icon = 'steel',
        model = 'models/mosi/fallout4/props/junk/components/steel.mdl',
    },
    ['aluminum'] = {
        name = 'Алюминий',
        description = 'Не самый лучший, но и не худший',
        icon = 'aluminum',
        model = 'models/mosi/fallout4/props/junk/components/aluminum.mdl',
    },
    ['copper'] = {
        name = 'Медь',
        description = 'Основа основ',
        icon = 'copper',
        model = 'models/mosi/fallout4/props/junk/components/copper.mdl',
    },
    ['lead'] = {
        name = 'Свинец',
        description = 'Радиация?',
        icon = 'plumbum',
        model = 'models/mosi/fallout4/props/junk/components/lead.mdl',
    },
    ['gold'] = {
        name = 'Золото',
        description = 'Золотой век',
        icon = 'gold-bars',
        model = 'models/mosi/fallout4/props/junk/components/gold.mdl',
    },
    ['silver'] = {
        name = 'Серебро',
        description = 'Серебрянный век',
        icon = 'silver',
        model = 'models/mosi/fallout4/props/junk/components/silver.mdl',
    },
    ['glass'] = {
        name = 'Стекло',
        description = 'Я тебя вижу!',
        icon = 'glass',
        model = 'models/mosi/fallout4/props/junk/components/glass.mdl',
    },
    ['tape'] = {
        name = 'Изолента',
        description = 'Я тебя вижу!',
        icon = 'tape',
        model = 'models/mosi/fallout4/props/junk/ducttape.mdl',
    },
    ['glue'] = {
        name = 'Клей',
        description = 'Склеил ласты',
        icon = 'glue',
        model = 'models/props_junk/metal_paintcan001a.mdl',
    },
    ['cloth'] = {
        name = 'Ткань',
        description = 'Я по твоему швея?',
        icon = 'textile',
        model = 'models/mosi/fallout4/props/junk/components/cloth.mdl',
    },
    ['wire'] = {
        name = 'Медные провода',
        description = 'А их можно будет сдать на медь?',
        icon = 'wire',
        model = 'models/quest/materials_wire.mdl',
    },
    ['battery'] = {
        name = 'Аккумулятор',
        description = 'Младший брат павербанка!',
        icon = 'battery',
        model = 'models/ammo/ammo_gauss.mdl',
    },
    ['battery_c'] = {
        name = 'Улучшенный Аккумулятор',
        description = 'Почти павербанк!',
        icon = 'upgraded_battery',
        model = 'models/ammo/ammo_gauss_custom.mdl',
    },
    ['motherboard'] = {
        name = 'Электросхема',
        description = 'Первые шаги в развитии электроники!',
        icon = 'motherboard',
        model = 'models/mosi/fallout4/props/junk/components/circuitry.mdl',
    },
    ['licence'] = {
        name = 'Лицензия',
        description = 'Да, я могу носить оружие!',
        icon = 'licence',
        model = 'models/props_lab/clipboard.mdl',
        func = function(self, ply)
            DarkRP.notify(ply, 1, 4, 'Вы использовали "Лицензию на оружие"')
            ply:setDarkRPVar("HasGunlicense", true)
            self:Remove()
        end,
    },
    ['cry_doll'] = {
        name = 'Кукля',
        description = 'НЕ ТРОГАЙ ЕЕ!',
        icon = 'star',
        model = 'models/props_c17/doll01.mdl',
        func = function(self, ply)
            self:SetColor(Color(255, 0, 0))
            self:EmitSound('ui/buttonclickrelease.wav')
            timer.Simple(3, function()
                VJ_EmitSound(self, "vj_fire/explosion2.wav", 100, 100)
                util.BlastDamage(self, self:CPPIGetOwner(), self:GetPos(), 256, 1000)
                util.ScreenShake(self:GetPos(), 100, 200, 1, 2500)
                ParticleEffect("vj_explosion2", self:GetPos(), self:GetAngles())
                self:Remove()
            end)
        end,
    },
    ['pipe'] = {
        name = 'Труба',
        description = 'Тебе труба!',
        icon = 'pipe',
        model = 'models/props_canal/mattpipe.mdl',
    },
    ['piston'] = {
        name = 'Поршень',
        description = 'Подвинься',
        icon = 'piston',
        model = 'models/xqm/pistontype1.mdl',
    },
    ['rifle_barrel'] = {
        name = 'Ствол',
        description = 'Не целься в меня',
        icon = 'rifle_barrel',
        model = 'models/craftparts/basicrec/basicrec.mdl',
    },
    ['rifle_body'] = {
        name = 'Корпус',
        description = '',
        icon = 'rifle_body',
        model = 'models/items/item_item_crate.mdl',
    },
    ['rifle_butt'] = {
        name = 'Приклад',
        description = 'Держись',
        icon = 'rifle_butt',
        model = 'models/craftparts/basicbutt/basicbutt.mdl',
    },
    ['rifle_clip'] = {
        name = 'Магазин',
        description = 'А патроны не забыл?',
        icon = 'rifle_clip',
        model = 'models/craftparts/medmag/medmag.mdl',
    },
    ['screws'] = {
        name = 'Болты',
        description = 'Закручивай',
        icon = 'screws',
        model = 'models/mosi/fallout4/props/junk/components/screws.mdl',
    },
    ['spring'] = {
        name = 'Пружина',
        description = 'Отойди от меня',
        icon = 'spring',
        model = 'models/mosi/fallout4/props/junk/components/springs.mdl',
    },
    ['tools'] = {
        name = 'Инструменты',
        description = 'Без меня никуда!',
        icon = 'tools',
        model = 'models/mosi/fallout4/props/junk/modcrate.mdl',
    },
    ['wood'] = {
        name = 'Древесина',
        description = 'Первичный материал',
        icon = 'wood',
        -- model = 'models/mosi/fallout4/props/junk/components/wood.mdl',
        model = 'models/props_docks/channelmarker_gib01.mdl',
    },
    ['stone'] = {
        name = 'Камень',
        description = 'Вторичный материал',
        icon = 'stone',
        -- model = 'models/props_combine/breenbust_chunk06.mdl',
        model = 'models/props_junk/rock001a.mdl',
    },
}

function shizlib.Crafting.LoadEntities()
    for k, v in pairs( shizlib.Resources ) do
        local ENT = {}
        ENT.Type = "anim"
        ENT.Base = "base_resources"

        ENT.PrintName = v.name
        ENT.Category		= "SHZ | Resource"
        ENT.Author			= "shizlib"

        ENT.Spawnable = true
        ENT.AdminSpawnable = true
            
        ENT.ResourceType = k

        if v.func then
            function ENT:Use(activator, caller)
                if not self.cd or self.cd < CurTime() then
                    self.cd = CurTime() + 1
                    if self:GetPos():Distance(activator:GetPos()) >= CFG.useDist then return end

                    v.func(self, caller)
                end
            end
        end

        scripted_ents.Register( ENT, 'shizlib_resource_' .. string.Replace( string.lower( k ), " ", "" ) )
    end
end

shizlib.Crafting.LoadEntities()