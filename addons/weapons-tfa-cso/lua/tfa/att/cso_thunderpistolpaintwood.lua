if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Wood" -- skin name
ATTACHMENT.Description = { -- skin description
}
ATTACHMENT.Icon = "entities/att/cso_thunderpistolpaintwood.png" -- icon
ATTACHMENT.ShortName = "Wood" -- short name that displayed inside the icon

ATTACHMENT.WeaponTable = {
	 MaterialTable_V = {
	 [1] = "models/weapons/tfa_cso/paint/$20@003thundergun_2_paintwood",
	 [2] = "models/weapons/tfa_cso/paint/$20@004thundergun_1_paintwood",
	 }, -- separate table for viewmodel materials, overrides main table
	 MaterialTable_W = {
	 [1] = "models/weapons/tfa_cso/paint/$20@003thundergun_2_paintwood",
	 [4] = "models/weapons/tfa_cso/paint/$20@004thundergun_1_paintwood",	 
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
