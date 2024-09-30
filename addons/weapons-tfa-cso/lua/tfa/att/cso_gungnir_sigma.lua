if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Sigma" -- skin name
ATTACHMENT.Description = {
}
ATTACHMENT.Icon = "entities/att/cso_gungnir_sigma.png" -- icon
ATTACHMENT.ShortName = "Sigma" -- short name that displayed inside the icon

ATTACHMENT.WeaponTable = {
	 MaterialTable_V = {
	 [1] = "models/weapons/tfa_cso/paint/gungnir_sigma/gungnirsigma01_v",
	 [2] = "models/weapons/tfa_cso/paint/gungnir_sigma/gungnirsigma02_v",
	 [10] = "models/weapons/tfa_cso/paint/gungnir_sigma/gungnirsigma_blade_v",
	 }, -- separate table for viewmodel materials, overrides main table
	 MaterialTable_W = {
     [1] = "models/weapons/tfa_cso/paint/gungnir_sigma/gungnirsigma_p",
	 [2] = "models/weapons/tfa_cso/paint/gungnir_sigma/gungnirsigma_blade_p",	 
	 }, -- separate table for worldmodel materials, overrides main table
}

local function resetMatCache(att, wep)
	wep.MaterialCached = false
end

ATTACHMENT.Attach = resetMatCache
ATTACHMENT.Detach = resetMatCache

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
