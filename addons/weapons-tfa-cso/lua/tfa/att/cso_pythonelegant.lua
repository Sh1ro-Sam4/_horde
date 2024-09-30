if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Elegant" -- skin name
ATTACHMENT.Description = {TFA.AttachmentColors["+"],"x2 Damage"}
ATTACHMENT.Icon = "entities/att/cso_pythonelegant.png" -- icon
ATTACHMENT.ShortName = "Elegant" -- short name that displayed inside the icon

ATTACHMENT.WeaponTable = {
	MaterialTable = { -- materials that are present on both view- and worldmodel
	[1] = "models/weapons/tfa_cso/paint/python_elegant",
	},
	["Primary"] = {
	["Damage"] = function(wep, stat) return stat * 2 end,
	}
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
