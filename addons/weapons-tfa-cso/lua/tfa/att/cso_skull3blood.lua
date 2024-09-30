if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Blood" -- skin name
ATTACHMENT.Description = { -- skin description
}
ATTACHMENT.Icon = "entities/att/cso_skull3blood.png" -- icon
ATTACHMENT.ShortName = "Blood" -- short name that displayed inside the icon

ATTACHMENT.WeaponTable = {
	MaterialTable = { -- materials that are present on both view- and worldmodel
	[1] = "models/weapons/tfa_cso/paint/skull3_vblood",
},
	["WElements"] = {
	["other_skull3"] = {
	["materials"] = {
	[1] = "models/weapons/tfa_cso/paint/skull3_vblood",
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
