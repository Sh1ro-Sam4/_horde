if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Amusement Park" -- skin name
ATTACHMENT.Description = {TFA.AttachmentColors["+"],"x2 Damage"}
ATTACHMENT.Icon = "entities/att/cso_infinityex2park.png" -- icon
ATTACHMENT.ShortName = "Park" -- short name that displayed inside the icon

ATTACHMENT.WeaponTable = {
	MaterialTable = { -- materials that are present on both view- and worldmodel
	[1] = "models/weapons/tfa_cso/paint/v_infinityex2_11_park",
	[2] = "models/weapons/tfa_cso/paint/v_infinityex2_12_park",
	[3] = "models/weapons/tfa_cso/paint/v_infinityex2_11_park",
	[4] = "models/weapons/tfa_cso/paint/v_infinityex2_12_park",
},
	["Primary"] = {
	["Damage"] = function(wep, stat) return stat * 2 end,
},
	["WElements"] = {
	["otherpist"] = {
	["materials"] = {
	[1] = "models/weapons/tfa_cso/paint/v_infinityex2_11_park",
	[2] = "models/weapons/tfa_cso/paint/v_infinityex2_12_park",
	[3] = "models/weapons/tfa_cso/paint/v_infinityex2_11_park",
	[4] = "models/weapons/tfa_cso/paint/v_infinityex2_12_park",
	}
	},
	},
}

local function resetMatCache(att, wep)
	wep:ClearMaterialCache()
end

ATTACHMENT.Attach = resetMatCache
ATTACHMENT.Detach = resetMatCache

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end