local hasPermission = false
local menuPool = NativeUI.CreatePool()
local mainMenu = NativeUI.CreateMenu("LEO Weapon Loadouts", "Select your loadout")
menuPool:Add(mainMenu)

-- Create a silent audio object
local function CreateSilentAudio()
    return {
        Id = -1,
        Play = function(self) end,
        Stop = function(self) end,
        Release = function(self) end
    }
end

-- Disable mouse controls and replace audio with silent audio
mainMenu.Settings.MouseControlsEnabled = false
mainMenu.Settings.InstructionalButtons = {}
mainMenu.Settings.Audio = CreateSilentAudio()

local function GiveWeaponLoadout(loadout)
    local ped = PlayerPedId()
    RemoveAllPedWeapons(ped, true)
    
    for _, weapon in ipairs(loadout) do
        GiveWeaponToPed(ped, GetHashKey(weapon), 250, false, false)
    end
end

local function AddLoadoutItem(menu, name, loadout)
    local item = NativeUI.CreateItem(name, "Select this loadout")
    menu:AddItem(item)
    item.Activated = function(_, _)
        GiveWeaponLoadout(loadout)
        ShowNotification("Loadout " .. name .. " equipped.")
        menuPool:CloseAllMenus()
    end
end

-- Add loadout items to the menu
for _, loadout in ipairs(Config.Loadouts) do
    AddLoadoutItem(mainMenu, loadout.name, loadout.weapons)
end

-- Add "Return All Weapons" option
if Config.AllowReturnAllWeapons then
    local returnItem = NativeUI.CreateItem(Config.ReturnAllWeaponsText, "Remove all weapons")
    mainMenu:AddItem(returnItem)
    returnItem.Activated = function(_, _)
        local ped = PlayerPedId()
        RemoveAllPedWeapons(ped, true)
        ShowNotification("All weapons have been returned.")
        menuPool:CloseAllMenus()
    end
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        menuPool:ProcessMenus()
        
        local playerCoords = GetEntityCoords(PlayerPedId())
        
        for _, location in ipairs(Config.PDLocations) do
            local distance = #(playerCoords - location.coords)
            
            if distance < 10.0 then
                DrawMarker(
                    1,
                    location.coords.x, location.coords.y, location.coords.z - 1.0,
                    0.0, 0.0, 0.0,
                    0.0, 0.0, 0.0,
                    1.0, 1.0, 1.0,
                    0, 0, 255, 200,
                    false, false, 2, false, nil, nil, false
                )
                
                if distance < 1.5 then
                    if not mainMenu:Visible() then
                        if not Config.UsePermissions or hasPermission then
                            ShowHelpNotification("Press ~INPUT_CONTEXT~ to open the LEO Weapon Loadout menu")
                        else
                            ShowHelpNotification("You don't have permission to access this menu")
                        end
                    end
                    
                    if IsControlJustReleased(0, 38) and (not Config.UsePermissions or hasPermission) then
                        mainMenu:Visible(not mainMenu:Visible())
                    end
                end
            end
        end
    end
end)

function ShowNotification(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(false, false)
end

function ShowHelpNotification(text)
    BeginTextCommandDisplayHelp("STRING")
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandDisplayHelp(0, false, true, -1)
end

RegisterNetEvent('leoLoadout:setPermission')
AddEventHandler('leoLoadout:setPermission', function(perm)
    hasPermission = perm
end)

Citizen.CreateThread(function()
    TriggerServerEvent('leoLoadout:checkPermission')
end)

RegisterServerEvent('leoLoadout:checkPermission')
AddEventHandler('leoLoadout:checkPermission', function()
    local source = source
    if not Config.UsePermissions or IsPlayerAceAllowed(source, "LeoLoadout") then
        TriggerClientEvent('leoLoadout:setPermission', source, true)
    else
        TriggerClientEvent('leoLoadout:setPermission', source, false)
    end
end)
