fx_version 'cerulean'
game 'gta5'

author 'Squizer'
description 'ESX Data Store (edit to work with MultiChar)'

version '1.0.0'

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'server/classes/datastore.lua',
	'server/main.lua'
}