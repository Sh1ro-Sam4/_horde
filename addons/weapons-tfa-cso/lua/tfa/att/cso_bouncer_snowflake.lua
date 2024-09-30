if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Snowflake" -- skin name
ATTACHMENT.Description = {
}
ATTACHMENT.Icon = "entities/att/cso_bouncer_snowflake.png" -- icon
ATTACHMENT.ShortName = "Snowflake" -- short name that displayed inside the icon

ATTACHMENT.WeaponTable = {
	MaterialTable = { -- materials that are present on both view- and worldmodel
	[2] = "models/weapons/tfa_cso/paint/bouncer_snowflake_v",
	},
	 --MaterialTable_V = {
	 --[1] = "models/weapons/tfa_cso/paint/ak47_eagle",
	 --}, -- separate table for viewmodel materials, overrides main table
	 --MaterialTable_W = {
     --[1] = "models/weapons/tfa_cso/paint/ak47_eagle",	 
	 --}, -- separate table for worldmodel materials, overrides main table
}

local function resetMatCache(att, wep)
	wep.MaterialCached = false
end

ATTACHMENT.Attach = resetMatCache
ATTACHMENT.Detach = resetMatCache

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end