/*
	NEED TO REWRITE!!!!
*/

file.CreateDir('shizlib')

http.Fetch('https://i.imgur.com/5dCjln4.png', function(body, size, headers, code)
	if code == 200 then
		hook.Run('shizlib.imgur.loaded')
	end
end)

shizlib.loadingMat = 'data/cat.png'
shizlib.imgCache = {}

local function fileNameFromURL(url)
	return 'shizlib/' ..
		string.StripExtension(url):gsub('https?://', ''):gsub('[\\/:*?"<>|%.]', '_') ..
		'.' .. string.GetExtensionFromFilename(url)
end

local function matNameFromURL(url)
	return 'data/' .. fileNameFromURL(url)
end

function shizlib.getURLMaterial(url, callback, forceReload)
	local mat = shizlib.imgCache[url]
	if not mat then
		shizlib.imgCache[url] = shizlib.loadingMat
		mat = shizlib.loadingMat

		http.Fetch(url, function(content)
			file.Write(fileNameFromURL(url), content)

			local matName = matNameFromURL(url)
			RunConsoleCommand('mat_reloadmaterial', string.StripExtension(matName))
			shizlib.imgCache[url] = matName

			if isfunction(callback) then callback(shizlib.imgCache[url]) end
		end)
	end
	return mat
end