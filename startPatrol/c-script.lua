RegisterCommand('sp', function(source, args)
    if(args[1] == 'pd') then
        if pdValid() == true then
            print('Starting patrol as PD')
            startPD(GetPlayerServerId(PlayerId()))
        end
    elseif(args[1] == 'fire') then
        if fireValid() == true then
            print('Starting patrol as Fire')
            startFire(GetPlayerServerId(PlayerId()))
        end
    elseif(args[1] == 'civ') then
        print('Starting patrol as Civ')
        startCiv(GetPlayerServerId(PlayerId()))
    else
        print('Please do /sp [pd] or [fire]')
    end
end, false)

---- Functions ----
-- Civ --
function startCiv(id)
    TriggerServerEvent('sp:sCiv', id)
    notify('Starting patrol as ~o~Civilian Department')
end

-- PD --
function startPD(id)
    TriggerServerEvent('sp:sPD', id)
    notify('Starting patrol as ~b~Police Department')
end

-- Fire --
function startFire(id)
    TriggerServerEvent('sp:sFD', id)
    notify('Starting patrol as ~r~Fire Department')
end

function pdValid() 
    return true
end

function fireValid()
    return true
end

function adminValid()
    return true
end

-- Notifications --
function notify(string)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(string)
    DrawNotification(true, false)
end