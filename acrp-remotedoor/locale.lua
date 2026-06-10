Locales = {}

Locales["de"] = {
    menu_title = "Remote Türsteuerung",
    menu_open = "Öffnen",
    menu_close = "Schließen",

    notify_no_access = "Du hast keinen Zugriff auf diese Tür.",
    notify_not_configured = "Diese Tür ist nicht konfiguriert.",
    notify_opened = "Die Tür wurde geöffnet.",
    notify_closed = "Die Tür wurde geschlossen.",
    notify_error = "Es ist ein Fehler aufgetreten.",
    notify_not_found = "Tür nicht im Türsystem gefunden.",

    debug_start_scan = "Starte ox_doorlock Tür-Scan...",
    debug_list_header = "--- ox_doorlock Türen ---",
    debug_list_entry = "Index: %s | DB-ID: %s | Name: %s",
    debug_list_end = "--- Ende Liste ---",

    debug_toggle_called = "remoteDoor:toggle von %s",
    debug_toggle_params = "Tür-ID: %s | open: %s",
    debug_config_found = "Config gefunden: %s",
    debug_door_found = "ox_doorlock Tür gefunden: DB-ID: %s | Name: %s",
    debug_door_nil = "WARNUNG: getDoor(%s) gibt nil zurück!",
    debug_set_state = "Setze Türstate: %s",
    debug_event_call = "TriggerEvent('ox_doorlock:setState', %s, %s)",
    debug_export_call = "exports.ox_doorlock:setDoorState(%s, %s)",
    debug_done = "FERTIG: Tür %s sollte jetzt %s sein."
}

Locales["en"] = {
    menu_title = "Remote Door Control",
    menu_open = "Open",
    menu_close = "Close",

    notify_no_access = "You do not have access to this door.",
    notify_not_configured = "This door is not configured.",
    notify_opened = "The door has been opened.",
    notify_closed = "The door has been closed.",
    notify_error = "An error occurred.",
    notify_not_found = "Door not found in door system.",

    debug_start_scan = "Starting ox_doorlock door scan...",
    debug_list_header = "--- ox_doorlock Doors ---",
    debug_list_entry = "Index: %s | DB-ID: %s | Name: %s",
    debug_list_end = "--- End of List ---",

    debug_toggle_called = "remoteDoor:toggle called by %s",
    debug_toggle_params = "Door-ID: %s | open: %s",
    debug_config_found = "Config found: %s",
    debug_door_found = "ox_doorlock door found: DB-ID: %s | Name: %s",
    debug_door_nil = "WARNING: getDoor(%s) returned nil!",
    debug_set_state = "Setting door state: %s",
    debug_event_call = "TriggerEvent('ox_doorlock:setState', %s, %s)",
    debug_export_call = "exports.ox_doorlock:setDoorState(%s, %s)",
    debug_done = "DONE: Door %s should now be %s."
}
