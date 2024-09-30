/*
    STRANGE THING, RIGHT?
*/
shizlib.math = shizlib.math or {}

function shizlib.math.sign(value)
	return value > 0 and 1 or value < 0 and -1 or 0
end

function shizlib.math.lerp(src, tgt, fraction, min, max)
	if src == tgt then return src end
	local diff = tgt - src
	local sign = shizlib.math.sign(diff)
	local distAbs = math.abs(diff)
	local dist = distAbs * fraction
	if min then dist = math.max(dist, min) end
	if max then dist = math.min(dist, max) end
	dist = math.min(distAbs, dist)

	return src + dist * sign
end