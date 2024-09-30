if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Blue" -- skin name
ATTACHMENT.Description = { -- skin description
}
ATTACHMENT.Icon = "entities/att/cso_balrog7blue.png" -- icon
ATTACHMENT.ShortName = "Blue" -- short name that displayed inside the icon

ATTACHMENT.WeaponTable = {
	--MaterialTable = { -- materials that are present on both view- and worldmodel
		--[1] = "models/weapons/tfa_cso/skull_5/skull-vmodel",
	--},
	 MaterialTable_V = {
	 [1] = "models/weapons/tfa_cso/paint/balrog-7_vblue",
	 [3] = "models/weapons/tfa_cso/paint/balrog-7_scopeblue",
	 [4] = "models/weapons/tfa_cso/paint/balrog-7_eyeblue",
	 }, -- separate table for viewmodel materials, overrides main table
	 MaterialTable_W = {
     [1] = "models/weapons/tfa_cso/paint/balrog-7blue_p",	 
	 }, -- separate table for worldmodel materials, overrides main table
	 ["MuzzleFlashEffect"] = "cso_muz_lyc",
		["Secondary"] = {
	["SetNextSecondaryFire"] = function( wep, stat) return stat +5 end,
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
