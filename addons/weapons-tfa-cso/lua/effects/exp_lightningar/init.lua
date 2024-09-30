function EFFECT:Init(data)
	self.Entity = data:GetEntity()
	pos = data:GetOrigin()
	self.Emitter = ParticleEmitter(pos)
	if data:GetScale() == 1 then
			local particle = self.Emitter:Add( "sprites/ef_y20s2scarhit", pos)
			if (particle) then
				particle:SetVelocity( VectorRand():GetNormalized()*math.Rand(100, 300) )
				if i == 1 then 
				particle:SetDieTime( 4 )
				else
				particle:SetDieTime( 4 )
				end
				particle:SetStartAlpha( 50 )
				particle:SetEndAlpha( 0 )
				particle:SetStartSize( 64 )
				particle:SetEndSize( 56 )
				particle:SetRoll( 0)
				particle:SetRollDelta( 0 )
				particle:SetColor( 255 , 255 , 255 ) 
 				particle:SetAirResistance( 9999 ) 	
				particle:SetCollide( false )
				particle:SetBounce( 0 )
			end

	elseif data:GetScale() == 2 then
			local particle = self.Emitter:Add( "sprites/ef_y20s2scarhit", pos)
			if (particle) then
				particle:SetVelocity( VectorRand():GetNormalized()*math.Rand(500, 1000) )
				if i <= 1 then 
				particle:SetDieTime( 4 )
				else
				particle:SetDieTime( 4 )
				end
				particle:SetStartAlpha( 50 )
				particle:SetEndAlpha( 0 )
				particle:SetStartSize( 64 )
				particle:SetEndSize( 56 )
				particle:SetRoll( 0)
				particle:SetRollDelta( 0 )
				particle:SetColor( 255 , 255 , 255 ) 
 				particle:SetAirResistance( 9999 ) 	
				particle:SetCollide( false )
				particle:SetBounce( 0 )
			end
		end
end

function EFFECT:Think()
return false
end

function EFFECT:Render()

end