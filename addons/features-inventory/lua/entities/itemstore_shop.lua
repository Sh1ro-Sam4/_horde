
-----------------------------------------------------
AddCSLuaFile()

ENT.Type = "anim"
ENT.RenderGroup = RENDERGROUP_TRANSLUCENT

ENT.PrintName = "Ларек"
ENT.Category = "SHZ | ItemStore"

ENT.Spawnable = true
ENT.AdminOnly = false

ENT.IsShop = true

function ENT:SetupDataTables()
	self:NetworkVar( "Entity", 0, "owning_ent" )
end

if SERVER then
	function ENT:SpawnFunction( pl, trace, class )
		local ent = ents.Create( class )
		ent:SetPos( trace.HitPos + trace.HitNormal * 16 )
		ent:Setowning_ent( pl )
		ent:Spawn()

		return ent
	end

	function ENT:Initialize()
	if IsValid(self:Getowning_ent()) then
		self:CPPISetOwner(self:Getowning_ent())
	end
		self:SetModel( "models/props_c17/display_cooler01a.mdl" )

		self:PhysicsInit( SOLID_VPHYSICS )
		self:SetMoveType( MOVETYPE_VPHYSICS )
		self:SetSolid( SOLID_VPHYSICS )
		self:SetUseType( SIMPLE_USE )

		self:GetPhysicsObject():Wake()

		self.Container = itemstore.Container( unpack( itemstore.config.ShopSize ) )

		self.Container:AddCallback( "read", function( con, pl )
			return pl:GetPos():Distance( self:GetPos() ) < 250
		end )

		self.Container:AddCallback( "write", function( to_con, pl, action, from_con, from_slot, from_item, to_slot, to_item )
			if self:Getowning_ent() ~= pl then return false end

			if action == "move" and from_item then
				net.Start( "ItemStorePriceShopItem" )
					net.WriteEntity( self )
					net.WriteUInt( to_slot, 16 )
				net.Send( pl )
			end

			return true
		end )
	end

	function ENT:Use( pl )
		self.Container:Sync( pl )

		if self:Getowning_ent() == pl then
			pl:OpenContainer( self.Container:GetID(), "Ларек" )
		else
			net.Start( "ItemStoreOpenShop" )
				net.WriteEntity( self )
				net.WriteUInt( self.Container:GetID(), 32 )
			net.Send( pl )
		end
	end

	function ENT:PriceItem( pl, slot, price )
		if pl ~= self:Getowning_ent() then return end

		local item = self.Container:GetItem( slot )
		if not IsValid( item ) then return end

		item:SetData( "ShopPrice", price )
	end

	function ENT:OnRemove()
		self.Container:Remove()
	end
else
function ENT:Draw()
	self:DrawModel()
    	local pos = self:GetPos() + Vector(0, 0, 1) * math.sin(CurTime() * 1) * 1
    local PlayersAngle = LocalPlayer():GetAngles()
    local ang = Angle( 0, PlayersAngle.y - 180, 0 )
    ang:RotateAroundAxis(ang:Right(), -90)
    ang:RotateAroundAxis(ang:Up(), 90)
	
	if LocalPlayer():GetPos():Distance(self:GetPos()) < 200 then
	cam.Start3D2D(pos + ang:Up() * -10 + ang:Right() * -70, ang, 0.1)
		draw.SimpleTextOutlined("Ларек", "font.120", 0, 0, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP, 0, Color(0, 0, 0))
        draw.SimpleTextOutlined(self:Getowning_ent():Name(), "font.120",0, 90, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP, 0, Color(0, 0, 0))					
	cam.End3D2D()
 end

end

end