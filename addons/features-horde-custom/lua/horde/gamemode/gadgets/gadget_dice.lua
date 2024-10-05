GADGET.PrintName = "Dice"
GADGET.Description =
[[Randomly activates one of the following gadgets:
 Agility Shard, Resistance Shard, Damage Shard,
 Elixir, Medic Bag, Turret Pack,
 Idol of Greed, Optical Camoflauge, Portable Battery,
 Ammo Bag, Berserker Armor, or Ultimate Shard.
 All temporary effects have been increased to 30 seconds.]]
GADGET.Icon = "items/gadgets/dice.png"
GADGET.Duration = 0
GADGET.Cooldown = 30
GADGET.Active = true
GADGET.Params = {
}
GADGET.Hooks = {}

GADGET.Hooks.Horde_UseActiveGadget = function (ply)
    if CLIENT then return end
    if ply:Horde_GetGadget() ~= "gadget_dice" then return end

--long elseif statement aaa

    local p = math.random(1,12)
	
	if p == 1 then
	ply:ChatPrint( "Rolled: Agility Shard" )
      ply.Horde_Has_Agility_Shard = true
    ply:Horde_SyncStatus(HORDE.Status_Agility_Shard, 1)
    timer.Simple(30, function ()
        if ply:IsValid() then
            ply.Horde_Has_Agility_Shard = nil
            ply:Horde_SyncStatus(HORDE.Status_Agility_Shard, 0)
        end
    end)
	
	elseif p == 2 then
	ply:ChatPrint( "Rolled: Resistance Shard" )
	ply.Horde_Has_Resistance_Shard = true
    ply:Horde_SyncStatus(HORDE.Status_Resist_Shard, 1)
    timer.Simple(30, function ()
        if ply:IsValid() then
            ply.Horde_Has_Resistance_Shard = nil
            ply:Horde_SyncStatus(HORDE.Status_Resist_Shard, 0)
        end
    end)
	
	elseif p == 3 then
	ply:ChatPrint( "Rolled: Damage Shard" )
	ply.Horde_Has_Damage_Shard = true
    ply:Horde_SyncStatus(HORDE.Status_Damage_Shard, 1)
    timer.Simple(30, function ()
        if ply:IsValid() then
            ply.Horde_Has_Damage_Shard = nil
            ply:Horde_SyncStatus(HORDE.Status_Damage_Shard, 0)
        end
    end)
	
	elseif p == 4 then
	ply:ChatPrint( "Rolled: Elixir" )
	sound.Play("items/medshot4.wav", ply:GetPos())
    local healinfo = HealInfo:New({amount=ply:GetMaxHealth(), healer=ply})
    HORDE:OnPlayerHeal(ply, healinfo)

    for debuff, buildup in pairs(ply.Horde_Debuff_Buildup) do
        ply:Horde_RemoveDebuff(debuff)
        ply:Horde_ReduceDebuffBuildup(debuff, buildup)
    end
	
	elseif p == 5 then
	ply:ChatPrint( "Rolled: Medic Bag" )
	
	local ent = ents.Create("horde_medic_bag")
    local pos = ply:GetPos()
    local dir = (ply:GetEyeTrace().HitPos - pos)
    dir:Normalize()
    local drop_pos = pos + dir * 50
    drop_pos.z = pos.z + 15
    ent:SetPos(drop_pos)
    ent:SetAngles(Angle(0, ply:GetAngles().y, 0))
    ply:Horde_AddDropEntity(ent:GetClass(), ent)
    ent:Spawn()
	
	
	elseif p == 6 then
	ply:ChatPrint( "Rolled: Turret Pack" )
	local ent = ents.Create("npc_turret_floor")
    local pos = ply:GetPos()
    local dir = (ply:GetEyeTrace().HitPos - pos)
    dir:Normalize()
    local drop_pos = pos + dir * 50
    drop_pos.z = pos.z + 15
    ent:SetPos(drop_pos)
    ent:SetAngles(Angle(0, ply:GetAngles().y, 0))
    ply:Horde_AddDropEntity(ent:GetClass(), ent)
    ent:SetNWEntity("HordeOwner", ply)
    ent:SetRenderMode(RENDERMODE_TRANSCOLOR)
    ent:SetColor(Color(255,0,0,255))
    ent:Spawn()
    ent.Horde_Is_Mini_Sentry = true

    -- Minions have no player collsion
    ent:AddRelationship("player D_LI 99")
    ent.VJ_NPC_Class = {"CLASS_PLAYER_ALLY"}
    local npc_info = list.Get("NPC")[ent:GetClass()]
    if not npc_info then
        print("[HORDE] NPC does not exist in ", list.Get("NPC"))
    end
    local wpns = npc_info["Weapons"]
    if wpns then
        local wpn = wpns[math.random(#wpns)]
        ent:Give(wpn)
    end
    -- Special case for turrets
    local id = ent:GetCreationID()
    ent:SetCollisionGroup(COLLISION_GROUP_WORLD)
    timer.Create("Horde_MinionCollision" .. id, 1, 0, function ()
        if not ent:IsValid() then timer.Remove("Horde_MinionCollision" .. id) return end
        ent:SetCollisionGroup(COLLISION_GROUP_WORLD)
    end)
    HORDE:DropTurret(ent)
    --HORDE:DropTurret(ent)
    ply:Horde_SetMinionCount(ply:Horde_GetMinionCount() + 1)

    ent:CallOnRemove("Horde_EntityRemoved", function()
        if ent:IsValid() and ply:IsValid() then
            timer.Remove("Horde_MinionCollision" .. ent:GetCreationID())
            ent:GetNWEntity("HordeOwner"):Horde_RemoveDropEntity(ent:GetClass(), ent:GetCreationID(), true)
            ent:GetNWEntity("HordeOwner"):Horde_SyncEconomy()
            ply:Horde_SetMinionCount(ply:Horde_GetMinionCount() - 1)
        end
    end)

    timer.Simple(30, function()
        if not ent:IsValid() then return end
        ent:TakeDamage(ent:GetMaxHealth() + 1, Entity(0), Entity(0))
    end)
	
	elseif p == 7 then
	ply:ChatPrint( "Rolled: Idol of Greed" )
	sound.Play("satan_laugh.wav", ply:GetPos())
    ply.Horde_GreedIdol = true
  --  ply:ScreenFade(SCREENFADE.IN, Color(253, 248, 50, 32), 0.1, 30)
  ply:Horde_SyncStatus(HORDE.Status_Idol_Of_Greed, 1)
    timer.Simple(30, function()
        if ply:IsValid() then 
		ply.Horde_GreedIdol = nil 
		ply:Horde_SyncStatus(HORDE.Status_Idol_Of_Greed, 0)
		end
    end)
	
	
	elseif p == 8 then
	ply:ChatPrint( "Rolled: Optic Camoflauge" )
	sound.Play("horde/gadgets/optical_camouflage_on.ogg", ply:GetPos())
    sound.Play("horde/gadgets/optical_camouflage_in.ogg", ply:GetPos())
    ply.Horde_In_Optical_Camouflage = true
    ply:ScreenFade(SCREENFADE.IN, Color(200, 200, 200, 25), 0.1, 30)
  --  ply:Horde_AddCamoflague()
    timer.Simple(30, function()
        if ply:IsValid() then ply.Horde_In_Optical_Camouflage = nil return end
    end)
	
	elseif p == 9 then 
	ply:ChatPrint( "Rolled: Portable Battery" )
	
	local battery = 25
	sound.Play("items/battery_pickup.wav", ply:GetPos())
  ply:SetArmor(math.min(ply:GetMaxArmor(), ply:Armor() + battery ))
	
	elseif p == 10 then 

ply:ChatPrint( "Rolled: Ammo Bag" )

local ent = ents.Create("horde_ammo_bag")
    local pos = ply:GetPos()
    local dir = (ply:GetEyeTrace().HitPos - pos)
    dir:Normalize()
    local drop_pos = pos + dir * 50
    drop_pos.z = pos.z + 15
    ent:SetPos(drop_pos)
    ent:SetAngles(Angle(0, ply:GetAngles().y, 0))
    ply:Horde_AddDropEntity(ent:GetClass(), ent)
    --ent:SetNWEntity("HordeOwner", ply)
    ent:Spawn()


		
	
	elseif p == 11 then
	ply:ChatPrint( "Rolled: Berserker Armor" )
	sound.Play("horde/gadgets/berserk_on.ogg", ply:GetPos())
    sound.Play("horde/gadgets/berserk_in.ogg", ply:GetPos())
    ply.Horde_HasGuts = true
    ply:ScreenFade(SCREENFADE.IN, Color(200, 50, 50, 50), 0.1, 30)
    timer.Simple(30, function()
        if ply:IsValid() then ply.Horde_HasGuts = nil end
    end)
	
	elseif p == 12 then 
	
	ply:ChatPrint( "Rolled: Ultimate Shard" )
	 ply.Horde_Has_Ultimate_Shard = true
    ply:Horde_SyncStatus(HORDE.Status_Ultimate_Shard, 1)
	
	sound.Play("items/medshot4.wav", ply:GetPos())
    local healinfo = HealInfo:New({amount=20, healer=ply})
    HORDE:OnPlayerHeal(ply, healinfo)

    for debuff, buildup in pairs(ply.Horde_Debuff_Buildup) do
        ply:Horde_RemoveDebuff(debuff)
        ply:Horde_ReduceDebuffBuildup(debuff, buildup)
    end
	
    timer.Simple(30, function ()
        if ply:IsValid() then
            ply.Horde_Has_Ultimate_Shard = nil
            ply:Horde_SyncStatus(HORDE.Status_Ultimate_Shard, 0)
        end
    end)
	end
end

GADGET.Hooks.Horde_OnPlayerDamageTaken = function (ply, dmginfo, bonus)
    if ply:Horde_GetGadget() ~= "gadget_dice" then return end
	
	if ply.Horde_HasGuts then
    bonus.resistance = bonus.resistance + 0.25
	end
	
	if ply.Horde_In_Optical_Camouflage then
	bonus.evasion = bonus.evasion + 0.50
	end
	
end

GADGET.Hooks.Horde_OnPlayerDamage = function (ply, npc, bonus, hitgroup, dmginfo)


  if ply:Horde_GetGadget() ~= "gadget_dice" or not ply.Horde_HasGuts then return end
    bonus.increase = bonus.increase + 0.25
	end


GADGET.Hooks.Horde_PlayerMoveBonus = function(ply, bonus_walk, bonus_run)
    if ply:Horde_GetGadget() ~= "gadget_dice" or not ply.Horde_HasGuts then return end
    bonus_walk.increase = bonus_walk.increase + 0.25
    bonus_run.increase = bonus_run.increase + 0.25
end