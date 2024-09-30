ENT.Type = "anim"

ENT.PrintName = "Small Box"
ENT.Category = "SHZ | ItemStore"

ENT.Spawnable = true
ENT.AdminOnly = true

function ENT:SetupDataTables()
	self:NetworkVar( "Entity", 0, "owning_ent" ) -- i feel really stupid.
end

if SERVER then
	AddCSLuaFile()

	ENT.DefaultHealth = 100
	ENT.Model = "models/props/cs_office/Cardboard_box02.mdl"

	ENT.ContainerWidth = 3
	ENT.ContainerHeight = 3
	ENT.ContainerPages = 1

	function ENT:Initialize()
		self:SetModel( self.Model )

		self:PhysicsInit( SOLID_VPHYSICS )
		self:SetMoveType( MOVETYPE_VPHYSICS )
		self:SetSolid( SOLID_VPHYSICS )
		self:SetUseType( SIMPLE_USE )

		self:GetPhysicsObject():Wake()

		self.Container = itemstore.Container( self.ContainerWidth, self.ContainerHeight, self.ContainerPages )
		self.Container:SetOwner( self )

		if self.Items then
			for _, item in ipairs( self.Items ) do
				self.Container:AddItem( item:Copy() )
			end
		end

		local function callback( con, pl )
			if not IsValid( pl ) then return end
			
			if pl:GetPos():Distance( self:GetPos() ) < 250 then
				return true
			end

			return false
		end

		self.Container:AddCallback( "read", callback )
		self.Container:AddCallback( "write", callback )

		self:SetHealth( self.DefaultHealth )
	end

	function ENT:SpawnFunction( pl, trace, class )
		local ent = ents.Create( class )
		ent:SetPos( trace.HitPos + trace.HitNormal * 16 )
		ent:Spawn()

		return ent
	end

	function ENT:Use( pl )
		self.Container:Sync()
		pl:OpenContainer( self.Container:GetID(), "Box" )
	end

	function ENT:Break()
		local effect = EffectData()
		effect:SetOrigin( self:GetPos() )
		util.Effect( "Explosion", effect, true, true )

		for _, item in pairs( self.Container.Items ) do
			item:CreateEntity( self:GetPos() )
		end

		self:Remove()
	end

	function ENT:OnTakeDamage( dmg )
		if not itemstore.config.BoxBreakable then return end

		self:SetHealth( self:Health() - dmg:GetDamage() )

		if self:Health() <= 0 then
			self:Break()
		end
	end

	function ENT:OnRemove()
		self.Container:Remove()
	end
end
