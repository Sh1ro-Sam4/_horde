if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "NA1" -- skin name
ATTACHMENT.Description = { -- skin description
}
ATTACHMENT.Icon = "entities/att/cso_dreadnova_na1.png" -- icon
ATTACHMENT.ShortName = "NA1" -- short name that displayed inside the icon

ATTACHMENT.WeaponTable = {
	 MaterialTable_V = {
	 [1] = "models/weapons/tfa_cso/paint/dreadnova_na1/@summonknifena1_summonknife_v_blade",
	 [2] = "models/weapons/tfa_cso/paint/dreadnova_na1/@summonknifena1_summonknife_v",
	 [3] = "models/weapons/tfa_cso/paint/dreadnova_na1/@summonknifena1_glow",
	 }, -- separate table for viewmodel materials, overrides main table
	  MaterialTable_W = {
	 [1] = "models/weapons/tfa_cso/paint/dreadnova_na1/@summonknifena1_summonknife_v",
	 [2] = "models/weapons/tfa_cso/paint/dreadnova_na1/@summonknifena1_summonknife_v_blade",
	 }, -- separate table for worldmodel materials, overrides main table
	 
	["WElements"] = {
    ["dreadnova_a"] = {
    ["materials"] = {
    [1] = "models/weapons/tfa_cso/paint/dreadnova_na1/@summonknifena1_summonknife_v",
    [2] = "models/weapons/tfa_cso/paint/dreadnova_na1/@summonknifena1_summonknife_v_blade",
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
