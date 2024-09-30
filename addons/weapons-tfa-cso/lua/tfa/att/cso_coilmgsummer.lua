if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Summer Splash" -- skin name
ATTACHMENT.Description = {TFA.AttachmentColors["+"],"x2 Primary Damage"}
ATTACHMENT.Icon = "entities/att/cso_coilmgsummer.png" -- icon
ATTACHMENT.ShortName = "Splash" -- short name that displayed inside the icon

ATTACHMENT.WeaponTable = {
	MaterialTable = { -- materials that are present on both view- and worldmodel
	[2] = "models/weapons/tfa_cso/paint/y19s3coilmg_v",
},
	["Primary"] = {
	["Damage"] = function(wep, stat) return stat * 2 end,
    ["Sound"] = "CoilMG_Summer.Fire"
	},
	["MuzzleFlashEffect"] = "cso_muz_wg",
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
