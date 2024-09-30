-- COPY THIS FILE AND RENAME BEFORE EDITING IT!
TFA.AddWeaponSound( "Groza_Summer.Fire", "weapons/tfa_cso/summersplash/groza_fire.wav", false, "^" )
local hookName = "cso_grozasummer" -- hook ID for patcher, make sure it's set to something unique!

local patchTbl = {
	["tfa_cso_groza"] = { -- class of weapon you want to patch skins in
		[1] = { -- SWEP.Attachments table index/category
			"tfa_cso_grozasummer", -- list of attachment IDs (lua/tfa/att/<attachment id>.lua) you want to patch in, comma-separated
		},
	},
}

-- ACTUAL PATCHER CODE BELOW, DO NOT TOUCH!

local function PatchWeapon(wep)
	if not IsValid(wep) then return end
	local tbl = patchTbl[wep:GetClass()]
	if not tbl then return end

	wep.Attachments = wep.Attachments or {}

	for k,v in pairs(tbl) do
		if not wep.Attachments[k] then
			wep.Attachments[k] = {}
		end
	end

	for k, v in pairs(wep.Attachments) do
		local selname
		if v.sel then
			if isnumber(v.sel) and v.sel >= 0 then
				selname = v.atts[v.sel]
			elseif isstring(v.sel) then
				selname = v.sel
			end
		end

		v.atts = v.atts or {}
		for _, att in ipairs(tbl[k] or {}) do
			table.insert(v.atts, att)
		end

		if selname then
			for n,m in pairs(v.atts) do
				if m == selname then
					v.sel = n
				end
			end
		end
	end
end

hook.Add("TFA_PreInitAttachments", "att_patch_weapon_" .. hookName, function(wep)
	PatchWeapon(wep)
end)