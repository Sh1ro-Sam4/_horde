
-- Copyright (c) 2018 TFA Base Devs

-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:

-- The above copyright notice and this permission notice shall be included in all
-- copies or substantial portions of the Software.

-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
-- SOFTWARE.

ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "TFBow Arrow Stuck"
ENT.Author = "TheForgottenArchitect"
ENT.Contact = "Don't"
ENT.Purpose = "Arrow Entity"
ENT.Instructions = "Arrow that's stuck in ground"
ENT.Hull = 32 --Expand hull to make it easier to grab

local cv_al = GetConVar("sv_tfa_arrow_lifetime")
function ENT:Initialize()
    if SERVER then
      local owner = self.Owner
        self.Entity:SetModel("models/weapons/tfa_cso/thanatos7_scythe.mdl")
		self:DrawShadow(true)
		self:SetCollisionGroup(COLLISION_GROUP_PROJECTILE)
        self:PhysicsInit(SOLID_VPHYSICS)
        self:SetMoveType(MOVETYPE_VPHYSICS)
        self:SetSolid(SOLID_VPHYSICS)
        local phys = self:GetPhysicsObject()

		if (phys:IsValid()) then
			phys:Wake()
			phys:SetMass(2)
			phys:EnableGravity(false)
			phys:EnableCollisions(false)
		end

       
    end

    if (self:GetModel() and self:GetModel() == "") then
        self:SetModel("models/weapons/tfa_cso/thanatos7_scythe.mdl")
    end
	if self.Slash then
		self.timeleft = CurTime() + 8
	else
		self.timeleft = CurTime() + 8
	end
	self.CanTool = false
    self.PhysicsCollide = function() end
    self:SetCollisionGroup(COLLISION_GROUP_PROJECTILE)
    local phys = self:GetPhysicsObject()

    if (phys:IsValid()) then
        phys:Sleep()
    end
end

function ENT:Think()
	if CLIENT and not self.PredictCL then return end
	if IsValid(self.targent) and self.targent.Health and self.targent:Health() <= 0 and self.targent.GetRagdollEntity then
		local rag = self.targent:GetRagdollEntity()
	end
	if not IsValid(self) then return end
	if not IsValid(self.Entity) then return end

	
	if self.timeleft < CurTime() then
		self.Entity:Remove()
	end

	self:MakeSlash()
	self.Entity:NextThink( CurTime() )
	local par = self:GetParent()
	if IsValid(par) and self.UseMod and not par.HasUseMod then
		par.HasUseMod = true
		par.ArrowUseOld = par.ArrowUseOld or par.Use
		par.Use = function( parent, ... )
			print(parent)
			for _,v in pairs( par:GetChildren() ) do
				if v.Use then v:Use(...) end
			end
			parent:Use( ... )
		end
		par:SetUseType( SIMPLE_USE )
	end
	self:NextThink(CurTime())
	return true
end

function ENT:MakeSlash()

	local pos = self.PosToKeep
	if pos == nil then pos = self.Entity:GetPos()end
	local damage = 50
	local radius = 86
	local owner = self.Owner and self.Owner or self 
	
	if self.Slash then
		radius = 86
		damage = 50
	end

	local slashover
	if IsValid(self) then 
		if IsValid(self.Owner) then 
			slashover = self.Owner
		elseif IsValid(self.Entity) then
			slashover = self.Entity
		end 
	end
	if not IsValid(slashover) then return end
	
	util.BlastDamage(self, slashover, pos, radius, damage)
end