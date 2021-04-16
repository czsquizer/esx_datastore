function stringsplit(inputstr, sep)
	if sep == nil then
		sep = "%s"
	end

	local t={} ; i=1
	for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
		t[i] = str
		i = i + 1
	end

	return t
end

function CreateDataStore(name, owner, data)
	local self = {}

	self.name  = name
	self.owner = owner
	self.data  = data

	local timeoutCallbacks = {}

	self.set = function(key, val)
		data[key] = val
		self.save()
	end

	self.get = function(key, i)
		local path = stringsplit(key, '.')
		local obj  = self.data

		for i=1, #path, 1 do
			obj = obj[path[i]]
		end

		if i == nil then
			return obj
		else
			return obj[i]
		end
	end

	self.count = function(key, i)
		local path = stringsplit(key, '.')
		local obj  = self.data

		for i=1, #path, 1 do
			obj = obj[path[i]]
		end

		if i ~= nil then
			obj = obj[i]
		end

		if obj == nil then
			return 0
		else
			return #obj
		end
	end

	self.save = function()
		for i=1, #timeoutCallbacks, 1 do
			ESX.ClearTimeout(timeoutCallbacks[i])
			timeoutCallbacks[i] = nil
		end

		local timeoutCallback = ESX.SetTimeout(10000, function()
			if self.owner == nil then
				MySQL.Async.execute('UPDATE datastore_data SET data = @data WHERE name = @name', {
					['@data'] = json.encode(self.data),
					['@name'] = self.name,
				})
			else
				MySQL.Async.execute('UPDATE datastore_data SET data = @data WHERE name = @name and owner = @owner', {
					['@data']  = json.encode(self.data),
					['@name']  = self.name,
					['@owner'] = self.owner,
				})
			end
		end)

		table.insert(timeoutCallbacks, timeoutCallback)
	end

	return self
end

Citizen.CreateThread(function()

	Wait(15000)
	local scripts = {
		"sqz_unijob",
		"scb_rpmenu",
		"sqz_drugs"
	}

	for k, v in pairs(scripts) do

		if GetResourceState(v) == 'started' then
			break
		end

		if GetResourceState(v) == 'missing' or GetResourceState(v) == 'unknown' or GetResourceState(v) == 'uninitialized' then

			local printData = [[                                                                                    _                         _       _
	  \ \   / /        ( )                    (_)       (_)                                                        | |               (_)     | |     | |
	   \ \_/ /__  _   _|/ _ __ ___   _ __ ___  _ ___ ___ _ _ __   __ _   ___  ___  _ __ ___   ___    ___ ___   ___ | |  ___  ___ _ __ _ _ __ | |_ ___| |
		\   / _ \| | | | | '__/ _ \ | '_ ` _ \| / __/ __| | '_ \ / _` | / __|/ _ \| '_ ` _ \ / _ \  / __/ _ \ / _ \| | / __|/ __| '__| | '_ \| __/ __| |
		 | | (_) | |_| | | | |  __/ | | | | | | \__ \__ \ | | | | (_| | \__ \ (_) | | | | | |  __/ | (_| (_) | (_) | | \__ \ (__| |  | | |_) | |_\__ \_|
		 |_|\___/ \__,_| |_|  \___| |_| |_| |_|_|___/___/_|_| |_|\__, | |___/\___/|_| |_| |_|\___|  \___\___/ \___/|_| |___/\___|_|  |_| .__/ \__|___(_)
																__/ |                                                                | |              
																|___/                                                                 |_|              

		 _____      _                                        _   _   _                                                       _______   _                 
		/ ____|    | |                                     / _| | | | |                                                     |__   __| | |                
		| |  __  ___| |_   ___  ___  _ __ ___   ___    ___ | |_  | |_| |__   ___ _ __ ___     ___  _ __     ___  _   _ _ __     | | ___| |__   _____  __  
		| | |_ |/ _ \ __| / __|/ _ \| '_ ` _ \ / _ \  / _ \|  _| | __| '_ \ / _ \ '_ ` _ \   / _ \| '_ \   / _ \| | | | '__|    | |/ _ \ '_ \ / _ \ \/ /  
		| |__| |  __/ |_  \__ \ (_) | | | | | |  __/ | (_) | |   | |_| | | |  __/ | | | | | | (_) | | | | | (_) | |_| | |       | |  __/ |_) |  __/>  < _ 
		\_____|\___|\__| |___/\___/|_| |_| |_|\___|  \___/|_|    \__|_| |_|\___|_| |_| |_|  \___/|_| |_|  \___/ \__,_|_|       |_|\___|_.__/ \___/_/\_(_)
																																																				
			███████╗ ██████╗ ███████╗        ██╗   ██╗███╗   ██╗██╗     ██╗ ██████╗ ██████╗ 
			██╔════╝██╔═══██╗╚══███╔╝        ██║   ██║████╗  ██║██║     ██║██╔═══██╗██╔══██╗
			███████╗██║   ██║  ███╔╝         ██║   ██║██╔██╗ ██║██║     ██║██║   ██║██████╔╝
			╚════██║██║▄▄ ██║ ███╔╝          ██║   ██║██║╚██╗██║██║██   ██║██║   ██║██╔══██╗
			███████║╚██████╔╝███████╗███████╗╚██████╔╝██║ ╚████║██║╚█████╔╝╚██████╔╝██████╔╝
			╚══════╝ ╚══▀▀═╝ ╚══════╝╚══════╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝ ╚════╝  ╚═════╝ ╚═════╝ 

			███████╗ ██████╗ ███████╗        ██████╗ ██████╗ ██╗   ██╗ ██████╗ ███████╗
			██╔════╝██╔═══██╗╚══███╔╝        ██╔══██╗██╔══██╗██║   ██║██╔════╝ ██╔════╝
			███████╗██║   ██║  ███╔╝         ██║  ██║██████╔╝██║   ██║██║  ███╗███████╗
			╚════██║██║▄▄ ██║ ███╔╝          ██║  ██║██╔══██╗██║   ██║██║   ██║╚════██║
			███████║╚██████╔╝███████╗███████╗██████╔╝██║  ██║╚██████╔╝╚██████╔╝███████║
			╚══════╝ ╚══▀▀═╝ ╚══════╝╚══════╝╚═════╝ ╚═╝  ╚═╝ ╚═════╝  ╚═════╝ ╚══════╝

			███████╗ ██████╗██████╗         ██████╗ ██████╗ ███╗   ███╗███████╗███╗   ██╗██╗   ██╗
			██╔════╝██╔════╝██╔══██╗        ██╔══██╗██╔══██╗████╗ ████║██╔════╝████╗  ██║██║   ██║
			███████╗██║     ██████╔╝        ██████╔╝██████╔╝██╔████╔██║█████╗  ██╔██╗ ██║██║   ██║
			╚════██║██║     ██╔══██╗        ██╔══██╗██╔═══╝ ██║╚██╔╝██║██╔══╝  ██║╚██╗██║██║   ██║
			███████║╚██████╗██████╔╝███████╗██║  ██║██║     ██║ ╚═╝ ██║███████╗██║ ╚████║╚██████╔╝
			╚══════╝ ╚═════╝╚═════╝ ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝     ╚═╝╚══════╝╚═╝  ╚═══╝ ╚═════╝ 
											
									sqz.tebex.io

					Scripts made by Squizer#3020 and Scoobiik#9981
			]]
			print(printData)
			break
		end

	end


end)