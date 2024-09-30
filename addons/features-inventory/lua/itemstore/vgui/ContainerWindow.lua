local PANEL = {}

function PANEL:Init()
	self:SetSkin('itemstore')
	self:SetAlpha(0)
	self:AlphaTo(255, .4, 0)

	self.Container = vgui.Create( "ItemStoreContainer", self )
	self.Container:SizeToContents()
end

function PANEL:PerformLayout()
	self:SetSize( self.Container:GetWide() + 10, self.Container:GetTall() + 32 )
	self.Container:SetPos( 5, 27 )

	self.BaseClass.PerformLayout( self )
end

function PANEL:Refresh()
	self.Container:Refresh()
end

function PANEL:SetContainerID( id )
	self.Container:SetContainerID( id )
end

function PANEL:GetContainerID()
	return self.Container:GetContainerID()
end

vgui.Register( "ItemStoreContainerWindow", PANEL, "DFrame" )
