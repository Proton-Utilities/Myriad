--!nocheck
--!nolint

-- Please reference our manual tests to properly verify your implementation.
-- https://github.com/Standard-2/Myriad/issues/18
return function()
	if not openfilesdialog then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	return {
		status = 200,
		message = "Passed",
	}
end
