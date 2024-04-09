name "Jim-MiniGame"
author "Jimathy"
version "0.1"
description "Minigame Script By Jimathy"
fx_version "cerulean"
game "gta5"
lua54 'yes'

shared_scripts {
	'config.lua',

    -- Required core scripts
    '@ox_lib/init.lua',
    '@ox_core/imports/client.lua',
    '@es_extended/imports.lua',
    '@qbx_core/modules/playerdata.lua',

    --Jim Bridge
    '@jim_bridge/exports.lua',
    '@jim_bridge/functions.lua',
    '@jim_bridge/wrapper.lua',
    '@jim_bridge/crafting.lua',
	'shared/*.lua',
}
client_scripts {
    'client.lua'
}

ui_page 'html/index.html'
files { 'html/*.html' }

dependency 'jim_bridge'