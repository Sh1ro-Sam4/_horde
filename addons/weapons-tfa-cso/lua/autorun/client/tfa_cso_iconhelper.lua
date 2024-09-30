
local surface = surface

function TFA_CSO_DrawWeaponSelection(self, x, y, wide, tall, alpha)
	if not self.WepSelectIconCSO then return end
	-- Set us up the texture
	surface.SetDrawColor(255, 255, 255, alpha)
	surface.SetMaterial(self.WepSelectIconCSO)

	y = y + 10
	x = x + 10
	wide = wide - 20

	self.WepSelectIconCSO:SetFloat('$alpha', alpha / 255)
	surface.DrawTexturedRectUV(x, y, wide, wide / 2, 1, 0, 0, 1)
	self.WepSelectIconCSO:SetFloat('$alpha', 1)
end
