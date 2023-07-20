local Failed = false
local Success = false

---@param points number || description: "Determines the amount of dots on the untangle game."
---@param time number || description: "In seconds, it determines the time until fail on the minigame!"
local function StartUntangleGame(points, time)
    if not points or points < 5 then
        points = Config.DefaultPoints
    end

    if not time then
        time = Config.DefaultLength
    end

    SendNUIMessage({action = "untangle", points = points, time = time})
    SetNuiFocus(true, true)

    while not Failed or not Success do
        Wait(1000)
        if Config.Debug then print("Player has not finished the hack...") end
        if Failed == true or Success == true then
            break
        end
    end

    if Failed then
        if Config.Debug then
            print("You failed!")
        end
        return false
    elseif Success then
        if Config.Debug then
            print("Success!")
        end
        return true
    end

    -- Default to returning false, although this code should not be executed.
    return false
end exports('StartUntangleGame', StartUntangleGame)

RegisterNUICallback('success', function(data)
    Success = true
    SetNuiFocus(false, false)
    Wait(2500)
    Success = false
end)

RegisterNUICallback('failed', function(data)
    Failed = true
    SetNuiFocus(false, false)
    Wait(2500)
    Failed = false
end)

if Config.Debug then
    RegisterCommand('untangle', function ()
        print("Starting Untangle Hack!")
        local result = StartUntangleGame()
        if result then -- Success
            print("Wow! You did it!")
        else -- Failed
            print("You failed, unlucky.")
        end
    end, false)
end