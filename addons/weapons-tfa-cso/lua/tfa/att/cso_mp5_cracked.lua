if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Cracked" -- skin name
ATTACHMENT.Description = { -- skin description
}
ATTACHMENT.Icon = "entities/att/cso_mp5_cracked.png" -- icon
ATTACHMENT.ShortName = "Cracked" -- short name that displayed inside the icon

ATTACHMENT.WeaponTable = {
	MaterialTable = { -- materials that are present on both view- and worldmodel
	[1] = "models/weapons/tfa_cso/paint/cso_mp5_cracked",
},
--	 MaterialTable_V = {
--	 [1] = "models/weapons/tfa_cso/ak47/ak47_paint1",
--	 }, -- separate table for viewmodel materials, overrides main table
--	 MaterialTable_W = {
--     [1] = "models/weapons/tfa_cso/ak47/ak47_paint1",	 
--	 }, -- separate table for worldmodel materials, overrides main table
}

local function resetMatCache(att, wep)
	wep.MaterialCached = false
end

ATTACHMENT.Attach = resetMatCache
ATTACHMENT.Detach = resetMatCache

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
