board = { }
stillInSession = { 
    
}
playerCount = 1

display = false

---- Listen to events ----

-- Add new user to scoreboard --
RegisterServerEvent('sb:addNewUser')
AddEventHandler('sb:addNewUser', function(id, name)
    local newBoard = { id = id, name = GetPlayerName(id), dept = "civ" }
    table.insert(board, newBoard)
    playerCount = playerCount + 1
end)

-- Remove player when leaves --
AddEventHandler('playerDropped', function()
    stillInSession = { }
    playerCount = playerCount - 1

    TriggerClientEvent('sb:checkPlayerC', -1)

    playerCheckFinal()
end)

-- Change user dept --
RegisterServerEvent('sb:changeUserDept')
AddEventHandler('sb:changeUserDept', function(id, dept)
    for index, data in ipairs(board) do 
        for key, value in pairs(data) do
            if key == 'id' then
                if value == id then
                    board[index].dept = dept
                end
            end
        end
    end
    updateBoard()
end)

-- Receives who is still in session --
RegisterServerEvent('sb:checkPlayerS')
AddEventHandler('sb:checkPlayers', function(id)
    local addInSession = { id = id }
    table.insert(stillInSession, addInSession)
end)

-- Updates clients board when someone joins --
RegisterServerEvent('sb:sUpdateBoard')
AddEventHandler('sb:sUpdateBoard', function()
    updateBoard()
end)

---- Functions ----

-- Removes anyone who isnt in session anymore --
function playerCheckFinal()
    Citizen.Wait(5000)
    for index, data in ipairs(board) do
        for key, value in pairs(data) do
                    
            if key == "id" then
                for newIndex, newData in ipairs(stillInSession) do
                    for newKey, newValue in pairs(newData) do
                        if newKey == "id" then
                            if newValue == value then
                                print('skipped id, ', value)
                                goto continue
                            else
        
                            end
                        end
        
                    end
                end
                    
        
                print('removed id: ', newValue)
                table.remove(board, index)

        
                ::continue::
            end
        end
    end
end

function updateBoard()
    TriggerClientEvent('sb:updatecBoard', -1, board)
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5000)
        local loadFile = LoadResourceFile(GetCurrentResourceName(), "./scoreboard.json")
        SaveResourceFile(GetCurrentResourceName(), "scoreboard.json", json.encode(board), -1)

        TriggerClientEvent('sb:updatecBoard', -1, board)
    end
end)