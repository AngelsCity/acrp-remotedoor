local function Debug(msg)
    print(('^3[RemoteDoor-DEBUG] ^7%s'):format(msg))
end


local function GetDoorConfig(doorId)
    for _, d in ipairs(Config.RemoteDoors or {}) do
        if d.id == doorId then
            return d
        end
    end
    return nil
end


CreateThread(function()
    Wait(2000)
    Debug('Starte ox_doorlock Tür-Scan...')

    local ok, doors = pcall(function()
        return exports.ox_doorlock:getDoorList()
    end)

    if not ok or not doors then
        Debug('FEHLER: getDoorList() konnte nicht ausgeführt werden!')
        return
    end

    Debug('--- ox_doorlock Türen ---')
    for index, door in pairs(doors) do
        Debug(('Index: %s | DB-ID: %s | Name: %s'):format(
            tostring(index),
            tostring(door.id),
            tostring(door.name)
        ))
    end
    Debug('--- Ende Liste ---')
end)


RegisterNetEvent('remoteDoor:toggle', function(doorId, open)
    local src = source

    Debug('----------------------------------------')
    Debug(('remoteDoor:toggle von %s'):format(src))
    Debug(('Tür-ID: %s | open: %s'):format(tostring(doorId), tostring(open)))

    local cfg = GetDoorConfig(doorId)
    if not cfg then
        Debug(('FEHLER: Tür-ID %s nicht in Config gefunden!'):format(tostring(doorId)))
        return
    end

    Debug(('Config gefunden: %s'):format(cfg.name))

    
    local okDoor, doorData = pcall(function()
        return exports.ox_doorlock:getDoor(doorId)
    end)

    if not okDoor then
        Debug(('FEHLER: getDoor(%s) wirft Fehler!'):format(tostring(doorId)))
    elseif not doorData then
        Debug(('WARNUNG: getDoor(%s) gibt nil zurück!'):format(tostring(doorId)))
    else
        Debug(('ox_doorlock Tür gefunden: DB-ID: %s | Name: %s'):format(
            tostring(doorData.id),
            tostring(doorData.name)
        ))
    end

    local state = open and 0 or 1

    Debug(('Setze Türstate: %s'):format(state))

   
    Debug(('TriggerEvent("ox_doorlock:setState", %s, %s)'):format(doorId, state))
    TriggerEvent('ox_doorlock:setState', doorId, state)

    
    if exports.ox_doorlock.setDoorState then
        Debug(('exports.ox_doorlock:setDoorState(%s, %s)'):format(doorId, state))
        exports.ox_doorlock:setDoorState(doorId, state)
    else
        Debug('WARNUNG: exports.ox_doorlock:setDoorState existiert NICHT.')
    end

    Debug(('FERTIG: Tür %s sollte jetzt %s sein.'):format(
        tostring(doorId),
        open and 'GEÖFFNET' or 'GESCHLOSSEN'
    ))

    
    TriggerClientEvent('remoteDoor:playSound', -1, doorId, cfg.sound, cfg.soundVolume, cfg.soundRadius)

    Debug('----------------------------------------')
end)
