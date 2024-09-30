if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Lizard" -- skin name
ATTACHMENT.Description = {
}
ATTACHMENT.Icon = "entities/att/cso_stormgiantlizard.png" -- icon
ATTACHMENT.ShortName = "Lizard" -- short name that displayed inside the icon

ATTACHMENT.WeaponTable = {
	MaterialTable_V = { -- materials that are present on both view- and worldmodel
	[1] = "models/weapons/tfa_cso/paint/$20@003_sg_2_lizard",
	[2] = "models/weapons/tfa_cso/paint/$20@003_sg_2_lizard",
	[3] = "models/weapons/tfa_cso/paint/$20@001_sg_1_lizard",
	},
	MaterialTable_W = { -- materials that are present on both view- and worldmodel
	[2] = "models/weapons/tfa_cso/paint/$20@001_sg_1_lizard",
	[3] = "models/weapons/tfa_cso/paint/$20@003_sg_2_lizard",
	[4] = "models/weapons/tfa_cso/paint/$20@001_sg_1_lizard",
	[6] = "models/weapons/tfa_cso/paint/$20@003_sg_2_lizard",
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
