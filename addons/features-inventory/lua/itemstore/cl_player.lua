local meta = FindMetaTable( "Player" )

function meta:MoveItem( from_con_id, from_slot, to_con_id, to_slot )
	net.Start( "ItemStoreMove" )
		net.WriteUInt( from_con_id, 32 )
		net.WriteUInt( from_slot, 32 )
		net.WriteUInt( to_con_id, 32 )
		net.WriteUInt( to_slot, 32 )
	net.SendToServer()
end

function meta:UseItem( con_id, slot, ... )
	net.Start( "ItemStoreUse" )
		net.WriteUInt( con_id, 32 )
		net.WriteUInt( slot, 32 )
		net.WriteTable( { ... } )
	net.SendToServer()
end

function meta:UseItemWith( from_con_id, from_slot, to_con_id, to_slot )
	net.Start( "ItemStoreUseWith" )
		net.WriteUInt( from_con_id, 32 )
		net.WriteUInt( from_slot, 32 )
		net.WriteUInt( to_con_id, 32 )
		net.WriteUInt( to_slot, 32 )
	net.SendToServer()
end

function meta:DropItem( con_id, slot )
	net.Start( "ItemStoreDrop" )
		net.WriteUInt( con_id, 32 )
		net.WriteUInt( slot, 32 )
	net.SendToServer()
end

function meta:DestroyItem( con_id, slot )
	net.Start( "ItemStoreDestroy" )
		net.WriteUInt( con_id, 32 )
		net.WriteUInt( slot, 32 )
	net.SendToServer()
end

function meta:MergeItem( from_con_id, from_slot, to_con_id, to_slot )
	net.Start( "ItemStoreMerge" )
		net.WriteUInt( from_con_id, 32 )
		net.WriteUInt( from_slot, 32 )
		net.WriteUInt( to_con_id, 32 )
		net.WriteUInt( to_slot, 32 )
	net.SendToServer()
end

function meta:SplitItem( con_id, slot, amount )
	net.Start( "ItemStoreSplit" )
		net.WriteUInt( con_id, 32 )
		net.WriteUInt( slot, 32 )
		net.WriteUInt( amount, 16 )
	net.SendToServer()
end

hook.Add( "InitPostEntity", "ItemStoreRequestInventory", function()
	net.Start( "ItemStoreSyncInventory" ) net.SendToServer()
end )

local ContextInventory

net.Receive( "ItemStoreSyncInventory", function()
	LocalPlayer().InventoryID = net.ReadUInt( 32 )

	if not itemstore.config.ContextInventory then return end

	local inv = vgui.Create( "ItemStoreContainerWindow", g_ContextMenu )
	inv:SetTitle( itemstore.Translate( "inventory" ) )
	inv:SetContainerID( LocalPlayer().InventoryID )
	inv:ShowCloseButton( false )
	inv:SetDraggable( true )
	inv:InvalidateLayout( true )

	local side = itemstore.config.ContextInventoryPosition
	if side == "bottom" then
		inv:SetPos( ScrW() / 2 - inv:GetWide() / 2, ScrH() - inv:GetTall() )
	elseif side == "top" then
		inv:SetPos( ScrW() / 2 - inv:GetWide() / 2, 0 )
	elseif side == "left" then
		inv:SetPos( 0, ScrH() / 2 - inv:GetTall() / 2 )
	elseif side == "right" then
		inv:SetPos( ScrW() - inv:GetWide(), ScrH() / 2 - inv:GetTall() / 2 )
	end

	ContextInventory = inv
end )

hook.Add( "Tick", "ItemStoreHideContextInventory", function()
	if not IsValid( LocalPlayer() ) then return end
	if not IsValid( ContextInventory ) then return end

	ContextInventory:SetVisible( LocalPlayer():CanUseInventory() )
end )

net.Receive( "ItemStoreOpen", function()
	local id = net.ReadUInt( 32 )
	local name = net.ReadString()
	local hideinv = net.ReadBit() == 1

	local con = itemstore.containers.Get( id )
	if not con then return end

	local panel = vgui.Create( "ItemStoreContainerWindow" )

	panel:SetContainerID( id )
	panel:SetTitle( name )
	panel:Center()

	panel:MakePopup()

	if not hideinv then
		local inv = vgui.Create( "ItemStoreContainerWindow" )
		inv:SetContainerID( LocalPlayer().InventoryID )
		inv:SetTitle( itemstore.Translate( "inventory" ) )
		inv:ShowCloseButton( false )
		inv:MakePopup()
		inv:InvalidateLayout( true )

		local think = inv.Think
		function inv:Think()
			think( self )

			local x, y = panel:GetPos()
			inv:SetPos( panel:GetPos() + ( panel:GetWide() / 2 - inv:GetWide() / 2 ),
				 y + panel:GetTall() + 10 )
		end

		function panel:OnClose()
			inv:Close()
		end
	end
end )