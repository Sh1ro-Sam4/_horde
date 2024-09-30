if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Black Neon" -- skin name
ATTACHMENT.Description = {}
ATTACHMENT.Icon = "entities/att/cso_m2blackneon.png" -- icon
ATTACHMENT.ShortName = "Black Neon" -- short name that displayed inside the icon

ATTACHMENT.WeaponTable = {
	MaterialTable = {
	[1] = "models/weapons/tfa_cso/paint/m2_blackneon_v",
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
