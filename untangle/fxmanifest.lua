fx_version "cerulean"
games {"gta5"}
author "https://github.com/dnelyk"
description "Untangle Minigame for FiveM!"

client_scripts {
    'client/cl_untangle.lua'
}

shared_scripts {
    'shared/config.lua'
}

ui_page "html/index.html"

files {
    'html/index.html',
    'html/css/style.css',
    'html/js/scripts.js',
    'html/images/fas-server.png',
}