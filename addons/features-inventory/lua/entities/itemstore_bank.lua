ENT.Type = "anim"
ENT.RenderGroup = RENDERGROUP_TRANSLUCENT

ENT.PrintName = "Банк"
ENT.Category = "SHZ | ItemStore"

ENT.Spawnable = true
ENT.AdminOnly = true

if SERVER then
	AddCSLuaFile()

	function ENT:Initialize()
		self:SetModel( "models/props/cs_assault/ticketmachine.mdl" )

		self:PhysicsInit( SOLID_VPHYSICS )
		self:SetMoveType( MOVETYPE_VPHYSICS )
		self:SetSolid( SOLID_VPHYSICS )
		self:SetUseType( SIMPLE_USE )

		self:GetPhysicsObject():EnableMotion( false )
	end

	function ENT:SpawnFunction( pl, trace, class )
		local ent = ents.Create( class )
		ent:SetPos( trace.HitPos + trace.HitNormal * 16 )
		ent:Spawn()

		return ent
	end

	function ENT:Use( pl )
		if not IsValid( pl ) then return end

		pl.Bank:Sync()
		pl:OpenContainer( pl.Bank:GetID(), itemstore.Translate( "bank" ) )
	end

	concommand.Add( "itemstore_savebanks", function( pl )
		if not game.SinglePlayer() and IsValid( pl ) then return end

		local banks = {}

		for _, ent in ipairs( ents.FindByClass( "itemstore_bank" ) ) do
			table.insert( banks, {
				Position = ent:GetPos(),
				Angles = ent:GetAngles()
			} )
		end

		file.Write( "itemstore/banks/" .. game.GetMap() .. ".txt", util.TableToJSON( banks ) )

		print( "Banks for map " .. game.GetMap() .. " saved." )
	end )

	hook.Add( "InitPostEntity", "ItemStoreSpawnBanks", function()
		local banks = util.JSONToTable( file.Read( "itemstore/banks/" .. game.GetMap() .. ".txt", "DATA" ) or "" ) or {}

		for _, data in ipairs( banks ) do
			local bank = ents.Create( "itemstore_bank" )
			bank:SetPos( data.Position )
			bank:SetAngles( data.Angles )
			bank:Spawn()
		end
	end )
else
function ENT:Draw()
    self:DrawModel()
    local Pos = self:GetPos() + Vector(0, 0, 1) * math.sin(CurTime() * 1) * 1
    local PlayersAngle = LocalPlayer():GetAngles()
    local Ang = Angle( 0, PlayersAngle.y - 180, 0 )
    Ang:RotateAroundAxis(Ang:Right(), -90)
    Ang:RotateAroundAxis(Ang:Up(), 90)

	if LocalPlayer():GetPos():Distance(self:GetPos()) < 200 then
		cam.Start3D2D(Pos + Ang:Up() * 1 + Ang:Right() * -106, Ang, 0.1)
			draw.SimpleText( "Банк", "font.120", 0,0, Color(255,255,255), 1,1 )
		cam.End3D2D()
	end
  end
end