if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Summer Splash" -- skin name
ATTACHMENT.Description = { -- skin description
}
ATTACHMENT.Icon = "entities/att/cso_m200summer.png" -- icon
ATTACHMENT.ShortName = "Splash" -- short name that displayed inside the icon

ATTACHMENT.WeaponTable = {
	--MaterialTable = { -- materials that are present on both view- and worldmodel
		--[1] = "models/weapons/tfa_cso/skull_5/skull-vmodel",
	--},
	 MaterialTable_V = {
	 [1] = "models/weapons/tfa_cso/paint/408_Cheyenne_512_splash",
	 }, -- separate table for viewmodel materials, overrides main table
	["Primary"] = {
    ["Sound"] = "M200_Summer.Fire"
	},
	["MuzzleFlashEffect"] = "cso_muz_brick_piece",
	 MaterialTable_W = {
     [1] = "models/weapons/tfa_cso/paint/#256256y19s3m200_splash_p",	 
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
