if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Plastic Model" -- skin name
ATTACHMENT.Description = { -- skin description
}
ATTACHMENT.Icon = "entities/att/cso_destroyer_plastic.png" -- icon
ATTACHMENT.ShortName = "Plastic" -- short name that displayed inside the icon

ATTACHMENT.WeaponTable = {
	--MaterialTable = { -- materials that are present on both view- and worldmodel
	--[2] = "models/weapons/tfa_cso/paint/destroyer_plastic",
	--},
	 MaterialTable_V = {
	 [2] = "models/weapons/tfa_cso/paint/destroyer_plastic",
	 }, -- separate table for viewmodel materials, overrides main table
	 MaterialTable_W = {
     [1] = "models/weapons/tfa_cso/paint/destroyer_plastic",	 
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
