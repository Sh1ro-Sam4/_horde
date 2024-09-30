ENT.Type = "anim"
ENT.RenderGroup = RENDERGROUP_TRANSLUCENT

function ENT:SetItem( item )
	self.Item = item

	if SERVER then
		self:Sync()
	end
end

function ENT:GetItem()
	return self.Item
end

if SERVER then
	AddCSLuaFile()

	function ENT:Initialize()
		local item = self:GetItem()
		if not item then self:Remove() end

		self:SetModel( item:GetModel() )

		self:PhysicsInit( SOLID_VPHYSICS )
		self:SetSolid( SOLID_VPHYSICS )
		self:SetMoveType( MOVETYPE_VPHYSICS )
		self:SetCollisionGroup( COLLISION_GROUP_WEAPON )
		self:SetUseType( SIMPLE_USE )

		self:SetColor( item:GetColor() or color_white )
		self:SetMaterial( item:GetMaterial() )

		local phys = self:GetPhysicsObject()
		if not IsValid( phys ) then
			self:PhysicsInitSphere( 16, "default" )
			phys = self:GetPhysicsObject()
		end

		phys:Wake()
	end

	function ENT:Use( pl )
		if not IsValid( pl ) then return end

		local item = self:GetItem()
		if not item then return end

		if pl.Inventory:AddItem( item ) then
			pl:EmitSound( "items/itempickup.wav" )
			self:Remove()
		else
			pl:SendError( "Your inventory is full." )
		end
	end

	function ENT:Sync( pl )
		local item = self:GetItem()
		if not item then return end

		net.Start( "ItemStoreSyncItem" )
			net.WriteEntity( self )
			net.WriteString( item.Class )
			net.WriteTable( item.Data )
		net.Send( pl or player.GetAll() )
	end

	util.AddNetworkString( "ItemStoreSyncItem" )
	net.Receive( "ItemStoreSyncItem", function( len, pl )
		local ent = net.ReadEntity()
		if not IsValid( ent ) then return end

		ent:Sync( pl )
	end )
else
	function ENT:Initialize()
		net.Start( "ItemStoreSyncItem" )
			net.WriteEntity( self )
		net.SendToServer()
	end

	function ENT:DrawTranslucent()
		local item = self:GetItem()
		if not item then return end

		item:PreRender( self )
			self:DrawModel()
		item:PostRender( self )
	end

	net.Receive( "ItemStoreSyncItem", function()
		local ent = net.ReadEntity()
		
		if not IsValid( ent ) then return end
		if not ent.SetItem then return end

		local class = net.ReadString()
		local data = net.ReadTable()

		ent:SetItem( itemstore.Item( class, data ) )
	end )
end
