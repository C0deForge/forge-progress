Installation on ESX core

function ESX.Progressbar(message, length)
    return exports['forge-progress']:StartProg(message, length)
end

Installation on QB core

function QBCore.Functions.Progressbar(name, label, duration, useWhileDead, canCancel, disableControls, animation, prop, propTwo, onFinish, onCancel)
    local res = exports['forge-progress']:StartProg(label, duration)
    repeat Wait(100) until res ~= nil
    if res then
        onFinish()
    else
        onCancel()
    end
end