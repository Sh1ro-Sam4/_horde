/****
	GENERAL CONFIGURATION
	General
****/

-- Whether to use the server's database (sv.db) or MySQL. Restart the map after changing database mode.
-- WARNING: You cannot transfer items from one database to another.
-- 0: sv.db (local)
-- 1: MySQL via gmsv_mysqloo (https://facepunch.com/showthread.php?t=1515853)
--	  Configure the DB settings in accessory/sv_database.lua
-- 2: MySQL via gmsv_tmysql4
--	  Configure the DB settings in accessory/sv_database.lua
SH_ACC.DatabaseMode = 0

-- Set to true to allow players to run a command (defined below) to bring up the menu.
-- AKA players can change their accessories at any time given.
SH_ACC.FreeAccess = true

-- Commands to open the accessory menu. Only works when FreeAccess is true.
-- ! is automatically replaced to / so you don't have to include them.
SH_ACC.FreeAccessCommand = {
	"/accessory",
	"/accessories",
	"/acc",
}

-- Which usergroups are allowed to use the system.
-- Leave the table empty to allow everyone to use the add-on.
SH_ACC.AllowedUsergroups = {
	// Remove the -- below to allow only "vip" players to use the add-on.
	-- ["vip"] = true,
}

-- Fraction of an accessory's price.
-- Anything below 0 will result in unintended behavior!
SH_ACC.PurchaseFrac = 1

-- Different purchase price fractions for specific usergroups.
-- If available, this overrides the PurchaseFrac option but is overriden by PurchaseFracPlayers.
SH_ACC.PurchaseFracUsergroups = {
	-- ["admin"] = 0.1,
	-- ["superadmin"] = 0.1,
}

-- Different purchase price fractions for specific players.
-- SteamID only.
-- If available, this overrides the PurchaseFrac and PurchaseFracUsergroups options.
SH_ACC.PurchaseFracPlayers = {
	-- ["STEAM_0:0:0"] = 0.1,
}

-- How many accessories a player can wear at a time.
-- Set to 0 to remove the limit.
SH_ACC.MaximumWearable = 0

-- Different wearable accessory limit for specific usergroups.
-- If available, this overrides the MaximumWearable option but is overriden by MaximumWearablePlayers.
SH_ACC.MaximumWearableUsergroups = {
}

-- Different wearable accessory limit for specific players.
-- SteamID only.
-- If available, this overrides the MaximumWearable and MaximumWearableUsergroups options.
SH_ACC.MaximumWearablePlayers = {
	-- ["STEAM_0:0:0"] = 100,
}

-- Disable key shortcuts when using the shop.
-- TAB = toggle navigation bar
-- 1-9 = browse categories
-- Ctrl+F = open search bar
-- MOUSE4 (in adjust menu) = close adjust menu
SH_ACC.DisableKeyShortcuts = false

-- Disable the info tab.
-- Shows name, credits, version, add-ons enabled, how many accessories are installed and a link to the ScriptFodder page.
SH_ACC.DisableInfoTab = true

-- Where to spawn Accessories Vendor NPCs on the map.
-- Use the "sh_accessories_mypos" console command to get your current position and angle.
-- SH_ACC.NPCSpawns = {
-- 	 --{pos = Vector(-1632, -1176, -196), ang = Angle(0, -90, 0)
-- 	 {pos = Vector(510.000000, -3016.000000, 72.031250), ang = Angle(0.000, 90.000, 0.000)
-- },
-- }

-- How long equipping an accessory from the SWEP takes in seconds.
SH_ACC.DelayedEquipTime = 6

-- How long unequipping an accessory from the SWEP takes in seconds.
SH_ACC.DelayedUnequipTime = 1

-- Whether to send the (interface) content used by the script via Steam Workshop or FastDL.
SH_ACC.UseWorkshop = false

/****
	GENERAL CONFIGURATION
	Adjusting
****/

-- Should players be allowed to adjust their accessories?
-- Adjusting is moving, rotating or scaling an accessory slightly in case it doesn't or barely fits a player model.
SH_ACC.AllowAdjusting = false

-- Specific usergroups allowed (or not) to adjust accessories.
-- If available, this overrides the AllowAdjusting option but is overriden by AllowAdjustingPlayers.
SH_ACC.AllowAdjustingUsergroups = {
	-- ["admin"] = true,
	-- ["superadmin"] = true,
}

-- Allow specific players to adjust or not.
-- SteamID only.
-- If available, this overrides the AllowAdjusting and AllowAdjustingUsergroups options.
SH_ACC.AllowAdjustingPlayers = {
	-- ["STEAM_0:0:0"] = false,
}

-- Factor determining how much a player can adjust their accessory.
-- The smaller the value, the less the player will be able to adjust their accessory.
-- The higher, the (potentially) further they can move, rotate or scale it from their body, resulting in hilarious consequences.
-- Anything below or equal to 0 will produce unexpected results, so don't do that.
SH_ACC.AdjustFactor = 5

-- Different adjusting factors for specific usergroups.
-- If available, this overrides the AdjustFactor option but is overriden by AdjustFactorPlayers.
SH_ACC.AdjustFactorUsergroups = {
	-- ["admin"] = 100,
	-- ["superadmin"] = 100,
}

-- Different adjusting factors for specific players.
-- SteamID only.
-- If available, this overrides the AdjustFactor and AdjustFactorUsergroups options.
SH_ACC.AdjustFactorPlayers = {
	-- ["STEAM_0:0:0"] = 100,
}

-- How much translating, rotating and scaling are affected by adjustment.
-- Don't touch unless you've got a good reason to.
SH_ACC.IndividiualAdjustFactor = {
	translate = 0.5,
	rotate = 1,
	scale = 0.01,
}

/****
	GENERAL CONFIGURATION
	Selling
****/

-- Can players sell their accessories?
SH_ACC.AllowSelling = true  

-- Allow specific usergroups to sell or not.
-- If available, this overrides the AllowSelling option but is overriden by AllowSellingPlayers.
SH_ACC.AllowSellingUsergroups = {
	-- ["admin"] = true,
	-- ["superadmin"] = true,
}

-- Allow specific players to sell or not.
-- SteamID only.
-- If available, this overrides the AllowSelling and AllowSellingUsergroups options.
SH_ACC.AllowSellingPlayers = {
	-- ["STEAM_0:0:0"] = false,
}

-- Fraction of money players get by selling an accessory
-- Anything below 0 will result in unintended behavior!
SH_ACC.SellFrac = 0.5

-- Different sell value fractions for specific usergroups.
-- If available, this overrides the SellFrac option but is overriden by SellFracPlayers.
SH_ACC.SellFracUsergroups = {
	-- ["vip"] = 0.75,
	-- ["admin"] = 1,
	-- ["superadmin"] = 1,
}

-- Different sell value fractions for specific players.
-- SteamID only.
-- If available, this overrides the SellFrac and SellFracUsergroups options.
SH_ACC.SellFracPlayers = {
	-- ["STEAM_0:0:0"] = 100,
}

/****
	GENERAL CONFIGURATION
	Rendering
****/

-- Draw accessories on player bodies
SH_ACC.DrawOnBodies = true

-- Draw accessories on arrested players
SH_ACC.DrawOnArrested = false

-- Draw accessories even if they can't find the player's bone
-- (often they will be badly positionned, like real bad)
SH_ACC.DisplayWithEmptyBone = false

-- Maximum distance at which the accessories can be rendered. In units.
-- Set to 0 for infinite distance
SH_ACC.RenderDistance = 750 -- bilo750

/****
	GENERAL CONFIGURATION
	Interface
****/

-- Blur the blackground in black when the menu is open
SH_ACC.DrawBackgroundBlur = false

-- Show messages when equipping/unequipping something
SH_ACC.EquipMessages = false

-- Categories displayed in the Shop.
-- Here you can move categories around or even delete them.
SH_ACC.ShopCategories = {
	{text = "head", slot = SH_SLOT_HEAD, icon = Material("shenesis/accessory/hat.png", "noclamp smooth")},
	{text = "eyes", slot = SH_SLOT_EYES, icon = Material("shenesis/accessory/sunglasses.png", "noclamp smooth")},
	{text = "mouth", slot = SH_SLOT_MOUTH, icon = Material("shenesis/accessory/mask.png", "noclamp smooth")},
	{text = "neck", slot = SH_SLOT_NECK, icon = Material("shenesis/accessory/scarf.png", "noclamp smooth")},
	{text = "back", slot = SH_SLOT_BACK, icon = Material("shenesis/accessory/backpack.png", "noclamp smooth")},
}

/****
	STYLE CONFIGURATION
****/

-- Font to use for normal text throughout the interface.
SH_ACC.Font = "Circular Std Medium"

-- Font to use for bold text throughout the interface.
SH_ACC.FontBold = "Circular Std Bold"

-- Color sheet. Only modify if you know what you're doing
local colors = {
    header_a = Color(44, 62, 80),
    bg_a = Color(23,23,23,200),
	close_hover = Color(231, 76, 60, 255),
}
SH_ACC.Style = {
header = colors.header_a,
    bg = colors.bg_a,
    inbg = colors.bg_a,

	close_hover = colors.close_hover,
	hover = colors.bg_a,
	hover2 = colors.header_a,


	text = Color(255, 255, 255, 255),
	text_down = Color(0, 0, 0),
	can_afford = Color(46, 204, 17),
	cant_afford = Color(231, 76, 60),
	equipped = Color(52, 152, 219),
	possessed = Color(241, 196, 15),
	restricted = Color(230, 126, 34),

	menu = colors.bg_a,
}

/****
	LANGUAGE CONFIGURATION
****/

-- Names corresponding to each accessory slot.
-- You shouldn't have to modify this. Modify the Language table instead.
-- If you (manage to) add a new slot, make sure to register it here or the add-on will not work!
SH_ACC.SlotText = {
	[SH_SLOT_HEAD] = "head",
	[SH_SLOT_EYES] = "eyes",
	[SH_SLOT_MOUTH] = "mouth",
	[SH_SLOT_BACK] = "back",
	[SH_SLOT_NECK] = "neck",
}

-- Various strings used throughout the add-on. Change them to your language here.
-- %s and %d are special strings replaced with relevant info, keep them in the string!

-- French translation: http://pastebin.com/aHGFnN5A

SH_ACC.Language = {
	accessory_vendor = "Аксессуары",
	accessory_changer = "Аксессуары",

	toggle = "Включить",
	purchase = "Купить",
	sell = "Продать",
	equip = "Экипировать",
	unequip = "Убрать",
	adjust = "Регулировать",
	adjust_desc = "",
	quick_switch = "Смена аксессуара",
	accessory_limit = "Лимит аксессуаров",
	search = "Поиск",

	none = "Ничего",
	free = "Бесплатно",
	equipped = "Куплено",
	possessed = "Куплено",
	restricted = "Только с Premium",
	job_specific = "",
	yes = "Да",
	no = "Нет",
	info = "Инфо",

	translate = "", -- "Move" -- 
	rotate = "Поворот",
	scale = "Размер",
	reset_adjustments = "Сбросить",

	confirm_action = "Подтвердить изменения",
	buy_confirm = "Вы действительно хотите купить аксессуар за %s?",
	sell_confirm = "Вы действительно хотите продать %s за %s?",
	this_accessory_covers_x = "Заполняет несколько слотов: %s",
	failed_to_perform_action = "Ошибка.",
	cant_afford_x = "У вас не хватает денег на %s!",
	reached_acc_limit = "Вы достигли лимита аксессуаров, купите VIP+",
	cannot_purchase_accessory = "Не удается приобрести аксессуар",
	cannot_sell_accessory = "Не удается продать аксессуар",
	bad_usergroup = "Ваша привелегия не позволяет носить аксессуар.",

	you_equipped_x = "Вы теперь носите %s.",
	you_equipped_x_swapped_with_y = "Вы теперь носите %s (сменено %s).",
	you_unequipped_x = "Вы больше не носите %s.",
	you_purchased_x = "Вы приобрели %s!",
	you_sold_x_for_y = "Вы продали %s за %s!",
	equipping_to_acc = "Одеваем %s",
	unequipping_acc = "Снимаем %s",

	-- model panel instructions
	left_click_help = "ЛЕВЫЙ КЛИК: Право-лево",
	right_click_help = "ПРАВЫЙ КЛИК: Приближение",
	middle_click_help = "СРЕДНЯЯ КНОПКА МЫШИ: Перемещение модели",

	-- slots
	overview = "Обзор",
	head = "Голова",
	eyes = "Глаза",
	mouth = "Лицо",
	back = "Спина",
	neck = "Шея",
}