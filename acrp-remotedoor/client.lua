
local function _L(key, ...)
    local lang = Config.Locale or "de"
    if not Locales or not Locales[lang] then return key end

    local str = Locales[lang][key] or key
    if select("#", ...) > 0 then
        return string.format(str, ...)
    end
    return str
end

local function Debug(msg)
    if Config.Debug then
        print(('^3[RemoteDoor-Client] ^7%s'):format(msg))
    end
end

local function PlayAnimation()
    if not Config.Animation.enabled then return end

    local ped = PlayerPedId()
    local dict = Config.Animation.dict
    local name = Config.Animation.name

    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do Wait(0) end

    TaskPlayAnim(ped, dict, name, 8.0, -8.0, Config.Animation.duration, Config.Animation.flag, 0, false, false, false)
end

-- Menü öffnen
local function OpenDoorMenu()
    local options = {}

    for _, door in ipairs(Config.RemoteDoors) do
        table.insert(options, {
            title = door.name,
            icon = 'door-open',
            menu = 'door_menu_' .. door.id
        })

        lib.registerContext({
            id = 'door_menu_' .. door.id,
            title = door.name,
            options = {
                {
                    title = _L("menu_open"),
                    icon = "unlock",
                    onSelect = function()
                        PlayAnimation()
                        TriggerServerEvent('remoteDoor:toggle', door.id, true)
                    end
                },
                {
                    title = _L("menu_close"),
                    icon = "lock",
                    onSelect = function()
                        PlayAnimation()
                        TriggerServerEvent('remoteDoor:toggle', door.id, false)
                    end
                }
            }
        })
    end

    lib.registerContext({
        id = 'remote_door_main',
        title = _L('menu_title'),
        options = options
    })

    lib.showContext('remote_door_main')
end

-- Command
if Config.EnableCommand then
    RegisterCommand(Config.CommandName, function()
        OpenDoorMenu()
    end)
end

-- ox_target
if Config.EnableTarget then
    exports.ox_target:addSphereZone({
        coords = Config.TargetCoords,
        radius = Config.TargetRadius,
        options = {
            {
                name = 'remote_door_menu',
                label = _L('menu_title'),
                icon = 'fa-solid fa-door-open',
                onSelect = function()
                    OpenDoorMenu()
                end
            }
        }
    })
end

-- Sound
RegisterNetEvent('remoteDoor:playSound', function(sound, volume, radius, doorId)
    local ped = PlayerPedId()
    local pCoords = GetEntityCoords(ped)

    -- Türposition aus ox_doorlock holen
    local door = exports.ox_doorlock:getDoor(doorId)
    if not door or not door.coords then return end

    if #(pCoords - door.coords) <= radius then
        SendNUIMessage({
            type = "playSound",
            sound = sound,
            volume = volume
        })
    end
end)

RegisterNetEvent('remoteDoor:notify', function(title, desc, ntype)
    lib.notify({
        title = title,
        description = desc,
        type = ntype
    })
end)
