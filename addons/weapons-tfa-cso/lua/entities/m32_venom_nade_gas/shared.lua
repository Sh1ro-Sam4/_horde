ENT.Type = "anim"
ENT.PrintName			= "M32 Venom Nade"
ENT.Author			= ""
ENT.Contact			= ""
ENT.Purpose			= ""
ENT.Instructions			= ""
ENT.Spawnable			= false
ENT.AdminOnly = true 
ENT.DoNotDuplicate = true 
ENT.DisableDuplicator = true

ENT.MyModel = "models/items/ar2_grenade.mdl"
ENT.MyModelScale = 1
ENT.Damage = 150
ENT.Radius = 128

if SERVER then

AddCSLuaFile( "shared.lua" )

function ENT:Initialize()

	self.Entity:SetModel("models/items/ar2_grenade.mdl")
	self.Entity:PhysicsInit( MOVETYPE_NONE )  
	self.Entity:SetMoveType( MOVETYPE_VPHYSICS ) --the way it was
	self.Entity:SetSolid( SOLID_VPHYSICS )
	self.Entity:DrawShadow( false )
	self.Entity:SetCollisionGroup( COLLISION_GROUP_WEAPON )
	self.Entity:SetRenderMode( RENDERMODE_TRANSALPHA )
	self.Entity:SetColor( Color(0,0,0,0) ) --fix this later
	self.Owner = self.Entity.Owner
	if self.Big then
		self.timeleft = CurTime() + 4
	else
		self.timeleft = CurTime() + 4
	end
	self.CanTool = false
end

function ENT:Think()
	
	if not IsValid(self) then return end
	if not IsValid(self.Entity) then return end

	if not IsValid(self.Owner) then
		self.Entity:Remove()
		return
	end
	
	if self.timeleft < CurTime() then
		self.Entity:Remove()
	end

	self:MakePoison()
	self.Entity:NextThink( CurTime() )
	
end


function ENT:MakePoison()

	local pos = self.PosToKeep
	if pos == nil then pos = self.Entity:GetPos()end
	local damage = 25
	local radius = 128
	
	if self.Big then
		radius = 128
		damage = 25
	end

	local poisonowner
	if IsValid(self) then 
		if IsValid(self.Owner) then 
			poisonowner = self.Owner
		elseif IsValid(self.Entity) then
			poisonowner = self.Entity
		end 
	end
	if not IsValid(poisonowner) then return end
	
	util.BlastDamage(self, poisonowner, pos, radius, damage)
	-- an explosion for making poison. Sure, must be one hell of a nerve agent to light wood on fire
	-- and to shatter windows. Guess i'll just have to deal with it.

end
	
end