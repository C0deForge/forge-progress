local result = nil

local function StartProg(title, time)
    result = nil
    print(title, time)
    SendNUIMessage({ action = 'Show', title = title, time = time, config = Config })
    repeat Wait(100) until result ~= nil
    return result
end

local function StopProg()
    SendNUIMessage({ action = 'Stop' })
    Wait(700)
    result = false
end

RegisterNuiCallback('finish', function()
    result = true
end)

exports('StartProg', StartProg)

exports('StopProg', StopProg)

RegisterCommand('test', function()
    local res = exports['forge-progress']:StartProg('Drinking...', 5000)
    print(res)
end)

RegisterCommand('sp', function()
    exports['forge-progress']:StopProg()
end)
