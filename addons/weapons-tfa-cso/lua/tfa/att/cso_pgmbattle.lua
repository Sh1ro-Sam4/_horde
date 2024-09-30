if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Battle" -- skin name
ATTACHMENT.Description = {TFA.AttachmentColors["+"], TFA.AttachmentColors["+"],"+3 Clip Size", "x2 Damage", TFA.AttachmentColors["+"],"-8 Speed Reduction"}
ATTACHMENT.Icon = "entities/att/cso_pgmbattle.png" -- icon
ATTACHMENT.ShortName = "Battle" -- short name that displayed inside the icon

ATTACHMENT.WeaponTable = {
	["MoveSpeed"] = function( wep, stat ) return stat / 0.9 end,
	MaterialTable = { -- materials that are present on both view- and worldmodel
	[1] = "models/weapons/tfa_cso/paint/pgmiultima_v",
	},
	["Primary"] = {
	["Damage"] = function(wep, stat) return stat +400 end,
    ["ClipSize"] = function( wep, val) return math.floor(val +3) end,
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
