if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "KR1" -- skin name
ATTACHMENT.Description = { -- skin description
}
ATTACHMENT.Icon = "entities/att/cso_gunkatakr1.png" -- icon
ATTACHMENT.ShortName = "KR1" -- short name that displayed inside the icon

ATTACHMENT.WeaponTable = {
	MaterialTable = { -- materials that are present on both view- and worldmodel
	[1] = "models/weapons/tfa_cso/paint/$20@004gunslingerkr1_v",
	[2] = "models/weapons/tfa_cso/paint/$20@004gunslingerkr1_v_gold",
	[5] = "models/weapons/tfa_cso/paint/$20@004gunslingerkr1_trail",
	},
	["MuzzleFlashEffect"] = "cso_muz_des_wm",
	["WElements"] = {
	["otherpist"] = {
	["materials"] = {
	[1] = "models/weapons/tfa_cso/paint/$20@004gunslingerkr1_v",
	[2] = "models/weapons/tfa_cso/paint/$20@004gunslingerkr1_v_gold",
	}
	},
	},
}

local function resetMatCache(att, wep)
	wep.MaterialCached = false
end

ATTACHMENT.Attach = resetMatCache
ATTACHMENT.Detach = resetMatCache

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
