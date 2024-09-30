if SERVER then
	AddCSLuaFile()
end

SWEP.PrintName = "Инвентарь"

SWEP.Purpose = "Собираем вещи"
SWEP.Instructions = "ПКМ, Забрать предмет. ЛКМ, Открыть инвентарь"
SWEP.Category = "RolePlay"

SWEP.Spawnable = true
SWEP.AdminSpawnable = true
SWEP.ViewModel = "models/props_c17/SuitCase_Passenger_Physics.mdl"
SWEP.WorldModel = "models/props_c17/SuitCase_Passenger_Physics.mdl"
SWEP.UseHands = true

SWEP.Primary.Clipsize = -1
SWEP.Primary.DefaultClip = -1
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "none"

SWEP.Secondary.Clipsize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = "none"

SWEP.Slot               = 1
SWEP.SlotPos 			= 10
SWEP.DrawAmmo           = false
SWEP.DrawCrosshair      = true

function SWEP:Initialize()
	self:SetHoldType( "normal" )
end

function SWEP:OnDrop()
	self:Remove()
end

local nodos = {Angle(0, 0, -180)}
function SWEP:DrawWorldModel()
    local entOwner = self:GetOwner()

    if not entOwner:IsValid() then
        self:SetRenderOrigin()
        self:SetRenderAngles()
        self:DrawModel()

        return
    end

    self:RemoveEffects(EF_BONEMERGE_FASTCULL)
    self:RemoveEffects(EF_BONEMERGE)
    local iHandBone = entOwner:LookupBone("ValveBiped.Bip01_R_Hand")
    if not iHandBone then return end
    local vecBone, angBone = entOwner:GetBonePosition(iHandBone)

        local forward = angBone:Forward()
        angBone:RotateAroundAxis(forward, 90)
        local right = angBone:Right()
        angBone:RotateAroundAxis(right, -90)
        local up = angBone:Up()
        angBone:RotateAroundAxis(up, 90)
        vecBone:Sub(angBone:Up() * -3.9)
        vecBone:Sub(angBone:Right() * 0.7)
        vecBone:Sub(angBone:Forward() * 1)

    self:SetRenderOrigin(vecBone)
    self:SetRenderAngles(angBone + nodos[1])
    self:DrawModel()
end

function SWEP:PrimaryAttack()
	if CLIENT then return end

	self.Owner:PickupItem()
end

function SWEP:SecondaryAttack()
	if CLIENT then return end

	self.Owner:OpenContainer( self.Owner.Inventory:GetID(),
		itemstore.Translate( "inventory" ), true )
end

function SWEP:GetViewModelPosition( pos, ang )
    pos = pos + ang:Right() * 9 + ang:Forward() * 25 + ang:Up() * -9

    ang:RotateAroundAxis( ang:Right(), 0 )
    ang:RotateAroundAxis( ang:Up(), 70 )


    return pos, ang
end