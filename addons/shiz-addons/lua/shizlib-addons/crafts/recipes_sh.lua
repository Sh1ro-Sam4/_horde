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
        name = 'Корпус',
        description = '',
        amount = 1,
        resources = {
            {
                class = 'steel',
                amount = 4,
            },
            {
                class = 'aluminum',
                amount = 2,
            },
        },
        base = 'resource',
        entity = 'rifle_body',
        customCheck = function(self, ply) return true end,
    },
    {
        id = 3,
        name = 'Магазин',
        description = '',
        amount = 1,
        resources = {
            {
                class = 'steel',
                amount = 3,
            },
            {
                class = 'spring',
                amount = 2,
            },
        },
        base = 'resource',
        entity = 'rifle_clip',
        customCheck = function(self, ply) return true end,
    },
    {
        id = 4,
        name = 'Ствол',
        description = '',
        amount = 1,
        resources = {
            {
                class = 'steel',
                amount = 1,
            },
            {
                class = 'pipe',
                amount = 1,
            },
            {
                class = 'screws',
                amount = 1,
            },
        },
        base = 'resource',
        entity = 'rifle_barrel',
        customCheck = function(self, ply) return true end,
    },
    {
        id = 5,
        name = 'Приклад',
        description = '',
        amount = 1,
        resources = {
            {
                class = 'steel',
                amount = 1,
            },
            {
                class = 'cloth',
                amount = 1,
            },
            {
                class = 'tape',
                amount = 2,
            },
        },
        base = 'resource',
        entity = 'rifle_butt',
        customCheck = function(self, ply) return true end,
    },
    {
        id = 6,
        name = 'Glock',
        description = '',
        amount = 1,
        resources = {
            {
                class = 'rifle_body',
                amount = 1,
            },
            {
                class = 'rifle_clip',
                amount = 1,
            },
            {
                class = 'screws',
                amount = 2,
            },
        },
        base = 'weapon',
        entity = 'glock',
        customCheck = function(self, ply) return true end,
    },
    {
        id = 7,
        name = 'TMP',
        description = '',
        amount = 1,
        resources = {
            {
                class = 'rifle_body',
                amount = 1,
            },
            {
                class = 'rifle_clip',
                amount = 1,
            },
            {
                class = 'rifle_barrel',
                amount = 1,
            },
            {
                class = 'screws',
                amount = 2,
            },
        },
        base = 'weapon',
        entity = 'tmp',
        customCheck = function(self, ply) return true end,
    },
    {
        id = 8,
        name = 'M3',
        description = '',
        amount = 1,
        resources = {
            {
                class = 'rifle_body',
                amount = 1,
            },
            {
                class = 'rifle_barrel',
                amount = 1,
            },
            {
                class = 'screws',
                amount = 2,
            },
        },
        base = 'weapon',
        entity = 'm3super90',
        customCheck = function(self, ply) return true end,
    },
    {
        id = 9,
        name = 'Galil',
        description = '',
        amount = 1,
        resources = {
            {
                class = 'rifle_body',
                amount = 1,
            },
            {
                class = 'rifle_clip',
                amount = 1,
            },
            {
                class = 'rifle_barrel',
                amount = 1,
            },
            {
                class = 'rifle_butt',
                amount = 1,
            },
            {
                class = 'tape',
                amount = 1,
            },
            {
                class = 'screws',
                amount = 2,
            },
        },
        base = 'weapon',
        entity = 'galil',
        customCheck = function(self, ply) return true end,
    },
    {
        id = 10,
        name = 'AK-47',
        description = '',
        amount = 1,
        resources = {
            {
                class = 'rifle_body',
                amount = 2,
            },
            {
                class = 'rifle_clip',
                amount = 1,
            },
            {
                class = 'rifle_barrel',
                amount = 1,
            },
            {
                class = 'rifle_butt',
                amount = 1,
            },
            {
                class = 'tape',
                amount = 2,
            },
            {
                class = 'screws',
                amount = 3,
            },
        },
        base = 'weapon',
        entity = 'ak47',
        customCheck = function(self, ply) return true end,
    },
    {
        id = 11,
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
        id = 12,
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
}

shizlib.Crafting.RecipesCook = {
    {
        id = 1,
        name = 'Жареный тост',
        description = '',
        amount = 1,
        resources = {
            {
                class = 'toast',
                amount = 1,
            },
            {
                class = 'oil',
                amount = 2,
            },
        },
        base = 'food',
        entity = 'cookedtoast',
        customCheck = function(self, ply) return true end,
    },
    {
        id = 2,
        name = 'Лист Капусты',
        description = '',
        amount = 2,
        resources = {
            {
                class = 'cabbage',
                amount = 1,
            },
        },
        base = 'food',
        entity = 'lettuce',
        customCheck = function(self, ply) return true end,
    },
    {
        id = 3,
        name = 'Мясо',
        description = '',
        amount = 1,
        resources = {
            {
                class = 'meat9',
                amount = 1,
            },
            {
                class = 'oil',
                amount = 2,
            },
        },
        base = 'food',
        entity = 'meat9b',
        customCheck = function(self, ply) return true end,
    },
    {
        id = 4,
        name = 'Гамбургер',
        description = '',
        amount = 1,
        resources = {
            {
                class = 'meat9',
                amount = 1,
            },
            {
                class = 'lettuce',
                amount = 3,
            },
            {
                class = 'bread01',
                amount = 1,
            },
            {
                class = 'pickle',
                amount = 1,
            },
        },
        base = 'food',
        entity = 'burger',
        customCheck = function(self, ply) return true end,
    },
    {
        id = 5,
        name = 'Чизбургер',
        description = '',
        amount = 1,
        resources = {
            {
                class = 'meat9',
                amount = 1,
            },
            {
                class = 'lettuce',
                amount = 3,
            },
            {
                class = 'bread01',
                amount = 1,
            },
            {
                class = 'pickle',
                amount = 1,
            },
            {
                class = 'cheese',
                amount = 1,
            },
        },
        base = 'food',
        entity = 'cheesburger',
        customCheck = function(self, ply) return true end,
    },
}