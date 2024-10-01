local Player = FindMetaTable('Player')
shizlib.use = shizlib.use or {}

function shizlib.use.getTrace(ply)
	return ply:GetEyeTraceLimited(CFG.useDist)
end

function shizlib.use.check(ply, ent)
	if not IsValid(ply) or not IsValid(ent) then return false end

	local tr = shizlib.use.getTrace(ply)

	return tr.Entity == ent
end