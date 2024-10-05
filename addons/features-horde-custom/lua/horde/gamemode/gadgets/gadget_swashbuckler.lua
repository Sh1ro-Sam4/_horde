GADGET.PrintName = "Swashbuckler"
GADGET.Description = "Dealing non-ignite fire damage gives you a stack of Swashbuckler. \nEach stack increases melee damage by 100%. \nDealing melee damage resets all of your stacks. Maximum of 5 stacks."
GADGET.Icon = "items/gadgets/berserk_armor.png"
GADGET.Duration = 0
GADGET.Cooldown = 0
GADGET.Active = false

--GADGET.Hooks.Horde_OnSetGadget = function(ply, gadget)
  --  if ply:Horde_GetGadget() ~= "gadget_swashbuckler" then return end
	--if SERVER then
 --ply:Horde_SetSwashbucklerEnabled(true)
  --  end
--	end

--GADGET.Hooks.Horde_OnUnsetGadget = function(ply, gadget)
  --  if ply:Horde_GetGadget() ~= "gadget_swashbuckler" then return end
--	if SERVER then
 --ply:Horde_SetSwashbucklerEnabled(nil)
	--	end
 --   end

local plymeta = FindMetaTable("Player")

function plymeta:Horde_AddSwashbucklerStack()
    if self.Horde_SwashbucklerStack == self:Horde_GetMaxSwashbucklerStack() then return end
    self.Horde_SwashbucklerStack = self.Horde_SwashbucklerStack + 1
  --  timer.Create("Horde_SwashbucklerTracker" .. self:SteamID(), self:Horde_GetSwashbucklerStackDuration(), 1, function()
     --   self:Horde_RemoveSwashbucklerStack()
   -- end)
net.Start("Horde_SyncStatus")
        net.WriteUInt(HORDE.Status_Swashbuckler, 8)
        net.WriteUInt(self.Horde_SwashbucklerStack, 8)
    net.Send(self)
end

function plymeta:Horde_RemoveSwashbucklerStack()
    if not self:IsValid() then return end
    if self.Horde_SwashbucklerStack == 0 then return end
    self.Horde_SwashbucklerStack = math.max(0, self.Horde_SwashbucklerStack - 1)
net.Start("Horde_SyncStatus")
        net.WriteUInt(HORDE.Status_Swashbuckler, 8)
        net.WriteUInt(self.Horde_SwashbucklerStack, 8)
    net.Send(self)
end

function plymeta:Horde_GetSwashbucklerStack()
    return self.Horde_SwashbucklerStack or 0
end

function plymeta:Horde_GetMaxSwashbucklerStack()
    return 5
end

function plymeta:Horde_GetSwashbucklerStackDuration()
    return 5
end

function plymeta:Horde_ClearSwashbucklerStack()
    if not self:IsValid() then return end
    self.Horde_SwashbucklerStack = 0
	--timer.Remove("Horde_SwashbucklerTracker")
	net.Start("Horde_SyncStatus")
        net.WriteUInt(HORDE.Status_Swashbuckler, 8)
        net.WriteUInt(self.Horde_SwashbucklerStack, 8)
    net.Send(self)
end

function plymeta:Horde_GetSwashbucklerEnabled()
    return self.Horde_SwashbucklerEnabled
end

function plymeta:Horde_SetSwashbucklerEnabled(enabled)
    self.Horde_SwashbucklerEnabled = enabled
end

hook.Add("Horde_OnPlayerDamage", "Horde_SwashbucklerDamage", function (ply, npc, bonus, hitgroup, dmginfo)
	if ply:Horde_GetGadget() ~= "gadget_swashbuckler" then return end
	if dmginfo:GetInflictor():GetClass() == "entityflame" then return end
    if HORDE:IsFireDamage(dmginfo) then
	ply:Horde_AddSwashbucklerStack()
	end
    if ply:Horde_GetSwashbucklerStack() > 0 and HORDE:IsMeleeDamage(dmginfo) then
        bonus.increase = bonus.increase + ply:Horde_GetSwashbucklerStack()
		ply:Horde_ClearSwashbucklerStack()
		sound.Play("horde/player/crit.ogg", ply:GetPos())
    end
end)

hook.Add("Horde_ResetStatus", "Horde_SwashbucklerReset", function(ply)
    ply.Horde_SwashbucklerStack = 0
end)
