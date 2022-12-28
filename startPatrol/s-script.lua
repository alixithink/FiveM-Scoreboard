RegisterServerEvent('sp:sCiv')
AddEventHandler('sp:sCiv', function(id)
    TriggerEvent('sb:changeUserDept', id, "civ")
end)

RegisterServerEvent('sp:sPD')
AddEventHandler('sp:sPD', function(id)
    TriggerEvent('sb:changeUserDept', id, "pd")
end)


RegisterServerEvent('sp:sFD')
AddEventHandler('sp:sFD', function(id)
    TriggerEvent('sb:changeUserDept', id, "fire")
end)