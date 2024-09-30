if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Kingdom Musket" -- skin name
ATTACHMENT.Description = {TFA.AttachmentColors["+"],"x2 Damage"}
ATTACHMENT.Icon = "entities/att/cso_musket_kingdom.png" -- icon
ATTACHMENT.ShortName = "Kingdom" -- short name that displayed inside the icon

ATTACHMENT.WeaponTable = {
	MaterialTable = { -- materials that are present on both view- and worldmodel
	[1] = "models/weapons/tfa_cso/paint/musket_kingdom",
},
	["Primary"] = {
	["Damage"] = function(wep, stat) return stat * 2 end,
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
