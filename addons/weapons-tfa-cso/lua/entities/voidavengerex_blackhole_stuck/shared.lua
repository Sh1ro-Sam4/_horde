
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
ENT.PrintName = "Sawblade"
ENT.Author = ""
ENT.Contact = ""
ENT.Purpose = ""
ENT.Instructions = ""
ENT.DoNotDuplicate = true
ENT.DisableDuplicator = true

ENT.glitchthreshold = 24 --threshold distance from bone to reset pos

ENT.Hull = 1.5 --Expand hull to make it easier to grab
ENT.PredictCL = false
ENT.UseMod = false --Experimentally modify the parent's Use func

local cv_al = GetConVar("sv_tfa_arrow_lifetime")
local nzombies

local function GetBoneCenter(ent, bone)
	local bonechildren = ent:GetChildBones(bone)

	if #bonechildren <= 0 then
		return ent:GetBonePosition(bone)
	else
		local bonepos = ent:GetBonePosition(bone)
		local tmppos = bonepos

		if tmppos then
			for i = 1, #bonechildren do
				local childpos = ent:GetBonePosition(bonechildren[i])

				if childpos then
					tmppos = (tmppos + childpos) / 2
				end
			end
		else
			return ent:GetPos()
		end

		return tmppos
	end
end

function ENT:Initialize()
	if ( CLIENT ) then return end
	self.ExplodeTimeOffset = 5
	self.ExplodeTime = CurTime() + self.ExplodeTimeOffset
	self.BeginExplosion = CurTime() + 1
	self:SetModel( "models/hunter/misc/sphere075x075.mdl" )
	self:PhysicsInit( SOLID_VPHYSICS )
	self:SetMoveType( MOVETYPE_VPHYSICS )
	self:SetSolid( SOLID_VPHYSICS )
	self:DrawShadow(false)
	self:SetModelScale(0.8, 0)
	self.Scale = 0
	self.DelayBetweenEffects = 0.5
	self:EmitSound("weapons/tfa_cso/voidpistol/blackhole_start.wav", 360 )
	local phys = self:GetPhysicsObject()
	if (phys:IsValid()) then
			phys:Wake()
			phys:SetMass(2)
			phys:EnableGravity(false)
			phys:EnableCollisions(false)
	end

	local tr = util.TraceLine({self:GetPos(), self:GetPos() + Vector(0,0,100000000), self})
	if tr.HitSky then

	end
	if nzombies == nil then
		nzombies = nZombies or NZ or NZombies or engine.ActiveGamemode() == "nzombies"
	end

	local mdl = self:GetModel()

	if not mdl or mdl == "" or mdl == "models/error.mdl" then
		self:SetModel("models/weapons/w_tfa_arrow.mdl")
	end

	if SERVER then

	   local owner = self.Owner
       
		local mins = (self:OBBMins() and self:OBBMins() or Vector(0, 0, 0)) - Vector(1, 1, 1)
		local maxs = (self:OBBMaxs() and self:OBBMaxs() or Vector(0, 0, 0)) + Vector(1, 1, 1)
		self:PhysicsInitBox(mins * self.Hull, maxs * self.Hull)
		--self:PhysicsInit( SOLID_VPHYSICS )
		--self:SetSolid( SOLID_VPHYSICS )
		self:SetMoveType( MOVETYPE_VPHYSICS )
		local phys = self:GetPhysicsObject()

		if (phys:IsValid()) then
			phys:Wake()
			phys:SetMass(2)
			phys:EnableGravity(false)
			phys:EnableCollisions(false)
		end

		if self.SetUseType then
			self:SetUseType(SIMPLE_USE)
		end

		if cv_al:GetInt() ~= -1 then
			timer.Simple( cv_al:GetFloat(), function()
				if IsValid(self) then
					self:Remove()
				end
			end)
		end

		self:SetUseType( SIMPLE_USE )
	end

	if SERVER then
		self:TargetEnt( true )
	end

	if CLIENT then
		self:SetPredictable(false)
	end

	if (self:GetModel() and self:GetModel() == "") then
		self:SetModel("models/weapons/w_tfa_arrow.mdl")
	end

	self:SetCollisionGroup(COLLISION_GROUP_WEAPON)

	self:DrawShadow(false)
end

function ENT:TargetEnt( init )
	if self.targent and IsValid(self.targent) then
		if init then
			local ent, bone, bonepos, bonerot
			ent = self.targent
			bone = self.targent:TranslatePhysBoneToBone(self.targphysbone)
			self.targbone = bone

			if not ent:GetBoneCount() or ent:GetBoneCount() <= 1 or string.find(ent:GetModel(), "door") then
				bonepos = ent:GetPos()
				bonerot = ent:GetAngles()
				self.enthasbones = false
			else
				if ent.SetupBones then
					ent:SetupBones( )
				end

				bonepos, bonerot = ent:GetBonePosition(bone)
				self.enthasbones = true
			end

end
end
end

function ENT:Think()
	if CLIENT and not self.PredictCL then return end
	if IsValid(self.targent) and self.targent.Health and self.targent:Health() <= 0 and self.targent.GetRagdollEntity then
		local rag = self.targent:GetRagdollEntity()
		if IsValid(rag) then
			self.targent = rag
			self:TargetEnt( false )
		end
	end
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
	if SERVER and not self.HTE then
		self:TargetEnt( true )
	end
	
	self:NextThink(CurTime())
	if CLIENT then return end
		if CurTime() > (self.BeginExplosion ) then

self:EmitSound("weapons/tfa_cso/voidpistol/blackhole_idle.wav", 360 )
			
			for k,v in pairs(ents.FindInSphere(self:GetPos(), 360)) do
				if v:IsPlayer() == true or v:IsNPC() == true then
					v:SetVelocity(((self:GetPos() - v:GetPos()) * 25))
				end
				if v:GetPhysicsObject():IsValid() then
					local phys = v:GetPhysicsObject()
					phys:ApplyForceCenter(((self:GetPos() - v:GetPos()) * v:GetPhysicsObject():GetMass() * 25) * self:GetModelScale())
					if v:GetClass() == "prop_ragdoll" then
						for i=0, v:GetPhysicsObjectCount() - 1 do
							v:GetPhysicsObjectNum(i):EnableGravity(true)
							phys:ApplyForceCenter(((self:GetPos() - v:GetPos()) * v:GetPhysicsObject():GetMass() * 25) * self:GetModelScale())
						end
					end
				end
			end
		

		if self.Scale == 1 then
			self:SetModelScale(1)
			self.Scale = 1
		end
		if CurTime() > self.ExplodeTime then

			self:SetModelScale(1)

			if self:GetModelScale() <= 0.05 then

				for k,v in pairs(ents.FindInSphere(self:GetPos(), 360)) do
					if v:GetClass() == "prop_ragdoll" then
						for i=0, v:GetPhysicsObjectCount() - 1 do
							v:GetPhysicsObjectNum(i):EnableGravity(true)
						end
					end
				end
				for k,v in pairs(ents.FindInSphere(self:GetPos(), 360)) do

					if v:GetPhysicsObject():IsValid() then
						local phys = v:GetPhysicsObject()
						phys:ApplyForceCenter(((v:GetPos()) - self:GetPos() * v:GetPhysicsObject():GetMass() * 180))
						if v:GetClass() == "prop_ragdoll" then
							for i=0, v:GetPhysicsObjectCount() - 1 do
								phys:ApplyForceCenter(((v:GetPos() - self:GetPos()) * v:GetPhysicsObject():GetMass() * 240))
							end
						end
					end
				end
			end
			
				self:Explode()

			end
		end
		self:NextThink(CurTime() + .1)

		return true
end

function ENT:Explode()
		local owent = self.Owner and self.Owner or self
		util.BlastDamage(self,owent,self:GetPos(),256,750)
		local fx = EffectData()
		fx:SetOrigin(self:GetPos())
		--fx:SetNormal(data.HitNormal)
		util.Effect("exp_voidpistolex",fx)
		self:Remove()

end
