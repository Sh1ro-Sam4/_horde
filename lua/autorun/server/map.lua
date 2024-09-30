maplist = {}
maplist["hr_harvest_and_trustee_edit"] = "2828903763"
maplist["hr_swamp"] = "2639938894"
maplist["hr_bloodshedmall"] = "2595264712"
maplist["hr_nalwoo"] = "2832979710"
maplist["hr_antarctic_hospital_d"] = "2409823577"
maplist["hr_desolate"] = "2592100078"
maplist["hr_zombiealley"] = "2840619224"
maplist["hr_dust2"] = "2638826810"
maplist["hr_rooftop_v1_fixed"] = "2930690532"
maplist["de_stad"] = "1751765989"


local map = game.GetMap() local workshopid = maplist[map] if(workshopid != nil) then resource.AddWorkshop(workshopid) end