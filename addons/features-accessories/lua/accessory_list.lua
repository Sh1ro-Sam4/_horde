-- This is the accessory list. It comes with accessories from a few add-ons (which can be enabled in accessory_addons.lua).
-- If you want to add a new accessory, you can use the SH_ACC:AddAccessory function.
-- To register an accessory, the id, model and slots are mandatory.
-- "id" is an unique identifier for the accessory.
-- "model" is the model of the accessory. Multi-model accessories are not supported.
-- "slots" are the slots that the accessory occupies. A slot may have only one accessory at a time (normally). An accessory can occupy multiple slots (a full face mask for example)
-- There are other settings such as:
-- "name", "price", "skin", "bodygroups", "material", "color", "scale", "canPurchase", "canSell",
-- "usergroups", "steamids", "jobs", "jobsexclude"
-- ...but these are optional.
-- After registering your entity, you need to set up an offset in accessory_offsets.lua

SH_SLOT_HEAD = 1
SH_SLOT_EYES = 2
SH_SLOT_MOUTH = 4
SH_SLOT_BACK = 8
SH_SLOT_NECK = 16

SH_ACC.List = {}

local precached = {}

function SH_ACC:AddAccessory(id, data)
	local mdl = data.mdl
	local slots = data.slot or data.slots
	local price_de = data.price_de or -1

	assert(id and id ~= "", "empty accessory id")
	assert(mdl and id ~= "", "empty model name")
	assert(slots and slots > 0, "unassigned slot")

	local name = data.name or "Accessory"
	local price = data.price or 0

	local skin = data.skin or 0
	local bodygroups = data.bodygroups or {}
	local material = data.material or ""
	local color = data.color or Color(255, 255, 255)
	local scale = data.scale or 1
	local canPurchase = data.canPurchase or nil
	local canSell = data.canSell or nil
	local usergroups = data.usergroups or nil
	local steamids = data.steamids or nil

	assert(self.List[id] == nil, "accessory with id '" .. id .. "' already exists")

	self.List[id] = {
		id = id,
		mdl = mdl:lower(),
		slots = slots,

		name = name,
		price = price,
		price_de = price_de,

		skin = skin,
		bodygroups = bodygroups,
		material = material,
		color = color,
		scale = scale,

		canPurchase = canPurchase,
		canSell = canSell,
		usergroups = usergroups,
		steamids = steamids,
	}

	if (!precached[mdl]) then
		util.PrecacheModel(mdl)
		precached[mdl] = true
	end

	return self.List[id]
end

function SH_ACC:GetAccessory(id)
	return self.List[id]
end

function SH_ACC:CopyAccessory(id, acc, data)
	local newacc = table.Copy(acc)
	for k, v in pairs (data) do
		newacc[k] = v
	end

	return self:AddAccessory(id, newacc)
end

local New = function(...)
	return SH_ACC:AddAccessory(...)
end

local Copy = function(...)
	return SH_ACC:CopyAccessory(...)
end
--
	local a = New("castryla", {name = "Кастрюля", price = 5000, slot = SH_SLOT_HEAD, mdl = "models/props_wasteland/laundry_basket001.mdl"})
	a.scale = 0.25
--
	New("ponchik", {name = "Пончик", price = 750000, mdl = "models/noesis/donut.mdl", slot = SH_SLOT_HEAD, scale = 0.65})
--
	New("hedkrab", {name = "Хєдкраб", price = 750000, mdl = "models/nova/w_headcrab.mdl", slot = SH_SLOT_HEAD, scale = 0.5})
--
	New("ptica", {name = "Птица", price = 750000, slot = SH_SLOT_BACK, mdl = "models/crow.mdl", scale = 2})
--
	New("maskamanyaka", {name = "Маска педофила", price = 750000, mdl = "models/nova/w_headgear.mdl", slot = SH_SLOT_HEAD + SH_SLOT_EYES + SH_SLOT_MOUTH, scale = 1.2}) --donate1
--
	New("shlapa", {name = "Шляпа профессора", price = 750000, mdl = "models/player/items/humans/top_hat.mdl", slot = SH_SLOT_HEAD})
--
	New("shkolnik", {name = "Шляпа школьника", price = 750000, mdl = "models/player/items/humans/graduation_cap.mdl", slot = SH_SLOT_HEAD, scale = 1})
--
	New("trava", {name = "Трɐва", price = 750000, mdl = "models/props/pi_fern.mdl", slot = SH_SLOT_HEAD, scale = 0.25})
--
	New("snegovik", {name = "Маска снеговика", price = 750000, mdl = "models/props/cs_office/snowman_face.mdl", slot = SH_SLOT_HEAD + SH_SLOT_EYES + SH_SLOT_MOUTH}) --donate2
--
	New("kepka", {name = "Кепарик", price = 750000, mdl = "models/props/cs_office/snowman_hat.mdl", slot = SH_SLOT_HEAD, scale = 0.8})
--
	New("war", {name = "Подводный шар", price = 750000, mdl = "models/maxofs2d/hover_basic.mdl", slot = SH_SLOT_HEAD + SH_SLOT_EYES + SH_SLOT_MOUTH, scale = 0.75})
--
	New("vasya", {name = "Маска васи", price = 750000, mdl = "models/maxofs2d/balloon_gman.mdl", slot = SH_SLOT_HEAD + SH_SLOT_EYES + SH_SLOT_MOUTH, scale = 1.05}) --donate3
--
	New("sveta", {name = "Маска светы", price = 750000, mdl = "models/maxofs2d/balloon_mossman.mdl", slot = SH_SLOT_HEAD + SH_SLOT_EYES + SH_SLOT_MOUTH, scale = 1}) --donate4
	New("teliktupo", {name = "Телевизор", price = 750000, mdl = "models/props_c17/tv_monitor01.mdl", slot = SH_SLOT_HEAD, scale = 1}) -- donate
--
	New("defender", {name = "Защита GMOD'A", price = 750000, mdl = "models/maxofs2d/logo_gmod_b.mdl", slot = SH_SLOT_BACK, scale = 0.1})
--
	New("lampa", {name = "Лампа", price = 750000, mdl = "models/props/de_inferno/ceiling_light.mdl", slot = SH_SLOT_HEAD, scale = 0.7})
--
	New("kepkad", {name = "Ярик-Кепарик", price = 750000, mdl = "models/props/de_tides/vending_hat.mdl", slot = SH_SLOT_HEAD, scale = 0.8})
--
	New("cherepa", {name = "Черепашка", price = 750000, mdl = "models/props/de_tides/vending_turtle.mdl", slot = SH_SLOT_HEAD, scale = 1})
--
	New("gitara", {name = "Гитара", price = 750000, mdl = "models/props_phx/misc/fender.mdl", slot = SH_SLOT_BACK, scale = 0.8}) --donate5
--
	New("jetpack", {name = "Джетпак", price = 750000, mdl = "models/thrusters/jetpack.mdl", slot = SH_SLOT_BACK, scale = 1})
--
	New("gib", {name = "GIB-05",  price = 750000, mdl = "models/gibs/scanner_gib05.mdl", slot = SH_SLOT_HEAD + SH_SLOT_EYES + SH_SLOT_MOUTH, scale = 0.75}) --donate6
--
	New("uebaka", {name = "Улыбака", price = 750000, mdl = "models/props_phx/facepunch_logo.mdl", slot = SH_SLOT_BACK, scale = 0.05})
--
	New("constructinc", {name = "Construct inc.",price = 750000, mdl = "models/maxofs2d/construct_sign.mdl", slot = SH_SLOT_BACK, scale = 0.025})
--
	New("hlapalampa", {name = "Шляпа-Лампа", price = 750000, mdl = "models/props_wasteland/prison_lamp001c.mdl", slot = SH_SLOT_HEAD, scale = 0.5})
--
	New("znak1", {name = "Дорожный знак 1", price = 750000, mdl = "models/props_c17/streetsign004e.mdl", slot = SH_SLOT_BACK, scale = 0.7})
--
	New("znak2", {name = "Дорожный знак 2", price = 750000, mdl = "models/props_c17/streetsign004f.mdl", slot = SH_SLOT_BACK, scale = 0.7})
--
	New("krug", {name = "Спасательный круг", price = 750000, mdl = "models/props/de_nuke/lifepreserver.mdl", slot = SH_SLOT_NECK, scale = 0.3})	 --donate7
/*
	ADDON
	[GTA V] Giant Accessories Pack
*/

--if (SH_ACC.Addons["572310312"]) then --572310302
	-- Head
	local a = New("symbolКепка1", {name = "Кепка [Gray F]", price = 750000, price_de = 75000, mdl = "models/modified/hat07.mdl", slot = SH_SLOT_HEAD})
	Copy("symbolКепка2", a, {name = "Кепка [Black F]", skin = 1})
	Copy("symbolКепка3", a, {name = "Кепка [Light Gray C]", skin = 2})
	Copy("symbolКепка4", a, {name = "Кепка [White LS]", skin = 3})
	Copy("symbolКепка5", a, {name = "Кепка [Green Feud]", skin = 4})
	Copy("symbolКепка6", a, {name = "Кепка [Kaki Magnetics]", skin = 5})
	Copy("symbolКепка7", a, {name = "Кепка [Brown OG]", skin = 6})
	Copy("symbolКепка8", a, {name = "Кепка [Blue Stank]", skin = 7})
	Copy("symbolКепка9", a, {name = "Кепка [Olive Knight]", skin = 8})
	Copy("symbolКепка10", a, {name = "Кепка [Dark Blue Monkey]", skin = 9})
	Copy("symbolКепка11", a, {name = "Кепка [Dark Green Football]", skin = 10})

	local a = New("symbolКепка12", {name = "Кепка [Orange LH]", price = 750000,price_de = 75000, mdl = "models/modified/hat08.mdl", slot = SH_SLOT_HEAD})
	Copy("symbolКепка13", a, {name = "Кепка [Censored]", skin = 1})
	Copy("symbolКепка14", a, {name = "Кепка [The Nut House]", skin = 2})
	Copy("symbolКепка15", a, {name = "Кепка [Rusty Browns]", skin = 3})
	Copy("symbolКепка16", a, {name = "Кепка [Bishop's]", skin = 4})
	Copy("symbolКепка17", a, {name = "Кепка [247]", skin = 5})
	Copy("symbolКепка18", a, {name = "Кепка [Fruit Basket]", skin = 6})
	Copy("symbolКепка19", a, {name = "Кепка [Ron]", skin = 7})
	Copy("symbolКепка20", a, {name = "Кепка [Meteorite]", skin = 8})
	Copy("symbolКепка21", a, {name = "Кепка [Dusche Gold]", skin = 9})
	Copy("symbolКепка22", a, {name = "Кепка [Vespucci Beach]", skin = 10})
	Copy("symbolКепка23", a, {name = "Кепка [Orang-O-Tang]", skin = 11})

	local a = New("beerhat1", {name = "Пивная шляпа [Pisswasser]", price = 750000,price_de = 75000, mdl = "models/sal/acc/fix/beerhat.mdl", slot = SH_SLOT_HEAD})
	Copy("beerhat2", a, {name = "Пивная шляпа [Supa Wet]", skin = 1})
	Copy("beerhat3", a, {name = "Пивная шляпа [Patriot]", skin = 2})
	Copy("beerhat4", a, {name = "Пивная шляпа [Benedict]", skin = 3})
	Copy("beerhat5", a, {name = "Пивная шляпа [Blarneys]", skin = 4})
	Copy("beerhat6", a, {name = "Пивная шляпа [J Lager]", skin = 5})

	local a = New("headphones1", {name = "Наушники [Red]", price = 750000,price_de = 75000, mdl = "models/modified/headphones.mdl", slot = SH_SLOT_HEAD})
	Copy("headphones2", a, {name = "Наушники [Pink]", skin = 1})
	Copy("headphones3", a, {name = "Наушники [Green]", skin = 2})
	Copy("headphones4", a, {name = "Наушники [Yellow]", skin = 3})

	New("chefhat", {name = "Головной убор шеф-повара", price = 750000,price_de = 75000, mdl = "models/sal/acc/fix/cheafhat.mdl", slot = SH_SLOT_HEAD})

	local a = New("fedora1", {name = "Мягкая фетровая шляпа [Gray]", price = 750000,price_de = 75000, mdl = "models/modified/hat01_fix.mdl", slot = SH_SLOT_HEAD})
	Copy("fedora2", a, {name = "Мягкая фетровая шляпа [Black]", skin = 1})
	Copy("fedora3", a, {name = "Мягкая фетровая шляпа [White]", skin = 2})
	Copy("fedora4", a, {name = "Мягкая фетровая шляпа [Yellow]", skin = 3})
	Copy("fedora5", a, {name = "Мягкая фетровая шляпа [Red]", skin = 4})
	Copy("fedora6", a, {name = "Мягкая фетровая шляпа [Black/Red]", skin = 5})
	Copy("fedora7", a, {name = "Мягкая фетровая шляпа [Brown/White]", skin = 6})
	Copy("fedora8", a, {name = "Мягкая фетровая шляпа [Blue/Black]", skin = 7})

	local a = New("beanie1", {name = "Шапочка [Red Stripes]", price = 750000,price_de = 75000, mdl = "models/modified/hat03.mdl", slot = SH_SLOT_HEAD})
	Copy("beanie2", a, {name = "Шапочка [Blue]", skin = 1})
	Copy("beanie3", a, {name = "Шапочка [Red]", skin = 2})
	Copy("beanie4", a, {name = "Шапочка [White]", skin = 3})
	Copy("beanie5", a, {name = "Шапочка [Black Stripes]", skin = 4})

	local a = New("woolhat1", {name = "Шерстяная шапка [Black]", price = 750000,price_de = 75000, mdl = "models/modified/hat04.mdl", slot = SH_SLOT_HEAD})
	Copy("woolhat2", a, {name = "Шерстяная шапка [Gray]", skin = 1})
	Copy("woolhat3", a, {name = "Шерстяная шапка [Gray Stripes]", skin = 2})
	Copy("woolhat4", a, {name = "Шерстяная шапка [Jamaica]", skin = 3})
	Copy("woolhat5", a, {name = "Шерстяная шапка [Dark Blue]", skin = 4})

	New("flatКепка", {name = "Кепка гопаря", price = 750000, mdl = "models/modified/hat06.mdl", slot = SH_SLOT_HEAD})

	-- Eyes
	local a = New("glasses1", {name = "Очки [Gray]", price = 750000, mdl = "models/modified/glasses01.mdl", slot = SH_SLOT_EYES})
	Copy("glasses2", a, {name = "Очки [White]", skin = 1})
	Copy("glasses3", a, {name = "Очки [Green]", skin = 2})
	Copy("glasses4", a, {name = "Очки [Brown]", skin = 3})
	Copy("glasses5", a, {name = "Очки [Orange]", skin = 4})
	Copy("glasses6", a, {name = "Очки [Light Gray]", skin = 5})

	New("plaguedoctor", {name = "Маска чумы", price = 750000, slot = SH_SLOT_EYES, mdl = "models/sal/halloween/doctor.mdl"})

	local a = New("balletmask1", {name = "Балетная маска [White]", price = 750000, slot = SH_SLOT_EYES, mdl = "models/sal/acc/fix/mask_1.mdl"})
	Copy("balletmask2", a, {name = "Балетная маска [Blue]", skin = 1})
	Copy("balletmask3", a, {name = "Балетная маска [Black]", skin = 2})
	Copy("balletmask4", a, {name = "Балетная маска [Gray]", skin = 3})
	Copy("balletmask5", a, {name = "Балетная маска [Yellow]", skin = 4})
	Copy("balletmask6", a, {name = "Балетная маска [Black 2]", skin = 5})

	-- Mouth
	New("bandana", {name = "Black Bandana", price = 750000, slot = SH_SLOT_MOUTH, mdl = "models/modified/bandana.mdl"})

	-- Neck
	-- local a = New("scarf1", {name = "Шарф [White]", price = 750000, mdl = "models/sal/acc/fix/scarf01.mdl", slot = SH_SLOT_NECK})
	-- Copy("scarf2", a, {name = "Шарф [Gray]", skin = 1})
	-- Copy("scarf3", a, {name = "Шарф [Black]", skin = 2})
	-- Copy("scarf4", a, {name = "Шарф [Dark Blue]", skin = 3})
	-- Copy("scarf5", a, {name = "Шарф [Red]", skin = 4})
	-- Copy("scarf6", a, {name = "Шарф [Green]", skin = 5})
	-- Copy("scarf7", a, {name = "Шарф [Pink]", skin = 6})

	-- Whole head (Head + Eyes + Mouth)
	New("catmask", {name = "Маска кошки", price = 750000, slot = SH_SLOT_HEAD + SH_SLOT_EYES + SH_SLOT_MOUTH, mdl = "models/sal/cat.mdl"})
	New("bearmask", {name = "Маска медведя", price = 750000, slot = SH_SLOT_HEAD + SH_SLOT_EYES + SH_SLOT_MOUTH, mdl = "models/sal/bear.mdl"})
	New("foxmask", {name = "Маска лисы", price = 750000, slot = SH_SLOT_HEAD + SH_SLOT_EYES + SH_SLOT_MOUTH, mdl = "models/sal/fox.mdl"})
	New("wolfmask", {name = "Маска волка", price = 750000, slot = SH_SLOT_HEAD + SH_SLOT_EYES + SH_SLOT_MOUTH, mdl = "models/sal/wolf.mdl"})
	New("santapenguin", {name = "Санта-Пингвин", price = 750000, slot = SH_SLOT_HEAD + SH_SLOT_EYES + SH_SLOT_MOUTH, mdl = "models/sal/penguin.mdl"})
    New("owlmask", {name = "Маска совы", price = 750000, slot = SH_SLOT_HEAD + SH_SLOT_EYES + SH_SLOT_MOUTH, mdl = "models/sal/owl.mdl"})

	local a = New("monkeymask1", {name = "Маска обезьяны [Normal]", price = 750000, slot = SH_SLOT_HEAD + SH_SLOT_EYES + SH_SLOT_MOUTH, mdl = "models/sal/halloween/monkey.mdl"})
	Copy("monkeymask2", a, {name = "Маска обезьяны [Gorilla]", skin = 1})
	Copy("monkeymask3", a, {name = "Маска обезьяны [Zombie]", skin = 2})
	Copy("monkeymask4", a, {name = "Маска обезьяны [Old]", skin = 3})


	local a = New("eaglemask1", {name = "Маска орла [White]", price = 750000, slot = SH_SLOT_HEAD + SH_SLOT_EYES + SH_SLOT_MOUTH, mdl = "models/sal/hawk_1.mdl"})
	Copy("eaglemask2", a, {name = "Маска орла [Brown]", mdl = "models/sal/hawk_2.mdl"})

	local a = New("paperbag1", {name = "Бумажный пакет",  price = 750000, slot = SH_SLOT_HEAD + SH_SLOT_EYES + SH_SLOT_MOUTH, mdl = "models/sal/halloween/bag.mdl"})
	Copy("paperbag2", a, {name = "Бумажный пакет [Grin]", skin = 1})
	Copy("paperbag3", a, {name = "Бумажный пакет [Crying]", skin = 2})
	Copy("paperbag4", a, {name = "Бумажный пакет [Smile]", skin = 3})
	Copy("paperbag5", a, {name = "Бумажный пакет [Boss]", skin = 4})
	Copy("paperbag6", a, {name = "Бумажный пакет [Teeth]", skin = 5})
	Copy("paperbag7", a, {name = "Бумажный пакет [Timid]", skin = 6})
	Copy("paperbag8", a, {name = "Бумажный пакет [Burger Shot]", skin = 7})
	Copy("paperbag9", a, {name = "Бумажный пакет [Please Kill Me]", skin = 8})
	Copy("paperbag10", a, {name = "Бумажный пакет [Satan]", skin = 9})
	Copy("paperbag11", a, {name = "Бумажный пакет [Pig]", skin = 10})
	Copy("paperbag12", a, {name = "Бумажный пакет [Tongue Out]", skin = 11})
	Copy("paperbag13", a, {name = "Бумажный пакет [Angry]", skin = 12})
	Copy("paperbag14", a, {name = "Бумажный пакет [Confused]", skin = 13})
	Copy("paperbag15", a, {name = "Бумажный пакет [Death]", skin = 14})
	Copy("paperbag16", a, {name = "Бумажный пакет [Dog]", skin = 15})
	Copy("paperbag17", a, {name = "Бумажный пакет [Ghos]", skin = 16})
	Copy("paperbag18", a, {name = "Бумажный пакет [Alien]", skin = 17})
	Copy("paperbag19", a, {name = "Бумажный пакет [Help Me]", skin = 18})
	Copy("paperbag20", a, {name = "Бумажный пакет [Rectangles]", skin = 19})
	Copy("paperbag21", a, {name = "Бумажный пакет [Middle Finger]", skin = 20})
	Copy("paperbag22", a, {name = "Бумажный пакет [Gentleman]", skin = 21})
	Copy("paperbag23", a, {name = "Бумажный пакет [Stickers]", skin = 22})
	Copy("paperbag24", a, {name = "Бумажный пакет [Picasso]", skin = 23})
	Copy("paperbag25", a, {name = "Бумажный пакет [Black Heart]", skin = 24})
	Copy("paperbag26", a, {name = "Бумажный пакет [Black]", skin = 25})

	-- Face (Eyes + Mouth)
	New("gingerbread", {name = "Пряничная маска", price = 750000, slot = SH_SLOT_EYES + SH_SLOT_MOUTH, mdl = "models/sal/gingerbread.mdl"})

	local a = New("headwrap1", {name = "головная упаковка [Gray Bandages]", price = 750000, mdl = "models/sal/halloween/headwrap2.mdl", slot = SH_SLOT_EYES + SH_SLOT_MOUTH})
	a.scale = 0.9
	Copy("headwrap2", a, {name = "головная упаковка [Black Bandages]", skin = 1})
	Copy("headwrap3", a, {name = "головная упаковка [White Bandages]", skin = 2})
	Copy("headwrap4", a, {name = "головная упаковка [Rainbow Bandages]", skin = 3})
	Copy("headwrap5", a, {name = "головная упаковка [Do Not Cross]", mdl = "models/sal/halloween/headwrap1.mdl"})

	local a = New("hockeymask1", {name = "Хоккейная маска [Please Stop Me]", price = 750000, price_de = 700000, slot = SH_SLOT_EYES + SH_SLOT_MOUTH, mdl = "models/modified/mask5.mdl"})
	a.scale = 0.9

	local a = New("hockeymask2", {name = "Хоккейная маска [Bullet Holes]", price = 750000, price_de = 700000, slot = SH_SLOT_EYES + SH_SLOT_MOUTH, mdl = "models/sal/acc/fix/mask_2.mdl"})
	a.scale = 0.9

	Copy("hockeymask3", a, {name = "Хоккейная маска [Dog]", skin = 1})
	Copy("hockeymask4", a, {name = "Хоккейная маска [Cat]", skin = 2})
	Copy("hockeymask5", a, {name = "Хоккейная маска [Dog 2]", skin = 3})
	Copy("hockeymask6", a, {name = "Хоккейная маска [Dog 3]", skin = 4})
	Copy("hockeymask7", a, {name = "Хоккейная маска [Crown]", skin = 5})
	Copy("hockeymask8", a, {name = "Хоккейная маска [Rotten Zombie]", skin = 6})
	Copy("hockeymask9", a, {name = "Хоккейная маска [Vile Zombie]", skin = 7})
	Copy("hockeymask10", a, {name = "Хоккейная маска [Flame Skull]", skin = 8})
	Copy("hockeymask11", a, {name = "Хоккейная маска [Nightmare Skull]", skin = 9})
	Copy("hockeymask12", a, {name = "Хоккейная маска [Electric Skull]", skin = 10})
	Copy("hockeymask13", a, {name = "Хоккейная маска [Skull]", skin = 11})
	Copy("hockeymask14", a, {name = "Хоккейная маска [Stitched]", skin = 12})
	Copy("hockeymask15", a, {name = "Хоккейная маска [Pale Stitched]", skin = 13})
	Copy("hockeymask16", a, {name = "Хоккейная маска [X]", skin = 14})

	local a = New("skullmask1", {name = "Маска черепа [Black]", price = 750000, slot = SH_SLOT_EYES + SH_SLOT_MOUTH, mdl = "models/modified/mask6.mdl"})
	a.scale = 0.9
	Copy("skullmask2", a, {name = "Маска черепа [Gray]", skin = 1})
	Copy("skullmask3", a, {name = "Маска черепа [White]", skin = 2})
	Copy("skullmask4", a, {name = "Маска черепа [Dark Green]", skin = 3})

	local a = New("pigmask1", {name = "Маска свиньи [Normal]", price = 750000, slot = SH_SLOT_EYES + SH_SLOT_MOUTH, mdl = "models/sal/pig.mdl"})
	Copy("pigmask2", a, {name = "Маска свиньи [Bloody]", skin = 1})

	local a = New("warriormask1", {name = "Маска воина [Metal]", price = 750000, slot = SH_SLOT_EYES + SH_SLOT_MOUTH, mdl = "models/sal/acc/fix/mask_4.mdl"})
	Copy("warriormask2", a, {name = "Маска воина [Circuit]", skin = 1})
	Copy("warriormask3", a, {name = "Маска воина [Molten]", skin = 2})
	Copy("warriormask4", a, {name = "Маска воина [Purple]", skin = 3})
	Copy("warriormask5", a, {name = "Маска воина [Carbon]", skin = 4})
	Copy("warriormask6", a, {name = "Маска воина [Target]", skin = 5})
	Copy("warriormask7", a, {name = "Маска воина [Concrete]", skin = 6})
	Copy("warriormask8", a, {name = "Маска воина [Thunder]", skin = 7})

	-- local a = New("ninja1", {name = "Маска ниндзя [Black]", price = 750000, price_de = 700000, slot = SH_SLOT_EYES + SH_SLOT_MOUTH, mdl = "models/sal/halloween/ninja.mdl"})
	-- Copy("ninja2", a, {name = "Маска ниндзя [White]", skin = 1})
	-- Copy("ninja3", a, {name = "Маска ниндзя [Tan]", skin = 2})
	-- Copy("ninja4", a, {name = "Маска ниндзя [L.S Benders]", skin = 3})
	-- Copy("ninja5", a, {name = "Маска ниндзя [Justice]", skin = 4})
	-- Copy("ninja6", a, {name = "Маска ниндзя [Woodland Camo]", skin = 5})
	-- Copy("ninja7", a, {name = "Маска ниндзя [Red Stripes]", skin = 6})
	-- Copy("ninja8", a, {name = "Маска ниндзя [Love Fist]", skin = 7})
	-- Copy("ninja9", a, {name = "Маска ниндзя [T.P.I]", skin = 8})
	-- Copy("ninja10", a, {name = "Маска ниндзя [Pink Camo]", skin = 9})
	-- Copy("ninja11", a, {name = "Маска ниндзя [Police]", skin = 10})

	-- Back
	local a = New("backpack1", {name = "Рюкзак [Red]", price = 750000, price_de = 1650000, mdl = "models/modified/backpack_1.mdl", slot = SH_SLOT_BACK})
	Copy("backpack2", a, {name = "Рюкзак [Black]", skin = 1})
	Copy("backpack3", a, {name = "Рюкзак [Orange]", skin = 2})

	local a = New("backpackcamp1", {name = "Походный рюкзак [Blue]", price = 750000, mdl = "models/modified/backpack_2.mdl", slot = SH_SLOT_BACK})
	Copy("backpackcamp2", a, {name = "Походный Рюкзак [Green]", skin = 1})
	Copy("backpackcamp3", a, {name = "Походный Рюкзак [Red/White]", skin = 2})

	local a = New("backpackmil1", {name = "Военный Рюкзак [Black]", price = 750000, mdl = "models/modified/backpack_3.mdl", slot = SH_SLOT_BACK})
	Copy("backpackmil2", a, {name = "Военный Рюкзак [Gray]", skin = 1})
--end

/*
	ADDON
	GMod Tower: Accessories Pack
*/

	-- Head
	local a = New("strawhat", {name = "Straw Hat", price = 750000, slot = SH_SLOT_HEAD, mdl = "models/captainbigbutt/skeyler/hats/strawhat.mdl"})
	a.scale = 0.9
	a.unusual = true

	local a = New("sunhat", {name = "Sunshine Hat", price = 750000, slot = SH_SLOT_HEAD, mdl = "models/captainbigbutt/skeyler/hats/sunhat.mdl"})
	a.scale = 0.9

	local a = New("cowboyhat", {name = "Cowboy Hat", price = 750000, slot = SH_SLOT_HEAD, mdl = "models/captainbigbutt/skeyler/hats/cowboyhat.mdl"})
	a.scale = 0.8

	local a = New("catears", {name = "Cat Ears", price = 750000, slot = SH_SLOT_HEAD, mdl = "models/gmod_tower/catears.mdl"})
	a.scale = 0.5

	New("bunnyears", {name = "Bunny Ears", price = 750000, slot = SH_SLOT_HEAD, mdl = "models/captainbigbutt/skeyler/hats/bunny_ears.mdl"})

	local a = New("afro", {name = "Afro", price = 750000, slot = SH_SLOT_HEAD, mdl = "models/gmod_tower/afro.mdl"})
	a.scale = 0.8

	local a = New("cathat1", {name = "Cat Hat [Black]", price = 750000, slot = SH_SLOT_HEAD, mdl = "models/captainbigbutt/skeyler/hats/cat_hat.mdl"})
	a.scale = 0.7
	Copy("cathat2", a, {name = "Cat Hat [White]", skin = 1})

	-- local a = New("bearhat", {name = "Bear Hat", price = 750000, slot = SH_SLOT_HEAD, mdl = "models/captainbigbutt/skeyler/hats/bear_hat.mdl"})
	-- a.scale = 0.75
	-- Copy("froghat", a, {name = "Frog Hat", mdl = "models/captainbigbutt/skeyler/hats/frog_hat.mdl", scale = 0.59})

	local a = New("maidheadband", {name = "Maid's Headband", price = 750000, slot = SH_SLOT_HEAD, mdl = "models/captainbigbutt/skeyler/hats/maid_headband.mdl"})
	a.scale = 0.75
	Copy("heartband", a, {name = "Heartband", mdl = "models/captainbigbutt/skeyler/hats/heartband.mdl"})
	Copy("starband", a, {name = "Starband", mdl = "models/captainbigbutt/skeyler/hats/starband.mdl"})

	local a = New("zcap", {name = "cap [Z]", price = 750000, slot = SH_SLOT_HEAD, mdl = "models/captainbigbutt/skeyler/hats/zhat.mdl"})
	a.scale = 0.8

	New("partyhat", {name = "Party Hat", price = 750000, slot = SH_SLOT_HEAD, mdl = "models/gmod_tower/partyhat.mdl"})

	-- Eyes
	local a = New("sunglasses", {name = "Sunglasses", price = 750000, slot = SH_SLOT_EYES, mdl = "models/captainbigbutt/skeyler/accessories/glasses04.mdl"})
	a.scale = 0.8

	local a = New("iconr", {name = "Воздушный Единорог", price = 1000000, slot = SH_SLOT_BACK, mdl = "models/gmod_tower/balloonicorn_nojiggle.mdl"})
	a.scale = 0.8
	
	New("legohead", {name = "Лего", price = 1000000, slot = SH_SLOT_HEAD + SH_SLOT_EYES + SH_SLOT_MOUTH, mdl = "models/gmod_tower/legohead.mdl"})

	New("aviators", {name = "Aviators", price = 750000, slot = SH_SLOT_EYES, mdl = "models/gmod_tower/aviators.mdl"})
	New("shuttershades", {name = "Shutter Shades", price = 750000, slot = SH_SLOT_EYES, mdl = "models/captainbigbutt/skeyler/accessories/glasses03.mdl"})
	New("starglasses", {name = "Star Очки", price = 750000, slot = SH_SLOT_EYES, mdl = "models/gmod_tower/starglasses.mdl"})

	local a = New("3dglasses", {name = "3D Очки", price = 750000, slot = SH_SLOT_EYES, mdl = "models/gmod_tower/3dglasses.mdl"})
	a.scale = 1.1

	-- Whole head (Head + Eyes + Mouth)
	-- local a = New("deadmaus", {name = "Deadmau5 Hat", price = 750000, slot = SH_SLOT_HEAD + SH_SLOT_EYES + SH_SLOT_MOUTH, mdl = "models/captainbigbutt/skeyler/hats/deadmau5.mdl"})
	-- a.scale = 0.9

	-- Back
	New("fairywings", {name = "Fairy Wings", price = 750000, slot = SH_SLOT_BACK, mdl = "models/gmod_tower/fairywings.mdl"})


/*
	ADDON
	Horse Mask Prop
*/

if (SH_ACC.Addons["166177187"]) then
	-- Whole head (Head + Eyes + Mouth)
	local a = New("horsemask1", {name = "Horse Mask [Brown]", price = 750000, slot = SH_SLOT_HEAD + SH_SLOT_EYES + SH_SLOT_MOUTH, mdl = "models/horsie/horsiemask.mdl"})
	Copy("horsemask2", a, {name = "Horse Mask [Black]", skin = 1})
end

/*
	ADDON
	Alienware mask from PAYDAY 2
*/

if (SH_ACC.Addons["283483231"]) then
	-- Face (Eyes + Mouth)
	New("alienwaremask", {name = "Alienware Mask", price = 750000, slot = SH_SLOT_EYES + SH_SLOT_MOUTH, mdl = "models/snowzgmod/payday2/masks/maskalienware.mdl"})
end

/*
	ADDON
	Freddy Mask SWEP
*/

if (SH_ACC.Addons["383109137"]) then
	-- Whole head (Head + Eyes + Mouth)
	local a = New("freddymask", {name = "Freddy Mask", price = 750000, slot = SH_SLOT_HEAD + SH_SLOT_EYES + SH_SLOT_MOUTH, mdl = "models/errolliamp/five_nights_at_freddys/freddy_mask.mdl"})
	a.scale = 1.1
end

/*
	ADDON
	MGS V TPP Venom's Respirator
*/

if (SH_ACC.Addons["879182781"]) then
	-- Mouth
	New("respirator", {name = "Respirator", price = 750000, slot = SH_SLOT_MOUTH, mdl = "models/mgsv/gear/venom_respirator.mdl"})
end

/*
	ADDON
	Pirate Hat Model
*/

if (SH_ACC.Addons["351194925"]) then
	-- Hat
	New("piratehat", {name = "Pirate Hat", price = 750000, slot = SH_SLOT_HEAD, mdl = "models/piratehat/piratehat.mdl"})
end

/*
	ADDON
	Detective Hat Model
*/

if (SH_ACC.Addons["158276951"]) then
	-- Hat
	local a = New("detectivehat", {name = "Detective Hat", price = 750000, slot = SH_SLOT_HEAD, mdl = "models/ttt/deerstalker.mdl"})
	a.scale = 0.97
end

/*
	ADDON
	MGS V TPP Chicken Hat
*/

if (SH_ACC.Addons["879200645"]) then
	-- Hat
	New("chickenhat", {name = "Chicken Hat", price = 750000, slot = SH_SLOT_HEAD, mdl = "models/chicken_hat/chicken_hat.mdl"})
end

/*
	ADDON
	Polished Military Beret- FO3 HAT
*/

if (SH_ACC.Addons["158532239"]) then
	-- Hat
	local a = New("beret1", {name = "Beret [Red]", price = 750000, slot = SH_SLOT_HEAD, mdl = "models/fallout 3/polish_beret.mdl"})
	Copy("beret2", a, {name = "Beret [Black]", skin = 1})
	Copy("beret3", a, {name = "Beret [Green]", skin = 2})
end

/*
	ADDON
	Animal masks from PAYDAY 2
*/

if (SH_ACC.Addons["282958377"]) then
	-- Face (Eyes + Mouth)
	local a = New("pd2mask_arnold", {name = "Arnold Mask", price = 750000, slot = SH_SLOT_EYES + SH_SLOT_MOUTH, mdl = "models/snowzgmod/payday2/masks/maskarnold.mdl"})
	a.scale = 0.95
	local a = New("pd2mask_babyrhino", {name = "Baby Rhino Mask", price = 750000, slot = SH_SLOT_EYES + SH_SLOT_MOUTH, mdl = "models/snowzgmod/payday2/masks/maskbabyrhino.mdl"})
	a.scale = 0.95
	local a = New("pd2mask_chuck", {name = "Chuck Mask", price = 750000, slot = SH_SLOT_EYES + SH_SLOT_MOUTH, mdl = "models/snowzgmod/payday2/masks/maskchuck.mdl"})
	a.scale = 0.95
	local a = New("pd2mask_dolph", {name = "Dolph Mask", price = 750000, slot = SH_SLOT_EYES + SH_SLOT_MOUTH, mdl = "models/snowzgmod/payday2/masks/maskdolph.mdl"})
	a.scale = 0.95
	local a = New("pd2mask_jeanclaude", {name = "Jean-Claude Mask", price = 750000, slot = SH_SLOT_EYES + SH_SLOT_MOUTH, mdl = "models/snowzgmod/payday2/masks/maskjeanclaude.mdl"})
	a.scale = 0.95
	local a = New("pd2mask_mark", {name = "Mark Mask", price = 750000, slot = SH_SLOT_EYES + SH_SLOT_MOUTH, mdl = "models/snowzgmod/payday2/masks/maskmark.mdl"})
	a.scale = 0.95
	local a = New("pd2mask_monkeybusiness", {name = "Monkey Business Mask", price = 750000, slot = SH_SLOT_EYES + SH_SLOT_MOUTH, mdl = "models/snowzgmod/payday2/masks/maskmonkeybusiness.mdl"})
	a.scale = 0.95
	local a = New("pd2mask_thehog", {name = "The Hog Mask", price = 750000, slot = SH_SLOT_EYES + SH_SLOT_MOUTH, mdl = "models/snowzgmod/payday2/masks/maskthehog.mdl"})
	a.scale = 0.95
end

/*
	ADDON
	Wrench Mask
*/

if (SH_ACC.Addons["827404607"]) then
	-- Face (Eyes + Mouth)
	local a = New("wrenchmask", {name = "Wrench Mask", price = 750000, slot = SH_SLOT_EYES + SH_SLOT_MOUTH, mdl = "models/models/wrenchmask.mdl"})
	a.scale = 0.47
end

/*
	ADDON
	Russian hat/Ushanka prop
*/

if (SH_ACC.Addons["354739227"]) then
	-- Hat
	New("ushanka", {name = "Ushanka", price = 750000, slot = SH_SLOT_HEAD, mdl = "models/russianhat1.mdl"})
end

/*
	ADDON
	GTA IV Bike Helmets
*/

if (SH_ACC.Addons["551144079"]) then
	-- Hat
	local a = New("bikehelmet1", {name = "Bike Helmet [Black]", price = 750000, slot = SH_SLOT_HEAD, mdl = "models/dean/gtaiv/helmet.mdl"})
	Copy("bikehelmet2", a, {name = "Bike Helmet [Gray]", skin = 1})
	Copy("bikehelmet3", a, {name = "Bike Helmet [White]", skin = 2})
	Copy("bikehelmet4", a, {name = "Bike Helmet [Red]", skin = 3})
	Copy("bikehelmet5", a, {name = "Bike Helmet [Orange]", skin = 4})
	Copy("bikehelmet6", a, {name = "Bike Helmet [Yellow]", skin = 5})
	Copy("bikehelmet7", a, {name = "Bike Helmet [Green]", skin = 6})
	Copy("bikehelmet8", a, {name = "Bike Helmet [Blue]", skin = 7})
	Copy("bikehelmet9", a, {name = "Bike Helmet [Pink]", skin = 8})
	Copy("bikehelmet10", a, {name = "Bike Helmet [Rainbow]", skin = 9, price = 750000})
	Copy("bikehelmet11", a, {name = "Bike Helmet [Stars]", skin = 10, price = 750000})
	Copy("bikehelmet12", a, {name = "Bike Helmet [Gradient]", skin = 11, price = 750000})
	Copy("bikehelmet13", a, {name = "Bike Helmet [America]", skin = 12, price = 750000})
	Copy("bikehelmet14", a, {name = "Bike Helmet [Black Stripe]", skin = 13, price = 750000})
	Copy("bikehelmet15", a, {name = "Bike Helmet [White Stripe]", skin = 14, price = 750000})
end

/*
	ADDON
	Halloween_Pumpkin
*/

if (SH_ACC.Addons["826536617"]) then
	local a = New("pumpkinhat", {name = "Pumpkin Hat", price = 750000, slot = SH_SLOT_HEAD, mdl = "models/props/pumpkin_z.mdl"})
	a.scale = 0.5
end

/*
	CUSTOM ACCESSORIES
	Place your custom accessories under this!
*/

-- Only admins may buy this hat, and this hat will only render when their team name is "Admin On Duty"

--[[
local a = New("owlmask", {name = "Маска совы", price = 10000, slot = SH_SLOT_HEAD + SH_SLOT_EYES + SH_SLOT_MOUTH, mdl = "models/sal/owl.mdl"})
a.jobs = {
}
a.usergroups = {
["vip"] = true,
["moder"] = true,
["padmin"] = true,
["sponsor"] = true,
["t-admin"] = true,
["admin"] = true,
["superadmin"] = true,
}

local a = New("santapenguin", {name = "Санта-Пингвин", price = 5000, slot = SH_SLOT_HEAD + SH_SLOT_EYES + SH_SLOT_MOUTH, mdl = "models/sal/penguin.mdl"})
a.jobs = {
}
a.usergroups = {
["vip"] = true,
["moder"] = true,
["padmin"] = true,
["sponsor"] = true,
["t-admin"] = true,
["admin"] = true,
["superadmin"] = true,
}

local a = New("bearmask", {name = "Маска медведя", price = 10000, slot = SH_SLOT_HEAD + SH_SLOT_EYES + SH_SLOT_MOUTH, mdl = "models/sal/bear.mdl"})
a.jobs = {
}
a.usergroups = {
["vip"] = true,
["moder"] = true,
["padmin"] = true,
["sponsor"] = true,
["t-admin"] = true,
["admin"] = true,
["superadmin"] = true,
}

local a = New("wolfmask", {name = "Маска волка", price = 10000, slot = SH_SLOT_HEAD + SH_SLOT_EYES + SH_SLOT_MOUTH, mdl = "models/sal/wolf.mdl"})
a.jobs = {
}
a.usergroups = {
["vip"] = true,
["moder"] = true,
["padmin"] = true,
["sponsor"] = true,
["t-admin"] = true,
["admin"] = true,
["superadmin"] = true,
}
--]]