if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Metallic" -- skin name
ATTACHMENT.Description = { -- skin description
}
ATTACHMENT.Icon = "entities/att/cso_xtrackerpaintiron.png" -- icon
ATTACHMENT.ShortName = "Metallic" -- short name that displayed inside the icon

ATTACHMENT.WeaponTable = {
	 MaterialTable_V = {
	 [1] = "models/weapons/tfa_cso/paint/lockongun_paintiron01",
	 [2] = "models/weapons/tfa_cso/paint/lockongun_paintiron02",
	 }, -- separate table for viewmodel materials, overrides main table
	 MaterialTable_W = {
	 [3] = "models/weapons/tfa_cso/paint/lockongun_paintiron02",
	 [4] = "models/weapons/tfa_cso/paint/lockongun_paintiron01", 
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
