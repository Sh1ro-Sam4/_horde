shizlib.Crafting = shizlib.Crafting or {}

shizlib.Crafting.CFG = shizlib.Crafting.CFG or {}
shizlib.Crafting.Recipes = {
    {
        id = 1,
        name = 'Электросхема',
        description = '',
        amount = 1,
        resources = {
            {
                class = 'battery',
                amount = 1,
            },
            {
                class = 'glue',
                amount = 2,
            },
            {
                class = 'wire',
                amount = 4,
            },
            {
                class = 'copper',
                amount = 2,
            },
            {
                class = 'silver',
                amount = 1,
            },
        },
        base = 'resource',
        entity = 'motherboard',
        customCheck = function(self, ply) return true end,
    },
    {
        id = 2,
        name = 'Шляпа Ковбоя',
        description = '',
        amount = 1,
        resources = {
            {
                class = 'cloth',
                amount = 3,
            },
            {
                class = 'glue',
                amount = 1,
            },
            {
                class = 'tools',
                amount = 1,
            },
        },
        base = 'accessory',
        entity = 'cowboyhat',
        customCheck = function(self, ply) return true end,
    },
    {
        id = 3,
        name = 'Очки Авиаторы',
        description = '',
        amount = 1,
        resources = {
            {
                class = 'glass',
                amount = 2,
            },
            {
                class = 'aluminum',
                amount = 2,
            },
            {
                class = 'glue',
                amount = 1,
            },
            {
                class = 'tools',
                amount = 1,
            },
        },
        base = 'accessory',
        entity = 'aviators',
        customCheck = function(self, ply) return true end,
    },
    {
        id = 4,
        name = 'Smart Pistol MK5',
        description = 'Автоматический пистолет с автонаведением',
        amount = 1,
        resources = {
            {
                class = 'battery',
                amount = 4,
            },
            {
                class = 'battery_c',
                amount = 2,
            },
            {
                class = 'aluminum',
                amount = 4,
            },
            {
                class = 'screws',
                amount = 3,
            },
            {
                class = 'tools',
                amount = 1,
            },
            {
                class = 'rifle_body',
                amount = 1,
            },
            {
                class = 'rifle_clip',
                amount = 1,
            },
            {
                class = 'motherboard',
                amount = 2,
            },
        },
        base = 'weapon',
        entity = 'mp_weapon_smart_pistol',
        customCheck = function(self, ply) return true end,
    },
    {
        id = 5,
        name = 'Death Sickle',
        description = 'При атаке стреляет вращающимися косами',
        amount = 1,
        resources = {
            {
                class = 'aluminum',
                amount = 8,
            },
            {
                class = 'steel',
                amount = 4,
            },
            {
                class = 'gold',
                amount = 4,
            },
            {
                class = 'lead',
                amount = 4,
            },
            {
                class = 'silver',
                amount = 4,
            },
            {
                class = 'screws',
                amount = 4,
            },
            {
                class = 'tools',
                amount = 4,
            },
            {
                class = 'motherboard',
                amount = 2,
            },
        },
        base = 'weapon',
        entity = 'weapon_deathsickle',
        customCheck = function(self, ply) return true end,
    },
}