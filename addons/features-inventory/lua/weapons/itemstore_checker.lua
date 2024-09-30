if SERVER then
	AddCSLuaFile()
end

SWEP.PrintName = "Чекер инвенторя"

SWEP.Purpose = "Проверка инвентаря другого игрокаr"
SWEP.Instructions = "ЛКМ, Проверить инвентарь игрока перед вами"
SWEP.Category = "RolePlay"

SWEP.Spawnable = true
SWEP.AdminSpawnable = true
SWEP.ViewModel = "models/weapons/cstrike/c_c4.mdl"
SWEP.WorldModel = ""
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

SWEP.Range = 250

function SWEP:Initialize()
	self:SetHoldType( "normal" )
end

function SWEP:OnDrop()
	self:Remove()
end

function SWEP:PrimaryAttack()
	if CLIENT then return end

	local tr = util.TraceLine{
		start = self.Owner:GetShootPos(),
		endpos = self.Owner:GetShootPos() + self.Owner:GetAimVector() * self.Range,
		filter = self.Owner
	}

	if not tr.Hit then return end
	if not IsValid( tr.Entity ) or not tr.Entity:IsPlayer() then return end

	local inv = tr.Entity.Inventory
	if not inv then return end

	inv:Sync( self.Owner )
	self.Owner:OpenContainer( inv:GetID(), itemstore.Translate( "inventory" ), true )
end

function SWEP:SecondaryAttack()
end
