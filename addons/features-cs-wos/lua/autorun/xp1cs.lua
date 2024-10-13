print(">>>CS 1.6: Port Edition Addon Loaded<<<")

hook.Add( "InitLoadAnimations", "XP1.CS16.LoadAnimations", function()

    wOS.DynaBase:RegisterSource({
        Name = "CS 1.6: Port Edition",
        Type =  WOS_DYNABASE.REANIMATION,
        Male = "models/xp1/m_reanm_cs16.mdl",
        Female = "models/xp1/f_reanm_cs16.mdl",
        Zombie = "models/xp1/z_reanm_cs16.mdl",
    })

    hook.Add( "PreLoadAnimations", "XP1.CS16.MountAnimations", function( gender )
        if gender == WOS_DYNABASE.MALE then
            IncludeModel( "models/xp1/m_reanm_cs16.mdl" )
        elseif gender == WOS_DYNABASE.FEMALE then
            IncludeModel( "models/xp1/f_reanm_cs16.mdl" )
        elseif gender == WOS_DYNABASE.ZOMBIE then
            IncludeModel( "models/xp1/z_reanm_cs16.mdl" )
        end
    end )

end )