if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Snowflake" -- skin name
ATTACHMENT.Description = {
}
ATTACHMENT.Icon = "entities/att/cso_plasmagun_snowflake.png" -- icon
ATTACHMENT.ShortName = "Snowflake" -- short name that displayed inside the icon

ATTACHMENT.WeaponTable = {
	MaterialTable = { -- materials that are present on both view- and worldmodel
	[1] = "models/weapons/tfa_cso/paint/plasma_snowflake_v",
	[2] = "models/weapons/tfa_cso/paint/plasma_snowflake_v_alpha",
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
