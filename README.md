Here's a README file for the loadout menu on GitHub:

---

# Loadout Menu for vMenu Servers

This script adds a highly configurable loadout menu to your vMenu server, making the armories of MLOs more functional and useful. You can customize the loadouts, configure different police department locations, and adjust the marker and interaction settings to suit your server's needs.

## Features

- **Customizable Loadouts:** Pre-configured weapon loadouts for different roles like Standard Patrol, SWAT, and more.
- **Marker System:** Configurable marker settings, including size, color, and interaction.
- **Support for Peds:** AI PED OPTION COMING IN SOON !
- **Multiple PD Locations:** Set up armories at different police departments around the map.
- **Permission System:** Option to enable or disable permissions for accessing the menu.
- **Return All Weapons:** Players can return all their weapons with a single command.

## Configuration

All configuration options can be found in the `Config` section of the script. Below are the key configuration options:

### Menu Configuration
```lua
Config.UsePermissions = false  -- Set to true to restrict menu access via permissions.
Config.InteractionKey = 38     -- Key to open the menu (default: E).
```

### Marker Settings
```lua
Config.Marker = {
    type = 1,
    size = vector3(1.5, 1.5, 1.0),  -- Adjust marker size.
    color = {r = 0, g = 150, b = 255, a = 200},  -- Marker color (RGB + Alpha).
    bobUpAndDown = false,  -- Set to true to make the marker bob up and down.
    faceCamera = false,    -- Set to true to make the marker always face the camera.
    rotate = false,        -- Set to true to make the marker rotate.
    drawOnEnts = false     -- Set to true to draw markers on entities.
}
```

### Weapon Return Option
```lua
Config.AllowReturnAllWeapons = true  -- Enable or disable the "Return All Weapons" option.
Config.ReturnAllWeaponsText = "Return All Weapons"  -- Text shown for returning all weapons.
```

### Ped Interaction
```lua
Config.UsePeds = false           -- Set to true to enable ped interaction for the menu.
Config.PedModel = "s_m_y_cop_01"  -- The default ped model, can be customized.
```

### PD Locations
Add or remove police department locations where the loadout menu can be accessed:
```lua
Config.PDLocations = {
    {name = "LSPD HQ", coords = vector3(441.8, -981.5, 30.7)},
    {name = "Sandy Shores Sheriff", coords = vector3(1853.8, 3686.5, 34.2)},
    {name = "Paleto Bay Sheriff", coords = vector3(-448.2, 6008.6, 31.7)},
    {name = "Vespucci PD", coords = vector3(-1108.1, -845.5, 19.3)},
    {name = "Davis Sheriff Station", coords = vector3(364.9, -1584.4, 29.3)}
}
```

### Loadout Configuration
You can define multiple loadouts with different weapons, such as Standard Patrol, SWAT, Detective, etc.:
```lua
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
```
Here's the section for "Permissions Setup" by itself:

---

## Permissions Setup

If you wish to restrict access to certain users, you can enable permissions and configure them as follows:

### Configuring Permissions in `server.cfg`

1. Set `Config.UsePermissions` to `true` in the script configuration.
2. Add the following to your `server.cfg` file:

```plaintext
add_ace group.leo LeoLoadout allow  # Grants the 'LeoLoadout' permission to the 'leo' group.
#add_principal identifier.steam:UserHEX group.leo  # Uncomment and replace with a valid Steam identifier to assign a user to the 'leo' group.
```

With this setup, only users who belong to the `group.leo` group will be able to access the loadout menu. You can assign users to the group by their Discord ID or use any other available methods in your permissions system.
## Installation

1. Clone or download this repository.
2. Add the script to your FiveM server's resources folder.
3. Add `start loadout_menu` to your `server.cfg`.
4. Customize the `Config` file to fit your server's needs.

## Contributing

If you have any suggestions or improvements, feel free to open a pull request or issue on GitHub.

---

Enjoy using the Loadout Menu on your vMenu server!

