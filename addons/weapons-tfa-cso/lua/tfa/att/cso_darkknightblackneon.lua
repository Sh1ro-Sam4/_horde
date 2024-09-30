if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Black Neon" -- skin name
ATTACHMENT.Description = {}
ATTACHMENT.Icon = "entities/att/cso_darkknightblackneon.png" -- icon
ATTACHMENT.ShortName = "Black Neon" -- short name that displayed inside the icon

ATTACHMENT.WeaponTable = {
	MaterialTable_V = {
	[1] = "models/weapons/tfa_cso/paint/$20@003_m4a1b1_blackneon",
	[2] = "models/weapons/tfa_cso/paint/$20@003_m4a1b2_blackneon",
	},
	MaterialTable_W = {
	[2] = "models/weapons/tfa_cso/paint/$20@003_m4a1b1_blackneon",
	[3] = "models/weapons/tfa_cso/paint/$20@003_m4a1b2_blackneon",
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
