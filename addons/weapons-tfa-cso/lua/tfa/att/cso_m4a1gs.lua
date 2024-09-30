if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "10th Anniversary" -- skin name
ATTACHMENT.Description = {TFA.AttachmentColors["+"],"x2 Damage"}
ATTACHMENT.Icon = "entities/att/cso_m4a1gs.png" -- icon
ATTACHMENT.ShortName = "Gold Special" -- short name that displayed inside the icon

ATTACHMENT.WeaponTable = {
	--MaterialTable = { -- materials that are present on both view- and worldmodel
		--[1] = "models/weapons/tfa_cso/skull_5/skull-vmodel",
	--},
	 MaterialTable_V = {
	 [1] = "models/weapons/tfa_cso/10th_anniversary_gold_special/$20@003m4a1gs",
	 }, -- separate table for viewmodel materials, overrides main table
	 MaterialTable_W = {
     [1] = "models/weapons/tfa_cso/10th_anniversary_gold_special/$20@003m4a1gs_p",
	 }, -- separate table for worldmodel materials, overrides main table
	["Primary"] = {
	["Damage"] = function(wep, stat) return stat *2 end,
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
