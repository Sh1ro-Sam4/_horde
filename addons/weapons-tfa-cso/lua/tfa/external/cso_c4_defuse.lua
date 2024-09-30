if CLIENT then

	language.Add("tfa_cso_defuser", "Defuse Kit")

	return
end

hook.Add("PlayerSpawn", "CSO_DefuseLoadout", function(ply)
	if ply:GetNW2Bool("CSO_HasDefuseKit", false) then
		ply:SetNW2Bool("CSO_HasDefuseKit", false)
	end
end)

hook.Add("KeyRelease", "CSO_DefuseInterrupt", function(ply, key)
	if not IsValid(ply) or key ~= IN_USE then return end

	if IsValid(ply:GetNW2Entity("CSO_DefuseTarget")) then
		ply:SetNW2Entity("CSO_DefuseTarget", NULL)
		ply:SetNW2Float("CSO_DefuseProgress", -1)
	end
end)

hook.Add("StartCommand", "CSO_DefuseThink", function(ply, ucmd)
	if not IsValid(ply) then return end

	local target = ply:GetNW2Entity("CSO_DefuseTarget")
	if IsValid(target) then
		ucmd:ClearMovement()

		local progress = ply:GetNW2Float("CSO_DefuseProgress", 0)

		if progress >= 1 then
			ply:SetNW2Entity("CSO_DefuseTarget", NULL)
			ply:SetNW2Float("CSO_DefuseProgress", -1)
			if GetConVar( "sv_tfa_cso_c4_radio_snd" ):GetBool() then
			target:EmitSound("radio/bombdef.wav", -1)
			end
			target:EmitSound("C4.DisarmFinish")
			target:Remove()
		else
			local amount = math.max(GetConVar( "sv_tfa_cso_c4_defuse_time" ):GetInt(), 0.05)

			if ply:GetNW2Bool("CSO_HasDefuseKit", false) then
				amount = amount * .5
			end

			ply:SetNW2Float("CSO_DefuseProgress", progress + FrameTime() / amount)
		end
	end
end)