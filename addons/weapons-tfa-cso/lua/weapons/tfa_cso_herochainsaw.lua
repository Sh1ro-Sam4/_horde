SWEP.Base = "tfa_bash_base"
SWEP.Category = "TFA CS:O Equipment"
SWEP.Author = "Kamikaze, ★Bullet★"
SWEP.PrintName = "Last Stand Chainsaw"
SWEP.Type	= "Special Grade Equipment"
SWEP.ViewModel = "models/weapons/tfa_cso/c_herochainsaw.mdl"
SWEP.ViewModelFOV = 80
SWEP.ViewModelFlip = true
SWEP.VMPos = Vector(0, 0, 0)
SWEP.UseHands = true

--SWEP.InspectPos = Vector(17.184, -4.891, -11.902) - SWEP.VMPos
--SWEP.InspectAng = Vector(70, 46.431, 70)
SWEP.WorldModel = "models/weapons/tfa_cso/w_herochainsaw.mdl"
SWEP.Offset = {
	Pos = {
		Up = -0,
		Right = 1.5,
		Forward = 23
	},
	Ang = {
		Up = -90,
		Right = -0,
		Forward = 170
	},
	Scale = 1
}
SWEP.HoldType = "shotgun"
SWEP.Spawnable = true
SWEP.AdminOnly = true

SWEP.AllowSprintAttack = true
SWEP.IsMelee = true
SWEP.DisableChambering = true
SWEP.MuzzleFlashEnabled = false
SWEP.MoveSpeed = 1.05

SWEP.Primary.Automatic = true
SWEP.Primary.RPM = 1000
SWEP.Primary.Damage = 250
SWEP.Primary.NumShots = 1
SWEP.Primary.Ammo = "none"
SWEP.SelectiveFire = false
SWEP.Primary.Reach = 120
SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = -1

SWEP.data = {}
SWEP.data.ironsights = 0

SWEP.SawAnimation = {
	["in"] = {
		["type"] = TFA.Enum.ANIMATION_SEQ, --Sequence or act
		["value"] = "attack1_start", --Number for act, String/Number for sequence
		["transition"] = true
	}, --Inward transition
	["loop"] = {
		["type"] = TFA.Enum.ANIMATION_SEQ, --Sequence or act
		["value"] = "attack1_loop", --Number for act, String/Number for sequence
		["is_idle"] = true
	},--looping animation
	["out"] = {
		["type"] = TFA.Enum.ANIMATION_SEQ, --Sequence or act
		["value"] = "attack1_end", --Number for act, String/Number for sequence
		["transition"] = true
	} --Outward transition
}

SWEP.Saw_Sound_Idle = ""
SWEP.Saw_Sound_Saw = "HeroChainsaw.Attack_Loop"
SWEP.Saw_Sound_In = "HeroChainsaw.Attack_Start"
SWEP.Saw_Sound_Out = "HeroChainsaw.Attack_End"

SWEP.Saw_Sound_Idle_Next = -1
SWEP.Saw_Sound_Saw_Next = -1

SWEP.Saw_Sound_BlendTime = 0.05

SWEP.Saw_Drain_Idle = 0
SWEP.Saw_Drain_Sawing = 120 / 10--Ammo per second

SWEP.Secondary.Automatic = true
SWEP.Secondary.CanBash = true
SWEP.Secondary.BashDamage = 5000
SWEP.Secondary.BashDelay = 0.1
SWEP.Secondary.BashLength = 120
SWEP.Secondary.BashDamageType = bit.bor(DMG_SLASH,DMG_ALWAYSGIB)

SWEP.Secondary.BashSound = Sound("")
SWEP.Secondary.BashHitSound = Sound("Chainsaw.Slash"..math.random(1,2))
SWEP.Secondary.BashHitSound_Flesh = Sound("Chainsaw.HitFleshSlash2")

SWEP.ForceDryFireOff = true
SWEP.DisableIdleAnimations = false
SWEP.ForceEmptyFireOff = true

-- nZombies Stuff
SWEP.NZWonderWeapon		= false	-- Is this a Wonder-Weapon? If true, only one player can have it at a time. Cheats aren't stopped, though.
--SWEP.NZRePaPText		= "your text here"	-- When RePaPing, what should be shown? Example: Press E to your text here for 2000 points.
SWEP.NZPaPName				= "Doomslayer"
--SWEP.NZPaPReplacement 	= "tfa_cso_dualinfinityfinal"	-- If Pack-a-Punched, replace this gun with the entity class shown here.
SWEP.NZPreventBox		= true	-- If true, this gun won't be placed in random boxes GENERATED. Users can still place it in manually.
SWEP.NZTotalBlackList	= true	-- if true, this gun can't be placed in the box, even manually, and can't be bought off a wall, even if placed manually. Only code can give this gun.

local BaseClass = baseclass.Get( SWEP.Base )

local stat,_,tanim

function SWEP:Initialize( ... )
	self.StatCache_Blacklist[ "Secondary.BashHitSound"] = true
	self.StatCache_Blacklist[ "Secondary.BashHitSound_Flesh"] = true
	self.StatCache_Blacklist[ "Secondary.BashDamage"] = true
	return BaseClass.Initialize( self, ... )
end

function SWEP:Deploy( ... )
	self.FSaw_Velocity = 0
	if IsFirstTimePredicted() then
		self.Saw_Sound_Idle_Next = -1
		self.Saw_Sound_Saw_Next = -1
	end
	return BaseClass.Deploy( self, ... )
end

function SWEP:Holster( ... )
	return BaseClass.Holster(self, ... )
end
function SWEP:PrimaryAttack( ... )
	self:SawThink()

	BaseClass.PrimaryAttack( self, ... )
end
function SWEP:Think2( ... )
	self:SawThink()

	BaseClass.Think2( self, ... )
end

function SWEP:ChooseIdleAnim( ... )
	if self:GetStatus() == TFA.GetStatus("sawing") and self.SawAnimation["loop"] then
		return self:PlayAnimation( self.SawAnimation["loop"] )
	else
		return BaseClass.ChooseIdleAnim(self, ...)
	end
end

function SWEP:SawThink()
	stat = self:GetStatus()
	if self.Owner:KeyDown(IN_ATTACK) and TFA.Enum.ReadyStatus[stat] and not self:GetSprinting() then
		if self.SawAnimation["in"] then
			_,tanim = self:PlayAnimation( self.SawAnimation["in"] )
		else
			_,tanim = self:PlayAnimation( self.SawAnimation["loop"] )
		end
		self:SetStatus( TFA.GetStatus("sawing") )
		self:SetStatusEnd( math.huge )
		self:GetOwner():SetAnimation(PLAYER_ATTACK1)
		if self:CanSoundPredict() then
			self:EmitSound(self.Saw_Sound_In)
			self.Saw_Sound_Saw_Next = SysTime() + 0.1
		end
	elseif stat == TFA.GetStatus("sawing") and ( ( not self.Owner:KeyDown(IN_ATTACK) ) or self:GetSprinting() ) then
		self:SetStatus( TFA.GetStatus("sawing_end") )
		if self.SawAnimation["out"] then
			_,tanim = self:PlayAnimation( self.SawAnimation["out"] )
		else
			_,tanim = self:ChooseIdleAnim()
		end
		self:SetStatusEnd( CurTime() + 1.5 )
		if self:CanSoundPredict() then
			self:EmitSound(self.Saw_Sound_Out)
			self.Saw_Sound_Idle_Next = SysTime() + 0.1
		end
	elseif stat == TFA.GetStatus("sawing") and CurTime() > self:GetNextIdleAnim() then
		self:ChooseIdleAnim()
	end
	if self:Clip1() == 0 then
		self.Secondary.BashHitSound = Sound("HeroChainsaw.Slash"..math.random(3,4))
		self.Secondary.BashHitSound_Flesh = Sound("HeroChainsaw.HitFleshSlash"..math.random(3,4))
		self.Secondary.BashDamage = 5000
	end
	self:SawMechanics()
	self:SawSounds()
	self:AnimateSaw()
end

SWEP.AmmoDrainDelta = 0

function SWEP:SawMechanics()
	stat = self:GetStatus()
	if SERVER then
		self.AmmoDrainDelta = self.AmmoDrainDelta + ( ( stat == TFA.GetStatus("sawing") ) and self.Saw_Drain_Sawing or self.Saw_Drain_Idle ) * TFA.FrameTime()
		while self.AmmoDrainDelta >= 1 do
			self.AmmoDrainDelta = self.AmmoDrainDelta - 1
			self:TakePrimaryAmmo(1)
		end
	end
	if self:GetStatus() == TFA.GetStatus("sawing") and CurTime() > self:GetNextPrimaryFire() and ( IsFirstTimePredicted() and not ( game.SinglePlayer() and CLIENT ) ) then
		local ft = 60 / self.Primary.RPM
		if IsFirstTimePredicted() then
			self:Saw( self.Primary.Damage * ft, self.Primary.Damage * ft, self.Primary.Reach )
		end
		self:SetNextPrimaryFire( CurTime() + ft )
	end
end

SWEP.FSaw_Velocity = 0
SWEP.FSaw_Accel = 720
SWEP.FSaw_Decel = 360
SWEP.FSaw_IdleSpeed = 180
SWEP.FSaw_SawingSpeed = 720
SWEP.FSaw_Friction = 90

function SWEP:AnimateSaw()
	if self:Clip1() > 0 then
		if self:GetStatus() == TFA.GetStatus("sawing") or self:GetStatus() == TFA.GetStatus("bashing") then
			self.FSaw_Velocity = math.min( self.FSaw_Velocity + self.FSaw_Accel * TFA.FrameTime(), self.FSaw_SawingSpeed )
		else
			if self.FSaw_Velocity > self.FSaw_IdleSpeed then
				self.FSaw_Velocity = math.max( self.FSaw_Velocity - self.FSaw_Decel * TFA.FrameTime() , self.FSaw_IdleSpeed )
			else
				self.FSaw_Velocity = math.min( self.FSaw_Velocity + self.FSaw_Accel * TFA.FrameTime(), self.FSaw_IdleSpeed )
			end
		end
	else
		self.FSaw_Velocity = math.max( self.FSaw_Velocity - self.FSaw_Friction * TFA.FrameTime() , 0 )
	end
end

function SWEP:SawSounds()
	stat = self:GetStatus()
	if stat == TFA.GetStatus("holster") or stat == TFA.GetStatus("holster_final") or stat == TFA.GetStatus("holster_ready") then
		self:MuteSounds( true )
		return
	end
	if self:Clip1() == 0 then
		self:MuteSounds( true )
		self:StopSound("HeroChainsaw.Idle")
		return
	end
	if not self:CanSoundPredict() then return end
	if self:GetStatus() == TFA.GetStatus("sawing") then
		if SysTime() > self.Saw_Sound_Saw_Next then
			self.Saw_Sound_Saw_Next = SysTime() + SoundDuration( self.Saw_Sound_Saw ) / self:GetTimeScale() - self.Saw_Sound_BlendTime
			self:EmitSound( self.Saw_Sound_Saw )
		end
		if self.Saw_Sound_Idle_Next ~= -1 then
			self:StopSound( self.Saw_Sound_Idle )
			self.Saw_Sound_Idle_Next = -1
		end
	elseif self:Clip1() >= 0 and stat ~= TFA.GetStatus("reloading") then
		if SysTime() > self.Saw_Sound_Idle_Next then
			self.Saw_Sound_Idle_Next = SysTime() + SoundDuration( self.Saw_Sound_Idle ) / self:GetTimeScale() - self.Saw_Sound_BlendTime
			self:EmitSound( self.Saw_Sound_Idle )
		end
		if self.Saw_Sound_Saw_Next ~= -1 then
			self:StopSound( self.Saw_Sound_Saw )
			self.Saw_Sound_Saw_Next = -1
		end
	end
end

function SWEP:MuteSounds( offsnd )
	if self.Saw_Sound_Saw_Next ~= -1 then
		self:StopSound( self.Saw_Sound_Saw )
		self.Saw_Sound_Saw_Next = -1
		if offsnd then
			self:EmitSound("HeroChainsaw.Attack_End")
		end
	end
	if self.Saw_Sound_Idle_Next ~= -1 then
		self:StopSound( self.Saw_Sound_Idle )
		self.Saw_Sound_Idle_Next = -1
		if offsnd then
			self:EmitSound("HeroChainsaw.Idle")
		end
	end
end

function SWEP:CanSoundPredict()
	if game.SinglePlayer() then
		if CLIENT then return false end
	else
		if not IsFirstTimePredicted() then return false end
	end
	return true
end

local dryfire_cvar = GetConVar("sv_tfa_allow_dryfire")
local ct

function SWEP:Reload(released)
end

local hull = {}

function SWEP:Saw( damage, force, reach )
	if not self:OwnerIsValid() then return end
	pos = self.Owner:GetShootPos()
	ang = self.Owner:GetAimVector()

	self.Owner:LagCompensation(true)

	hull.start = pos
	hull.endpos = pos + (ang * reach)
	hull.filter = self.Owner
	hull.mins = Vector(-5, -5, 0)
	hull.maxs = Vector(5, 5, 5)
	local slashtrace = util.TraceHull(hull)

	self.Owner:LagCompensation(false)

	if slashtrace.Hit then
		if game.GetTimeScale() > 0.99 then
			self.Owner:FireBullets({
				Attacker = self.Owner,
				Inflictor = self,
				Damage = 250,
				Force = force,
				Distance = reach + 10,
				HullSize = 12.5,
				Tracer = 0,
				Src = self.Owner:GetShootPos(),
				Dir = slashtrace.Normal,
				Callback = function(a, b, c)
					c:SetDamageType( bit.bor( DMG_SLASH,DMG_ALWAYSGIB) )
				end
			})
		else
			if not IsValid( slashtrace.Entity ) then return end
			local dmg = DamageInfo()
			dmg:SetAttacker(self.Owner)
			dmg:SetInflictor(self)
			dmg:SetDamagePosition(self.Owner:GetShootPos())
			dmg:SetDamageForce(self.Owner:GetAimVector() * (250))
			dmg:SetDamage(250)
			dmg:SetDamageType( bit.bor( DMG_SLASH,DMG_ALWAYSGIB) )
			if slashtrace.Entity.TakeDamageInfo then
				slashtrace.Entity:TakeDamageInfo(dmg)
			end
		end
	end
end

local sv_cheats_cv = GetConVar("sv_cheats")
local host_timescale_cv = GetConVar("host_timescale")
local ts
function SWEP:GetTimeScale()
	ts = game.GetTimeScale()
	if sv_cheats_cv:GetBool() then
		ts = ts * host_timescale_cv:GetFloat()
	end
	return ts
end

function SWEP:Holster( ... )
	self:StopSound("HeroChainsaw.Idle")
	self:StopSound("HeroChainsaw.Attack_Loop")
	self:StopSound("HeroChainsaw.Draw")
	return BaseClass.Holster(self,...)
end
if CLIENT then
	SWEP.WepSelectIconCSO = Material("vgui/killicons/tfa_cso_herochainsaw")
	SWEP.DrawWeaponSelection = TFA_CSO_DrawWeaponSelection
end