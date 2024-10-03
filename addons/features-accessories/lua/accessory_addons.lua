-- In this file you can decide what accessory add-on to use on your server.
-- Remember that the more add-ons enabled, the more files your players will have to download to join.
-- If you are enabling an add-on that isn't supported by default by this script, you'll have to create the accessory items!
-- (See help file)

/*
	You can check out a list of recommended add-ons to use with this script here:
	http://pastebin.com/AKcpgFmq

	You can of course add other add-ons here if you're planning to create accessories with custom content yourself.
*/

SH_ACC.Addons = {
	/*
		This is how you enable an add-on. Copy the below line (without the --),
		and replace the 000000000 by the workshop add-on's ID
		to automatically add that add-on to the list of content to download.
	*/
	-- ["000000000"] = true,
}

local atleast = false

for id, enable in pairs (SH_ACC.Addons) do
	if (!enable) then
		continue end

	atleast = true

	if (SERVER) then
		resource.AddWorkshop(id)
	end
end

-- if (!atleast) then
-- 	MsgC(Color(52, 152, 219), "SH Accessories", Color(219, 52, 52), ": No accessory add-ons were enabled at all! Check the accessory_addons.lua file to enable an add-on to use!\n")
-- 	MsgC(Color(219, 52, 52), "While no add-on is enabled, the Accessory Vendor will show up empty.\n")

-- 	if (CLIENT) then
-- 		chat.AddText(Color(52, 152, 219), "SH Accessories", Color(219, 52, 52), ": No accessory add-ons were enabled at all! Check the accessory_addons.lua file to enable an add-on to use!")
-- 		chat.AddText(Color(219, 52, 52), "While no add-on is enabled, the Accessory Vendor will show up empty.")
-- 	end
-- end