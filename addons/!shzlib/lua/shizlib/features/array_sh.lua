shizlib.array = shizlib.array or {}

function shizlib.array.toKeys(array, value)
	if value == nil then
		value = true
	end

	local out = {}
	for _, v in ipairs(array) do
		out[v] = value
	end

	return out
end