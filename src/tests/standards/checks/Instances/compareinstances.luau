--!nocheck
--!nolint

return function()
	if not compareinstances then
		return {
			status = 400,
			message = "Global not found",
		}
	elseif not cloneref then
		return {
			status = 401,
			message = "'cloneref' needed to test this reliably",
		}
	end

	local originalPart = Instance.new("Part")
	local originalService = game:GetService("CoreGui")

	if cloneref(originalPart) == originalPart then
		return {
			status = 500,
			message = `(CR) Cloned part cannot be equal to original reference`,
		}
	elseif cloneref(originalService) == originalService then
		return {
			status = 500,
			message = `(CR) Cloned service cannot be equal to original reference`,
		}

	elseif not compareinstances(game, game) then
		return {
			status = 500,
			message = `Two equal instances (game, game) assumed unequal`,
		}
	elseif compareinstances(game, workspace) then
		return {
			status = 500,
			message = `Two unequal instances (game, workspace) assumed equal`,
		}
	elseif not compareinstances(originalPart, cloneref(originalPart)) then
		return {
			status = 500,
			message = `Two equal instances (originalPart, clonedPart) assumed equal`,
		}
	elseif not compareinstances(originalService, cloneref(originalService)) then
		return {
			status = 500,
			message = `Two equal instances (originalService, clonedService) assumed equal`,
		}
	end

	--// Alias test
	local envIndex, failedIndex = require("@dependencies/aliasTest.luau")({})

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
