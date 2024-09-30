if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Metallic" -- skin name
ATTACHMENT.Description = { -- skin description
}
ATTACHMENT.Icon = "entities/att/cso_awppaintiron.png" -- icon
ATTACHMENT.ShortName = "Metallic" -- short name that displayed inside the icon

ATTACHMENT.WeaponTable = {
	--MaterialTable = { -- materials that are present on both view- and worldmodel
		--[1] = "models/weapons/tfa_cso/skull_5/skull-vmodel",
	--},
	 MaterialTable_V = {
	 [1] = "models/weapons/tfa_cso/paint/awp_paintiron",
	 }, -- separate table for viewmodel materials, overrides main table
	 MaterialTable_W = {
     [1] = "models/weapons/tfa_cso/paint/awp_paintiron",	 
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
