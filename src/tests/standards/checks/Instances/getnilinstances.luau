--!nocheck
--!nolint

return function()
	if not getnilinstances then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	--// Functionality test
	local originalPart1, found1 = Instance.new("Part"), false
	local originalPart2, found2 = Instance.new("Part", workspace), false
	local found3 = false

	originalPart2.Anchored = true
	originalPart2.Transparency = 1
	originalPart2.CanCollide = false
	originalPart2.Position = Vector3.new(0,-100,0)

	for _, v in pairs(getnilinstances()) do
		if v == originalPart1 then
			found1 = true
		elseif v == originalPart2 then
			found2 = true
		elseif v:IsDescendantOf(game) then
			found3 = true
		elseif not v:IsA("Instance") then
			return {
				status = 500,
				message = "Found a part that isn't an instance"
			}
		end
	end

	if not found1 then
		return {
			status = 500,
			message = "Didn't find a part w/ a nil parent"
		}
	elseif found2 or found3 then
		return {
			status = 500,
			message = "Found a part w/ a parent"
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
