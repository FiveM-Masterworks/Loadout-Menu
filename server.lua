RegisterServerEvent('leoLoadout:checkPermission')
AddEventHandler('leoLoadout:checkPermission', function()
    local source = source
    if IsPlayerAceAllowed(source, "LeoLoadout") then
        TriggerClientEvent('leoLoadout:setPermission', source, true)
    else
        TriggerClientEvent('leoLoadout:setPermission', source, false)
    end
end)
