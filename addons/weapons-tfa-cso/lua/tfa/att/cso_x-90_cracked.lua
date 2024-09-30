if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Cracked" -- skin name
ATTACHMENT.Description = { -- skin description
}
ATTACHMENT.Icon = "entities/att/cso_x-90_cracked.png" -- icon
ATTACHMENT.ShortName = "Cracked" -- short name that displayed inside the icon

ATTACHMENT.WeaponTable = {
	--MaterialTable = { -- materials that are present on both view- and worldmodel
		--[1] = "models/weapons/tfa_cso/skull_5/skull-vmodel",
	--},
	 MaterialTable_V = {
	 [1] = "models/weapons/tfa_cso/paint/argus3_cracked_v",
	 }, -- separate table for viewmodel materials, overrides main table
	 MaterialTable_W = {
     [3] = "models/weapons/tfa_cso/paint/argus3_cracked_v",	 
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