--[[
             /|  
,           /||  
\\ /` -_-_   ||  
 \\   || \\  ||  
 /\\  || ||  ||  
/  \; ||-'  ,/-' 
      |/         
      '          
Xp1 criador do addon 

]]--


hook.Add("Initialize", "SetupUnstableFlinches", function()

	CreateConVar("sv_cs16_flinch", "0", {FCVAR_REPLICATED, FCVAR_NOTIFY}, "Use more accurate, but less reliable animations? (THIS CAN LOOK VERY BAD)" )

end )