if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Trans-Gear" -- skin name
ATTACHMENT.Description = {TFA.AttachmentColors["+"],"x2 Damage", TFA.AttachmentColors["+"],"+5 Clip Size "}
ATTACHMENT.Icon = "entities/att/cso_usas12transgear.png" -- icon
ATTACHMENT.ShortName = "Trans" -- short name that displayed inside the icon

ATTACHMENT.WeaponTable = {
MaterialTable = { -- materials that are present on both view- and worldmodel
	[1] = "models/weapons/tfa_cso/paint/usas12_transgear",
},
	["Primary"] = {
	["Damage"] = function(wep, stat) return stat * 2 end,
    ["ClipSize"] = function( wep, val) return math.floor(val +5) end,
	},
	--MaterialTable_V = {
	--[1] = "models/weapons/tfa_cso/ak47/ak47_paint1",
	--}, -- separate table for viewmodel materials, overrides main table
	--MaterialTable_W = {
    --[1] = "models/weapons/tfa_cso/ak47/ak47_paint1",	 
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
