if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Tech" -- skin name
ATTACHMENT.Description = {TFA.AttachmentColors["+"],"x1.5 Damage","x2 Rate of Fire","+2 Clip"}
ATTACHMENT.Icon = "entities/att/cso_dartpistol_tech.png" -- icon
ATTACHMENT.ShortName = "Tech" -- short name that displayed inside the icon

ATTACHMENT.WeaponTable = {
	MaterialTable = { -- materials that are present on both view- and worldmodel
	[1] = "models/weapons/tfa_cso/paint/y23s1dartpistol_v",
	[2] = "models/weapons/tfa_cso/paint/y23s1dart",
	},
	["Primary"] = {
	["Damage"] = function(wep, stat) return stat * 1.5 end,
	["ClipSize"] = function( wep, val) return math.floor(val +2) end,
	["RPM"] = function( wep, val) return math.floor(val +75) end,
	["ImpactEffect"] = "exp_dartpistol",
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
