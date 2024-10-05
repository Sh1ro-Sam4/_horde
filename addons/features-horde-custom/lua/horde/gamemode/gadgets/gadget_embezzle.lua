GADGET.PrintName = "Embezzle"
GADGET.Description =
[["Cheat the economy with your wicked ways;
it's not like they care how you get the money anyways."
Killing non-elites has a 3% chance to drop a skull token.
Killing bosses drops a Super Skull Token that awards skull tokens.
Amount of skull tokens given depends on the difficulty,
starting at 1 on Normal and capping at 5 on Apocalypse.]]
GADGET.Icon = "items/gadgets/embezzle.png"
GADGET.Duration = 0
GADGET.Cooldown = 0
GADGET.Active = false
GADGET.Params = {
}
GADGET.Hooks = {}

if GetConVar("horde_enable_sandbox"):GetInt() == 0 and GetConVar("horde_enable_rank"):GetInt() == 1 then
	hook.Add("Horde_OnEnemyKilled", "Horde_Embezzle", function(victim, killer, wpn)
		if HORDE.current_wave <= 0 or GetConVar("sv_cheats"):GetInt() == 1 then return end
		if killer:IsPlayer() and killer:IsValid() and killer:Horde_GetClass() then
				if killer:Horde_GetGadget() ~= "gadget_embezzle" then return end
			local class_name = killer:Horde_GetCurrentSubclass()
			if not (victim:GetVar("is_elite") or victim:GetVar("is_boss"))  then
				local p = math.random()
				if p <= 0.03 then
					-- Drop a skull token
					local ent = ents.Create("horde_skull_token")
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
		if victim:GetVar("is_boss") then
				local p = math.random()
					-- Drop a skull token
					local ent = ents.Create("horde_super_skull_token")
					local pos = victim:GetPos()
					local drop_pos = pos
					drop_pos = drop_pos + VectorRand() * 5
					drop_pos.z = pos.z + 15
					ent:SetPos(drop_pos)
					ent.Owner = killer
					ent:Spawn()
			end
	end)
end

