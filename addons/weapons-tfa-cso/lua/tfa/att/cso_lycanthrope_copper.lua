if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Copper" -- skin name
ATTACHMENT.Description = { -- skin description
}
ATTACHMENT.Icon = "entities/att/cso_lycanthrope_copper.png" -- icon
ATTACHMENT.ShortName = "Copper" -- short name that displayed inside the icon

ATTACHMENT.WeaponTable = {
	MaterialTable_V = {
	[1] = "models/weapons/tfa_cso/paint/$20@004_buffsg552y21s3_01",
	[2] = "models/weapons/tfa_cso/paint/$20@004_buffsg552y21s3_02",
	[3] = "models/weapons/tfa_cso/paint/$20@004_moony21s3",
},
	MaterialTable_W = {
	[9] = "models/weapons/tfa_cso/paint/$20@004_buffsg552y21s3_01",
	[8] = "models/weapons/tfa_cso/paint/$20@004_buffsg552y21s3_02",
	[4] = "models/weapons/tfa_cso/paint/$20@004_moony21s3",
},
	["MuzzleFlashEffect"] = "cso_muz_cerberus",
	["TracerName"] = "cso_tra_cerberus",
}

local function resetMatCache(att, wep)
	wep.MaterialCached = false
end

ATTACHMENT.Attach = resetMatCache
ATTACHMENT.Detach = resetMatCache

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
