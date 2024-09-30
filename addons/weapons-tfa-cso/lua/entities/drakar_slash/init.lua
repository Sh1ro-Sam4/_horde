
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

AddCSLuaFile("cl_init.lua") -- Make sure clientside
AddCSLuaFile("shared.lua") -- and shared scripts are sent.
include("shared.lua")

ENT.DieTime = 0
ENT.iAlpha = 255

function ENT:Initialize()
	self.DieTime = CurTime() + 0.25
	self:SetRenderMode(RENDERGROUP_TRANSLUCENT)
	self:DrawShadow(false)
end

function ENT:Think()
	self:SetPos(self:GetPos() + self:GetAngles():Forward() * 50)
	if(self.DieTime < CurTime()) then
		self.iAlpha = math.Clamp(self.iAlpha - 25, 0, 255)
		if(self.iAlpha <= 0) then
			self:Remove()
		end
		self:SetColor(Color(255, 255, 255, self.iAlpha))
	end
	self:NextThink(CurTime())
	return true
end