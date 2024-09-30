if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Trans-Gear" -- skin name
ATTACHMENT.Description = {TFA.AttachmentColors["+"],"x2 Damage"}
ATTACHMENT.Icon = "entities/att/cso_infinityex2transgear.png" -- icon
ATTACHMENT.ShortName = "Trans" -- short name that displayed inside the icon

ATTACHMENT.WeaponTable = {
	MaterialTable = { -- materials that are present on both view- and worldmodel
	[1] = "models/weapons/tfa_cso/paint/v_infinityex2_transgear_01",
	[2] = "models/weapons/tfa_cso/paint/v_infinityex2_transgear_02",
	[3] = "models/weapons/tfa_cso/paint/v_infinityex2_transgear_01",
	[4] = "models/weapons/tfa_cso/paint/v_infinityex2_transgear_02",
},
	["Primary"] = {
	["Damage"] = function(wep, stat) return stat * 2 end,
},
	["WElements"] = {
	["otherpist"] = {
	["materials"] = {
	[1] = "models/weapons/tfa_cso/paint/v_infinityex2_transgear_01",
	[2] = "models/weapons/tfa_cso/paint/v_infinityex2_transgear_02",
	[3] = "models/weapons/tfa_cso/paint/v_infinityex2_transgear_01",
	[4] = "models/weapons/tfa_cso/paint/v_infinityex2_transgear_02",
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