if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Tricera" -- skin name
ATTACHMENT.Description = { -- skin description
}
ATTACHMENT.Icon = "entities/att/cso_m249phoenixtricera.png" -- icon
ATTACHMENT.ShortName = "Tricera" -- short name that displayed inside the icon

ATTACHMENT.WeaponTable = {
	MaterialTable_V = {
	[1] = "models/weapons/tfa_cso/paint/$20@004buff_m249_tricera_1_v",
	[6] = "models/weapons/tfa_cso/paint/buff_m249_2_tricera_v",
},
	MaterialTable_W = {
	[1] = "models/weapons/tfa_cso/paint/$20@004buff_m249_tricera_1_v",
	[3] = "models/weapons/tfa_cso/paint/buff_m249_2_tricera_v",
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
