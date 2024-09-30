CreateConVar("sv_tfa_cso_hauteclere_damage", 50, FCVAR_ARCHIVE, "Hauteclere's combo damage, per sword.", 1, 32767)
CSO_Hauteclere_Table = {}
CSO_Hauteclere_Effect = {}

local function ShouldApplyTable(ply)
	for k,v in next, CSO_Hauteclere_Table do
		if(v["ply"] == ply) then return false end
	end
	table.insert(CSO_Hauteclere_Table, {
		["ply"] = ply,
		["skill.cooldown"] = 0,
		["skill.pos"] = Vector(0, 0, 0),
		["skill.interval"] = 0,
		["skill.state"] = 0,
		["skill.started"] = false,
		["skill.nextsequence"] = false,
		["skill.cached.seq"] = 0,
		["skill.length"] = 0,
		["skill.attack.cd"] = 0,
		["skill.yaw"] = 0,
		["skill.pitch"] = 0,
		["skill.portal"] = nil,
		["skill.big.interval"] = 0,
		["secondary.seq"] = 0,
		["secondary.fired"] = false,
		["secondary.delay"] = 0,
		["skill.portal"] = nil,
		["skill.lastplayed"] = false,
	})
end

hook.Add("Tick", "CSO_Hauteclere_Skill", function()

	for k,v in next, CSO_Hauteclere_Effect do
		if(v["killtime"] < CurTime()) then
			if(IsValid(v["sword_ent"])) then
				v["sword_ent"]:Remove()
			end
			table.remove(CSO_Hauteclere_Effect, k)
		end
		if(!v["spawned"]) then
			if(v["sword_ent"] == nil) then
				v["sword_ent"] = ents.Create("prop_dynamic")
					v["sword_ent"]:SetPos(v["pos"])
					v["sword_ent"]:SetAngles(Angle(v["pitch"], v["yaw"], 0))
					if(!v["big"]) then
						v["sword_ent"]:SetModel("models/effects/tfa_cso/ef_swordbombard.mdl")
					else
						v["sword_ent"]:SetModel("models/effects/tfa_cso/ef_swordbombard_big.mdl")
						v["sword_ent"]:SetModelScale(1.75, 0)
					end
					v["sword_ent"]:Spawn()
			end
			if(!v["big"]) then
				util.SpriteTrail(v["sword_ent"], 0, Color(200, 200, 255, 100), false, 3, 1, 0.10, 0.125, "trails/smoke.vmt")
			else
				util.SpriteTrail(v["sword_ent"], 0, Color(242, 182, 109, 100), false, 5, 3, 0.10, 0.125, "trails/smoke.vmt")
			end
			util.SpriteTrail(v["sword_ent"], 0, Color(255, 255, 255, 255), false, 4, 1, 0.04, 0.035, "trails/smoke.vmt")
			v["sword_ent"]:DrawShadow(false)
			v["spawned"] = true
		else
			if(v["big"]) then v["speed"] = v["speed"] + 1.2 end
			if(v["starttime"] > CurTime()) then
				v["speed"] = v["speed"] + 0.05
				v["dst"] = v["dst"] + v["speed"]
			else
				v["speed"] = v["speed"] + 1.5
				v["dst"] = v["dst"] + v["speed"]
			end
			if(v["bullet.interval"] < CurTime()) then
					local mins, maxs = v["sword_ent"]:OBBMins(), v["sword_ent"]:OBBMaxs()
					local st = v["sword_ent"]:GetPos()
					local dr = v["sword_ent"]:GetAngles()
					local tr = util.TraceHull({
						start = st,
						endpos = st + dr:Forward() * v["dst"],
						maxs = maxs,
						mins = mins,
						filter = {v["ply"], v["sword_ent"]}
					})
					if(IsValid(tr.Entity)) then
						local d = DamageInfo()
							if(v["big"]) then
								d:SetDamage(20)
							else
								d:SetDamage(5)
							end
							d:SetAttacker(v["ply"])
							d:SetInflictor(v["ply"]:GetActiveWeapon())
							d:SetDamageType(4)
							d:SetDamagePosition(tr.Entity:GetPos() + Vector(0, 0, 20))
						tr.Entity:TakeDamageInfo(d)
					end
				end
			v["sword_ent"]:SetPos(v["pos"] + Angle(v["pitch"], v["sword_ent"]:GetAngles().y, 0):Forward() * v["dst"])
		end
	end

	for k,v in next, CSO_Hauteclere_Table do
		if(!IsValid(v["ply"])) then continue end
		local pWep = v["ply"]:GetActiveWeapon()
		if(!IsValid(pWep)) then continue end
		if(pWep:GetClass() != "tfa_cso_hauteclere") then v["skill.state"] = 0 if(IsValid(v["skill.portal"])) then v["skill.portal"]:Remove() end
		if(v["skill.started"]) then
				table.insert(CSO_Hauteclere_Effect, {
					["sword_ent"] = nil,
					["spawned"] = false,
					["pos"] = v["skill.pos"],
					["dst"] = 0,
					["starttime"] = CurTime() + 0.15,
					["killtime"] = CurTime() + 0.85,
					["speed"] = 0,
					["yaw"] = v["skill.yaw"],
					["bullet.interval"] = 0,
					["ply"] = v["ply"],
					["pitch"] = v["skill.pitch"],
					["big"] = true,
				})
				v["skill.started"] = false
		end
		continue end
		local vm = v["ply"]:GetViewModel(0)
		local seq = vm:GetSequence()
		local dur = vm:SequenceDuration(3)
		local cyc = vm:GetCycle()
		local cur = math.Round(dur * cyc, 2)

		if(!v["skill.started"]) then
			if(seq != 0) then

				if(v["secondary.delay"] < CurTime()) then
					if(seq == 3) then
						if(cur >= 0.5 && cur <= 1) then
							local slash = ents.Create("hauteclere_range_slash")
								slash:SetPos(v["ply"]:EyePos())
								slash:SetAngles(v["ply"]:EyeAngles())
								slash:Spawn()
								slash:SetOwner(v["ply"])
								slash:SetVelocity(v["ply"]:EyeAngles():Forward() * 3000)
							v["secondary.delay"] = CurTime() + 1.3
						end
					end
				end

				if(seq != v["skill.cached.seq"] && v["skill.nextsequence"]) then -- this is where I spent most time to figure out
					if(v["skill.state"] == 4) then
						if(seq > 0 && seq < 3) then
							pWep:SetNextPrimaryFire(CurTime() + 1)
							pWep:SetNextSecondaryFire(CurTime() + 1)
							pWep:SetStatusEnd(CurTime() + 10.1)
							timer.Simple(0.3, function() 
								sound.Play("weapons/tfa_cso/hauteclere/skill_fx.wav", v["ply"]:GetPos(), 100, 100, 1)
								sound.Play("weapons/tfa_cso/hauteclere/skill.wav", v["ply"]:GetPos(), 100, 100, 1)

								v["skill.started"] = true
								v["skill.state"] = 0
								v["skill.pos"] = v["ply"]:GetPos() + Vector(0, 0, 50) + (Angle(0, v["ply"]:EyeAngles().y, 0):Forward() * -60) + Vector(0, 0, 35)
								v["skill.yaw"] = v["ply"]:EyeAngles().y
								v["skill.pitch"] = v["ply"]:EyeAngles().x
								v["skill.length"] = CurTime() + 8
								v["skill.attack.cd"] = CurTime() + 0.8
								v["skill.lastplayed"] = false
								if(!IsValid(v["skill.portal"])) then
									v["skill.portal"] = ents.Create("prop_dynamic")
									v["skill.portal"]:SetPos(v["skill.pos"])
									v["skill.portal"]:SetModelScale(1.3, 0.0)
									v["skill.portal"]:SetAngles(Angle(v["skill.pitch"], v["skill.yaw"], 0))
									v["skill.portal"]:SetModel("models/effects/tfa_cso/ef_swordbombard_potal.mdl")
									v["skill.portal"]:Spawn()
								end
							end)
						else
							v["skill.state"] = 0
						end
					end
					if(v["skill.state"] == 3) then
						if(seq == 3) then
							v["skill.state"] = 4
						else
							v["skill.state"] = 0
						end
					end
					if(v["skill.state"] == 2) then
						if(seq > 0 && seq < 3) then
							v["skill.state"] = 3
						else
							v["skill.state"] = 0
					end
					end
					if(v["skill.state"] == 1) then
						if(seq > 0 && seq < 3) then
							v["skill.state"] = 2
						else
							v["skill.state"] = 0
						end
					end
					if(v["skill.state"] == 0) then
						if(seq == 3) then
							v["skill.state"] = 1
						end
					end
					v["skill.nextsequence"] = false
					v["skill.cached.seq"] = seq
				else
					v["skill.nextsequence"] = true
				end
			end
		else
			if(v["skill.length"] > CurTime()) then
				pWep:SetNextPrimaryFire(CurTime() + 0.4)
				pWep:SetNextSecondaryFire(CurTime() + 0.4)
				if(IsValid(v["skill.portal"])) then local vA = v["skill.portal"]:GetAngles() v["skill.portal"]:SetAngles(Angle(vA.x, vA.y, vA.z + 0.3)) end
				if(v["skill.interval"] < CurTime()) then
					sound.Play("weapons/tfa_cso/hauteclere/fly"..math.random(1, 5)..".wav", v["skill.pos"], 100, 100, 1)
					table.insert(CSO_Hauteclere_Effect, {
						["sword_ent"] = nil,
						["spawned"] = false,
						["pos"] = v["skill.pos"] + Vector(math.random(-72, 72),math.random(-72, 72), math.random(-48, 64)),
						["dst"] = 0,
						["starttime"] = CurTime() + 0.15,
						["killtime"] = CurTime() + 0.85,
						["speed"] = 0,
						["yaw"] = v["skill.yaw"],
						["bullet.interval"] = 0,
						["ply"] = v["ply"],
						["pitch"] = v["skill.pitch"],
						["big"] = false,
					})
					v["skill.interval"] = CurTime() + 0.1
				end
				vm:SetSequence(6)
			else
				if(!v["skill.lastplayed"]) then
				sound.Play("weapons/tfa_cso/hauteclere/skill_end.wav", v["ply"]:GetPos(), 100, 100, 1)
				pWep:SetNextPrimaryFire(CurTime() + 0.5)
				pWep:SetNextSecondaryFire(CurTime() + 0.5)
				pWep:SetStatusEnd(CurTime() + 0.5)
				vm:SetSequence(7)
				table.insert(CSO_Hauteclere_Effect, {
					["sword_ent"] = nil,
					["spawned"] = false,
					["pos"] = v["skill.pos"],
					["dst"] = 0,
					["starttime"] = CurTime() + 0.15,
					["killtime"] = CurTime() + 0.85,
					["speed"] = 0,
					["yaw"] = v["skill.yaw"],
					["bullet.interval"] = 0,
					["ply"] = v["ply"],
					["pitch"] = v["skill.pitch"],
					["big"] = true,
				})
					timer.Simple(0.3, function()
						if(IsValid(v["skill.portal"])) then v["skill.portal"]:Remove() end
						v["skill.started"] = false
					end)
				v["skill.lastplayed"] = true
				end
			end
		end
	end
end)

hook.Add("PlayerSpawn", "CSO_Hauteclere_ApplyData", function(ply)
	ShouldApplyTable(ply)
end)