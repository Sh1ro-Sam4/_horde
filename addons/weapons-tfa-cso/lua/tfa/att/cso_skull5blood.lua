if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Blood" -- skin name
ATTACHMENT.Description = { -- skin description
}
ATTACHMENT.Icon = "entities/att/cso_skull5blood.png" -- icon
ATTACHMENT.ShortName = "Blood" -- short name that displayed inside the icon

ATTACHMENT.WeaponTable = {
	--MaterialTable = { -- materials that are present on both view- and worldmodel
		--[1] = "models/weapons/tfa_cso/skull_5/skull-vmodel",
	--},
	 MaterialTable_V = {
	 [1] = "models/weapons/tfa_cso/paint/skull-vblood",
	 }, -- separate table for viewmodel materials, overrides main table
	 MaterialTable_W = {
     [1] = "models/weapons/tfa_cso/paint/skullblood-pmodel",	 
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
