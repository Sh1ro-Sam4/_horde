EFFECT.Duration			= 0.25;
EFFECT.Size				= 32;

local MaterialGlow		= Material( "fx/warp1_warp_mr" );


function EFFECT:Init( data )

	self.Position = data:GetOrigin();
	self.Normal = data:GetNormal();
	self.LifeTime = self.Duration;
	self.Color = data:GetColor()
	--PrintTable(self.Color)
	local Coloride = {
[0] = Color( 255, 255, 255 ),
[1] = Color( 255, 255, 255 ),
[2] = Color( 22, 255, 22 ),
[3] = Color( 22, 255, 255 ),
[4] = Color( 22, 22, 255 ),
[5] = Color( 255, 255, 22 ),
[6] = Color( 255, 22, 22 ),
[7] = Color( 255, 22, 255 )
}

	-- particles
	local emitter = ParticleEmitter( self.Position );
	if( emitter ) then
		
		for i = 1, 4 do

			local particle = emitter:Add( "effects/ar2_altfire1b", self.Position + self.Normal * 15 );
			particle:SetVelocity( VectorRand() * math.Rand( 70, 120 ) );
			--particle:SetVelocity( ( self.Normal + VectorRand() * 0.75 ):GetNormal() * math.Rand( 75, 125 ) );
			particle:SetDieTime( math.Rand( 0.4, 0.8 ) );
			particle:SetStartAlpha( 64 );
			particle:SetEndAlpha( 0 );
			particle:SetStartSize( math.Rand( 12, 20 ) );
			particle:SetEndSize( 0 );
			particle:SetColor( 128, 0, 255)
			particle:SetRoll( 0 );
			--particle:SetGravity( Vector( 0, 0, -400 ) );
			particle:SetCollide( true );
			particle:SetBounce( 0.3 );
			particle:SetAirResistance( 5 );

		end
		emitter:Finish();
	end
	
	--EmitSound("TFA_SW_IMPACT",self.Position)
end


function EFFECT:Think()

	self.LifeTime = self.LifeTime - FrameTime();
	return self.LifeTime > 0;

end


function EFFECT:Render()

	local frac = math.max( 0, self.LifeTime / self.Duration );
	local rgb = 255 * frac;
	local color = Color( rgb, rgb, rgb, 255 );

	--render.SetMaterial( MaterialGlow );
	--render.DrawQuadEasy( self.Position + self.Normal, self.Normal, self.Size, self.Size, color );

end
