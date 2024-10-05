GADGET.PrintName = "Bounty Hunter"
GADGET.Description =
[["Why worry about the filler,
when you can focus on the big game?"
Killing bosses drops a Mega Skull Token, which awards 5 Skull Tokens.]]
GADGET.Icon = "items/gadgets/corporate_mindset.png"
GADGET.Duration = 0
GADGET.Cooldown = 0
GADGET.Active = false
GADGET.Params = {
}
GADGET.Hooks = {}

if GetConVar("horde_enable_sandbox"):GetInt() == 0 and GetConVar("horde_enable_rank"):GetInt() == 1 then
	hook.Add("Horde_OnEnemyKilled", "Horde_Bounty_Hunter", function(victim, killer, wpn)
		if HORDE.current_wave <= 0 or GetConVar("sv_cheats"):GetInt() == 1 then return end
		if killer:Horde_GetGadget() ~= "gadget_bounty_hunter" then return end
		if killer:IsPlayer() and killer:IsValid() and killer:Horde_GetClass() then
			local class_name = killer:Horde_GetCurrentSubclass()
			if victim:GetVar("is_boss") then
				local p = math.random()
				if p <= 1 then
					-- Drop a skull token
					local ent = ents.Create("horde_mega_skull_token")
					local pos = victim:GetPos()
					local drop_pos = pos
					drop_pos = drop_pos + VectorRand() * 5
					drop_pos.z = pos.z + 15
					ent:SetPos(drop_pos)
					ent.Owner = killer
					ent:Spawn()
				end
			end
		end
	end)
end