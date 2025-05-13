--!nocheck
--!nolint

return function()
	if not getfenv(0).gethui then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	local container = gethui()
	if not (container:IsA("ScreenGui") or container:IsA("BasePlayerGui") or container:IsA("Folder")) then
		return {
			status = 500,
			message = "Container is not a ScreenGui, BasePlayerGui, or Folder",
		}
	end
	if container == game:GetService("CoreGui") then
		return {
			status = 500,
			message = "Container cannot be an uncloned reference to CoreGui",
		}
	end

	local envIndex, failedIndex = require("dependencies/aliasTest.luau")({
		"get_hidden_gui"
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
