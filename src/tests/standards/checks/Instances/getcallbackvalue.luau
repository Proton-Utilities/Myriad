--!nocheck
--!nolint

return function()
	if not getfenv(0).getinstances then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	--// Functionality test
	local r1, r2, r3 = math.random(1, 10), math.random(1, 10), math.random(1, 10)
	local originalBindable1 = Instance.new("BindableFunction")
	local originalBindable2 = Instance.new("BindableFunction")
	local originalRemote = Instance.new("RemoteFunction")

	originalBindable1.OnInvoke = function(a, b)
		return (a + b) ^ r3
	end
	originalRemote.OnServerInvoke = function()
		return r3
	end

	local bindableCb1 = getcallbackvalue(originalBindable1, "OnInvoke")
	local bindableCb2 = getcallbackvalue(originalBindable2, "OnInvoke")
	local remoteCb = getcallbackvalue(originalRemote, "OnServerInvoke")

	if not bindableCb1 then
		return {
			status = 500,
			message = "Didn't return a callback value for a bindable",
		}
	elseif bindableCb2 then
		return {
			status = 500,
			message = "Returned a callback value for a bindable with none",
		}
	elseif not remoteCb then
		return {
			status = 500,
			message = "Returned a callback value for a remote with none",
		}
	elseif bindableCb1(r1, r2) ~= (r1 + r2) ^ r3 then
		return {
			status = 500,
			message = "Bindable's callback value didn't return the expected value",
		}
	elseif remoteCb(game.Players.LocalPlayer) ~= r3 then
		return {
			status = 500,
			message = "Remote's callback value didn't return the expected value",
		}
	end

	--// Alias test
	local envIndex, failedIndex = require("dependencies/aliasTest.luau")({
		"getcallbackmember"
	})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
