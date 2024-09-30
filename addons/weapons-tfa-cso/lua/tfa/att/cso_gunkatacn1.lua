if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "CN1" -- skin name
ATTACHMENT.Description = { -- skin description
}
ATTACHMENT.Icon = "entities/att/cso_gunkatacn1.png" -- icon
ATTACHMENT.ShortName = "CN1" -- short name that displayed inside the icon

ATTACHMENT.WeaponTable = {
	MaterialTable = { -- materials that are present on both view- and worldmodel
	[1] = "models/weapons/tfa_cso/paint/@gunkatacn1_gunslinger_v",
	[2] = "models/weapons/tfa_cso/paint/@gunkatacn1_gunslinger_v_gold",
	[5] = "models/weapons/tfa_cso/paint/@gunkatacn1_gunslinger_trail",
	},
	["MuzzleFlashEffect"] = "cso_muz_des_m",
	["WElements"] = {
	["otherpist"] = {
	["materials"] = {
	[1] = "models/weapons/tfa_cso/paint/@gunkatacn1_gunslinger_v",
	[2] = "models/weapons/tfa_cso/paint/@gunkatacn1_gunslinger_v_gold",
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
