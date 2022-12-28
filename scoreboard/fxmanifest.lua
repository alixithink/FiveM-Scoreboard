fx_version 'cerulean'
games { 'gta5' }

author 'alixithink'
description 'Scoreboard'
version '0.0.1'

resource_manifest_version '77731fab-63ca-442c-a67b-abc70f28dfa5'

ui_page 'html/index.html'

client_script {
    "c-script.lua",
    "config.lua"
}
server_script {
    "s-script.lua",
    "config.lua"
}

files {
    'html/index.html',
    'html/style.css',
    'html/reset.css',
    'html/listener.js'
}