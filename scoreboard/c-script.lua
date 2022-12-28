cBoard = { }
display = false

TriggerServerEvent('sb:addNewUser', GetPlayerServerId(PlayerId()))
TriggerServerEvent('sb:sUpdateBoard')

---- Events ----

-- Sends id back to be checked --
RegisterNetEvent('sb:checkPlayerC')
AddEventHandler('sb:checkPlayerC', function()
    TriggerServerEvent('sb:checkPlayerS', GetPlayerServerId(PlayerId()))
end)

RegisterNetEvent('sb:updatecBoard')
AddEventHandler('sb:updatecBoard', function(board)
    cBoard = board

    SendNUIMessage({
        type = "update",
        sendBoard = board
    })
end)

RegisterNetEvent('nui:on')
  AddEventHandler('nui:on', function()
    SendNUIMessage({
        type = "ui",
        display = true,
        doDept = Config.doDept,
        titleTxt = Config.titleTxt,
        sbDefault = Config.sbDefault,
        civColour = Config.civColour,
        pdColour = Config.pdColour,
        fireColour = Config.fireColour
    })
end)

RegisterNetEvent('nui:off')
AddEventHandler('nui:off', function()
    SendNUIMessage({
        type = "ui",
        display = false
    })
end)

---- Loop ----

-- Check if button is clicked --
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsControlJustReleased(0, Config.sbBtn) then
            if display == true then
                TriggerEvent("nui:off", true)
                display = false
            elseif display == false then
                TriggerEvent("nui:on", false)
                display = true
            end
        end
    end
end)