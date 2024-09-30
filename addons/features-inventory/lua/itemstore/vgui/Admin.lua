local PANEL = {}

function PANEL:Init()
	self:SetTitle( itemstore.Translate( "admin_title" ) )
	self:SetSkin( "itemstore" )

	self.Scroll = vgui.Create( "DScrollPanel", self )
	self.Scroll:Dock( FILL )

	self.List = vgui.Create( "DListLayout", self.Scroll )
	self.List:Dock( FILL )
	for _, pl in ipairs( player.GetAll() ) do
		local b = self.List:Add( "DButton" )
		b:SetText( pl:Name() )
		b:DockMargin( 0, 0, 0, 2 )

		function b.DoClick()
			local menu = DermaMenu()

			menu:AddOption( itemstore.Translate( "inventory" ), function()
				net.Start( "ItemStoreAdminInventory" )
				 	net.WriteEntity( pl )
				net.SendToServer()
			end )

			menu:AddOption( itemstore.Translate( "bank" ), function()
				net.Start( "ItemStoreAdminBank" )
					net.WriteEntity( pl )
				net.SendToServer()
			end )

			menu:Open()
		end
	end
end

vgui.Register( "ItemStoreAdmin", PANEL, "DFrame" )
