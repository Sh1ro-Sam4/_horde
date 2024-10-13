AddCSLuaFile("shared.lua")
AddCSLuaFile("cl_init.lua")
include("shared.lua")

ENT.NextSpawn = 0
ENT.FixedSpawn = false
ENT.IgnorePVS = false
ENT.MaxPrior = 0

ENT.ZedList = {}

function ENT:KFSpawnerPriorities()
	self.IgnorePVS = false
	self.FixedSpawn = false
	
	self.PriorTBL = {
		npc_cs_deimos = 5, 
		npc_cs_fatzombie = 60, 
		npc_cs_heavm = 70, 
		npc_cs_heavyboss = 1,
		npc_cs_pczombie = 90, 
		npc_cs_spezombie = 80, 
		npc_cs_zombeheal = 100
	}
end

 

function ENT:Initialize()
	self:SetModel( "models/Tripwire/killing floor/projectiles/SirenScream.mdl" )
	self:PhysicsInit( SOLID_NONE )
	self:SetMoveType( MOVETYPE_NONE )
	self:SetSolid( SOLID_NONE )
	self:AddFlags(FL_GRENADE)
	self:DrawShadow(false)
	self:SetRenderMode(RENDERMODE_TRANSALPHA)
	
	self.NextSpawn = CurTime()+0.5
	self.Limit = nil
	self.ZedList = {}
	
	
	self.ZedTBL = {}
	 
	self.HullTBL = {
		npc_cs_deimos = Vector(55, 55, 115), 
		npc_cs_fatzombie = Vector(25, 35, 87), 
		npc_cs_heavm = Vector(25, 35, 87),  
		npc_cs_heavyboss = Vector(57, 66 , 170), 
		npc_cs_pczombie = Vector(25, 18, 80), 
		npc_cs_spezombie = Vector(21, 21, 60), 
		npc_cs_zombeheal = Vector(25, 25, 80)
	}
	
	self:KFSpawnerPriorities()
	

	timer.Create("CSNEXONStartInit"..tostring(self),0.1,1,function()
		if(IsValid(self)&&self!=NULL) then
			local TEMP_ConFail = false
			local TEMP_ListFail = true
			
			if(!istable(self.ZedList)||#self.ZedList==0) then
				local TEMP_List = GetConVar("zombie_nexon_spawner_list"):GetString()
				local TEMP_String = ""
				if(isstring(TEMP_List)) then
					TEMP_List = string.Replace( TEMP_List, " ", "" )
					TEMP_List = string.Replace( TEMP_List, "_", "" )
					TEMP_List = string.lower( TEMP_List )
					
					TEMP_String = string.Explode(",", TEMP_List )
					
					if(#TEMP_String>0) then
						local TEMP_FailName = true
						
						for L=1, #TEMP_String do
							local TEMP_Zed = TEMP_String[L]
							
							if(scripted_ents.GetType("npc_cs_"..TEMP_Zed)=="ai") then
								table.insert(self.ZedTBL,"npc_cs_"..TEMP_Zed)
								TEMP_FailName = false
							end
						end
						
						if(TEMP_FailName==true) then
							TEMP_ConFail = true
						end
					else
						TEMP_ConFail = true
					end
				else
					TEMP_ConFail = true
				end
			else
				if(#self.ZedList>0) then
					for L=1, #self.ZedList do
						local TEMP_Zed = self.ZedList[L]
						
						if(isstring(TEMP_Zed)&&scripted_ents.GetType(TEMP_Zed)=="ai") then
							table.insert(self.ZedTBL,TEMP_Zed)
							TEMP_ListFail = false
						end
					end
				end
				
				TEMP_ConFail = true
			end
			
			if(TEMP_ConFail==true&&TEMP_ListFail==true) then
				self.ZedTBL = {"npc_cs_deimos", "npc_cs_fatzombie", "npc_cs_heavm", 
				"npc_cs_heavyboss", "npc_cs_pczombie", 
				"npc_cs_spezombie", 
				"npc_cs_zombeheal"}
				 sound.Add( {
					name = "ZombieComing",
					channel = CHAN_AUTO,
					volume = 1.0,
					level = 100,
					pitch = 100,
					sound = {"cszom/zombi_coming_1.wav","cszom/zombi_coming_2.wav"} 
				} )
				self:EmitSound( "ZombieComing" )  
				
				sound.Add( {
					name = "ZombieComing_ambient",
					channel = CHAN_AUTO,
					volume = 1.0,
					level = 100,
					pitch = 100,
					sound = "cszom/Zombie_Ambience.wav"
				} )
				self:EmitSound( "ZombieComing_ambient" ) 
				
			end
			
			if(TEMP_ConFail==false) then
					sound.Add( {
					name = "ZombieComing",
					channel = CHAN_AUTO,
					volume = 1.0,
					level = 100,
					pitch = 100,
					sound = {"cszom/zombi_coming_1.wav","cszom/zombi_coming_2.wav"} 
				} )
				self:EmitSound( "ZombieComing" )  
				
				sound.Add( {
					name = "ZombieComing_ambient",
					channel = CHAN_AUTO,
					volume = 1.0,
					level = 100,
					pitch = 100,
					sound = "cszom/Zombie_Ambience.wav"
				} )
				self:EmitSound( "ZombieComing_ambient" ) 
			end
	
			
			
			
			self.MaxPriorTBL = {}
			self.MaxPrior = 0
			
			if(#self.ZedTBL>0) then
				for N, P in pairs(self.ZedTBL) do
					self.MaxPrior = self.MaxPrior+self.PriorTBL[P]
					
					self.MaxPriorTBL[P] = self.MaxPrior
				end
			end
		end
	end)
	
	self:DropToFloor()
end

function ENT:Think()
	if(#player.GetAll()>0&&self.NextSpawn<CurTime()) then
				
		local TEMP_MaxZeds = GetConVarNumber("CS_NEXON_ZOMBIE_MAX")
		local TEMP_ZedCount = #ents.FindByClass("npc_cs_*")
	
		self.NextSpawn = CurTime()+math.Clamp(TEMP_ZedCount/64,0.1,1)
		
		local TEMP_Spawns = 1
		
		if(self.FixedSpawn==false) then
			TEMP_Spawns = math.random(2,6)
		end
				
		
		if(TEMP_ZedCount<TEMP_MaxZeds) then
			for S = 1, math.Clamp(TEMP_MaxZeds-TEMP_ZedCount,math.min(TEMP_MaxZeds,8),math.min(TEMP_MaxZeds,16)) do
				local TEMP_Muls = {-1, 1}
				
				local TEMP_XMul = TEMP_Muls[math.random(1,#TEMP_Muls)]
				local TEMP_YMul = TEMP_Muls[math.random(1,#TEMP_Muls)]
				
				local TEMP_X = 25
				local TEMP_Z = 105
				
				local TEMP_SpawnPos = self:GetPos()
				
				if(self.FixedSpawn==false) then
					TEMP_SpawnPos = player.GetAll()[math.random(1,#player.GetAll())]:GetPos()+Vector(math.random(400,5000)*TEMP_XMul,math.random(400,5000)*TEMP_YMul,math.random(-500,500)*math.Rand(-0.9,1))
				end
				
				local TEMP_SpawnNum = 0
				
				
				if(TEMP_ZedCount<TEMP_MaxZeds) then
					local TEMP_Spawner = ents.Create("base_gmodentity")
					TEMP_Spawner:SetModel("models/props_borealis/bluebarrel001.mdl")
					TEMP_Spawner:SetPos(TEMP_SpawnPos)
					TEMP_Spawner:Spawn()
					TEMP_Spawner:SetOwner(self)
					
					TEMP_Spawner:AddFlags(FL_NOTARGET)
					TEMP_Spawner:RemoveFlags(FL_OBJECT)
					
					TEMP_Spawner:SetNoDraw(true)
					TEMP_Spawner:DrawShadow(false)
					
					TEMP_Spawner:PhysicsInit(SOLID_BBOX)
					TEMP_Spawner:SetSolid(SOLID_BBOX)
					TEMP_Spawner:SetCollisionBounds(Vector(-TEMP_X,-TEMP_X,0),Vector(TEMP_X,TEMP_X,TEMP_Z))
					
					TEMP_Spawner:DropToFloor()
					
					TEMP_Spawner.Reaches = 0
					TEMP_Spawner.CheckTime = CurTime()+math.random(0.3,2)
					
					self:DeleteOnRemove(TEMP_Spawner)
					
					TEMP_Spawner:Fire("kill","",30)
					
					TEMP_Spawner:SetSolid(SOLID_NONE)
					TEMP_Spawner:SetTrigger(false)
				
					local TEMP_RandInd = math.random(1,self.MaxPrior)
					
					
					for N, P in pairs(self.ZedTBL) do
						if(TEMP_RandInd<self.MaxPriorTBL[P]+1) then
							local TEMP_Tr = util.TraceLine( {
								start = TEMP_Spawner:GetPos(),
								endpos = TEMP_Spawner:GetPos()+Vector(0,0,self.HullTBL[P].Z),
								filter = {TEMP_Spawner},
								mask = MASK_NPCSOLID
							} )
							
							if(!TEMP_Tr.Hit) then
								local TEMP_Tr = util.TraceHull( {
									start = TEMP_Spawner:GetPos(),
									endpos = TEMP_Spawner:GetPos(),
									mins = Vector(-self.HullTBL[P].X,-self.HullTBL[P].Y,0),
									maxs = Vector(self.HullTBL[P].X,self.HullTBL[P].Y,self.HullTBL[P].Z),
									filter = {TEMP_Spawner},
									mask = MASK_NPCSOLID
								} )
								
								if(!TEMP_Tr.Hit) then
									local TEMP_NoSpawnHere = false
									
									local TEMP_ENTs = ents.FindInSphere(TEMP_Spawner:GetPos(),200)
									
									if(#TEMP_ENTs>0) then
										for E=1, #TEMP_ENTs do
											if(TEMP_ENTs[E]:GetClass()=="trigger_hurt") then
												TEMP_NoSpawnHere = true
											end
										end
									end
									
									
									if(TEMP_NoSpawnHere==false) then
										local TEMP_Zed = ents.Create(self.ZedTBL[N])
										TEMP_Zed:SetPos(TEMP_Spawner:GetPos())
										TEMP_Zed:SetAngles(TEMP_Spawner:GetAngles())
										TEMP_Zed:Spawn()
										TEMP_Zed:SetNoDraw(false)
									 
										if TEMP_ZedCount < TEMP_MaxZeds and math.random(1,5) == 1 then
											sound.Add( {
												name = "ZombieComing",
												channel = CHAN_AUTO,
												volume = 1.0,
												level = 100,
												pitch = 100,
												sound = {"cszom/zombi_coming_1.wav","cszom/zombi_coming_2.wav"} 
											} )
											self:EmitSound( "ZombieComing" ) 
										end
										TEMP_Zed.Reaches = 0
										
										TEMP_Zed.KFNPCThinkAnyway = function()
											
											local TEMP_Reach = false
											
											if(#player.GetAll()>0) then
												for P=1, #player.GetAll() do
													local TEMP_Ply = player.GetAll()[P]
													
													if(TEMP_Zed:Visible(TEMP_Ply)||
														TEMP_Ply:Visible(TEMP_Zed)) then
														TEMP_Zed:SetNoDraw(false)
														
														TEMP_Zed.KFNPCThinkAnyway = function() end
														return
													else
														if(!TEMP_Zed:IsUnreachable(TEMP_Ply)) then
															TEMP_Reach = true
														end
													end
												end
											end
											
											if(TEMP_Reach==true) then
												TEMP_Zed.Reaches = TEMP_Zed.Reaches+1
											else
												TEMP_Zed.Reaches = TEMP_Zed.Reaches-1
											end
											
											if(TEMP_Zed.Reaches<-3) then
												TEMP_Zed:Remove()
											elseif(TEMP_Zed.Reaches>5) then
												TEMP_Zed.KFNPCThinkAnyway = function() end
												TEMP_Zed:SetNoDraw(false)
											end

										end
										
										if(self.IgnorePVS==false) then
											local TEMP_Fail = false
											local TEMP_FailNav = true
											
											if(#player.GetAll()>0) then
												for P=1, #player.GetAll() do
													local TEMP_Ply = player.GetAll()[P]
													
													if(TEMP_Spawner:Visible(TEMP_Ply)||
													TEMP_Ply:Visible(TEMP_Spawner)||
													TEMP_Ply:VisibleVec(TEMP_Spawner:GetPos()+Vector(0,0,TEMP_Z))||
													TEMP_Ply:VisibleVec(TEMP_Spawner:GetPos()+Vector(0,0,TEMP_Z/2))) then
														TEMP_Fail = true
													else
														if(!TEMP_Zed:IsUnreachable(TEMP_Ply)) then
															TEMP_FailNav = false
														end
													end
												end
											end
											
											if(TEMP_Fail==true||TEMP_FailNav==true) then
												TEMP_Zed:Remove()
											else
												if(self.Limit!=nil) then
													self.Limit = self.Limit-1
													
													if(self.Limit<1) then
														self:Remove()
													end
												end
											end
										end
									end
								end
							end
						end
					end
						
					TEMP_Spawner:Remove()
				end
			end
		end
	end
end

function ENT:OnRemove()
	timer.Remove("CSNEXONStartInit"..tostring(self))
	self:StopSound( "ZombieComing" )  
	self:StopSound( "ZombieComing_ambient" ) 
	
end