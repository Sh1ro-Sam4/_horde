-- Whenever you add a new model as an accessory, you NEED to register at least one offset (the "default" offset) which
-- will position your model on every player model. Without the "default" offset the add-on will throw an error and that's bad.
-- This is also where you position models manually for specific models. It can be very tedious to do so I recommend you
-- contact the author (http://steamcommunity.com/id/shendow/) before touching anything.

-- every little character counts
local B_HEAD = "ValveBiped.Bip01_Head1"
local B_SPINE2 = "ValveBiped.Bip01_Spine2"

local V = Vector
local A = Angle

function SH_ACC:GetOffset(mdl, ply)
	if (!self.Offsets[mdl]) then
		return false
	end

	return self.Offsets[mdl][ply:GetModel():lower()] or self.Offsets[mdl].default or false
end

function SH_ACC:GetModelOffset(bone, ply)
	local mdl = self.ModelOffsets[ply:GetModel():lower()]
	if (!mdl or !mdl[bone]) then
		return false
	end

	return mdl[bone]
end

function SH_ACC:DefineOffsetEasy(mdl, bone, pos, ang)
	self.Offsets[mdl] = {
		default = {
			bone = bone,
			pos = pos,
			ang = ang,
		}
	}
end

local function Offset(...)
	SH_ACC:DefineOffsetEasy(...)
end

/*
	PREDEFINED OFFSETS
*/

SH_ACC.Offsets = {}
Offset("models/santa/santa.mdl", B_HEAD, V(0.4, -0.5, 0), A(0, -70, -90))
Offset("models/captainbigbutt/skeyler/hats/pumpkin.mdl", B_HEAD, V(-1, 0.5, 0), A(0, -70, -90))
--
--2.0 ACCESSORY
--
--ponchik
Offset("models/noesis/donut.mdl", B_HEAD, V(6.2, -0.5, 0.2), A(0, -70, -90))
--hedkrab
Offset("models/nova/w_headcrab.mdl", B_HEAD, V(5.2, -1.5, 0), A(90, -90, -360))
--pedofil
Offset("models/nova/w_headgear.mdl", B_HEAD, V(-0.5, -2.5, -0.1), A(90, -90, -360))
--professor
Offset("models/player/items/humans/top_hat.mdl", B_HEAD, V(0, -2.5, -0.1), A(90, -90, -360))
--shkolnik
Offset("models/player/items/humans/graduation_cap.mdl", B_HEAD, V(0, 0.65, 0), A(90, -90, -90))
--trava
Offset("models/props/pi_fern.mdl", B_HEAD, V(5, 0.65, 0), A(90, -90, -90))
--snegovik
Offset("models/props/cs_office/snowman_face.mdl", B_HEAD, V(2, 2, -0.1), A(90, -90, -90))
--kepka
Offset("models/props/cs_office/snowman_hat.mdl", B_HEAD, V(6, 1.5, 0), A(90, -90, -90))
--shar
Offset("models/maxofs2d/hover_basic.mdl", B_HEAD, V(2.7, 1, -0.1), A(90, -90, -360))
--vasya
Offset("models/maxofs2d/balloon_gman.mdl", B_HEAD, V(-8, -0.65, 0.1), A(0, -90, -90))
--sveta
Offset("models/maxofs2d/balloon_mossman.mdl", B_HEAD, V(-8, 0.55, -0.1), A(0, -90, -90))
Offset("models/props_c17/tv_monitor01.mdl", B_HEAD, V(3, 0.55, -1.5), A(0, -90, -90))
--defender
Offset("models/maxofs2d/logo_gmod_b.mdl", B_SPINE2, V(4, 4, -0.1), A(0, -90, -90))
--lampa
Offset("models/props/de_inferno/ceiling_light.mdl", B_HEAD, V(4.5, 0, 0), A(0, -90, -270))
--kepka
Offset("models/props/de_tides/vending_hat.mdl", B_HEAD, V(4.2, 0.7, 0.15), A(90, -90, -90))
--cherepashka
Offset("models/props/de_tides/vending_turtle.mdl", B_HEAD, V(4.2, 0.25, 0.15), A(90, -90, -90))
--gitara
Offset("models/props_phx/misc/fender.mdl", B_SPINE2, V(9, 1, -4.15), A(30, 180, 270))
--jetpack
Offset("models/thrusters/jetpack.mdl", B_SPINE2, V(-1, 4, -0.5), A(0, 90, 90))
--GIB
Offset("models/gibs/scanner_gib05.mdl", B_HEAD, V(2, -1.5, -1.5), A(0, -90, -270))
--uebaka
Offset("models/props_phx/facepunch_logo.mdl", B_SPINE2, V(3, 4.5, 0), A(0, 180, 90))
--construct_sign
Offset("models/maxofs2d/construct_sign.mdl", B_SPINE2, V(3, 3.5, 0), A(0, -90, 270))
--шляпа-лампа
Offset("models/props_wasteland/prison_lamp001c.mdl", B_HEAD, V(9, 1.1, 0), A(0, -90, 270))
--znak1
Offset("models/props_c17/streetsign004e.mdl", B_SPINE2, V(3, 4, 0), A(0, 180, 0))
--znak2
Offset("models/props_c17/streetsign004f.mdl", B_SPINE2, V(3, 4, 0), A(0, 180, 0))
--krug
Offset("models/props/de_nuke/lifepreserver.mdl", "ValveBiped.Bip01_Neck1", V(1, 3, 0), A(0, 180, 0))
--uniqueacc
Offset("models/crow.mdl", B_SPINE2, V(0, -4, 0), A(0, 0, 90))

Offset("models/props_lab/huladoll.mdl", B_SPINE2, V(5.8, 5, 0), A(0, 90, 90))

-- ADDON: [GTA V] Giant Accessories Pack
Offset("models/modified/hat07.mdl", B_HEAD, V(4.8, -0.5, 0.2), A(0, -70, -90))
Offset("models/modified/hat08.mdl", B_HEAD, V(4.2, -0, 0.2), A(0, -80, -90))
Offset("models/sal/acc/fix/beerhat.mdl", B_HEAD, V(3, 0, 0.2), A(0, -75, -90))
Offset("models/modified/glasses01.mdl", B_HEAD, V(2, -0.1, 0.05), A(180, 110, 90))
Offset("models/modified/bandana.mdl", B_HEAD, V(-1.9, 1.5, 0), A(180, 110, 90))
Offset("models/modified/backpack_1.mdl", B_SPINE2, V(1.5, -4.2, 0), A(0, 80, 90))
Offset("models/modified/backpack_2.mdl", B_SPINE2, V(2, -4, 0), A(0, 80, 90))
Offset("models/modified/backpack_3.mdl", B_SPINE2, V(1.5, -4.2, 0), A(0, 80, 90))
Offset("models/sal/cat.mdl", B_HEAD, V(2, 0.5, 0), A(180, 110, 90))
Offset("models/sal/fox.mdl", B_HEAD, V(1.1, 0.5, 0), A(180, 110, 90))
Offset("models/sal/gingerbread.mdl", B_HEAD, V(0.5, 1, 0), A(180, 110, 90))
-- Offset("models/sal/acc/fix/scarf01.mdl", "ValveBiped.Bip01_Neck1", V(-18, 14, 0), A(180, 120, 90))
Offset("models/modified/headphones.mdl", B_HEAD, V(2.3, 0.8, 0), A(180, 110, 90))
Offset("models/sal/acc/fix/cheafhat.mdl", B_HEAD, V(7, 0, 0.4), A(180, 90, 90))
Offset("models/sal/halloween/bag.mdl", B_HEAD, V(0.5, 0.66, 0), A(180, 110, 90))
Offset("models/sal/halloween/doctor.mdl", B_HEAD, V(0, -0.1, 0.05), A(180, 110, 90))
Offset("models/sal/halloween/headwrap1.mdl", B_HEAD, V(0.6, 1.6, 0), A(180, 110, 90))
Offset("models/modified/hat01_fix.mdl", B_HEAD, V(4.4, -0.7, 0.2), A(0, -70, -90))
Offset("models/modified/hat03.mdl", B_HEAD, V(4.4, -0.7, 0), A(0, -60, -90))
Offset("models/modified/hat04.mdl", B_HEAD, V(4.2, -2.1, 0), A(0, -60, -90))
Offset("models/modified/hat06.mdl", B_HEAD, V(5.3, -1, 0), A(0, -80, -90))
Offset("models/modified/mask5.mdl", B_HEAD, V(0.5, 1.2, 0.05), A(180, 110, 90))
Offset("models/sal/hawk_1.mdl", B_HEAD, V(-1.5, 1, 0.2), A(180, 110, 90))
Offset("models/sal/pig.mdl", B_HEAD, V(0.1, 0.5, 0), A(180, 105, 90))
Offset("models/sal/wolf.mdl", B_HEAD, V(-1, 1, 0), A(180, 105, 90))
Offset("models/sal/acc/fix/mask_1.mdl", B_HEAD, V(-62.5, 17.7, 0), A(180, 105, 90))
Offset("models/sal/acc/fix/mask_4.mdl", B_HEAD, V(0.2, 1, 0.05), A(180, 110, 90))
Offset("models/sal/halloween/monkey.mdl", B_HEAD, V(0.2, 0.8, 0), A(180, 110, 90))
-- Offset("models/sal/halloween/ninja.mdl", B_HEAD, V(-0.3, 0.8, 0.1), A(180, 110, 90))

-- ADDON: GMod Tower: Accessories Pack
Offset("models/captainbigbutt/skeyler/accessories/glasses04.mdl", B_HEAD, V(2.5, 2.8, 0.05), A(180, 110, 90))
Offset("models/captainbigbutt/skeyler/hats/strawhat.mdl", B_HEAD, V(5.08, -0.37, 0), A(0, 108.00, 90))
Offset("models/gmod_tower/balloonicorn_nojiggle.mdl", B_SPINE2, V(3.26, 14.5, 0), A(90, 45, 135))
Offset("models/gmod_tower/legohead.mdl", B_HEAD, V(3.26, .6, 0), A(180, 98.26, 90))
Offset("models/gmod_tower/aviators.mdl", B_HEAD, V(3.26, 1.73, 0), A(180, 98.26, 90))
Offset("models/captainbigbutt/skeyler/hats/sunhat.mdl", B_HEAD, V(5.02, 2.44, 1.50), A(-40.60, 129.64, 90))
Offset("models/captainbigbutt/skeyler/accessories/glasses03.mdl", B_HEAD, V(2.68, 3.56, 0), A(180, 114.32, 90))
Offset("models/captainbigbutt/skeyler/hats/cowboyhat.mdl", B_HEAD, V(6.07, -0.73, 0), A(180, 113.41, 90))
Offset("models/gmod_tower/starglasses.mdl", B_HEAD, V(3.23, 2.50, 0), A(180, 100.50, 90))
Offset("models/gmod_tower/fairywings.mdl", B_SPINE2, V(0, -0.67, 0), A(-91.86, 0, 0))
Offset("models/captainbigbutt/skeyler/hats/cat_ears.mdl", B_HEAD, V(2.53, 0, 0), A(180, 90, 90))
Offset("models/gmod_tower/afro.mdl", "ValveBiped.Bip01_Head1", Vector(6, -1, 0), Angle(180, 90, 90))
Offset("models/captainbigbutt/skeyler/hats/cat_hat.mdl", "ValveBiped.Bip01_Head1", Vector(5.43, 0.36, 0), Angle(180, 90, 90))
Offset("models/captainbigbutt/skeyler/hats/deadmau5.mdl", "ValveBiped.Bip01_Head1", Vector(3.87, 0.705, 0), Angle(180, 90, 90))
Offset("models/captainbigbutt/skeyler/hats/bear_hat.mdl", "ValveBiped.Bip01_Head1", Vector(5.79, -0.189, 0), Angle(180, 99.9, 90))
Offset("models/captainbigbutt/skeyler/hats/frog_hat.mdl", "ValveBiped.Bip01_Head1", Vector(5.29, -0.6, 0), Angle(180, 99.9, 90))
Offset("models/captainbigbutt/skeyler/hats/maid_headband.mdl", "ValveBiped.Bip01_Head1", Vector(3.25, 0, 0), Angle(-180, 90, 90))
Offset("models/captainbigbutt/skeyler/hats/zhat.mdl", "ValveBiped.Bip01_Head1", Vector(3.97, -0.36, 0), Angle(161, 101, 101))
Offset("models/gmod_tower/3dglasses.mdl", "ValveBiped.Bip01_Head1", Vector(2.89, 1.8, 0), Angle(180, 103, 90))
Offset("models/gmod_tower/partyhat.mdl", "ValveBiped.Bip01_Head1", Vector(6.78, 0, 0.72), Angle(180, 101, 76.8))

-- ADDON: Horse Mask Prop
Offset("models/horsie/horsiemask.mdl", "ValveBiped.Bip01_Head1", Vector(3.52, 3.37, 0), Angle(-90, 0, -26.9))

-- ADDON: Alienware mask from PAYDAY 2
Offset("models/snowzgmod/payday2/masks/maskalienware.mdl", "ValveBiped.Bip01_Head1", Vector(2.66, 4.33, 0), Angle(0, -90, -90))

-- ADDON: Freddy Mask SWEP
Offset("models/errolliamp/five_nights_at_freddys/freddy_mask.mdl", "ValveBiped.Bip01_Head1", Vector(-2.19, 1.05, 0), Angle(-180, 77.7, 90))

-- ADDON: MGS V TPP Venom's Respirator
Offset("models/mgsv/gear/venom_respirator.mdl", "ValveBiped.Bip01_Head1", Vector(0.36, 2.88, 0), Angle(180, 116, 90))

-- ADDON: Pirate Hat Model
Offset("models/piratehat/piratehat.mdl", "ValveBiped.Bip01_Head1", Vector(3.59, 0.746, 0), Angle(0, 109, 90))

-- ADDON: Detective Hat Model
Offset("models/ttt/deerstalker.mdl", "ValveBiped.Bip01_Head1", Vector(-1.84, 0.364, 0), Angle(0, 3.62, 0))

-- ADDON: MGS V TPP Chicken Hat
Offset("models/chicken_hat/chicken_hat.mdl", "ValveBiped.Bip01_Head1", Vector(0, 0.72, 0), Angle(0, -71.8, -90))

-- ADDON: Polished Military Beret- FO3 HAT
Offset("models/fallout 3/polish_beret.mdl", "ValveBiped.Bip01_Head1", Vector(6.13, 1.77, 1.49), Angle(0, -90, -90))

-- ADDON: Animal masks from PAYDAY 2
Offset("models/snowzgmod/payday2/masks/maskarnold.mdl", "ValveBiped.Bip01_Head1", Vector(2.52, 3.97, 0), Angle(0, -90, -90))

-- ADDON: Wrench Mask
Offset("models/models/wrenchmask.mdl", "ValveBiped.Bip01_Head1", Vector(-1.37, 6.3, 0), Angle(0, -70.6, -90))

-- ADDON: Russian hat/Ushanka prop
Offset("models/russianhat1.mdl", "ValveBiped.Bip01_Head1", Vector(-6.12, -0.2, 0), Angle(180, -92.9, -90))

-- ADDON: GTA IV Bike Helmets
Offset("models/dean/gtaiv/helmet.mdl", "ValveBiped.Bip01_Head1", Vector(2.88, 0, 0), Angle(0, -90, -90))

-- ADDON: Halloween_Pumpkin
Offset("models/props/pumpkin_z.mdl", "ValveBiped.Bip01_Head1", Vector(3.98, 0, 0), Angle(0, -90, -90))

-- Offset copies
SH_ACC.Offsets["models/sal/bear.mdl"] = SH_ACC.Offsets["models/sal/cat.mdl"]
SH_ACC.Offsets["models/sal/owl.mdl"] = SH_ACC.Offsets["models/sal/fox.mdl"]
SH_ACC.Offsets["models/sal/penguin.mdl"] = SH_ACC.Offsets["models/sal/fox.mdl"]
SH_ACC.Offsets["models/sal/halloween/headwrap2.mdl"] = SH_ACC.Offsets["models/sal/halloween/headwrap1.mdl"]
SH_ACC.Offsets["models/modified/mask6.mdl"] = SH_ACC.Offsets["models/modified/mask5.mdl"]
SH_ACC.Offsets["models/sal/hawk_2.mdl"] = SH_ACC.Offsets["models/sal/hawk_1.mdl"]
SH_ACC.Offsets["models/sal/acc/fix/mask_2.mdl"] = SH_ACC.Offsets["models/modified/mask5.mdl"]
SH_ACC.Offsets["models/captainbigbutt/skeyler/hats/bunny_ears.mdl"] = SH_ACC.Offsets["models/captainbigbutt/skeyler/hats/cat_ears.mdl"]
SH_ACC.Offsets["models/captainbigbutt/skeyler/hats/heartband.mdl"] = SH_ACC.Offsets["models/captainbigbutt/skeyler/hats/maid_headband.mdl"]
SH_ACC.Offsets["models/captainbigbutt/skeyler/hats/starband.mdl"] = SH_ACC.Offsets["models/captainbigbutt/skeyler/hats/maid_headband.mdl"]
SH_ACC.Offsets["models/snowzgmod/payday2/masks/maskbabyrhino.mdl"] = SH_ACC.Offsets["models/snowzgmod/payday2/masks/maskarnold.mdl"]
SH_ACC.Offsets["models/snowzgmod/payday2/masks/maskchuck.mdl"] = SH_ACC.Offsets["models/snowzgmod/payday2/masks/maskarnold.mdl"]
SH_ACC.Offsets["models/snowzgmod/payday2/masks/maskdolph.mdl"] = SH_ACC.Offsets["models/snowzgmod/payday2/masks/maskarnold.mdl"]
SH_ACC.Offsets["models/snowzgmod/payday2/masks/maskjeanclaude.mdl"] = SH_ACC.Offsets["models/snowzgmod/payday2/masks/maskarnold.mdl"]
SH_ACC.Offsets["models/snowzgmod/payday2/masks/maskmark.mdl"] = SH_ACC.Offsets["models/snowzgmod/payday2/masks/maskarnold.mdl"]
SH_ACC.Offsets["models/snowzgmod/payday2/masks/maskmonkeybusiness.mdl"] = SH_ACC.Offsets["models/snowzgmod/payday2/masks/maskarnold.mdl"]
SH_ACC.Offsets["models/snowzgmod/payday2/masks/maskthehog.mdl"] = SH_ACC.Offsets["models/snowzgmod/payday2/masks/maskarnold.mdl"]

-- You shouldn't have to modify this.
-- These are model-specific bone offsets for when you have a model slightly different in a set of otherwise identical models
SH_ACC.ModelOffsets = {
	["models/player/breen.mdl"] = {
		[B_HEAD] = {
			pos = V(-1, 0.2, 0)
		},
	},
	["models/player/alyx.mdl"] = {
		[B_HEAD] = {
			pos = V(-0.8, -0.4, 0)
		},
	},
	["models/player/p2_chell.mdl"] = {
		[B_HEAD] = {
			pos = V(-0.8, -0.3, 0)
		},
	},
	["models/player/barney.mdl"] = {
		[B_HEAD] = {
			pos = V(-0.25, 0.2, 0)
		},
	},
	["models/player/monk.mdl"] = {
		[B_HEAD] = {
			pos = V(0.5, -0.5, 0)
		},
	},
	["models/player/gman_high.mdl"] = {
		[B_HEAD] = {
			pos = V(0.8, 0, 0)
		},
	},
	["models/player/odessa.mdl"] = {
		[B_HEAD] = {
			pos = V(-0.1, 0.65, 0)
		},
	},
	["models/player/mossman.mdl"] = {
		[B_HEAD] = {
			pos = V(-0.8, -0.2, 0)
		},
	},
	["models/player/eli.mdl"] = {
		[B_HEAD] = {
			pos = V(0, -0.5, 0)
		},
	},
	["models/player/charple.mdl"] = {
		[B_HEAD] = {
			pos = V(0, -1.5, 0)
		},
	},
	["models/player/soldier_stripped.mdl"] = {
		[B_HEAD] = {
			pos = V(-1.2, -1.2, 0)
		},
	},

	["models/player/group01/male_01.mdl"] = {
		[B_HEAD] = {
			pos = V(0, 0.85, 0)
		},
	},
	["models/player/group01/male_03.mdl"] = {
		[B_HEAD] = {
			pos = V(0.25, 0, 0)
		},
	},
	["models/player/group01/male_06.mdl"] = {
		[B_HEAD] = {
			pos = V(0.35, 1, 0)
		},
	},
	["models/player/group01/female_01.mdl"] = {
		[B_HEAD] = {
			pos = V(-1, 0.33, 0)
		},
		[B_SPINE2] = {
			pos = V(-2, 1, 0)
		},
	},
	["models/player/group01/female_02.mdl"] = {
		[B_HEAD] = {
			pos = V(-1, 0.5, 0)
		},
		[B_SPINE2] = {
			pos = V(-2, 1, 0)
		},
	},
	["models/player/group01/female_03.mdl"] = {
		[B_HEAD] = {
			pos = V(-1.1, 0.0, 0)
		},
		[B_SPINE2] = {
			pos = V(-2, 1, 0)
		},
	},
	["models/player/group01/female_04.mdl"] = {
		[B_HEAD] = {
			pos = V(-0.8, 0.5, 0)
		},
		[B_SPINE2] = {
			pos = V(-2, 1, 0)
		},
	},
}
SH_ACC.ModelOffsets["models/player/group01/male_04.mdl"] = SH_ACC.ModelOffsets["models/player/group01/male_03.mdl"]
SH_ACC.ModelOffsets["models/player/group01/female_05.mdl"] = SH_ACC.ModelOffsets["models/player/group01/female_03.mdl"]
SH_ACC.ModelOffsets["models/player/group01/female_06.mdl"] = SH_ACC.ModelOffsets["models/player/group01/female_01.mdl"]
SH_ACC.ModelOffsets["models/player/mossman_arctic.mdl"] = SH_ACC.ModelOffsets["models/player/mossman.mdl"]

/*
	CUSTOM OFFSETS
	Place your custom offsets here!
*/

Offset("models/player/items/humans/top_hat.mdl", B_HEAD, V(0, 1.43, 0), A(0, 113.47, 90))

-- Refresh the offsets
if (_FIRST_OFFSETS) then
	for _, v in ipairs (player.GetAll()) do
		if (v.SH_Accessories) then
			for id, cs in pairs (v.SH_Accessories) do
				local offset = SH_ACC:GetOffset(cs.m_sModel, v)
				cs.m_Offset = offset
			end
		end
	end
else
	_FIRST_OFFSETS = true
end