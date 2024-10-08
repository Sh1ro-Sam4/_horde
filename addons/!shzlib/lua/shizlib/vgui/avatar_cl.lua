local PANEL = {}

AccessorFunc(PANEL, "vertices", "Vertices", FORCE_NUMBER)
AccessorFunc(PANEL, "rotation", "Rotation", FORCE_NUMBER)

function PANEL:Init()
  self.rotation = 0
  self.vertices = 4
  self.scaler = 1
  self.avatar = vgui.Create("AvatarImage", self)
  self.avatar:SetPaintedManually(true)
end

function PANEL:CalculatePoly(w, h)
  local poly = {}

  local x = w / 2
  local y = h / 2 * self.scaler
  local radius = h / 2

  table.insert(poly, {
    x = x,
    y = y
  })

  for i = 0, self.vertices do
    local a = math.rad((i / self.vertices) * -360) + self.rotation
    table.insert(poly, {
      x = x + math.sin(a) * radius,
      y = y + math.cos(a) * (radius * self.scaler)
    })
  end

  local a = math.rad(0)
  table.insert(poly, {
    x = x + math.sin(a) * radius,
    y = y + math.cos(a) * (radius * self.scaler)
  })
  self.data = poly
end

function PANEL:PerformLayout(w, actualH)
  local h = self:GetTall()
  if (self.scaler < 1) then
    h = h * self.scaler
  end

  self.avatar:SetPos(0, h - actualH)
  self.avatar:SetSize(self:GetWide(), actualH)
  self:CalculatePoly(self:GetWide(), self:GetTall())
end

function PANEL:SetPlayer(ply, size)
  self.avatar:SetPlayer(ply, size)
end

function PANEL:SetSteamID(sid64, size)
  self.avatar:SetSteamID(sid64, size)
end
function PANEL:DrawPoly(w, h)
  if (!self.data) then
    self:CalculatePoly(w, h)
  end

  surface.DrawPoly(self.data)
end

function PANEL:Paint(w, h)
  render.ClearStencil()
  render.SetStencilEnable(true)

  render.SetStencilWriteMask(1)
  render.SetStencilTestMask(1)

  render.SetStencilFailOperation(STENCILOPERATION_REPLACE)
  render.SetStencilPassOperation(STENCILOPERATION_ZERO)
  render.SetStencilZFailOperation(STENCILOPERATION_ZERO)
  render.SetStencilCompareFunction(STENCILCOMPARISONFUNCTION_NEVER)
  render.SetStencilReferenceValue(1)

  draw.NoTexture()
  surface.SetDrawColor(color_white)
  self:DrawPoly(w, h)

  render.SetStencilFailOperation(STENCILOPERATION_ZERO)
  render.SetStencilPassOperation(STENCILOPERATION_REPLACE)
  render.SetStencilZFailOperation(STENCILOPERATION_ZERO)
  render.SetStencilCompareFunction(STENCILCOMPARISONFUNCTION_EQUAL)
  render.SetStencilReferenceValue(1)

  self.avatar:PaintManual()

  render.SetStencilEnable(false)
  render.ClearStencil()
end
vgui.Register("SHZAvatarImage", PANEL)
