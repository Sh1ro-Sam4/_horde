if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Tech" -- skin name
ATTACHMENT.Description = {}
ATTACHMENT.Icon = "entities/att/cso_crowbar_tech.png" -- icon
ATTACHMENT.ShortName = "Tech" -- short name that displayed inside the icon

ATTACHMENT.WeaponTable = {
	MaterialTable_V = {
	[2] = "models/weapons/tfa_cso/paint/y23s1crowcraft_v",
},
	MaterialTable_W = {
	[1] = "models/weapons/tfa_cso/paint/y23s1crowcraft_v",
},
["Primary"] = {
	["Damage"] = function(wep, stat) return stat * 2 end,
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
