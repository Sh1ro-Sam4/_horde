SETTINGS = SETTINGS or {}

SETTINGS.Config = {
    ['HUD'] = {
        {
            id = 1,
            name = 'Виньетка',
            convar = 'shizlib_hud_vingette',
            checkbox = true,
        },
    },
    ['Chat'] = {
        {
            id = 1,
            name = 'Перезагрузить чат',
            convar = 'shizlib_chat_reload',
            command = true,
        },
        {
            id = 2,
            name = 'Высота | Перезапускайте чат после изменений',
            convar = 'shizlib_chat_h',
            number = true,
            min = 0,
            max = 9999,
        },
        {
            id = 3,
            name = 'Ширина | Перезапускайте чат после изменений',
            convar = 'shizlib_chat_w',
            number = true,
            min = 0,
            max = 9999,
        },
        {
            id = 4,
            name = 'Позиция по X | Перезапускайте чат после изменений',
            convar = 'shizlib_chat_x',
            number = true,
            min = 0,
            max = 9999,
        },
        {
            id = 5,
            name = 'Позиция по Y | Перезапускайте чат после изменений',
            convar = 'shizlib_chat_y',
            number = true,
            min = 0,
            max = 9999,
        },
    }
}