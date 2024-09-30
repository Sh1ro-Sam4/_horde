if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Lunar" -- skin name
ATTACHMENT.Description = { -- skin description
}
ATTACHMENT.Icon = "entities/att/cso_mgsmlunar.png" -- icon
ATTACHMENT.ShortName = "Lunar" -- short name that displayed inside the icon

ATTACHMENT.WeaponTable = {
	MaterialTable = { -- materials that are present on both view- and worldmodel
	[2] = "models/weapons/tfa_cso/paint/mgsm01_lunar_v",
	[1] = "models/weapons/tfa_cso/paint/mgsm02_lunar_v",
	[3] = "models/weapons/tfa_cso/paint/$0b_mgsmeffectred_v",
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
