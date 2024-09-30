if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Frostbreaker" -- skin name
ATTACHMENT.Description = {TFA.AttachmentColors["="],"This is a special variant of Blade Runebreaker Expert.", TFA.AttachmentColors["-"],"Runebreaker Expert Only"}
ATTACHMENT.Icon = "entities/att/cso_blade_frostbreaker.png" -- icon
ATTACHMENT.ShortName = "Frost" -- short name that displayed inside the icon

ATTACHMENT.WeaponTable = {
	 MaterialTable_V = {
	 [1] = "models/weapons/tfa_cso/paint/$20@001_frostblade_v01",
	 [2] = "models/weapons/tfa_cso/paint/$20@001_frostblade_v02",
	 [3] = "models/weapons/tfa_cso/rune_breaker/runeblade_ef01",
	 [4] = "models/weapons/tfa_cso/paint/$20@004_frostblade_v03",
	 [5] = "models/weapons/tfa_cso/paint/eye_ef01",
	 [6] = "models/weapons/tfa_cso/rune_breaker/laser01",
	 [7] = "models/weapons/tfa_cso/rune_breaker/runeblade_ef01",
	 [8] = "models/weapons/tfa_cso/rune_breaker/eye_ef03",
	 [9] = "models/weapons/tfa_cso/rune_breaker/runeblade_body02",
	 [10] = "models/weapons/tfa_cso/rune_breaker/runeblade_body01",
	 [11] = "models/weapons/tfa_cso/rune_breaker/eye_ef02",
	 }, -- separate table for viewmodel materials, overrides main table
	 MaterialTable_W = {
	 [1] = "models/weapons/tfa_cso/paint/$20@001_frostblade_v02",
	 [2] = "models/weapons/tfa_cso/paint/$20@001_frostblade_v01",
	 [3] = "models/weapons/tfa_cso/paint/$20@004_frostblade_v03",	 
	 }, -- separate table for worldmodel materials, overrides main table
}

local function resetMatCache(att, wep)
	wep.MaterialCached = false
end

ATTACHMENT.Attach = resetMatCache
ATTACHMENT.Detach = resetMatCache

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
