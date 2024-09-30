
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

AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

ENT.BackToOwner = false
ENT.BackTime = 0
ENT.LockedTarget = nil
ENT.RemoveDelay = 0
ENT.LockedOnTarget = false
ENT.DamageIncrease = 4
ENT.DamageInterval = 0
ENT.MidVec = Vector(0, 0, 0)
ENT.LastPos = Vector(0, 0, 0)
ENT.MidPos = Vector(0, 0, 0)

function ENT:Initialize()
    self:SetModel("models/weapons/tfa_cso/guilotine_projectile.mdl")
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)
    self:SetModelScale(2, 0)
    local phys = self:GetPhysicsObject()
    if(IsValid(phys)) then
        phys:Wake()
        phys:SetMass(10)
		phys:EnableDrag(false)
        phys:EnableGravity(false)
    end
    self:SetCollisionGroup(1)
    self.BackTime = CurTime() + 0.7
end

function ENT:Think()
    local owner = self:GetOwner()
    if(!IsValid(owner)) then self:Remove() end
    if(self.BackTime < CurTime()) then
        self.BackToOwner = true
    end
    owner.AllowedToShoot = false
    self.LastPos = self:GetPos()
    local dst = owner:EyePos():Distance(self:GetPos()) -- Fucking hell    https://imgur.com/jgNAQRX
    local mAng = (self:GetPos() - self.LastPos):Angle()
    local mVec = self.LastPos + (mAng:Forward() * (self.LastPos:Distance(self:GetPos()) / 2))
    self.MidVec = mVec
    if(self.BackToOwner && !IsValid(self.LockedTarget)) then
        self:SetVelocity(self:GetVelocity() * -1)
        local vAngle = (owner:EyePos() - self:GetPos()):Angle()
        self:SetAngles(Angle(vAngle.x, vAngle.y, 0))
        self:SetPos(self:GetPos() + self:GetAngles():Forward() * 80)
        local tr = {
            start = self:GetPos() + Vector(0, 0, 1),
            endpos = owner:GetPos(),
            filter = {self, owner},
            mask = 16395,
        }
        if(util.TraceLine(tr).Fraction != 1) then
            if(util.IsInWorld(self:GetPos()) || util.IsInWorld(mVec) || util.IsInWorld(self.LastPos)) then
                if(self.RemoveDelay < CurTime()) then
                    owner.PlayBreakAnim = true
                    self:Remove()
                end
            end
        end
        if(dst <= 48) then
            owner.PlayBackAnim = true
            local ammos = owner:GetAmmoCount(3)
            owner:SetAmmo(ammos + 1, 3)
            self:Remove()
        end
    end

    if(IsValid(self.LockedTarget)) then
        if(self.BackTime < CurTime()) then
            self.LockedTarget = nil
            self.BackToOwner = true
        else
            self:SetPos(self.LockedTarget:EyePos())
            if(self.DamageInterval < CurTime()) then
                local d = DamageInfo()
                    d:SetDamage(20 + self.DamageIncrease)
                    d:SetDamageType(4)
                    d:SetDamagePosition(self.LockedTarget:EyePos())
                    d:SetAttacker(owner)
                    d:SetInflictor(owner)
                    d:SetDamageForce(Vector(math.random(-16, 16), math.random(-16, 16), 0))
                self.LockedTarget:TakeDamageInfo(d)

                self.DamageIncrease = self.DamageIncrease + 6
                self.DamageInterval = CurTime() + 0.1
            end
            if(self.LockedTarget:IsPlayer() && !self.LockedTarget:Alive()) then
                self.LockedTarget = nil
                self.BackToOwner = true
                self.RemoveDelay = CurTime() + 0.15
            end
        end
    else
        if(self.LockedOnTarget) then
            self.LockedTarget = nil
            self.BackToOwner = true
            self.RemoveDelay = CurTime() + 0.15
        else
         if(self.BackTime < CurTime()) then
                self.BackToOwner = true
                self.LockedTarget = nil
                self.BackToOwner = true
                self.RemoveDelay = CurTime() + 0.15
            end
        end
    end

    if(!self.LockedOnTarget) then
        for k,v in pairs(ents.GetAll()) do
            if(!IsValid(v)) then continue end
            if(!v:IsNPC() && !v:IsPlayer()) then continue end
            if(v:Health() <= 0) then continue end
            if(v == owner) then continue end
            local iX, mX = v:GetCollisionBounds()
            local Top = v:GetPos() + Vector(0, 0, mX.z)
            local Mid = v:GetPos() + Vector(0, 0, mX.z / 2)
            local Und = v:GetPos()
            if(self:GetPos():Distance(Top) > 32 && self:GetPos():Distance(Mid) > 32 && self:GetPos():Distance(Und) > 32) then continue end -- Check multiple position for better hitscan
            if(v.LastHitTime != nil && v.LastHitTime >= CurTime()) then continue end -- Prevent multiple hit
            v.LastHitTime = CurTime() + 0.15
            local d = DamageInfo()
                d:SetDamage(300)
                d:SetDamageType(4)
                d:SetDamagePosition(v:GetPos())
                d:SetAttacker(owner)
                d:SetInflictor(owner)
                d:SetDamageForce(Vector(math.random(-16, 16), math.random(-16, 16), 0))
            v:TakeDamageInfo(d)
            if(self:GetPos():Distance(v:EyePos()) > 24) then continue end
                self.LockedTarget = v
                self.BackTime = CurTime() + 6
                self.LockedOnTarget = true
        end
        for k,v in pairs(ents.GetAll()) do
            if(!IsValid(v)) then continue end
            if(!v:IsNPC() && !v:IsPlayer()) then continue end
            if(v:Health() <= 0) then continue end
            if(v == owner) then continue end
            local iX, mX = v:GetCollisionBounds()
            local Top = v:GetPos() + Vector(0, 0, mX.z)
            local Mid = v:GetPos() + Vector(0, 0, mX.z / 2)
            local Und = v:GetPos()
            if(self.MidVec:Distance(Top) > 32 && self.MidVec:Distance(Mid) > 32 && self.MidVec:Distance(Und) > 32) then continue end -- Check multiple position for better hitscan
            if(v.LastHitTime != nil && v.LastHitTime >= CurTime()) then continue end -- Prevent multiple hit
            v.LastHitTime = CurTime() + 0.15
            local d = DamageInfo()
                d:SetDamage(300)
                d:SetDamageType(4)
                d:SetDamagePosition(v:GetPos())
                d:SetAttacker(owner)
                d:SetInflictor(owner)
                d:SetDamageForce(Vector(math.random(-16, 16), math.random(-16, 16), 0))
            v:TakeDamageInfo(d)
            if(self.MidVec:Distance(v:EyePos()) > 10) then continue end
                self.LockedTarget = v
                self.BackTime = CurTime() + 6
                self.LockedOnTarget = true
        end

    end

    self:NextThink(CurTime())
    return true
end

function ENT:PhysicsCollide(data, collider)
    local hEnt = data.HitEntity
    local hPos = data.HitPos
    if(hEnt:IsWorld()) then
        if(self.BackToOwner) then
            if(self.RemoveDelay < CurTime()) then
                self:Remove()
            end
        else
            self.RemoveDelay = CurTime() + 0.15
            self.BackToOwner = true
        end
    end
end

function ENT:OnRemove()
    if(IsValid(self:GetOwner())) then
        self:GetOwner().AllowedToShoot = true
    end
end