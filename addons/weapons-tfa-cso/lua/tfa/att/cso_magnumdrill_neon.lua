if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Neon" -- skin name
ATTACHMENT.Description = {
}
ATTACHMENT.Icon = "entities/att/cso_magnumdrill_neon.png" -- icon
ATTACHMENT.ShortName = "Neon" -- short name that displayed inside the icon

ATTACHMENT.WeaponTable = { -- run lua_run PrintTable(Entity(1):GetActiveWeapon():GetMaterials()) in console command to get where texture part are located
	MaterialTable = { -- materials that are present on both view- and worldmodel
	[1] = "models/weapons/tfa_cso/paint/sg_drill_neon_v",
	[4] = "models/weapons/tfa_cso/paint/drill_neon_v",
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
