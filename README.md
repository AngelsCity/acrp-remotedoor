# 🔐 Remote Door Control – ox_doorlock Compatible
A lightweight and modern remote door control system for FiveM. Fully compatible with ox_doorlock, ox_lib, ox_target, and any framework.

# ✨ Features

- 🔧 Control any ox_doorlock door remotely
- 🎛️ ox_lib context menu
- 🎯 Optional ox_target interaction zone
- 🔊 Custom sounds when opening/closing [W.I.P.]
- 🌍 Locales (EN/DE)
- 🔒 Optional job‑restricted access

# 🧩 How to add new doors:

1. open ox_doorlock (/doorlocks)
2. find your door and remember the id
3. add the door in Config.RemoteDoors:
```

{
    id = 17,                 -- same id as in ox_doorlock
    name = "MRPD Eingang",   -- Door label shown in menu
    sound = "door-buzz",     -- Sound when opening and closing [W.I.P.]
    soundVolume = 0.7,
    soundRadius = 20.0,
    jobLock = false          -- true = Only the jobs that are set to true in Config.AllowedJobs
}
```
4. save → restart script → finished.

# 📦 Requirements

- ox_lib
- ox_doorlock
- ox_target (optional)

# 🖥️ Commands

```/doorcontrol```

Opens the remote door menu.
