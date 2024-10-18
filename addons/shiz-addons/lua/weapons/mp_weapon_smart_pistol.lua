if CLIENT then
SWEP.WepSelectIcon = surface.GetTextureID( "ui/menu/items/weapon_smartpistol" )
SWEP.DrawWeaponInfoBox	= false
SWEP.BounceWeaponIcon = false
killicon.Add( "mp_weapon_smart_pistol", "ui/menu/items/weapon_smartpistol", Color( 0, 0, 0, 255 ) )
end

SWEP.PrintName = "Smart Pistol MK5"

SWEP.Category = "Titanfall"

SWEP.Spawnable= true
SWEP.AdminSpawnable= true
SWEP.AdminOnly = true

SWEP.ViewModelFOV = 55
SWEP.ViewModel = "models/weapons/p2011sp/ptpov_p2011sp.mdl"
SWEP.WorldModel = "models/weapons/p2011sp/w_p2011sp.mdl"
SWEP.ViewModelFlip = false

SWEP.SwayScale = 0.5
SWEP.BobScale = 0.5

SWEP.AutoSwitchTo = false
SWEP.AutoSwitchFrom = false
SWEP.Weight = 15

SWEP.Slot = 2
SWEP.SlotPos = 0

SWEP.UseHands = false
SWEP.HoldType = "pistol"
SWEP.FiresUnderwater = true
SWEP.DrawCrosshair = false
SWEP.DrawAmmo = true
SWEP.CSMuzzleFlashes = true
SWEP.Base = "weapon_base"

SWEP.Aim = 0
SWEP.IronInTime = 0.25
SWEP.IronOutTime = 0.2
SWEP.DeployTime = 0.4
SWEP.Sprint = 0
SWEP.Lock = 0
SWEP.BobTimer = CurTime()
SWEP.Bob = 0

SWEP.Primary.Sound = Sound( "Weapon_SmartPistol.Single" )
SWEP.Primary.ClipSize = 18
SWEP.Primary.DefaultClip = 120
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "pistol"
SWEP.Primary.Damage = 42
SWEP.Primary.TakeAmmo = 1
SWEP.Primary.Recoil = 1
SWEP.Primary.RecoilView = 0.75
SWEP.Primary.Spread = 0.8
SWEP.Primary.NumberofShots = 1
SWEP.Primary.Delay = 0.125
SWEP.Primary.Force = 10

SWEP.Secondary.ClipSize = 0
SWEP.Secondary.DefaultClip = 0
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = "none"

function SWEP:Initialize()
self:SetWeaponHoldType( self.HoldType )
end

function SWEP:OnDrop()
	self:Remove()
end


function SWEP:DrawHUD()
if CLIENT then
local x, y
if self.Owner == LocalPlayer() and self.Owner:ShouldDrawLocalPlayer() then
local tr = util.GetPlayerTrace( self.Owner )
local trace = util.TraceLine( tr )
local coords = trace.HitPos:ToScreen()
x, y = coords.x, coords.y
else
x, y = ScrW() / 2, ScrH() / 2
end
surface.SetTexture( surface.GetTextureID( "vgui/hud/weapons/smart_pistol_reticle" ) )
surface.SetDrawColor( 255, 255, 255, 255 )
surface.DrawTexturedRect( x - 128, y - 128, 256, 256 )
end
end

function SWEP:Deploy()
self.Weapon:SendWeaponAnim( ACT_VM_DRAW )
self:SetNextPrimaryFire( CurTime() + self.DeployTime )
self:SetNextSecondaryFire( CurTime() + self.DeployTime )
self.Primary.Spread = 0.8
self.Owner:SetFOV( 0, 0 )
self.Aim = 0
self.Sprint = 0
self.Lock = 0
self.BobTimer = CurTime()
self.Bob = 0
end

function SWEP:Holster()
self.Primary.Spread = 0.8
self.Owner:SetFOV( 0, 0 )
self.Aim = 0
self.Sprint = 0
self.Lock = 0
self.BobTimer = CurTime()
self.Bob = 0
return true
end

function SWEP:PrimaryAttack()
if self.Sprint == 1 then return end
if self.Weapon:Clip1() <= 0 and self.Weapon:Ammo1() <= 0 and !( self.Owner:WaterLevel() == 3 ) then
self.Weapon:EmitSound( "Default.ClipEmpty_Rifle" )
self:SetNextPrimaryFire( CurTime() + self.Primary.Delay * 2 )
end
if self.FiresUnderwater == false and self.Owner:WaterLevel() == 3 then
self.Weapon:EmitSound( "Default.ClipEmpty_Rifle" )
self:SetNextPrimaryFire( CurTime() + self.Primary.Delay * 2 )
end
if self.Weapon:Clip1() <= 0 and self.Weapon:Ammo1() > 0 then
self:Reload()
end
if self.Weapon:Clip1() <= 0 then return end
if self.FiresUnderwater == false and self.Owner:WaterLevel() == 3 then return end
self.Owner:LagCompensation( true )
local tr = util.TraceLine( {
start = self.Owner:GetShootPos(),
endpos = self.Owner:GetShootPos() + self.Owner:GetAimVector() * 1000,
filter = self.Owner,
mask = MASK_SHOT_HULL,
} )
if !IsValid( tr.Entity ) then
tr = util.TraceHull( {
start = self.Owner:GetShootPos(),
endpos = self.Owner:GetShootPos() + self.Owner:GetAimVector() * 1000,
filter = self.Owner,
mins = Vector( -32, -32, 0 ),
maxs = Vector( 32, 32, 0 ),
mask = MASK_SHOT_HULL,
} )
end
if SERVER and IsValid( tr.Entity ) and ( tr.Entity:IsNPC() || tr.Entity:IsPlayer() || tr.Entity:Health() > 0 ) then
local dmginfo = DamageInfo()
local attacker = self.Owner
if !IsValid( attacker ) then
attacker = self
end
self.Owner:EmitSound( "Weapon_SmartPistol.Lock" )
dmginfo:SetAttacker( attacker )
dmginfo:SetInflictor( self )
dmginfo:SetDamage( self.Primary.Damage )
dmginfo:SetDamageForce( self.Owner:GetForward() * 10000 )
dmginfo:SetDamage( self.Primary.Damage )
tr.Entity:TakeDamageInfo( dmginfo )
else
local bullet = {}
bullet.Num = self.Primary.NumberofShots
bullet.Src = self.Owner:GetShootPos()
bullet.Dir = self.Owner:GetAimVector()
bullet.Spread = Vector( self.Primary.Spread * 0.1, self.Primary.Spread * 0.1, 0 )
bullet.Tracer = 1
bullet.Force = self.Primary.Force
bullet.Damage = self.Primary.Damage
bullet.AmmoType = self.Primary.Ammo
self.Owner:FireBullets( bullet )
end
if SERVER and IsValid( tr.Entity ) and ( tr.Entity:IsNPC() || tr.Entity:IsPlayer() || tr.Entity:Health() > 0 ) then
local phys = tr.Entity:GetPhysicsObject()
if IsValid( phys ) then
phys:ApplyForceOffset( self.Owner:GetAimVector() * 80 * phys:GetMass(), tr.HitPos )
end
end
self.Owner:LagCompensation( false )
self:EmitSound( self.Primary.Sound )
self.Owner:SetAnimation( PLAYER_ATTACK1 )
self.Owner:MuzzleFlash()
self.Owner:ViewPunchReset()
self.Owner:ViewPunch( Angle( -1, 0, 0 ) * self.Primary.Recoil )
self.Owner:SetEyeAngles( self.Owner:EyeAngles() + Angle( -1, math.random( -0.25, 0.25 ), 0 ) * self.Primary.RecoilView )
self:TakePrimaryAmmo( self.Primary.TakeAmmo )
self:SetNextPrimaryFire( CurTime() + self.Primary.Delay )
self:SetNextSecondaryFire( CurTime() + self.Primary.Delay )
if self.Aim == 0 then
self.Weapon:SendWeaponAnim( ACT_VM_PRIMARYATTACK )
end
if self.Aim == 1 then
self.Weapon:SendWeaponAnim( ACT_VM_PRIMARYATTACK_DEPLOYED )
end
end

function SWEP:SecondaryAttack()
if self.Sprint == 1 then return end
if self.Aim == 0 then
self.Weapon:SendWeaponAnim( ACT_VM_DEPLOY )
self:SetNextPrimaryFire( CurTime() + self.IronInTime )
self:SetNextSecondaryFire( CurTime() + self.IronInTime )
self.Primary.Spread = 0.05
self.Owner:SetFOV( 75, 0.1 )
self.Aim = 1
else
if self.Aim == 1 then
self.Weapon:SendWeaponAnim( ACT_VM_UNDEPLOY )
self:SetNextPrimaryFire( CurTime() + self.IronOutTime )
self:SetNextSecondaryFire( CurTime() + self.IronOutTime )
self.Primary.Spread = 0.8
self.Owner:SetFOV( 0, 0.1 )
self.Aim = 0
end
end
end

function SWEP:Reload()
if self.Sprint == 1 then return end
if self.Weapon:Clip1() < self.Primary.ClipSize and self.Weapon:Ammo1() > 0 then
if self.Weapon:Clip1() > 0 then
self.Weapon:DefaultReload( ACT_VM_RELOAD )
end
if self.Weapon:Clip1() <= 0 then
self.Weapon:DefaultReload( ACT_VM_RELOAD_EMPTY )
end
self.Primary.Spread = 0.8
self.Owner:SetFOV( 0, 0.1 )
self.Aim = 0
end
end

function SWEP:Think()
local tr = util.TraceLine( {
start = self.Owner:GetShootPos(),
endpos = self.Owner:GetShootPos() + self.Owner:GetAimVector() * 1000,
filter = self.Owner,
mask = MASK_SHOT_HULL,
} )
if !IsValid( tr.Entity ) then
tr = util.TraceHull( {
start = self.Owner:GetShootPos(),
endpos = self.Owner:GetShootPos() + self.Owner:GetAimVector() * 1000,
filter = self.Owner,
mins = Vector( -32, -32, 0 ),
maxs = Vector( 32, 32, 0 ),
mask = MASK_SHOT_HULL,
} )
end
if self.Lock == 0 and IsValid( tr.Entity ) and ( tr.Entity:IsNPC() || tr.Entity:IsPlayer() || tr.Entity:Health() > 0 ) then
self.Owner:EmitSound( "Weapon_SmartPistol.TargetLock" )
self.Lock = 1
end
if self.Lock == 1 and !IsValid( tr.Entity ) then
self.Lock = 0
end
if self.Weapon:Ammo1() > self.Primary.MaxAmmo then
self.Owner:SetAmmo( self.Primary.MaxAmmo, self.Primary.Ammo )
end
if self.Sprint == 0 and self.Owner:KeyDown( IN_SPEED ) and ( self.Owner:KeyDown( IN_FORWARD ) || self.Owner:KeyDown( IN_BACK ) || self.Owner:KeyDown( IN_MOVELEFT ) || self.Owner:KeyDown( IN_MOVERIGHT ) ) then
if SERVER then
self.Weapon:SendWeaponAnim( ACT_VM_SPRINT_IDLE )
end
self.Primary.Spread = 0.8
self.Owner:SetFOV( 0, 0.1 )
self.Sprint = 1
self.Aim = 0
self.BobTimer = CurTime()
self.Bob = 1
end
if self.Sprint == 1 and self.BobTimer <= CurTime() and self.Bob == 1 then
self.Owner:ViewPunch( Angle( 0, 0, -0.5 ) )
self.BobTimer = CurTime() + 0.3
self.Bob = 2
end
if self.Sprint == 1 and self.BobTimer <= CurTime() and self.Bob == 2 then
self.Owner:ViewPunch( Angle( 0, 0, 0.5 ) )
self.BobTimer = CurTime() + 0.3
self.Bob = 1
end
if self.Sprint == 1 and !self.Owner:KeyDown( IN_SPEED ) then
if SERVER then
self.Weapon:SendWeaponAnim( ACT_VM_IDLE )
end
self:SetNextPrimaryFire( CurTime() + 0.2 )
self:SetNextSecondaryFire( CurTime() + 0.2 )
self.Sprint = 0
self.BobTimer = CurTime()
self.Bob = 0
end
if self.Sprint == 1 and !( self.Owner:KeyDown( IN_FORWARD ) || self.Owner:KeyDown( IN_BACK ) || self.Owner:KeyDown( IN_MOVELEFT ) || self.Owner:KeyDown( IN_MOVERIGHT ) ) then
if SERVER then
self.Weapon:SendWeaponAnim( ACT_VM_IDLE )
end
self:SetNextPrimaryFire( CurTime() + 0.2 )
self:SetNextSecondaryFire( CurTime() + 0.2 )
self.Sprint = 0
self.BobTimer = CurTime()
self.Bob = 0
end
end