if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Halloween" -- skin name
ATTACHMENT.Description = {TFA.AttachmentColors["+"],"x3 Damage"}
ATTACHMENT.Icon = "entities/att/cso_krisshalloween.png" -- icon
ATTACHMENT.ShortName = "Halloween" -- short name that displayed inside the icon

ATTACHMENT.WeaponTable = {
	MaterialTable = { -- materials that are present on both view- and worldmodel
	[1] = "models/weapons/tfa_cso/paint/kriss_superv-1v_halloween",
},
	["Primary"] = {
	["Damage"] = function(wep, stat) return stat * 3 end,
	},
	["WElements"] = {
	["dualkriss"] = {
	["materials"] = {
	[1] = "models/weapons/tfa_cso/paint/kriss_superv-1v_halloween",
	}
	},
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
