if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Tricera" -- skin name
ATTACHMENT.Description = { -- skin description
}
ATTACHMENT.Icon = "entities/att/cso_charger5tricera.png" -- icon
ATTACHMENT.ShortName = "Tricera" -- short name that displayed inside the icon

ATTACHMENT.WeaponTable = {
	MaterialTable_V = {
	[2] = "models/weapons/tfa_cso/paint/charger5_tricera_v",
},
	MaterialTable_W = {
	[1] = "models/weapons/tfa_cso/paint/charger5_tricera_v",
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
