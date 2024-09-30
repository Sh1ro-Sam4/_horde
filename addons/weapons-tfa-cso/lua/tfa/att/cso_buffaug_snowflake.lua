if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Snowflake" -- skin name
ATTACHMENT.Description = {
}
ATTACHMENT.Icon = "entities/att/cso_buffaug_snowflake.png" -- icon
ATTACHMENT.ShortName = "Snowflake" -- short name that displayed inside the icon

ATTACHMENT.WeaponTable = {
	MaterialTable_V = {
	[1] = "models/weapons/tfa_cso/paint/$20@004buffaug01_v",
	[2] = "models/weapons/tfa_cso/paint/$20@004buffaug02_v",
	[3] = "models/weapons/tfa_cso/paint/$0b_buffaugglow",
	[4] = "models/weapons/tfa_cso/paint/$0b_buffaugshoot01",
	[5] = "models/weapons/tfa_cso/paint/$0b_buffaugshoot02",
	[6] = "models/weapons/tfa_cso/paint/$0b_buffaugshoot03",
	},
	MaterialTable_W = {
	[2] = "models/weapons/tfa_cso/paint/$20@004buffaug01_v",
	[1] = "models/weapons/tfa_cso/paint/$20@004buffaug02_v",
	},
	["MuzzleFlashEffect"] = "cso_muz_grd_s",
	["TracerName"] = "cso_tra_lyc",
["VElements"] = {
	["smoke"] = { type = "Model", model = "models/hunter/plates/plate1x1.mdl", bone = "buffaug_root", rel = "", pos = Vector(5.75, 2.5, -0.25), angle = Angle(0, -180, 90), size = Vector(0.185, 0.185, 0.0001), color = Color(255, 255, 255, 255), surpresslightning = false, material = "sprites/buffaug_snowflake_smoke", skin = 0, bodygroup = {} }
},
	 --MaterialTable_V = {
	 --[1] = "models/weapons/tfa_cso/paint/ak47_eagle",
	 --}, -- separate table for viewmodel materials, overrides main table
	 --MaterialTable_W = {
     --[1] = "models/weapons/tfa_cso/paint/ak47_eagle",	 
	 --}, -- separate table for worldmodel materials, overrides main table
}

local function resetMatCache(att, wep)
	wep.MaterialCached = false
end

ATTACHMENT.Attach = resetMatCache
ATTACHMENT.Detach = resetMatCache

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
