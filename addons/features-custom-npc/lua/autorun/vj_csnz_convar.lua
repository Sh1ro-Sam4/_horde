/*--------------------------------------------------
	=============== Nexon zombies SNPCs ConVars ===============
	*** Copyright (c) 2012-2017 by Norpa, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
INFO: Used to load ConVars for Nexon zombies SNPCs
--------------------------------------------------*/
if (!file.Exists("autorun/vj_base_autorun.lua","LUA")) then return end
-------------------------------------------------------------------
local AddConvars = {}

AddConvars["vj_deimosz_h"] = 3000
 

AddConvars["vj_fatzombie_h"] = 300
AddConvars["vj_fatzombie_d"] = 24

AddConvars["vj_heavyboss_h"] = 3500
AddConvars["vj_heavyboss_d"] = 35

AddConvars["vj_oberon_h"] = 15000
 
AddConvars["vj_spezom_h"] = 130
AddConvars["vj_spezom_d"] = 14

AddConvars["vj_tanz_h"] = 200
AddConvars["vj_tanz_d"] = 17

AddConvars["vj_zhealer_h"] = 220
AddConvars["vj_zhealer_d"] = 16

AddConvars["zombie_nexon_spawner_list"] = "deimos, fatzombie, heavm, heavyboss, pczombie, spezombie, zombeheal"
AddConvars["CS_NEXON_ZOMBIE_MAX"] = 30

 
for k, v in pairs(AddConvars) do
	if !ConVarExists( k ) then CreateConVar( k, v, {FCVAR_NONE} ) end
end