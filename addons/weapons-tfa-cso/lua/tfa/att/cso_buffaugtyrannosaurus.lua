if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Tyrannosaurus" -- skin name
ATTACHMENT.Description = {
}
ATTACHMENT.Icon = "entities/att/cso_buffaugtyrannosaurus.png" -- icon
ATTACHMENT.ShortName = "Tyrannosaurus" -- short name that displayed inside the icon

ATTACHMENT.WeaponTable = {
	MaterialTable_V = {
	[1] = "models/weapons/tfa_cso/paint/$20@004buffaug01_tyrannosaurus_v",
	[2] = "models/weapons/tfa_cso/paint/$20@004buffaug02_tyrannosaurus_v",
	},
	MaterialTable_W = {
	[2] = "models/weapons/tfa_cso/paint/$20@004buffaug01_tyrannosaurus_v",
	[1] = "models/weapons/tfa_cso/paint/$20@004buffaug02_tyrannosaurus_v",
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
