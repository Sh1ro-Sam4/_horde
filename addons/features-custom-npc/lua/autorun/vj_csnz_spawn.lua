/*--------------------------------------------------
	=============== Nexon zombies SNPCs Spawn ===============
	*** Copyright (c) 2012-2016 by Norpa, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
INFO: Used to load spawns for Nexon zombies SNPCs
--------------------------------------------------*/
if (!file.Exists("autorun/vj_base_autorun.lua","LUA")) then return end
include('autorun/vj_controls.lua')


local vCat = "Counter-Strike Nexon: Zombies"
VJ.AddNPC("Juggernaut","npc_cs_heavyboss",vCat)
VJ.AddNPC("Heavy zombie","npc_cs_fatzombie",vCat)
VJ.AddNPC("Deimos","npc_cs_deimos",vCat)
VJ.AddNPC("Psycho zombie","npc_cs_pczombie",vCat)
VJ.AddNPC("Light zombie","npc_cs_spezombie",vCat)
VJ.AddNPC("Doctor zombie","npc_cs_zombeheal",vCat)
VJ.AddNPC("Heavy zombie master","npc_cs_heavm",vCat)
VJ.AddNPC("Zombie invasion (Spawner)","sent_csnexon_spawner_wholemap",vCat)

  
//VJ.AddNPC("Oberon","npc_cs_oberon",vCat)
//VJ.AddNPC("Prototype Phobos","npc_cs_phobos1",vCat)
//VJ.AddNPC("Siege Type Phobos","npc_cs_phobos2",vCat)
//VJ.AddNPC("Little giant","npc_cs_littlegiant",vCat)
//VJ.AddNPC("Gestapo","npc_cs_gestapo",vCat)
//VJ.AddNPC("Crusader","npc_cs_crusader",vCat)
