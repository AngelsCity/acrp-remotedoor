fx_version 'cerulean'
game 'gta5'

name 'remote_door_menu'
author 'Angels City Roleplay - Amy 🏳️‍⚧️'
description 'Remote Door Control Menu for ox_doorlock'

lua54 'yes'

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua',
    'locale.lua'
}

client_scripts {
    'client.lua'
}

server_scripts {
    'server.lua'
}

files {
    'html/index.html',
    'html/script.js',
    'html/sounds/*.ogg'
}

ui_page 'html/index.html'
