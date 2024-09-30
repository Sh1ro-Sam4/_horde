if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Black Neon" -- skin name
ATTACHMENT.Description = {}
ATTACHMENT.Icon = "entities/att/cso_speargunblackneon.png" -- icon
ATTACHMENT.ShortName = "Black Neon" -- short name that displayed inside the icon

ATTACHMENT.WeaponTable = {
	MaterialTable_V = {
	[1] = "models/weapons/tfa_cso/paint/speargun_blackneon_v",
	},
	MaterialTable_W = {
	[1] = "models/weapons/tfa_cso/paint/256256speargun_blackneon_p",
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
