ArcCW_MW2_Mech = { "weapons/fesiugmw2/mechanism/weap_mech_layer_c1.wav", "weapons/fesiugmw2/mechanism/weap_mech_layer_c2.wav", "weapons/fesiugmw2/mechanism/weap_mech_layer_c3.wav", "weapons/fesiugmw2/mechanism/weap_mech_layer_c4.wav", "weapons/fesiugmw2/mechanism/weap_mech_layer_c5.wav", "weapons/fesiugmw2/mechanism/weap_mech_layer_c6.wav", "weapons/fesiugmw2/mechanism/weap_mech_layer_c7.wav", "weapons/fesiugmw2/mechanism/weap_mech_layer_c8.wav" }

sound.Add(
	{
		name	=		"MW2Common.Deploy",			
		channel	=		CHAN_ITEM,
		volume	=		1.0,
		pitch	=		{90, 110},
		sound	= 		"weapons/fesiugmw2/wpnarm_2.wav"	
	}
)
sound.Add(
	{
		name	=		"MW2Common.Underbarrel",			
		channel	=		CHAN_ITEM,
		volume	=		1.0,
		pitch	=		{90, 110},
		sound	= 		"weapons/fesiugmw2/pu_weapon01.wav"	
	}
)
sound.Add(
	{
		name	=		"MW2Common.Masterkey_Load",			
		channel	=		CHAN_ITEM,
		volume	=		1.0,
		pitch	=		100,
		sound	= 		{
							"weapons/fesiugmw2/foley/wpfoly_shotattach_reload_clipin1_v1.wav",
							"weapons/fesiugmw2/foley/wpfoly_shotattach_reload_clipin2_v1.wav"
						}
	}
)

sound.Add(
	{
		name	=		"MW2Common.Melee.Swing",			
		channel	=		CHAN_STATIC,
		volume	=		1.0,
		sound	= 		{
							"weapons/fesiugmw2/melee/h2h_knife_swing1.wav",
							"weapons/fesiugmw2/melee/h2h_knife_swing2.wav"
						}
	}
)

sound.Add(
	{
		name	=		"MW2Common.Melee.HitFleshy_Stab", -- heh
		channel	=		CHAN_ITEM,
		volume	=		1.0,
		sound	= 		{
							"weapons/fesiugmw2/melee/h2h_knife_stab1.wav",
							"weapons/fesiugmw2/melee/h2h_knife_stab1.wav"
						}
	}
)

sound.Add(
	{
		name	=		"MW2Common.Melee.HitFleshy_Slice", -- heh
		channel	=		CHAN_ITEM,
		volume	=		1.0,
		sound	= 		{
							"weapons/fesiugmw2/melee/h2h_knife_slice1.wav",
							"weapons/fesiugmw2/melee/h2h_knife_slice2.wav"
						}
	}
)

sound.Add(
	{
		name	=		"MW2Common.Melee.HitWorld",
		channel	=		CHAN_ITEM,
		volume	=		1.0,
		sound	= 		{
							"weapons/fesiugmw2/melee/h2h_knife_impact_other1.wav",
							"weapons/fesiugmw2/melee/h2h_knife_impact_other2.wav",
							"weapons/fesiugmw2/melee/h2h_knife_impact_other3.wav"
						}
	}
)