--[[
             /|  
,           /||  
\\ /` -_-_   ||  
 \\   || \\  ||  
 /\\  || ||  ||  
/  \; ||-'  ,/-' 
      |/         
      '          
Xp1 criador do addon 

]]--

local randomanims = GetConVar('deathanimation_random')

local BadBeginnings = { "g_", "p_", "e_", "b_", "bg_", "hg_", "tc_", "aim_", "turn", "gest_", "pose_", "auto_", "layer_", "posture", "bodyaccent", "a_" }
local BadStrings = { "gesture", "posture", "_trans_", "_rot_", "gest", "aim", "bodyflex_", "delta", "ragdoll", "spine", "arms" } -- Copied from RobotBoy655's easy animation tool code

local function GetGoodAnimationsAndDo(ent, func, tbl) -- This is just used to run a function if a sequence is valid
	for _, seq in pairs(ent:GetSequenceList()) do
		local goodanim = true
		for _, str in ipairs(BadStrings) do
			if string.find(string.lower(seq), str) then
				goodanim = false
				break
			end
		end
		for _, str in ipairs(BadBeginnings) do
			if str == string.Left(string.lower(seq), string.len(str)) then
				goodanim = false
				break
			end
		end
		if tbl then
			for _, str in pairs(tbl) do
				if str == seq then
					goodanim = false
					break
				end
			end
		end
		if goodanim then
			func(seq)
		end
	end
end

local function OpenMenuNoSort(pnl) -- This function is needed just so the DCheckBox won't get sorted
	if #pnl.Choices == 0 then
		return
	end
	if IsValid(pnl.Menu) then
		pnl.Menu:Remove()
		pnl.Menu = nil
	end
	pnl.Menu = DermaMenu()
	for k, v in pairs(pnl.Choices) do
		pnl.Menu:AddOption(v, function()
			pnl:ChooseOption(v, k)
		end)
	end
	local x, y = pnl:LocalToScreen(0, pnl:GetTall())
	pnl.Menu:SetMinimumWidth(pnl:GetWide())
	pnl.Menu:Open(x, y, false, pnl)
end

local function PaintButton(btn, w, h) -- Used to paint the buttons
	if btn.Depressed then
		surface.SetDrawColor(0, 200, 255, 255)
	elseif btn.Hovered then
		surface.SetDrawColor(200, 200, 200, 255)
	else
		surface.SetDrawColor(255, 255, 255, 255)
	end
	surface.DrawRect(0, 0, w, h)
	surface.SetDrawColor(0, 0, 0, 255)
	surface.DrawOutlinedRect(0, 0, w, h)
end

local function UpdateRandomTblCvar(tbl) -- Update the convar from the table
	local str = ''
	for k, line in pairs(tbl:GetLines()) do
		str = str .. line:GetValue(1) .. ','
	end
	RunConsoleCommand('deathanimation_random', string.sub(str, 1, #str - 1)) -- string.sub to remove the last ,
end

local function AddDescription(panel)
	local descriptionLabel = vgui.Create('DLabel', panel)
	descriptionLabel:SetText('CS 1.6 Port Edition')
	descriptionLabel:SetTextColor(Color(0, 0, 0)) -- Preto
	descriptionLabel:SetContentAlignment(5)
	descriptionLabel:SetFont('DermaLarge')
	descriptionLabel:SetSize(500, 30) -- Ajuste o tamanho da fonte aqui
	panel:AddItem(descriptionLabel)
end

hook.Add('PopulateToolMenu', 'DeathAnimationSettings', function()
    spawnmenu.AddToolMenuOption('Options', 'CS 1.6 Death', 'Death_Animation_Settings', 'CS 1.6 Death', '', '', function(panel)
        panel:ClearControls()
        AddDescription(panel)
        if LocalPlayer():IsAdmin() then
            panel:CheckBox('CS 1.6 death', 'cs_death')
            panel:CheckBox('CS 1.6 death hostage', 'cs_death_hostage')
            panel:CheckBox('CS Beta death', 'cs_beta_death')
			panel:CheckBox('CS 1.6 pose death', 'cs_pose_death')
            panel:CheckBox('Animations only on ground', 'death_onground')
        end
		
        local deathSequences = { "back" }
        local hostageDeathSequences = { "hostage_die1" }
        local betaDeathSequences = { "beta_die_chest1" } -- Adicione qualquer animação beta aqui se necessário
        local currentSequence = nil
        local function UpdateCurrentSequence()
            if GetConVar("cs_death"):GetBool() then
                currentSequence = table.Random(deathSequences)
            elseif GetConVar("cs_death_hostage"):GetBool() then
                currentSequence = table.Random(hostageDeathSequences)
            elseif GetConVar("cs_beta_death"):GetBool() then
                currentSequence = table.Random(betaDeathSequences)
	        elseif GetConVar("cs_pose_death"):GetBool() then
                currentSequence = table.Random(betaDeathSequences)
            else
                currentSequence = "idle_all"
            end
        end
		
		local mdlpnl = vgui.Create("DModelPanel")
		mdlpnl:SetModel(LocalPlayer():GetModel())
		mdlpnl.Entity.GetPlayerColor = function() return LocalPlayer():GetPlayerColor() end
		mdlpnl:SetHeight(400)
		function mdlpnl:LayoutEntity(ent)
			local mn, mx = ent:GetRenderBounds()
			local size = math.max(math.abs(mn.x) + math.abs(mx.x), math.abs(mn.y) + math.abs(mx.y), math.abs(mn.z) + math.abs(mx.z))
			self:SetFOV(35)
			self:SetCamPos(Vector(size, size, size))
			self:SetLookAt((mn + mx) * 0.5)
			UpdateCurrentSequence()
			ent:SetSequence(currentSequence)
			if ent:GetCycle() >= 0.95 then
				ent:SetCycle(0.05)
			end
			self:RunAnimation()
		end
        panel:AddItem(mdlpnl)
        cvars.AddChangeCallback("cs_death", function(name, old, new)
            if IsValid(mdlpnl) then
                mdlpnl:LayoutEntity(mdlpnl.Entity)
            end
        end, "UpdateMdlPanelOnDeathChange")
        cvars.AddChangeCallback("cs_death_hostage", function(name, old, new)
            if IsValid(mdlpnl) then
                mdlpnl:LayoutEntity(mdlpnl.Entity)
		    end
        end, "UpdateMdlPanelOnDeathChange")
        cvars.AddChangeCallback("cs_pose_death", function(name, old, new)
            if IsValid(mdlpnl) then
                mdlpnl:LayoutEntity(mdlpnl.Entity)
            end
        end, "UpdateMdlPanelOnHostageDeathChange")
        cvars.AddChangeCallback("cs_beta_death", function(name, old, new)
            if IsValid(mdlpnl) then
                mdlpnl:LayoutEntity(mdlpnl.Entity)
            end
        end, "UpdateMdlPanelOnBetaDeathChange")
	
-- Adicionar o rótulo de créditos com a fonte do GMod
       local creditsLabel = vgui.Create('DLabel', panel)
       creditsLabel:SetText('Credits:')
       creditsLabel:SetTextColor(Color(0, 0, 0)) -- Preto
       creditsLabel:SetContentAlignment(5) -- Centralizado no meio
       creditsLabel:SetFontInternal("DermaDefaultBold") -- Defina a fonte aqui
       creditsLabel:SetSize(00, 15) -- Ajuste o tamanho da fonte aqui
       creditsLabel:SetPos(0, 10) -- Ajuste a posição vertical (posição Y)
       panel:AddItem(creditsLabel)

-- Adicionar o rótulo de créditos do criador
      local creatorLabel = vgui.Create('DLabel', panel)
      creatorLabel:SetText('Xp1: Coder, Animator')
      creatorLabel:SetTextColor(Color(0, 0, 0)) -- Preto
      creatorLabel:SetContentAlignment(5) -- Centralizado no meio
      creatorLabel:SetFontInternal("DermaDefaultBold") -- Defina a fonte aqui
      creatorLabel:SetSize(90, 15) -- Ajuste o tamanho da fonte aqui
      creatorLabel:SetPos(0, 5) -- Ajuste a posição vertical (posição Y)
      panel:AddItem(creatorLabel)

	end)
end)