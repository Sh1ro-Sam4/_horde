if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Tyrannosaurus" -- skin name
ATTACHMENT.Description = { -- skin description
}
ATTACHMENT.Icon = "entities/att/cso_sgmissiletyrannosaurus.png" -- icon
ATTACHMENT.ShortName = "Tyrannosaurus" -- short name that displayed inside the icon

ATTACHMENT.WeaponTable = {
	MaterialTable_V = {
	[3] = "models/weapons/tfa_cso/paint/battleship00_01_tyrannosaurus_v",
	[10] = "models/weapons/tfa_cso/paint/battleship00_01_tyrannosaurus_v",
	[9] = "models/weapons/tfa_cso/paint/battleship01_01_tyrannosaurus_v",
},
	MaterialTable_W = {
	[3] = "models/weapons/tfa_cso/paint/battleship00_01_tyrannosaurus_v",
	[2] = "models/weapons/tfa_cso/paint/battleship01_01_tyrannosaurus_v",
	[1] = "models/weapons/tfa_cso/paint/battleship01_01_tyrannosaurus_v",
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
