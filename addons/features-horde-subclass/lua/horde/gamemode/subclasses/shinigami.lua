SUBCLASS.PrintName = "Shinigami" -- Required
SUBCLASS.UnlockCost = 100
SUBCLASS.ParentClass = HORDE.Class_Ghost -- Required for any new classes
SUBCLASS.Icon = "subclasses/shinigami.png" -- Required
SUBCLASS.Description = [[
Ghost subclass.
Specializes in extreme burst damage 
at the cost of firerate and precision.]] -- Required
SUBCLASS.BasePerk = "shinigami_base"
SUBCLASS.Perks = {
    [1] = {title = "Grief", choices = {"shinigami_1_1", "shinigami_1_2"}},
            [2] = {title = "Decomposition", choices = {"shinigami_2_1", "shinigami_2_2"}},
            [3] = {title = "Reaper", choices = {"shinigami_3_1", "shinigami_3_2"}},
            [4] = {title = "Touch of Death", choices = {"shinigami_4_1", "shinigami_4_2"}},
} -- Required