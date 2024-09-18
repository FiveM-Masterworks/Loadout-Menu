Config = {}
Config.UsePermissions = true
-- Key to open the menu (default: E)
Config.InteractionKey = 38

-- Marker settings
Config.Marker = {
    type = 1,
    size = vector3(1.5, 1.5, 1.0),
    color = {r = 0, g = 150, b = 255, a = 200},
    bobUpAndDown = false,
    faceCamera = false,
    rotate = false,
    drawOnEnts = false
}

Config.AllowReturnAllWeapons = true
Config.ReturnAllWeaponsText = "Return All Weapons"

Config.UsePeds = false  -- Set to false to disable peds
Config.PedModel = "s_m_y_cop_01"  -- Default ped model, can be changed

-- PD locations
Config.PDLocations = {
    {name = "LSPD HQ", coords = vector3(441.8, -981.5, 30.7)},
    {name = "Sandy Shores Sheriff", coords = vector3(1853.8, 3686.5, 34.2)},
    {name = "Paleto Bay Sheriff", coords = vector3(-448.2, 6008.6, 31.7)},
    {name = "Vespucci PD", coords = vector3(-1108.1, -845.5, 19.3)},
    {name = "Davis Sheriff Station", coords = vector3(364.9, -1584.4, 29.3)}
}

-- Weapon loadouts
Config.Loadouts = {
    {
        name = "Standard Patrol",
        weapons = {"WEAPON_PISTOL", "WEAPON_STUNGUN", "WEAPON_NIGHTSTICK", "WEAPON_FLASHLIGHT"}
    },
    {
        name = "SWAT",
        weapons = {"WEAPON_CARBINERIFLE", "WEAPON_PISTOL", "WEAPON_STUNGUN", "WEAPON_FLASHLIGHT", "WEAPON_SMOKEGRENADE"}
    },
    {
        name = "Detective",
        weapons = {"WEAPON_COMBATPISTOL", "WEAPON_FLASHLIGHT"}
    },
    {
        name = "Highway Patrol",
        weapons = {"WEAPON_COMBATPISTOL", "WEAPON_PUMPSHOTGUN", "WEAPON_STUNGUN", "WEAPON_NIGHTSTICK", "WEAPON_FLASHLIGHT"}
    },
    {
        name = "K-9 Unit",
        weapons = {"WEAPON_PISTOL", "WEAPON_STUNGUN", "WEAPON_NIGHTSTICK", "WEAPON_FLASHLIGHT"}
    }
}
