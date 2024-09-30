if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Battle" -- skin name
ATTACHMENT.Description = {TFA.AttachmentColors["+"],"+1 Damage"}
ATTACHMENT.Icon = "entities/att/cso_pythonbattle.png" -- icon
ATTACHMENT.ShortName = "Battle" -- short name that displayed inside the icon

ATTACHMENT.WeaponTable = {
	MaterialTable = { -- materials that are present on both view- and worldmodel
	[1] = "models/weapons/tfa_cso/paint/bpython_v",
	},
	["Primary"] = {
	["Damage"] = function(wep, stat) return stat +1 end,
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
