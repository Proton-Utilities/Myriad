return {
		cache = {
			["cache.invalidate"] = require("@checks/cache/invalidate.luau"),
			["cache.iscached"] = require("@checks/cache/iscached.luau"),
			["cache.replace"] = require("@checks/cache/replace.luau"),
		},

		Closures = {
			["islclosure"] = require("@checks/Closures/islclosure.luau"),
			["iscclosure"] = require("@checks/Closures/iscclosure.luau"),
			["isexecutorclosure"] = require("@checks/Closures/isexecutorclosure.luau"),
			["newcclosure"] = require("@checks/Closures/newcclosure.luau"),
			["clonefunction"] = require("@checks/Closures/clonefunction.luau"),
			["hookfunction"] = require("@checks/Closures/hookfunction.luau"),
			["restorefunction"] = require("@checks/Closures/restorefunction.luau"),
			["getfunctionhash"] = require("@checks/Closures/getfunctionhash.luau"),
			["checkcaller"] = require("@checks/Closures/checkcaller.luau"),
		},

		crypt = {
			["crypt.encrypt"] = require("@checks/crypt/encrypt.luau"),
			["crypt.decrypt"] = require("@checks/crypt/decrypt.luau"),
			["crypt.generatekey"] = require("@checks/crypt/generatekey.luau"),
			["crypt.generatebytes"] = require("@checks/crypt/generatebytes.luau"),
			["crypt.base64encode"] = require("@checks/crypt/base64encode.luau"),
			["crypt.base64decode"] = require("@checks/crypt/base64decode.luau"),
			["crypt.hash"] = require("@checks/crypt/hash.luau"),
			["crypt.random"] = require("@checks/crypt/random.luau"),
			["crypt.hmac"] = require("@checks/crypt/hmac.luau"),
		},

		debug = {
			["debug.getconstant"] = require("@checks/debug/getconstant.luau"),
			["debug.getconstants"] = require("@checks/debug/getconstants.luau"),
			["debug.getproto"] = require("@checks/debug/getproto.luau"),
			["debug.getprotos"] = require("@checks/debug/getprotos.luau"),
			["debug.getupvalue"] = require("@checks/debug/getupvalue.luau"),
			["debug.getupvalues"] = require("@checks/debug/getupvalues.luau"),
			["debug.getstack"] = require("@checks/debug/getstack.luau"),
			["debug.setconstant"] = require("@checks/debug/setconstant.luau"),
			["debug.setupvalue"] = require("@checks/debug/setupvalue.luau"),
		},

		Drawing = {
			["Drawing.new"] = require("@checks/Drawing/new.luau"),
			["Drawing.Fonts"] = require("@checks/Drawing/Fonts.luau"),
			["getrenderproperty"] = require("@checks/Drawing/getrenderproperty.luau"),
			["setrenderproperty"] = require("@checks/Drawing/setrenderproperty.luau"),
			["cleardrawcache"] = require("@checks/Drawing/cleardrawcache.luau"),
			["isrenderobj"] = require("@checks/Drawing/isrenderobj.luau"),
		},

		Environment = {
			["getgenv"] = require("@checks/Environment/getgenv.luau"),
			["getrenv"] = require("@checks/Environment/getrenv.luau"),
			["getgc"] = require("@checks/Environment/getgc.luau"),
			["filtergc"] = require("@checks/Environment/filtergc.luau"),
		},

		Filesystem = {
			["getcustomasset"] = require("@checks/Filesystem/getcustomasset.luau"),
			["listfiles"] = require("@checks/Filesystem/listfiles.luau"),
			["loadfile"] = require("@checks/Filesystem/loadfile.luau"),
			["appendfile"] = require("@checks/Filesystem/appendfile.luau"),
			["delfile"] = require("@checks/Filesystem/delfile.luau"),
			["delfolder"] = require("@checks/Filesystem/delfolder.luau"),
			["isfile"] = require("@checks/Filesystem/isfile.luau"),
			["isfolder"] = require("@checks/Filesystem/isfolder.luau"),
			["writefile"] = require("@checks/Filesystem/writefile.luau"),
			["readfile"] = require("@checks/Filesystem/readfile.luau"),
			["makefolder"] = require("@checks/Filesystem/makefolder.luau"),
		},

		Input = {
			["isrbxactive"] = require("@checks/Input/isrbxactive.luau"),
			["keypress"] = require("@checks/Input/keypress.luau"),
			["keyrelease"] = require("@checks/Input/keyrelease.luau"),
			["keytap"] = require("@checks/Input/keytap.luau"),
			["mouse1click"] = require("@checks/Input/mouse1click.luau"),
			["mouse1press"] = require("@checks/Input/mouse1press.luau"),
			["mouse1release"] = require("@checks/Input/mouse1release.luau"),
			["mouse2click"] = require("@checks/Input/mouse2click.luau"),
			["mouse2press"] = require("@checks/Input/mouse2press.luau"),
			["mouse2release"] = require("@checks/Input/mouse2release.luau"),
			["mousemoveabs"] = require("@checks/Input/mousemoveabs.luau"),
			["mousemoverel"] = require("@checks/Input/mousemoverel.luau"),
			["mousescroll"] = require("@checks/Input/mousescroll.luau"),
			["setclipboard"] = require("@checks/Input/setclipboard.luau"),
			["setrbxclipboard"] = require("@checks/Input/setrbxclipboard.luau"),
		},

		Instances = {
			["gethui"] = require("@checks/Instances/gethui.luau"),
			["cloneref"] = require("@checks/Instances/cloneref.luau"),
			["compareinstances"] = require("@checks/Instances/compareinstances.luau"),
			["getinstances"] = require("@checks/Instances/getinstances.luau"),
			["getnilinstances"] = require("@checks/Instances/getnilinstances.luau"),
			["getcallbackvalue"] = require("@checks/Instances/getcallbackvalue.luau"),
			["fireclickdetector"] = require("@checks/Instances/fireclickdetector.luau"),
			["fireproximityprompt"] = require("@checks/Instances/fireproximityprompt.luau"),
			["firetouchinterest"] = require("@checks/Instances/firetouchinterest.luau"),
			["saveinstance"] = require("@checks/Instances/saveinstance.luau"),
		},

		Metatable = {
			["getrawmetatable"] = require("@checks/Metatable/getrawmetatable.luau"),
			["setrawmetatable"] = require("@checks/Metatable/setrawmetatable.luau"),
			["hookmetamethod"] = require("@checks/Metatable/hookmetamethod.luau"),
			["getnamecallmethod"] = require("@checks/Metatable/getnamecallmethod.luau"),
			["setreadonly"] = require("@checks/Metatable/setreadonly.luau"),
			["makereadonly"] = require("@checks/Metatable/makereadonly.luau"),
			["isreadonly"] = require("@checks/Metatable/isreadonly.luau"),
		},

		Miscellaneous = {
			["identifyexecutor"] = require("@checks/Miscellaneous/identifyexecutor.luau"),
			["setfpscap"] = require("@checks/Miscellaneous/setfpscap.luau"),
			["getfpscap"] = require("@checks/Miscellaneous/getfpscap.luau"),
			["request"] = require("@checks/Miscellaneous/request.luau"),
			["lz4compress"] = require("@checks/Miscellaneous/lz4compress.luau"),
			["lz4decompress"] = require("@checks/Miscellaneous/lz4decompress.luau"),
			["queue_on_teleport"] = require("@checks/Miscellaneous/queue_on_teleport.luau"),
		},

		External = {
			["messagebox"] = require("@checks/External/messagebox.luau"),
			["rconsoleprint"] = require("@checks/External/rconsoleprint.luau"),
			["rconsoleinfo"] = require("@checks/External/rconsoleinfo.luau"),
			["rconsolewarn"] = require("@checks/External/rconsolewarn.luau"),
			["rconsoleerr"] = require("@checks/External/rconsoleerr.luau"),
			["rconsoleinput"] = require("@checks/External/rconsoleinput.luau"),
			["rconsoleclear"] = require("@checks/External/rconsoleclear.luau"),
			["rconsolename"] = require("@checks/External/rconsolename.luau"),
			["rconsolehide"] = require("@checks/External/rconsolehide.luau"),
			["rconsoleshow"] = require("@checks/External/rconsoleshow.luau"),
		},

		Reflection = {
			["sethiddenproperty"] = require("@checks/Reflection/sethiddenproperty.luau"),
			["gethiddenproperty"] = require("@checks/Reflection/gethiddenproperty.luau"),
			["setthreadidentity"] = require("@checks/Reflection/setthreadidentity.luau"),
			["getthreadidentity"] = require("@checks/Reflection/getthreadidentity.luau"),
			["setscriptable"] = require("@checks/Reflection/setscriptable.luau"),
			["isscriptable"] = require("@checks/Reflection/isscriptable.luau"),
		},

		Scripts = {
			["getscripts"] = require("@checks/Scripts/getscripts.luau"),
			["getrunningscripts"] = require("@checks/Scripts/getrunningscripts.luau"),
			["getcallingscript"] = require("@checks/Scripts/getcallingscript.luau"),
			["getloadedmodules"] = require("@checks/Scripts/getloadedmodules.luau"),
			["getsenv"] = require("@checks/Scripts/getsenv.luau"),
			["getscripthash"] = require("@checks/Scripts/getscripthash.luau"),
			["loadstring"] = require("@checks/Scripts/loadstring.luau"),
			["getscriptbytecode"] = require("@checks/Scripts/getscriptbytecode.luau"),
			["getscriptclosure"] = require("@checks/Scripts/getscriptclosure.luau"),
			["decompile"] = require("@checks/Scripts/decompile.luau"),
		},

		Signals = {
			
		},

		Actors = {
			["isparallel"] = require("@checks/Actors/isparallel.luau"),
			["run_on_actor"] = require("@checks/Actors/run_on_actor.luau"),
			["create_comm_channel"] = require("@checks/Actors/create_comm_channel.luau"),
			["get_comm_channel"] = require("@checks/Actors/get_comm_channel.luau"),
			["getactors"] = require("@checks/Actors/getactors.luau"),
		},

		WebSocket = {
			["connect"] = require("@checks/WebSocket/connect.luau"),
		},
	}