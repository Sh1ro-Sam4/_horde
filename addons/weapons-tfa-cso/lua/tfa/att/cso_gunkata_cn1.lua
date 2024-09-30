if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "CN1" -- skin name
ATTACHMENT.Description = { -- skin description
}
ATTACHMENT.Icon = "entities/att/cso_gunkata_cn1.png" -- icon
ATTACHMENT.ShortName = "NA1" -- short name that displayed inside the icon

ATTACHMENT.WeaponTable = { -- run lua_run PrintTable(Entity(1):GetActiveWeapon():GetMaterials()) in console command to get where texture part are located
	 MaterialTable_V = {
	 [1] = "models/weapons/tfa_cso/paint/gunkata_cn1/@gunkatacn1_gunslinger_v",
	 [2] = "models/weapons/tfa_cso/paint/gunkata_cn1/@gunkatacn1_gunslinger_v_gold",
	 [3] = "models/weapons/tfa_cso/paint/gunkata_cn1/$0b_gunkatafx01",
	 [4] = "models/weapons/tfa_cso/paint/gunkata_cn1/$0b_gunkatafx02",
	 [5] = "models/weapons/tfa_cso/paint/gunkata_cn1/@gunkatacn1_gunslinger_trail",
	 }, -- separate table for viewmodel materials, overrides main table
	  MaterialTable_W = {
	 [1] = "models/weapons/tfa_cso/paint/gunkata_cn1/@gunkatacn1_gunslinger_v",
	 [2] = "models/weapons/tfa_cso/paint/gunkata_cn1/@gunkatacn1_gunslinger_v_gold",
	 }, -- separate table for worldmodel materials, overrides main table
	 
	["WElements"] = {
    ["other_gunslinger"] = {
    ["materials"] = {
	 [1] = "models/weapons/tfa_cso/paint/gunkata_cn1/@gunkatacn1_gunslinger_v",
	 [2] = "models/weapons/tfa_cso/paint/gunkata_cn1/@gunkatacn1_gunslinger_v_gold",
	}
	},
	},
	["MuzzleFlashEffect"] = "muz_gunkata_cn1",
}

local function resetMatCache(att, wep)
	wep.MaterialCached = false
end

ATTACHMENT.Attach = resetMatCache
ATTACHMENT.Detach = resetMatCache

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
