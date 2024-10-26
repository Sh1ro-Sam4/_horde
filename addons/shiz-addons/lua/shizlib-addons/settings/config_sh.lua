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
            name = 'Высота',
            convar = 'shizlib_chat_h',
            number = true,
            min = 0,
            max = 9999,
        }
    }
}