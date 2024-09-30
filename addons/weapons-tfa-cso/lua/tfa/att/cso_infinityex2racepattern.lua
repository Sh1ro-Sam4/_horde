if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Race Pattern" -- skin name
ATTACHMENT.Description = {}
ATTACHMENT.Icon = "entities/att/cso_infinityex2racepattern.png" -- icon
ATTACHMENT.ShortName = "Race" -- short name that displayed inside the icon

ATTACHMENT.WeaponTable = {
	MaterialTable = { -- materials that are present on both view- and worldmodel
	[1] = "models/weapons/tfa_cso/paint/v_infinityex2_11_race",
	[2] = "models/weapons/tfa_cso/paint/v_infinityex2_12_race",
	[3] = "models/weapons/tfa_cso/paint/v_infinityex2_21_race",
	[4] = "models/weapons/tfa_cso/paint/v_infinityex2_22_race",
},
	["WElements"] = {
	["otherpist"] = {
	["materials"] = {
	[1] = "models/weapons/tfa_cso/paint/v_infinityex2_21_race",
	[2] = "models/weapons/tfa_cso/paint/v_infinityex2_22_race",
	[3] = "models/weapons/tfa_cso/paint/v_infinityex2_11_race",
	[4] = "models/weapons/tfa_cso/paint/v_infinityex2_12_race",
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