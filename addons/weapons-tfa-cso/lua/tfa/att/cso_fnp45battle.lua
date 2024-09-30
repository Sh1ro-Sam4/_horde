if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Battle" -- skin name
ATTACHMENT.Description = {TFA.AttachmentColors["+"],"+1 Damage", TFA.AttachmentColors["+"],"+1 Accuracy", TFA.AttachmentColors["+"],"-3 Recoil"}
ATTACHMENT.Icon = "entities/att/cso_fnp45battle.png" -- icon
ATTACHMENT.ShortName = "Battle" -- short name that displayed inside the icon

ATTACHMENT.WeaponTable = {
	MaterialTable = { -- materials that are present on both view- and worldmodel
	[1] = "models/weapons/tfa_cso/paint/bfnp45_v",
	},
	["Primary"] = {
	["Damage"] = function(wep, stat) return stat +1 end,
	["Spread"] = function( wep, stat ) return stat -0.0005 end,
	["KickUp"] = function(wep, stat) return stat -0.02 end,
	["KickDown"] = function(wep, stat) return stat -0.005 end,
	["KickHorizontal"] = function(wep, stat) return stat -0.02 end,
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
