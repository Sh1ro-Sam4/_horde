ITEM.Name = 'ACCESSORY BASE'
ITEM.Model = 'models/error.mdl'
ITEM.Base = 'base_entity'
ITEM.HighlightColor = Color(175,0,190)
ITEM.Stackable = false
ITEM.DropStack = false

function ITEM:GetName()
    local name = self:GetData( 'Name' )

    return name
end

function ITEM:SaveData( ent )
    self:SetData( 'Model', ent:GetModel() )
    self:SetData( 'id', ent:GetID() )
    self:SetData( 'Name', SH_ACC.List[self:GetData( 'id' )].name )
    self.Equip = false
end

function ITEM:LoadData( ent )
    ent.id = self:GetData('id')
    self.Equip = false
end

function ITEM:Use( pl )
    self.Equip = not self.Equip
    SH_ACC:ChangeEquipment(pl, self:GetData('id'), self.Equip)
    return false
end

function ITEM:Destroy( pl, con, slot )
    if pl:SH_HasAccessoryEquipped(self:GetData('id')) then SH_ACC:ChangeEquipment(pl, self:GetData('id'), false) end
end