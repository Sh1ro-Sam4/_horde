/*--------------------------------------------------
	=============== Autorun File ===============
	*** Copyright (c) 2012-2018 by Mayhem, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
------------------ Addon Information ------------------
local PublicAddonName = "Horror SNPC"
local AddonName = "Horror SNPC"
local AddonType = "SNPC"
local AutorunFile = "autorun/nm_autorun.lua"
local ConvarList_Horror = {}
local NPC_MetaTable = FindMetaTable("NPC")
-------------------------------------------------------
local VJExists = file.Exists("lua/autorun/vj_base_autorun.lua","GAME")
-- Options -------------------------------------------------------
ConvarList_Horror["vj_mutant_is_macho"] = 0 -- Is the mutant macho?
---------------------------------------------------------------------------------------------------------------------------
for k, v in pairs(ConvarList_Horror) do
	if !ConVarExists(k) then CreateConVar(k, v, {FCVAR_ARCHIVE}) end
end
-------------------------------------------------------
if VJExists == true then
	include('autorun/vj_controls.lua')

	local vCat = "Nightmare"
	VJ.AddNPC("Horror","npc_vj_nm_nightmare",vCat)

	VJ.AddCategoryInfo(vCat,{Icon = "vj_icons/HorrorIcon.png"})
-- !!!!!! DON'T TOUCH ANYTHING BELOW THIS !!!!!! -------------------------------------------------------------------------------------------------------------------------
	AddCSLuaFile(AutorunFile)
	VJ.AddAddonProperty(AddonName,AddonType)
else
	if (CLIENT) then
		chat.AddText(Color(0,200,200),PublicAddonName,
		Color(0,255,0)," was unable to install, you are missing ",
		Color(255,100,0),"VJ Base!")
	end
	timer.Simple(1,function()
		if not VJF then
			if (CLIENT) then
				VJF = vgui.Create("DFrame")
				VJF:SetTitle("VJ Base is not installed")
				VJF:SetSize(900,800)
				VJF:SetPos((ScrW()-VJF:GetWide())/2,(ScrH()-VJF:GetTall())/2)
				VJF:MakePopup()
				VJF.Paint = function()
					draw.RoundedBox(8,0,0,VJF:GetWide(),VJF:GetTall(),Color(200,0,0,150))
				end
				local VJURL = vgui.Create("DHTML")
				VJURL:SetParent(VJF)
				VJURL:SetPos(VJF:GetWide()*0.005, VJF:GetTall()*0.03)
				local x,y = VJF:GetSize()
				VJURL:SetSize(x*0.99,y*0.96)
				VJURL:SetAllowLua(true)
				VJURL:OpenURL("https://sites.google.com/site/vrejgaming/vjbasemissing")
			elseif (SERVER) then
				timer.Create("VJBASEMissing",5,0,function() print("VJ Base is Missing! Download it from the workshop!") end)
			end
		end
	end)
end
-- Menu Language -------------------------------------------------------------------------------------------------------------------------
if (CLIENT) then
	language.Add("vjbase.menugeneral.default", "Default")
end
---------------------------------------------------------------------------------------------------------------------------------------------
local function VJ_NM_OPTIONS_HORROR(Panel)
	if !game.SinglePlayer() then
		if !LocalPlayer():IsAdmin() or !LocalPlayer():IsSuperAdmin() then
			Panel:AddControl( "Label", {Text = "You are not an admin!"})
			Panel:ControlHelp("Notice: Only admins can change this settings.")
			return
		end
	end

	local vj_horror_reset = {Options = {}, CVars = {}, Label = "Reset Everything:", MenuButton = "0"}
	vj_horror_reset.Options["#vjbase.menugeneral.default"] = {
	vj_mutant_is_macho = "0",
	}

	Panel:AddControl("ComboBox", vj_horror_reset)

	Panel:AddControl( "Label", {Text = "Mutant is Macho:"})
	Panel:AddControl("Checkbox", {Label = "Toggle on/off.", Command = "vj_mutant_is_macho"})
end

function VJ_ADDTOMENU_NIGHTMARE_HORROR()
	spawnmenu.AddToolMenuOption("DrVrej", "SNPC Configures", "Nightmare", "Nightmare", "", "", VJ_NM_OPTIONS_HORROR, {})
end
	hook.Add("PopulateToolMenu", "VJ_ADDTOMENU_NIGHTMARE_HORROR", VJ_ADDTOMENU_NIGHTMARE_HORROR)
