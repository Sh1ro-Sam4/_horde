if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Metallic" -- skin name
ATTACHMENT.Description = { -- skin description
}
ATTACHMENT.Icon = "entities/att/cso_m95tigerpaintiron.png" -- icon
ATTACHMENT.ShortName = "Metallic" -- short name that displayed inside the icon

ATTACHMENT.WeaponTable = {
	["MuzzleFlashEffect"] = "cso_muz_m95tigeriron",
	["TracerName"] = "cso_tra_m95tigeriron",
	 MaterialTable_V = {
	 [2] = "models/weapons/tfa_cso/paint/$20m95tiger_02_paintiron",
	 [4] = "models/weapons/tfa_cso/paint/$20@004m95tiger_01_paintiron",
	 [5] = "models/weapons/tfa_cso/paint/$20@003m95tiger_03_paintiron",
	 }, -- separate table for viewmodel materials, overrides main table
	 MaterialTable_W = {
	[1] = "models/weapons/tfa_cso/paint/$20@004m95tiger_01_paintiron",
	[2] = "models/weapons/tfa_cso/paint/$20@003m95tiger_03_paintiron", 
	[4] = "models/weapons/tfa_cso/paint/$20m95tiger_02_paintiron",
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
