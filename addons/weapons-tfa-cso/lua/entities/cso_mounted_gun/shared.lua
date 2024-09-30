ENT.Type = "anim"
ENT.PrintName			= "CSO Mounted Gun"
ENT.Author			= "Meika"
ENT.Contact			= ""
ENT.Purpose			= ""
ENT.Instructions			= ""
ENT.DoNotDuplicate = true 
ENT.DisableDuplicator = true
ENT.PrintName = "Mounted Machine Gun"
ENT.Category = "TFA CS:O"
ENT.Spawnable = false

/*---------------------------------------------------------
OnRemove
---------------------------------------------------------*/
function ENT:OnRemove()
end

/*---------------------------------------------------------
PhysicsUpdate
---------------------------------------------------------*/
function ENT:PhysicsUpdate()
end

/*---------------------------------------------------------
PhysicsCollide
---------------------------------------------------------*/

function ENT:PhysicsCollide(data,phys)
	
end
