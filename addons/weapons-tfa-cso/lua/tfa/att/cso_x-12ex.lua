if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Scorching Auto-Shotgun" -- skin name
ATTACHMENT.Description = {TFA.AttachmentColors["="],"Customized version of Hunter-Killer X-12.", TFA.AttachmentColors["+"],"x1.5 Damage", TFA.AttachmentColors["+"],"Burning Damage"}
ATTACHMENT.Icon = "entities/att/cso_x-12ex.png" -- icon
ATTACHMENT.ShortName = "Incendiary" -- short name that displayed inside the icon

ATTACHMENT.WeaponTable = {
	MaterialTable = { -- materials that are present on both view- and worldmodel
	[1] = "models/weapons/tfa_cso/paint/argus12ex_v",
},
	["Primary"] = {
	["Damage"] = function(wep, stat) return stat * 1.5 end,
	["DamageType"] = bit.bor(DMG_BULLET,DMG_BURN),
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
