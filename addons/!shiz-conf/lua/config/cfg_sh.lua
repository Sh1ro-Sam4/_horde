CFG = CFG or {}

CFG.useDist = 84
CFG.useDistSqr = CFG.useDist * CFG.useDist

CFG.skinSound = {
    achievements = 'ui/achievement_earned.wav',
}

CFG.blacklistWeapon = shizlib.array.toKeys({
    'weapon_grapplehook',
    'weapon_grapplehook_mk2',
})

CFG.PlayerModelsSpawn = {
    'models/cs/playermodels/arctic.mdl',
    'models/cs/playermodels/gsg9.mdl',
    'models/cs/playermodels/guerilla.mdl',
    'models/cs/playermodels/leet.mdl',
    'models/cs/playermodels/sas.mdl',
    'models/cs/playermodels/terror.mdl',
    'models/cs/playermodels/urban.mdl',
}

CFG.PlayerModelsSpawnVIP = {
    'models/cs/playermodels/vip.mdl',
}

CFG.blacklistMap = {
    'cs_assault',
    'cs_compound',
    'cs_havana',
    'cs_italy',
    'cs_militia',
    'cs_office',
    'de_aztec',
    'de_cbble',
    'de_chateau',
    'de_dust',
    'de_dust2',
    'de_inferno',
    'de_nuke',
    'de_piranesi',
    'de_port',
    'de_prodigy',
    'de_tides',
    'de_train',
    'test_hardware',
    'test_speakers',
}

CFG.djump = shizlib.array.toKeys({
    'founder',
    'vip',
})

CFG.canHook = shizlib.array.toKeys({
    'founder',
    'elite',
})

CFG.canGrab = shizlib.array.toKeys({
    'founder',
    'imperator',
})

CFG.dropOnDefeat = {
    'steel',
    'aluminum',
    'copper',
    'lead',
    'gold',
    'silver',
    'glass',
    'tape',
    'glue',
    'cloth',
    'wire',
    'battery',
    'battery_c',
    'motherboard',
    'pipe',
    'piston',
    'rifle_barrel',
    'rifle_body',
    'rifle_butt',
    'rifle_clip',
    'screws',
    'spring',
    'tools',
    'wood',
    'stone',

    
    'cry_doll',
}

CFG.icon17 = {
    ['ak47'] = 'assault_rifle',
    ['aug'] = 'assault_rifle',
    ['awp'] = 'sniper_rifle',
    ['deagle'] = 'pistolet',
    ['beretas'] = 'pistolet',
    ['famas'] = 'assault_rifle',
    ['fiveseven'] = 'pistolet',
    ['g3sg1'] = 'sniper_rifle',
    ['galil'] = 'assault_rifle',
    ['glock'] = 'pistolet',
    ['m249'] = 'machine_gun',
    ['m3super90'] = 'shotgun',
    ['m4a1'] = 'assault_rifle',
    ['mac10'] = 'pp',
    ['mp5'] = 'submachine',
    ['p228'] = 'pistolet',
    ['p90'] = 'submachine',
    ['scout'] = 'sniper_rifle',
    ['sg552'] = 'assault_rifle',
    ['sg550'] = 'sniper_rifle',
    ['swb_shotgun'] = 'shotgun',
    ['tmp'] = 'pp',
    ['ump'] = 'submachine',
    ['usp'] = 'silented_pistolet',
    ['xm1014'] = 'shotgun',
    ['knife'] = 'knife',
    ['revolver'] = 'revolver',
}