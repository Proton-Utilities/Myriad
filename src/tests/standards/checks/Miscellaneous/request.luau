--!nocheck
--!nolint

return function()
	if not getfenv(0).request then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	--// Functionality Test
	local response = request({
		Url = "https://httpbin.org/user-agent",
		Method = "GET",
	})

	if not typeof(response) == "table" then
		return {
			status = 500,
			message = "Reponse wasn't a table"
		}
	elseif response.StatusCode ~= 200 then
		return {
			status = 500,
			message = "Didn't give status 200 (is httpbin.org down?)"
		}
	end

	local data = game:GetService("HttpService"):JSONDecode(response.Body)
	if type(data) ~= "table" and type(data["user-agent"]) ~= "string" then
		return {
			status = 500,
			message = "Didn't give a table w/ user-agent string"
		}
	end

	--// Alias test
	local envIndex, failedIndex = require("dependencies/aliasTest.luau")({
		"http.request",
		"http_request"
	})

	if not envIndex then
		return {
			status = 501,
			message = `Alias not found: {failedIndex}`,
		}
	end

	return {
		status = 200,
		message = `Passed ({data["user-agent"]})`,
	}
end
