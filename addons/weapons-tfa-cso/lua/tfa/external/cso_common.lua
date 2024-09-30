CSO = {}

function CSO:IsValidTarget(target, owner)
    if not IsValid(target) then return false end -- invalid target
	if target == owner then return false end -- owner

	if engine.ActiveGamemode() == "zombiesurvival" then
		if target:IsPlayer() and target:Team() == TEAM_UNDEAD and target:Alive() and not target:IsFrozen() then
			return true
		end
	else
		if (target:IsPlayer() and target:Alive() and not target:IsFrozen()) or target:IsNPC() or target:IsNextBot() then
			return true
		end
	end
	return false
end

function CSO:DMGInfo(attacker, inflictor, dmg, force, type, pos)
    local dmginfo = DamageInfo()
        dmginfo:SetAttacker(attacker)
        dmginfo:SetInflictor(inflictor)
        dmginfo:SetDamage(dmg)
        dmginfo:SetDamageForce(force)
        dmginfo:SetDamageType(type)
        dmginfo:SetDamagePosition(pos)
    return dmginfo
end

function CSO:DoRadiusAttack(wep, dmginfo, radius, knockback, force, dmgscale, override, vec, dmgfalloff)
    if(!IsValid(wep)) then return end
    local owner = wep:GetOwner()
    local dmg = dmginfo:GetDamage()
    if(!IsValid(owner)) then return end
    local ori = owner:GetPos()
    if override then
        ori = vec
    end
    for k,v in pairs(ents.FindInSphere(ori, radius)) do
        if (HORDE:IsPlayerOrMinion(v) == true) then continue end
        if CSO:IsValidTarget(v, owner) then
            if knockback then
                local f = ((v:GetPos() - ori):Angle():Forward() * force) + Vector(0, 0, 250)
                v:SetVelocity(v:GetVelocity() + f)
                dmginfo:SetDamageForce(f)
            end
            if dmgfalloff then
                local dst = v:GetPos():Distance(ori)
                dmginfo:SetDamage(dmg *  (1.1 - (dst / radius))) -- use 1.1 to make sure we still have a 10% base damage
            end
            dmginfo:SetDamagePosition(v:GetPos() + v:OBBCenter())
            dmginfo:ScaleDamage(dmgscale)
            v:TakeDamageInfo(dmginfo)
        end
    end
end

function CSO:DoRadiusAttack_WeaponLess(attacker, dmginfo, radius, knockback, force, dmgscale, override, vec, dmgfalloff)
    if(!IsValid(attacker)) then return end
    local ori = attacker:GetPos()
    local dmg = dmginfo:GetDamage()
    if(override) then
        ori = vec
    end
    for k,v in pairs(ents.FindInSphere(ori, radius)) do
        if(knockback) then
            local f = (v:GetPos() - ori):Angle():Forward() * force
            v:SetVelocity(v:GetVelocity() + f)
            dmginfo:SetDamageForce(f)
        end
        if(dmgfalloff) then
            local dst = v:GetPos():Distance(ori)
            dmginfo:SetDamage(dmg *  (1.1 - (dst / radius)))
        end
        dmginfo:SetDamagePosition(v:GetPos())
        dmginfo:ScaleDamage(dmgscale)
        v:TakeDamageInfo(dmginfo)
    end
end

