if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Battle" -- skin name
ATTACHMENT.Description = {TFA.AttachmentColors["+"],"+6 Damage", TFA.AttachmentColors["-"],"+2 Recoil", TFA.AttachmentColors["-"],"-1 Accuracy"}
ATTACHMENT.Icon = "entities/att/cso_glock18battle.png" -- icon
ATTACHMENT.ShortName = "Battle" -- short name that displayed inside the icon

ATTACHMENT.WeaponTable = {
	 MaterialTable_V = {
	 [1] = "models/weapons/tfa_cso/paint/bglock_v",
	 }, -- separate table for viewmodel materials, overrides main table
	 MaterialTable_W = {
     [1] = "models/weapons/tfa_cso/paint/bglock_p",	 
	 }, -- separate table for worldmodel materials, overrides main table
	["Primary"] = {
	["Damage"] = function(wep, stat) return stat +6 end,
	["Spread"] = function( wep, stat ) return stat +0.001 end,
	["KickDown"] = function(wep, stat) return stat +0.03 end,
	["KickHorizontal"] = function(wep, stat) return stat +0.003 end,
	}
}

local function resetMatCache(att, wep)
	wep.MaterialCached = false
end

ATTACHMENT.Attach = resetMatCache
ATTACHMENT.Detach = resetMatCache

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
