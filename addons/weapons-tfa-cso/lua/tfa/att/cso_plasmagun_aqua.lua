if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Aqua" -- skin name
ATTACHMENT.Description = { -- skin description
}
ATTACHMENT.Icon = "entities/att/cso_plasmagun_aqua.png" -- icon
ATTACHMENT.ShortName = "Aqua" -- short name that displayed inside the icon

ATTACHMENT.WeaponTable = {
--MaterialTable = { -- materials that are present on both view- and worldmodel
--	[1] = "models/weapons/tfa_cso/plasma_gun/plasma_aqua",
--},
	MaterialTable_V = {
	[1] = "models/weapons/tfa_cso/paint/plasma_aqua",
	}, -- separate table for viewmodel materials, overrides main table
	MaterialTable_W = {
	[2] = "models/weapons/tfa_cso/paint/plasma_aqua",	 
	}, -- separate table for worldmodel materials, overrides main table
}

local function resetMatCache(att, wep)
	wep.MaterialCached = false
end

ATTACHMENT.Attach = resetMatCache
ATTACHMENT.Detach = resetMatCache

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
