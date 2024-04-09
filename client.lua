local gameActive = false
local gameResult = nil
local soundId = GetSoundId()

RegisterNUICallback('gameResult', function(data, cb)
    gameResult = data.result
end)

RegisterNUICallback('playSound', function(data, cb)
    if data.result then
        PlaySoundFrontend(soundId, "YES", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
    else
        PlaySoundFrontend(soundId, "NO", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
    end
end)

RegisterCommand('testgame', function()
    if exports["jim-minigame"]:start(3, 15, "fas fa-key", "#25e1b6") then
        triggerNotify(nil, "Success", "success")
    else
        triggerNotify(nil, "Failed", "error")
    end
    Wait(200)
    if exports["jim-minigame"]:start(5, 10, "fas fa-handcuffs", "white", "swap") then
        triggerNotify(nil, "Success", "success")
    else
        triggerNotify(nil, "Failed", "error")
    end
    Wait(200)
    if exports["jim-minigame"]:start(3, 15, "fas fa-martini-glass", "white", "hard") then
        triggerNotify(nil, "Success", "success")
    else
        triggerNotify(nil, "Failed", "error")
    end
end)

exports('start', function(steps, speed, icon, iconCol, mode)
    if not gameActive then
        SetNuiFocus(true, false)
        gameResult = nil
        SendNUIMessage({
            type = 'showGame',
            icon = icon,
            iconCol = iconCol,
            totalSteps = steps,
            markerSpeed = speed,
            mode = mode or "easy",
        })
        Active = true
        while gameResult == nil do Wait(10) end
        SetNuiFocus(false, false)
        return gameResult
    else
        triggerNotify(nil, "You are already doing something", "error")
    end
end)