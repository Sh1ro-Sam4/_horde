local Player = FindMetaTable('Player')
local Entity = FindMetaTable('Entity')

function Entity:IsValidPlayer()
    return self and self:IsValid() and self:IsPlayer() and not self:IsBot()
end

function Player:isFemale()
	if !self:IsPlayer() then return false end
	if string.match(self:GetModel(),"female") || string.match(self:GetModel(),"alyx") || string.match(self:GetModel(),"mossman") then
		return true
	else
		return false
	end
end