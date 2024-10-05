PERK.PrintName = "Custom Gadget Status Effects"
PERK.Description = "Dummy perk that sets up status effects for custom gadgets. \nDoes not do anything."
PERK.Icon = "materials/perks/seismic_wave.png"
PERK.Params = {
    [1] = {value = 0.3, percent = true},
}

-- 11 new status effects

HORDE:RegisterStatus("Ultimate_Shard", "materials/status/damage.png")
HORDE:RegisterStatus("Resist_Shard", "materials/status/damage.png")
HORDE:RegisterStatus("Idol_Of_Greed", "materials/status/assassin_optics.png")
HORDE:RegisterStatus("Swashbuckler", "materials/perks/phalanx.png", true)
HORDE:RegisterStatus("Mutagen_Ballistic", "materials/status/mutagen_ballistic.png")
HORDE:RegisterStatus("Mutagen_Blast", "materials/status/mutagen_blast.png")
HORDE:RegisterStatus("Mutagen_Cold", "materials/status/mutagen_cold.png")
HORDE:RegisterStatus("Mutagen_Electric", "materials/status/mutagen_ballistic.png")
HORDE:RegisterStatus("Mutagen_Fire", "materials/status/mutagen_fire.png")
HORDE:RegisterStatus("Mutagen_Poison", "materials/status/mutagen_poison.png")
HORDE:RegisterStatus("Mutagen_Slash", "materials/status/mutagen_slash.png")
