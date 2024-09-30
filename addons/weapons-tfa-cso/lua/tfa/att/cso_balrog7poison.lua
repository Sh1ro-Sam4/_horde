if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Poison" -- skin name
ATTACHMENT.Description = { -- skin description
}
ATTACHMENT.Icon = "entities/att/cso_balrog7poison.png" -- icon
ATTACHMENT.ShortName = "Poison" -- short name that displayed inside the icon

ATTACHMENT.WeaponTable = {
	--MaterialTable = { -- materials that are present on both view- and worldmodel
		--[1] = "models/weapons/tfa_cso/skull_5/skull-vmodel",
	--},
	 MaterialTable_V = {
	 [1] = "models/weapons/tfa_cso/paint/balrog-7_vpoison",
	 [3] = "models/weapons/tfa_cso/paint/balrog-7_scopepoison",
	 }, -- separate table for viewmodel materials, overrides main table
	 MaterialTable_W = {
     [1] = "models/weapons/tfa_cso/paint/balrog-7poison_p",	 
	 }, -- separate table for worldmodel materials, overrides main table
	["Primary"] = {
	["DamageType"] = bit.bor(DMG_BULLET,DMG_BLAST,DMG_POISON),
	},
}

local function resetMatCache(att, wep)
	wep.MaterialCached = false
end

ATTACHMENT.Attach = resetMatCache
ATTACHMENT.Detach = resetMatCache

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
