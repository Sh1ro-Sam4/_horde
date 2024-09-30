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
	self.CanTool = false

	self.Entity:SetModel("models/items/ar2_grenade.mdl")
	util.SpriteTrail(self, 0, Color(100,175,0), false, 7, 1, 0.5, 0.125, "trails/smoke.vmt")	
	self.Entity:PhysicsInit( SOLID_VPHYSICS )
	self.Entity:SetMoveType( MOVETYPE_VPHYSICS )
	self.Entity:SetSolid( SOLID_VPHYSICS )
	self.Entity:DrawShadow( false )
	
	self.backflightvector = self.Entity:GetForward() * (-5)
	
	local phys = self.Entity:GetPhysicsObject()
	if (phys:IsValid()) then
	phys:SetMass(4)
	phys:Wake()
	end
	self:Think()
end

 function ENT:Think()
	
	if not IsValid(self) then return end
	if not IsValid(self.Entity) then return end

	self.Entity:NextThink( CurTime() )
	return true
end

/*---------------------------------------------------------
PhysicsCollide
---------------------------------------------------------*/
	function ENT:PhysicsCollide(data, physobj)
		local owent = self.Owner and self.Owner or self
		util.BlastDamage(self,owent,self:GetPos(),self.Radius,self.Damage)
		local fx = EffectData()
		fx:SetOrigin(self:GetPos())
		fx:SetNormal(data.HitNormal)
		util.Effect("exp_m32_venom",fx)
		self:Remove()
		self:BreakVial()
	end

function ENT:BreakVial()

	if not IsValid(self.Owner) then
		self.Entity:Remove()
		return
	end

	local pos = self.Entity:GetPos()
	
	if GetConVar("M32MGLVenomGas") == nil or GetConVar("M32MGLVenomGas"):GetBool() then
	
		local poison = ents.Create("m32_venom_nade_gas")
		poison:SetPos(pos )
		poison:SetOwner(self.Owner)
		poison.Owner = self.Owner
		poison.Big = false
		poison.PosToKeep = pos
		poison:Spawn()
		
	else
	
		local painParent = ents.Create("m32_venom_parent")
		painParent:SetPos(pos)
		painParent:SetOwner(self.Owner)
		painParent.Owner = self.Owner
		painParent:Spawn()
		painParent.Big = false
	
		local hurt1 = ents.Create("POINT_HURT")
		hurt1:SetPos(pos)
		hurt1:SetKeyValue("DamageRadius", 100)
		hurt1:SetKeyValue("DamageType", 262144)
		hurt1:SetKeyValue("Damage", 1)
		hurt1:Fire("TurnOn", "", 0)
		hurt1:Fire ( "Kill" , "", 17 )
		hurt1:SetParent(painParent)
		hurt1:Spawn()
	
		local hurt2 = ents.Create("POINT_HURT")
		hurt2:SetPos(pos)
		hurt2:SetKeyValue("DamageRadius", 150)
		hurt2:SetKeyValue("DamageType", 262144)
		hurt2:SetKeyValue("Damage", 1)
		hurt2:Fire("TurnOn", "", 0)
		hurt2:Fire ( "Kill" , "", 19 )
		hurt2:SetParent(painParent)
		hurt2:Spawn()
		
		
	end
	
	local gas = EffectData()
		gas:SetOrigin(pos)
		gas:SetEntity(self.Owner) //i dunno, just use it!
		gas:SetScale(1)//otherwise you'll get the pinch thing. just leave it as it is for smoke, i'm trying to save on lua files dammit!
	util.Effect("exp_m32_venom_gas", gas)
		
	self.Entity:Remove()

end

/*---------------------------------------------------------
OnTakeDamage
---------------------------------------------------------*/
function ENT:OnTakeDamage( dmginfo )
	if not IsValid(dmginfo) then return end if not IsValid(dmginfo:GetInflictor()) then return end
	if dmginfo:GetInflictor() == "m32_venom_nade_gas" then return end
	self:BreakVial()
end

end

if CLIENT then

 function ENT:Draw()             
 self.Entity:DrawModel()       // Draw the model.   
 end

end