if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Trans-Gear" -- skin name
ATTACHMENT.Description = {TFA.AttachmentColors["+"],"x10 Damage", TFA.AttachmentColors["+"],"+2 Clip Size"}
ATTACHMENT.Icon = "entities/att/cso_m24transgear.png" -- icon
ATTACHMENT.ShortName = "Trans" -- short name that displayed inside the icon

ATTACHMENT.WeaponTable = {
MaterialTable = { -- materials that are present on both view- and worldmodel
	[1] = "models/weapons/tfa_cso/paint/m24_transgear",
},
	["Primary"] = {
	["Damage"] = function(wep, stat) return stat * 10 end,
    ["ClipSize"] = function( wep, val) return math.floor(val +2) end,
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
