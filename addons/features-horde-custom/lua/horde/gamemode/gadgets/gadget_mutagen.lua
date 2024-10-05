GADGET.PrintName = "Mutagen"
GADGET.Description = "Upon activation, your damage is converted into a random type for 10 seconds. \nDamage types will also build up their respective status effects."
GADGET.Icon = "items/gadgets/mutagen.png"
GADGET.Duration = 10
GADGET.Cooldown = 20
GADGET.Active = true
GADGET.Droppable = true
GADGET.Params = {
    [1] = {value = 0.25, percent = true},
    [2] = {value = 0.25, percent = true},
    [3] = {value = 0.25, percent = true},
}
GADGET.Hooks = {}

GADGET.Hooks.Horde_UseActiveGadget = function (ply)
    if CLIENT then return end
    if ply:Horde_GetGadget() ~= "gadget_mutagen" then return end
	
	ply:EmitSound("horde/player/drink.ogg")
	
	local p = math.random(1,7)
	
	if p == 1 then
	
	ply:ChatPrint( "Mutagen: Ballistic" )
	
	  ply.Horde_Mutagen_Ballistic = true
    ply:Horde_SyncStatus(HORDE.Status_Mutagen_Ballistic, 1)
    timer.Simple(10, function ()
        if ply:IsValid() then
            ply.Horde_Mutagen_Ballistic = nil
            ply:Horde_SyncStatus(HORDE.Status_Mutagen_Ballistic, 0)
        end
    end)
	
	elseif p == 2 then

ply:ChatPrint( "Mutagen: Slash" )

ply.Horde_Mutagen_Melee = true
    ply:Horde_SyncStatus(HORDE.Status_Mutagen_Slash, 1)
    timer.Simple(10, function ()
        if ply:IsValid() then
            ply.Horde_Mutagen_Melee = nil
            ply:Horde_SyncStatus(HORDE.Status_Mutagen_Slash, 0)
        end
    end)

elseif p == 3 then

ply:ChatPrint( "Mutagen: Fire" )

ply.Horde_Mutagen_Fire = true
    ply:Horde_SyncStatus(HORDE.Status_Mutagen_Fire, 1)
	ply:Horde_SetApplyIgniteChance(ply:Horde_GetApplyIgniteChance() + 1)
    timer.Simple(10, function ()
        if ply:IsValid() then
            ply.Horde_Mutagen_Fire = nil
			ply:Horde_SetApplyIgniteChance(ply:Horde_GetApplyIgniteChance() - 1)
            ply:Horde_SyncStatus(HORDE.Status_Mutagen_Fire, 0)
        end
    end)

elseif p == 4 then

ply:ChatPrint( "Mutagen: Cold" )

ply.Horde_Mutagen_Cold = true
    ply:Horde_SyncStatus(HORDE.Status_Mutagen_Cold, 1)
    timer.Simple(10, function ()
        if ply:IsValid() then
            ply.Horde_Mutagen_Cold = nil
            ply:Horde_SyncStatus(HORDE.Status_Mutagen_Cold, 0)
        end
    end)

elseif p == 5 then

ply:ChatPrint( "Mutagen: Lightning" )

ply.Horde_Mutagen_Lightning = true
    ply:Horde_SyncStatus(HORDE.Status_Mutagen_Electric, 1)
    timer.Simple(10, function ()
        if ply:IsValid() then
            ply.Horde_Mutagen_Lightning = nil
            ply:Horde_SyncStatus(HORDE.Status_Mutagen_Electric, 0)
        end
    end)

elseif p == 6 then

ply:ChatPrint( "Mutagen: Poison" )

ply.Horde_Mutagen_Poison = true
    ply:Horde_SyncStatus(HORDE.Status_Mutagen_Poison, 1)
    timer.Simple(10, function ()
        if ply:IsValid() then
            ply.Horde_Mutagen_Poison = nil
            ply:Horde_SyncStatus(HORDE.Status_Mutagen_Poison, 0)
        end
    end)

elseif p == 7 then

ply:ChatPrint( "Mutagen: Blast" )

ply.Horde_Mutagen_Blast = true
    ply:Horde_SyncStatus(HORDE.Status_Mutagen_Blast, 1)
    timer.Simple(10, function ()
        if ply:IsValid() then
            ply.Horde_Mutagen_Blast = nil
            ply:Horde_SyncStatus(HORDE.Status_Mutagen_Blast, 0)
        end
    end)

--elseif p == 8 then

--ply:ChatPrint( "Mutagen: Direct" )

--ply.Horde_Mutagen_Direct = true
 --   ply:Horde_SyncStatus(HORDE.Status_Agility_Shard, 1)
  --  timer.Simple(10, function ()
   --     if ply:IsValid() then
    --        ply.Horde_Mutagen_Direct = nil
    --        ply:Horde_SyncStatus(HORDE.Status_Agility_Shard, 0)
    --    end
  --  end)
end
end

GADGET.Hooks.Horde_OnPlayerDamage = function (ply, npc, bonus, hitgroup, dmginfo)


if ply:Horde_GetGadget() ~= "gadget_mutagen" then return end

local direct = dmginfo:IsDamageType(DMG_DIRECT)
	
	if ply:IsValid() then 
	
	if ply.Horde_Mutagen_Ballistic and not direct then
    dmginfo:SetDamageType(DMG_BULLET)
	npc:Horde_AddWeaken(ply, ply:Horde_GetApplyDebuffDuration(), ply:Horde_GetApplyDebuffMore())
	end
	
	if ply.Horde_Mutagen_Melee and not direct then
    dmginfo:SetDamageType(DMG_SLASH)
	npc:Horde_AddDebuffBuildup(HORDE.Status_Bleeding, dmginfo:GetDamage() / 3, ply, dmginfo:GetDamagePosition())
	end
	
	if ply.Horde_Mutagen_Fire and not direct then
    dmginfo:SetDamageType(DMG_SLOWBURN)
	--npc:Horde_AddDebuffBuildup(HORDE.Status_Ignite, dmginfo:GetDamage() / 3, ply, dmginfo:GetDamagePosition())
	end
	
	if ply.Horde_Mutagen_Cold and not direct then
    dmginfo:SetDamageType(DMG_REMOVENORAGDOLL)
	npc:Horde_AddDebuffBuildup(HORDE.Status_Frostbite, dmginfo:GetDamage() / 3, ply, dmginfo:GetDamagePosition())
	end
	
	if ply.Horde_Mutagen_Lightning and not direct then
    dmginfo:SetDamageType(DMG_SHOCK)
	npc:Horde_AddDebuffBuildup(HORDE.Status_Shock, dmginfo:GetDamage() / 3, ply, dmginfo:GetDamagePosition())
	end
	
	if ply.Horde_Mutagen_Poison and not direct then
    dmginfo:SetDamageType(DMG_NERVEGAS)
	npc:Horde_AddDebuffBuildup(HORDE.Status_Break, dmginfo:GetDamage() / 3, ply, dmginfo:GetDamagePosition())
	end
	
	if ply.Horde_Mutagen_Blast and not direct then
    dmginfo:SetDamageType(DMG_BLAST)
	npc:Horde_AddDebuffBuildup(HORDE.Status_Stun, dmginfo:GetDamage() / 3, ply, dmginfo:GetDamagePosition())
	end
	
	--if ply.Horde_Mutagen_Direct then
  --  dmginfo:SetDamageType(DMG_DIRECT)
	--end
	
	end
end
