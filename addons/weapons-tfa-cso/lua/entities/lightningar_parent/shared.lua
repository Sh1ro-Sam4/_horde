ENT.Type = "anim"
ENT.PrintName			= ""
ENT.Author			= ""
ENT.Contact			= ""
ENT.Purpose			= ""
ENT.Instructions			= ""
ENT.Spawnable			= false
ENT.AdminOnly = true 
ENT.DoNotDuplicate = true 
ENT.DisableDuplicator = true

if SERVER then

AddCSLuaFile( "shared.lua" )

function ENT:Initialize()

	self.Entity:SetModel("models/maxofs2d/hover_classic.mdl")
	self.Entity:PhysicsInit( SOLID_VPHYSICS )  
	self.Entity:SetMoveType( MOVETYPE_VPHYSICS ) --the way it was
	self.Entity:SetSolid( SOLID_VPHYSICS )
	self.Entity:DrawShadow( false )
	self.Entity:SetCollisionGroup( COLLISION_GROUP_WEAPON )
	self.Entity:SetRenderMode( RENDERMODE_TRANSALPHA )
	self.Entity:SetColor( Color(0,0,0,0) ) --fix this later
	self.Owner = self.Entity.Owner
	if self.Big then
		self.timeleft = CurTime() + 1
	else
		self.timeleft = CurTime() + 1
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
	
end
	
end


