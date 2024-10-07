/*
    StormFox2.Time.Pause()
    StormFox2.Time.Resume()
    StormFox2.Time.Set(nsTime) | 720 == 12:00 | 60 == 1:00
*/

shizlib.horde = shizlib.horde or {}
shizlib.horde.night_health_multiplier = 1
shizlib.horde.enemy_count_multiplier = 1

hook.Add('HordeWaveStart', 'shizlib-StormFoxAndHorde', function(wave)
    if math.random(1, 2) == 1 then
        shizlib.Broadcast(Color(163,12,12), '[Оповещение] ', 'Наступила ночь! Будте бдительны, зомби стали сильнее!')
        shizlib.horde.night_health_multiplier = 1.4
        shizlib.horde.enemy_count_multiplier = 1.5

        StormFox2.Time.Set(60)
    else
        StormFox2.Time.Set(720)
    end
end)

hook.Add('HordeWaveEnd', 'shizlib-StormFoxAndHorde2', function(wave)
    StormFox2.Time.Set(720)

    shizlib.horde.night_health_multiplier = 1
    shizlib.horde.enemy_count_multiplier = 1
end)

hook.Add('InitPostEntity', 'shizlib-StormFoxAndHordInit', function()
    StormFox2.Time.Set(720)

    StormFox2.Time.Pause()
end)

-- hook.Add('Horde_OnPlayerDamagePost', 'shizlib-RicoshetDamage', function(ply, npc, bonus, hitgroup, dmginfo)
--     if ply:IsSuperAdmin() then
--         local dmg = DamageInfo()
--         dmg:SetAttacker(dmginfo:GetAttacker())
--         dmg:SetInflictor(dmginfo:GetInflictor())
--         dmg:SetDamageType(DMG_PLASMA)
--         dmg:SetDamage(dmginfo:GetDamage())
--         dmg:SetDamageCustom(HORDE.DMG_SPLASH)
--         util.BlastDamageInfo(dmg, dmginfo:GetDamagePosition(), 750)
--     end
-- end)

hook.Add('Think', 'Player-Tinker?Thinker!', function(ply)
	tbl = player.GetAll()
	time = CurTime()

	for i = 1, #tbl do
		hook.Run('PlayerThink', tbl[i], time)
	end
end)

hook.Remove('PlayerThink', 'shizlib-Grab', function(ply, time)
    if not CFG.canGrab[ply:GetUserGroup()] then return end

    if ply:KeyDown(IN_ATTACK) and ply.Grabbing then
        local enta = ply:GetEyeTrace().Entity
		if enta:IsPlayer() and not IsValid(ply.CarryEnt) then return end

        if not IsValid(enta:GetPhysicsObject()) then return end

        ply.CarryEntPhysbone = ply.CarryEntPhysbone or ply:GetEyeTrace().PhysicsBone
		local physbone = ply.CarryEntPhysbone
		ply.CarryEnt = IsValid(ply.CarryEnt) and ply.CarryEnt or enta

        if IsValid(ply.CarryEnt) then
			if ply:KeyPressed(IN_ATTACK) then
				local text = tostring(ply:Name()).." поднял ентити "..tostring(ply.CarryEnt:GetClass())
				--DiscordSendMessage("💙" .. text)
				print(text)
			end

			ply.CarryEnt:SetPhysicsAttacker(ply,5)

			ply.CarryEntLen = math.max(ply.CarryEntLen or ply.CarryEnt:GetPos():Distance(ply:EyePos()), 50)
			local ent = ply.CarryEnt
			local len = ply.CarryEntLen
			ply.CarryEnt:GetPhysicsObjectNum(ply.CarryEntPhysbone):EnableMotion(true)
			ply.CarryEnt.isheld = true
			local ang = ply:EyeAngles()
			ang[1] = 0
			if ent and len then
				local shadowparams = {}
				shadowparams.pos = ply:EyePos() + ply:EyeAngles():Forward() * len
				shadowparams.angle = ang
				shadowparams.maxangular = 50
				shadowparams.maxangulardamp = 25
				shadowparams.maxspeed = 10000
				shadowparams.maxspeeddamp = 1000
				shadowparams.dampfactor = 0.8
				shadowparams.teleportdistance = 0
				shadowparams.deltatime = CurTime()
				ent:GetPhysicsObjectNum(physbone):Wake()
				ent:GetPhysicsObjectNum(physbone):ComputeShadowControl(shadowparams)
			end
		end
    else
        if IsValid(ply.CarryEnt) then
			ply.CarryEnt.isheld = false
			ply.CarryEnt = nil
			ply.CarryEntLen = nil
			ply.CarryEntPhysbone = nil
		end
    end
    if ply:KeyDown(IN_ATTACK2) then
		if IsValid(ply.CarryEnt) then
			ply.CarryEnt:GetPhysicsObjectNum(ply.CarryEntPhysbone):EnableMotion(false)
			ply.CarryEnt.isheld = true
		end
	end
end)

concommand.Add('grab', function(ply)
    if not CFG.canGrab[ply:GetUserGroup()] then return end
    ply.Grabbing = not ply.Grabbing
end)

local Player = FindMetaTable('Player')
function Player:GiveHook()
    local ent = ents.Create('sent_grapplehook_bpack')
    ent:Spawn()
    ent:Activate()
    ent:SetPos(self:GetPos())

    ent:SendItemMessage( self , false )
            
    ent.SetOnPlayer( self , slotname , ent )
    ent:SetControllingPlayer( self )

    local slotname = ent:GetClass()
    if ent.SaveButtonToCvar then
        local selfkey = ent:GetControllingPlayerConVarKey()
        
        if ent:IsKeyAllowed( selfkey ) and selfkey ~= ent:GetKey() then
            ent:SetKey( selfkey )
        end
    end


    ent:SetKeyPressed( false )

    ent:OnAttach( ply , forced )
end