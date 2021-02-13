local DataStores = {
	["property"] = {},
	["user_ears"] = {},
	["user_glasses"] = {},
	["user_helmet"] = {},
	["user_mask" ]= {}
}
local DataStoresIndex = {}
local SharedDataStores = {}
ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

MySQL.ready(function()
	local result = MySQL.Sync.fetchAll('SELECT * FROM datastore')

	for i=1, #result, 1 do
		local name, label, shared = result[i].name, result[i].label, result[i].shared

		if shared == 0 then
			table.insert(DataStoresIndex, name)
		end
	end
end)

function GetDataStore(name, owner)
	for i=1, #DataStores[name], 1 do
		if DataStores[name][i].owner == owner then
			return DataStores[name][i]
		end
	end
end

function GetDataStoreOwners(name)
	local identifiers = {}

	for i=1, #DataStores[name], 1 do
		table.insert(identifiers, DataStores[name][i].owner)
	end

	return identifiers
end

function GetSharedDataStore(name)
	return SharedDataStores[name]
end

AddEventHandler('esx_datastore:getDataStore', function(name, owner, cb)
	cb(GetDataStore(name, owner))
end)

AddEventHandler('esx_datastore:getDataStoreOwners', function(name, cb)
	cb(GetDataStoreOwners(name))
end)

AddEventHandler('esx_datastore:getSharedDataStore', function(name, cb)
	cb(GetSharedDataStore(name))
end)
AddEventHandler('esx:playerLoaded', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	local dataStores = {}
	local result = MySQL.Sync.fetchAll('SELECT * FROM datastore')

	for i=1, #result, 1 do
		local name, label, shared = result[i].name, result[i].label, result[i].shared
		local result2 = MySQL.Sync.fetchAll('SELECT * FROM datastore_data WHERE name = @name AND owner = @owner', {
			['@name'] = name,
			['@owner'] = xPlayer.identifier
		})

		if shared == 0 then
			for j=1, #result2, 1 do
				local storeName  = result2[j].name
				local storeOwner = result2[j].owner
				local storeData  = (result2[j].data == nil and {} or json.decode(result2[j].data))
				local dataStore  = CreateDataStore(storeName, storeOwner, storeData)

				table.insert(DataStores[name], dataStore)
			end
		end
	end

	for i=1, #DataStoresIndex, 1 do
		local name = DataStoresIndex[i]
		local dataStore = GetDataStore(name, xPlayer.identifier)

		if not dataStore then
			MySQL.Async.execute('INSERT INTO datastore_data (name, owner, data) VALUES (@name, @owner, @data)', {
				['@name']  = name,
				['@owner'] = xPlayer.identifier,
				['@data']  = '{}'
			})

			dataStore = CreateDataStore(name, xPlayer.identifier, {})
			table.insert(DataStores[name], dataStore)
		end
		table.insert(dataStores, dataStore)
	end
	xPlayer.set('dataStores', dataStores)
end)

AddEventHandler('playerDropped', function()
	local steam = GetPlayerIdentifiers(source)[1]
	for i=1, #DataStoresIndex, 1 do
		local name = DataStoresIndex[i]
		for j=1, #DataStores[name], 1 do
			if DataStores[name][j].owner == steam then
				--DataStores[name][j] = {}
				DataStores[name][j] = nil
			end
		end
		print(ESX.DumpTable(DataStores[name]))
	end

	print(#DataStores["property"], " Datastore table lenght, property")
end)
