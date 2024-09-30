local PANEL = {}

function PANEL:Init()
	self.Pages = {}
	self.Slots = {}

	table.insert( itemstore.containers.Panels, self )
end

function PANEL:SetContainerID( id )
	self.ContainerID = id
	self:Refresh()
end

function PANEL:GetContainerID()
	return self.ContainerID
end

function PANEL:Refresh()
	local id = self:GetContainerID()
	local con = itemstore.containers.Get( id )

	if con then
		for i = 1, con:GetSize() do
			local page_id = con:GetPageFromSlot( i )
			local page = self.Pages[ page_id ]

			if not page then
				page = vgui.Create( "DIconLayout" )
				page:SetSpaceX( 1 )
				page:SetSpaceY( 1 )

				self.Pages[ page_id ] = page

				self:AddSheet( itemstore.Translate( "page", page_id ), page )
			end

			local slot = self.Slots[ i ]

			if not slot then
				slot = page:Add( "ItemStoreSlot" )
				slot:SetSize( 40, 40 )
				slot:SetContainerID( self:GetContainerID() )
				slot:SetSlot( i )

				self.Slots[ i ] = slot
			end

			slot:SetItem( con:GetItem( i ) )
			slot:Refresh()
		end
	end

	self:SizeToContents()
end

function PANEL:SizeToContents()
	local id = self:GetContainerID()
	local con = itemstore.containers.Get( id )

	if con then
		local w = con:GetWidth() * 41 + 15
		local h = con:GetHeight() * 41 + 35

		self:SetSize( w, h )
	end
end

vgui.Register( "ItemStoreContainer", PANEL, "DPropertySheet" )
