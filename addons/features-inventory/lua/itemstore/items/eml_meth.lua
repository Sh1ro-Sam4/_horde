ITEM.Name = 'Мет (1 грамм)'
ITEM.Model = 'models/zerochain/props_methlab/zmlab2_bag.mdl'
ITEM.Base = 'base_darkrp'
ITEM.HighlightColor = itemstore.config.HighlightColours.EML
ITEM.Stackable = true
ITEM.MaxStack = math.huge

function ITEM:SaveData( ent )
    self:SetAmount(ent:GetNW2Int('amount'))
    self:SetData('owner', ent:CPPIGetOwner())
end

function ITEM:LoadData( ent )
    ent:CPPISetOwner(self:GetData('owner'))
    ent:SetNW2Int('amount', self:GetAmount())
end