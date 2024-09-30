if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Battle" -- skin name
ATTACHMENT.Description = {TFA.AttachmentColors["+"],"+5 Damage", TFA.AttachmentColors["-"],"+5 Recoil", TFA.AttachmentColors["-"],"-5 Accuracy"}
ATTACHMENT.Icon = "entities/att/cso_mp5battle.png" -- icon
ATTACHMENT.ShortName = "Battle" -- short name that displayed inside the icon

ATTACHMENT.WeaponTable = {
	MaterialTable = { -- materials that are present on both view- and worldmodel
	[1] = "models/weapons/tfa_cso/paint/bmp5_v",
	},
	["Primary"] = {
	["Damage"] = function(wep, stat) return stat +5 end,
	["Spread"] = function( wep, stat ) return stat +0.0006 end,
	["IronAccuracy"] = function( wep, stat ) return stat +0.0003 end,
	["KickDown"] = function(wep, stat) return stat +0.025 end,
	["KickHorizontal"] = function(wep, stat) return stat +0.025 end,
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
