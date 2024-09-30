ENT.Type = "ai"
ENT.Base = "base_ai"
ENT.RenderGroup = RENDERGROUP_TRANSLUCENT

ENT.PrintName = "NPC Shop"
ENT.Category = "SHZ | ItemStore"

ENT.Spawnable = true
ENT.AdminOnly = true

ENT.AutomaticFrameAdvance = true

ENT.IsShop = true

function ENT:SetupDataTables()
	self:NetworkVar( "String", 0, "Title" )
end

function ENT:Think()
	self:NextThink( CurTime() )
	return true
end

if SERVER then
	AddCSLuaFile()

	function ENT:Initialize()
		self:SetModel( "models/Humans/Group03/Female_01.mdl" )

		self:SetMoveType( MOVETYPE_NONE )
		self:SetSolid( SOLID_BBOX )
		self:SetUseType( SIMPLE_USE )
		--self:DropToFloor()

		local min, max = self:GetCollisionBounds()
		self:SetCollisionBounds( Vector( -13, -13, 0 ), max)
		self:ResetSequence( 2 )

		self:SetTitle( "NPC Trader" )

		self.Container = itemstore.Container( unpack( itemstore.config.NPCShopSize ) )

		self.Container:AddCallback( "read", function( con, pl )
			return pl:GetPos():Distance( self:GetPos() ) < 250
		end )

		self.Container:AddCallback( "write", function( to_con, pl, action, from_con, from_slot, from_item, to_slot, to_item )
			if not pl:IsAdmin() then return false end

			if action == "move" and from_item then
				net.Start( "ItemStorePriceShopItem" )
					net.WriteEntity( self )
					net.WriteUInt( to_slot, 16 )
				net.Send( pl )
			end

			itemstore.shops.Save()

			return true
		end )
	end

	function ENT:AcceptInput( input, activator, caller )
		if input ~= "Use" or not  IsValid( caller ) or not caller:IsPlayer() then return end

		if self.Teams and not table.HasValue( self.Teams, team.GetName( caller:Team() ) ) then
			caller:ChatPrint( "This shop is limited to certain teams only, sorry!" ) return end
		
		self.Container:Sync( caller )

		net.Start( "ItemStoreOpenShop" )
			net.WriteEntity( self )
			net.WriteUInt( self.Container:GetID(), 32 )
		net.Send( caller )
	end

	function ENT:PriceItem( pl, slot, price )
		if not pl:IsAdmin() then return end

		local item = self.Container:GetItem( slot )
		if not IsValid( item ) then return end

		item:SetData( "ShopPrice", price )
	end

	util.AddNetworkString( "ItemStoreRequestShopInfo" )
	net.Receive( "ItemStoreRequestShopInfo", function( len, pl )
		if not pl:IsAdmin() then return end

		local ent = net.ReadEntity()
		if not IsValid( ent ) then return end

		local title = ent:GetTitle()
		local w = ent.Container:GetWidth()
		local h = ent.Container:GetHeight()
		local p = ent.Container:GetPages()
		local model = ent:GetModel()
		local teams = ent.Teams

		net.Start( "ItemStoreRequestShopInfo" )
			net.WriteEntity( ent )
			net.WriteString( title )
			net.WriteUInt( w, 8 )
			net.WriteUInt( h, 8 )
			net.WriteUInt( p, 8 )
			net.WriteString( model )

			net.WriteUInt( teams and #teams or 0, 8 )

			if teams then
				for k, v in ipairs( teams ) do
					net.WriteString( v )
				end
			end
		net.Send( pl )
	end )

	util.AddNetworkString( "ItemStoreEditShop" )
	net.Receive( "ItemStoreEditShop", function( len, pl )
		if not pl:IsAdmin() then return end

		local ent = net.ReadEntity()
		if not IsValid( ent ) then return end

		local title = net.ReadString()
		local w = net.ReadUInt( 8 )
		local h = net.ReadUInt( 8 )
		local p = net.ReadUInt( 8 )
		local model = net.ReadString()
		local teams = {}

		for i = 1, net.ReadUInt( 8 ) do
			teams[ i ] = net.ReadString()
		end

		ent:SetTitle( title )
		ent.Container:SetWidth( w )
		ent.Container:SetHeight( h )
		ent.Container:SetPages( p )
		ent:SetModel( model )
		ent.Teams = #teams > 0 and teams or nil

		itemstore.shops.Save()
	end )
else
	function ENT:DrawTranslucent()
		self:DrawModel()

		local text = self:GetTitle()
		local font = "DermaLarge"

		surface.SetFont( font )
		local textw, texth = surface.GetTextSize( text )
		local w = 5 + textw + 5
		local h = 2 + texth + 2
		local x, y = -w / 2, -h / 2

		cam.Start3D2D( self:GetPos() + self:GetAngles():Up() * 80, Angle( 0, CurTime() * 45, 90 ), 0.35 )
			surface.SetDrawColor( Color( 0, 0, 0, 200 ) )
			surface.DrawRect( x, y, w, h )

			draw.SimpleTextOutlined( text, font, 0, 0, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color( 0, 0, 0 ) )
		cam.End3D2D()
	end

	net.Receive( "ItemStoreRequestShopInfo", function( len, pl )
		local ent = net.ReadEntity()
		if not IsValid( ent ) then return end

		local title = net.ReadString()
		local w = net.ReadUInt( 8 )
		local h = net.ReadUInt( 8 )
		local p = net.ReadUInt( 8 )
		local model = net.ReadString()
		local teams = {}

		for i = 1, net.ReadUInt( 8 ) do
			teams[ i ] = net.ReadString()
		end

		local p = vgui.Create( "ItemStoreShopEditor" )
		p:SetEntity( ent )
		p:SetName( title )
		p:SetWidth( w )
		p:SetHeight( h )
		p:SetPages( p )
		p:SetModel( model )
		p:SetTeams( teams )
		p:Center()
		p:MakePopup()
	end )
end

properties.Add( "edititemstoreshop", {
	MenuLabel = "Edit Shop",
	MenuIcon = "icon16/pencil.png",

	Filter = function( self, ent, pl )
		return pl:IsAdmin() and ent:GetClass() == "itemstore_npc_shop"
	end,

	Action = function( self, ent )
		net.Start( "ItemStoreRequestShopInfo" )
			net.WriteEntity( ent )
		net.SendToServer()
	end
} )