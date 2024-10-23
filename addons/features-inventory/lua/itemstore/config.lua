-- The maximum allowable size for stacked items. Set to math.huge for infinite stacks.
-- SOME ITEMS DO NOT OBEY THIS CONFIG OPTION!! Ammo and money are exempt for obvious reasons.
itemstore.config.MaxStack = 5

-- Where to save player data. Values are none, text, mysqloo (recommended) and tmysql4 (deprecated)
itemstore.config.DataProvider = "text"

-- If true, saves the player's inventory every time it's changed.
-- DO NOT TURN THIS OFF IF YOU'RE RUNNING THE mysql.experimental DATA PROVIDER!!
itemstore.config.SaveOnWrite = false

-- The gamemode to enable support for. Valid values are darkrp and darkrp24.
itemstore.config.GamemodeProvider = "darkrp"

-- Prefix for chat commands
itemstore.config.ChatCommandPrefix = "/"

-- The jobs that have access to an inventory. If this is empty, all teams have access.
-- Admins will still have access to their inventory though.
-- Names must be exact.
-- example: itemstore.config.LimitToTeams = { TEAM_CITIZEN, TEAM_COP }
itemstore.config.LimitToJobs = {}

-- The interval at which the inventory saves all players automatically, in seconds.
itemstore.config.SaveInterval = 180

-- The language of the inventory.
-- There are two languages by default, en (English), fr (French), de (German) and ru (Russian)
itemstore.config.Language = "ru"

-- Enable quick inventory viewing by holding the context menu key, default C.
itemstore.config.ContextInventory = false

-- If context inventory is enabled, this defines where it appears on the player's screen.
-- Valid values are "top", "bottom", "left" and "right"
itemstore.config.ContextInventoryPosition = "bottom"

-- Allow the use of the /invholster command
itemstore.config.EnableInvholster = true

-- Force player to holster all of their ammo as well as their gun when they use /invholster, ala DarkRP.
itemstore.config.InvholsterTakesAmmo = true

-- Split ammo on spawned_weapons instead of giving all ammo at once when used
itemstore.config.SplitWeaponAmmo = false

-- Force player to retrieve their items from the bank before being able to use them.
itemstore.config.PickupsGotoBank = false

-- The distance that the player is able to "reach" when picking up items.
itemstore.config.PickupDistance = CFG.useDist

-- The distance that items will drop at relative to the player
itemstore.config.DropDistance = CFG.useDist

-- The key to use in combination with +use (E) to pick up items.
-- A list of keys for this option is here: http://wiki.garrysmod.com/page/Enums/IN
-- Set this to -1 to disable the key combo.
itemstore.config.PickupKey = IN_DUCK

-- Whether or not trading should be enabled. Set this to false to disable.
itemstore.config.TradingEnabled = true

-- How long in seconds the player needs to wait after a trade to trade again
itemstore.config.TradeCooldown = 60

-- How close in hammer units two players need to be to trade. 0 means infinite.
itemstore.config.TradeDistance = 99999

-- Whether or not the player should drop their inventory on death.
itemstore.config.DeathLoot = false

-- How long in seconds the player's dropped inventory should exist for.
itemstore.config.DeathLootTimeout = 60 * 3

-- Makes boxes breakable if enough damage is inflicted
itemstore.config.BoxBreakable = true

-- Amount of health for boxes to have
itemstore.config.BoxHealth = 100

-- Should users be able to pick up other users' entities
itemstore.config.IgnoreOwner = true

-- Fixes a duplication bug by detouring ENTITY:Remove()..
-- WARNING: Turning this off will open an exploit that allows players to dupe items!
-- Only turn it off if it is somehow conflicting.
itemstore.config.AntiDupe = true

-- Migrates text data from 2.0 to the current format.
-- This is experimental and may not function correctly. Please be careful if you decide to use this.
-- !!IMPORTANT!!
-- PLEASE make backups of your data -- this process is DESTRUCTIVE and will delete old data files 
-- and overwrite any inventory data that players currently have.
itemstore.config.MigrateOldData = false

-- Inventory sizes according to rank.
-- The format for this table is:
-- <rank> = { <width>, <height>, <pages> }
-- If a player's rank is not contained within this table, it defaults to default.
-- DO NOT REMOVE DEFAULT! If you remove it, there will be errors!
itemstore.config.InventorySizes = {
	default = { 8, 8, 2 },
}

-- Same as above, for banks. Same format. DON'T REMOVE DEFAULT!
itemstore.config.BankSizes = {
	default = { 8, 8, 1 },
}

-- The skin to use. Preinstalled skins are "flat" and "classic".
itemstore.config.Skin = "flat"

-- The various colours of the VGUI in R, G, B, A 0-255 format.
-- Not available when using the flat skin
itemstore.config.Colours = {
	Slot = Color( 29, 26, 31 ),
	HoveredSlot = Color( 255, 255, 255, 150 ),
	Title = Color( 255, 255, 255 ),

	TitleBackground = Color( 255, 255, 255 ),
	Upper = Color( 245, 245, 245, 20 ),
	Lower = Color( 30, 30, 30, 150 ),
	InnerBorder = Color( 0, 0, 0, 0 ),
	OuterBorder = Color( 0, 0, 0, 200 )
}

-- The style of the item highlight. Options are "old", "border", "corner", subtle" and "full"
itemstore.config.HighlightStyle = "full"

-- Highlight colours for the various types of items. 
itemstore.config.HighlightColours = {
	Weapons = Color( 231, 76, 60 ),
	Ammo = Color( 241, 196, 15 ),
	Shipments = Color( 230, 126, 34 ),
	Factories = Color( 52, 152, 219 ), -- printers, gunlabs, microwaves, etc
	Consumables = Color( 26, 188, 156 ), -- drugs, food
	Money = Color( 46, 204, 113 ),
	Other = Color( 236, 240, 241 ), -- never delete this!

	/*
		CUSTOM
	*/
	Food = Color( 78, 148, 95 ),
	EML = Color( 0, 184, 216 ),
	SIG = Color( 112, 95, 148 ),
	ADrug = Color( 81, 131, 94 ),
	Ammo = Color( 131, 115, 81 ),
	Resources = Color( 91, 107, 139 )
}

-- A table of disabled items. Set any value in this table to true to disallow picking up the item.
itemstore.config.DisabledItems = {
	drug = false,
	drug_lab = false,
	food = false,
	gunlab = false,
	microwave = false,
	spawned_food = false,
	spawned_shipment = false,
	spawned_weapon = false,
	spawned_money = false,

	prop_physics = true,

	/*
		CUSTOM: BLACK LIST
	*/
	cf_delievery_box = true,
	money_printer = true,
}

-- Custom items. Defining these will allow server owners to make certain
-- entities pickupable... but may not work 100%. If this is the case, you will probably
-- need to code the item definition yourself.
-- Format for each entry is:
-- <entity class> = { "<name>", "<description>", <stackable (optional)> }
itemstore.config.CustomItems = {
	sent_ball = { "Bouncy Ball", "A bouncy ball!", true, itemstore.config.HighlightColours.Other },
	/*
		EML
	*/
	eml_stove = { 'Плита', 'Используется для варки метамфетамина', false, itemstore.config.HighlightColours.EML },
	eml_spot = { 'Кастрюля', 'Используется для варки метамфетамина', false, itemstore.config.HighlightColours.EML },
	eml_redp = { 'Красный фосфор', 'Используется для варки метамфетамина', false, itemstore.config.HighlightColours.EML },
	eml_jar = { 'Банка', 'Используется для варки метамфетамина', false, itemstore.config.HighlightColours.EML },
	eml_macid = { 'Соляная Кислота', 'Используется для варки метамфетамина', false, itemstore.config.HighlightColours.EML },
	eml_iodine = { 'Жидкий Йод', 'Используется для варки метамфетамина', false, itemstore.config.HighlightColours.EML },
	eml_water = { 'Вода', 'Используется для варки метамфетамина', false, itemstore.config.HighlightColours.EML },
	eml_gas = { 'Газ', 'Используется для варки метамфетамина', false, itemstore.config.HighlightColours.EML },
	/*
		Sigfactory
	*/
	cf_cigarette_machine = { 'AUTO-CIG 2000', 'Используется для исготовления сигарет', false, itemstore.config.HighlightColours.CIG },
	cf_engine_upgrade = { 'Модуль "Скорость"', 'Используется для исготовления сигарет"', false, itemstore.config.HighlightColours.CIG },
	cf_storage_upgrade = { 'Модуль "Ёмкость"', 'Используется для исготовления сигарет"', false, itemstore.config.HighlightColours.CIG },
	cf_delievery_box = { 'Коробка для сбора сигарет', 'Используется для исготовления сигарет', false, itemstore.config.HighlightColours.CIG },
	cf_roll_paper = { 'Бумага', 'Используется для исготовления сигарет', false, itemstore.config.HighlightColours.CIG },
	cf_tobacco_pack = { 'Табак', 'Используется для исготовления сигарет', false, itemstore.config.HighlightColours.CIG },
	/*
		Other
	*/
	money_printer = { 'Денежный принтер', 'Переодически печатает деньги. Использует чернила!', false, Color(189,0,0) },
	shizlib_workbench = { 'Верстак', 'Используется для крафтов', false, Color(189,0,0) },

	shizlib_ammo_pulse = { 'Патроны для автоматов', '', false, itemstore.config.HighlightColours.Ammo },
	shizlib_ammo_buckshot = { 'Патроны для дробовиков', '', false, itemstore.config.HighlightColours.Ammo },
	shizlib_ammo_pistol = { 'Патроны для пистолетов', '', false, itemstore.config.HighlightColours.Ammo },
	shizlib_ammo_smg1 = { 'Патроны для пистолетов-пулеметов', '', false, itemstore.config.HighlightColours.Ammo },

	adrug_water = { 'Вода', 'Используется для выращивания травки', false, itemstore.config.HighlightColours.ADrug },
	adrug_weed_plant = { 'Горшок', 'Используется для выращивания травки', false, itemstore.config.HighlightColours.ADrug },
	adrug_heat_lamp = { 'Лампа', 'Используется для выращивания травки', false, itemstore.config.HighlightColours.ADrug },
	adrug_battery = { 'Подзарядник', 'Используется для выращивания травки', false, itemstore.config.HighlightColours.ADrug },
	adrug_weed_seed = { 'Семена травки', 'Используется для выращивания травки', false, itemstore.config.HighlightColours.ADrug },
	adrug_weed = { 'Травка', 'Используется для выращивания травки', false, itemstore.config.HighlightColours.ADrug },
}
