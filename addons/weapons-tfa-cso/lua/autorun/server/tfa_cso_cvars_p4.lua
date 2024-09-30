if !ConVarExists( "sv_tfa_cso_dmg_windrider_rb" ) then
	CreateConVar( "sv_tfa_cso_dmg_windrider_rb", 15, FCVAR_ARCHIVE, "How much damage does the Windrider's right-click do per attack? Default is 15." )
end

if !ConVarExists( "sv_tfa_cso_dmg_gunslinger_rb" ) then
	CreateConVar( "sv_tfa_cso_dmg_gunslinger_rb", 20, FCVAR_ARCHIVE, "How much damage does the Gunslinger's right-click do per attack? Default is 20." )
end

if !ConVarExists( "sv_tfa_cso_dmg_gunslinger_gs_rb" ) then
	CreateConVar( "sv_tfa_cso_dmg_gunslinger_gs_rb", 25, FCVAR_ARCHIVE, "How much damage does the Gunslinger GS's right-click do per attack? Default is 25." )
end

if !ConVarExists( "sv_tfa_cso_dmg_arbalest" ) then
	CreateConVar( "sv_tfa_cso_dmg_arbalest", 450, FCVAR_ARCHIVE, "How much damage does the Arbalest's right-click do per attack? Default is 450." )
end

if !ConVarExists( "sv_tfa_cso_c4_timer" ) then
	CreateConVar( "sv_tfa_cso_c4_timer", 35, FCVAR_ARCHIVE, "How many seconds does it take for the C4 to explode? Default is 35." )
end

if !ConVarExists( "sv_tfa_cso_c4_defuse_time" ) then
	CreateConVar( "sv_tfa_cso_c4_defuse_time", 10, FCVAR_ARCHIVE, "How many seconds does it take to defuse the C4? Default is 10." )
end

if !ConVarExists( "sv_tfa_cso_drop_stuff_on_death" ) then
	CreateConVar( "sv_tfa_cso_drop_stuff_on_death", 0, FCVAR_ARCHIVE, "Drop held entities (like defusal kits) on death? Default is 0, or disabled." )
end

if !ConVarExists( "sv_tfa_cso_dmg_gunslingers_player" ) then
	CreateConVar( "sv_tfa_cso_dmg_gunslingers_player", 0, FCVAR_ARCHIVE, "Can the Gunslingers' right-click deal damage to players? 0 is no, 1 is yes. Default is 0. NOTE: Bots are still considered players!" )
end

if !ConVarExists( "sv_tfa_cso_dmg_jetgun_player" ) then
	CreateConVar( "sv_tfa_cso_dmg_jetgun_player", 0, FCVAR_ARCHIVE, "Can Lightning Fury deal radius damage to players? 0 is no, 1 is yes. Default is 0. NOTE: Bots are still considered players!" )
end

if !ConVarExists( "sv_tfa_cso_dmg_trinity_detect_player" ) then
	CreateConVar( "sv_tfa_cso_dmg_trinity_detect_player", 0, FCVAR_ARCHIVE, "Will the Trinity Grenade detect players? 0 is no, 1 is yes. Default is 0. NOTE: Bots are still considered players!" )
end

if !ConVarExists( "sv_tfa_cso_dmg_arbalest_player" ) then
	CreateConVar( "sv_tfa_cso_dmg_arbalest_player", 0, FCVAR_ARCHIVE, "Can the Arbalest's right-click deal damage to players? 0 is no, 1 is yes. Default is 0. NOTE: Bots are still considered players!" )
end

if !ConVarExists( "sv_tfa_cso_dmg_trinity_detect_player" ) then
	CreateConVar( "sv_tfa_cso_dmg_trinity_detect_player", 0, FCVAR_ARCHIVE, "Will the Trinity Grenade detect players? 0 is no, 1 is yes. Default is 0. NOTE: Bots are still considered players!" )
end

if !ConVarExists( "sv_tfa_cso_supplybox_spawn_snd" ) then
	CreateConVar( "sv_tfa_cso_supplybox_spawn_snd", 1, FCVAR_ARCHIVE, "SUPPLEY BOXXXXX (0 to enable spawn sounds, 1 to enable. Default is 1.)" )
end

if !ConVarExists( "sv_tfa_cso_c4_radio_snd" ) then
	CreateConVar( "sv_tfa_cso_c4_radio_snd", 1, FCVAR_ARCHIVE, "How much seconds it takes to defuse C4? Default is 10." )
end