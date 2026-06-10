Config = {}

Config.Debug = true

Config.EnableCommand = true
Config.CommandName = "doorcontrol"

Config.EnableTarget = true
Config.TargetCoords = vector3(485.9301, -1006.0526, 21.9597)
Config.TargetRadius = 1.5

Config.AllowedJobs = {
    police = true,
    sheriff = true,
    fib = true
}

-- Animation
Config.Animation = {
    enabled = true,
    dict = 'anim@heists@keycard@',
    name = 'exit',
    duration = 1500,
    flag = 49
}

Config.RemoteDoors = {

    --[[
===============================
  Remote Door System – Tutorial
===============================

How to add new doors:

1. open ox_doorlock (/doorlocks)
2. find your door and remember the id
3. add the door in Config.RemoteDoors:

    {
        id = 17,                 -- same id as in ox_doorlock
        name = "MRPD Eingang",   -- Door lable shown in menu
        sound = "door-buzz",     -- Sound when opening and closing [W.I.P.]
        soundVolume = 0.7,
        soundRadius = 20.0,
        jobLock = false          -- true = Only the jobs that are set to true in Config.AllowedJobs
    }

4. save → restart script → finished.
]]


    {
        id = 2545,
        name = "MRPD Zelle C1",
        sound = "door-buzz",
        soundVolume = 0.7,
        soundRadius = 20.0,
        jobLock = true
    },
    {
        id = 2546,
        name = "MRPD Zelle C2",
        sound = "door-buzz",
        soundVolume = 0.7,
        soundRadius = 20.0,
        jobLock = true
    },
        {
        id = 2547,
        name = "MRPD Zelle C3",
        sound = "door-buzz",
        soundVolume = 0.7,
        soundRadius = 20.0,
        jobLock = true
    },
        {
        id = 2548,
        name = "MRPD Zelle C4",
        sound = "door-buzz",
        soundVolume = 0.7,
        soundRadius = 20.0,
        jobLock = true
    },
        {
        id = 2549,
        name = "MRPD Zelle C5",
        sound = "door-buzz",
        soundVolume = 0.7,
        soundRadius = 20.0,
        jobLock = true
    },
        {
        id = 2550,
        name = "MRPD Zelle C6",
        sound = "door-buzz",
        soundVolume = 0.7,
        soundRadius = 20.0,
        jobLock = true
    },
        {
        id = 2551,
        name = "MRPD Zelle C7",
        sound = "door-buzz",
        soundVolume = 0.7,
        soundRadius = 20.0,
        jobLock = true
    },
        {
        id = 2552,
        name = "MRPD Zellen Eingang Rechts",
        sound = "door-buzz",
        soundVolume = 0.7,
        soundRadius = 20.0,
        jobLock = true
    },
        {
        id = 2553,
        name = "MRPD Zellen Eingang Links",
        sound = "door-buzz",
        soundVolume = 0.7,
        soundRadius = 20.0,
        jobLock = true
    },
    {
        id = 2555,
        name = "MRPD Zellen Eingang Mitte",
        sound = "door-buzz",
        soundVolume = 0.7,
        soundRadius = 20.0,
        jobLock = true
    },
}

Config.Locale = "en" -- "de" or "en"
