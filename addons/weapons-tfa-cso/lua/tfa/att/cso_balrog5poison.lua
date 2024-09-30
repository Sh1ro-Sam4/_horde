if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Poison" -- skin name
ATTACHMENT.Description = { -- skin description
}
ATTACHMENT.Icon = "entities/att/cso_balrog5poison.png" -- icon
ATTACHMENT.ShortName = "Poison" -- short name that displayed inside the icon

ATTACHMENT.WeaponTable = {
	MaterialTable = { -- materials that are present on both view- and worldmodel
	[1] = "models/weapons/tfa_cso/paint/balrog-1vpoison",
},
	["Primary"] = {
	["DamageType"] = bit.bor(DMG_BULLET,DMG_BLAST,DMG_POISON),
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
