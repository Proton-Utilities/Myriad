--!nocheck
--!nolint

return function()
	if not getfenv(0).setreadonly then
		return {
			status = 400,
			message = "Global not found",
		}
	end

	local originalTable = table.freeze{
		MYRIAD = "MYRI"
	}

	local freezeSuccess, message = pcall(function()
		originalTable.MYRIAD = "MYRIAD"
	end)
	local writeSuccess, message = pcall(function()
		setreadonly(originalTable, false)
		originalTable.MYRIAD = "MYRIAD"
	end)
	local reFreezeSuccess, message = pcall(function()
		setreadonly(originalTable, true)
		originalTable.MYRIAD = "MYRIAD"
	end)

	if freezeSuccess then
		return {
			status = 500,
			message = "Frozen table writable (???): " .. message
		}
	elseif not writeSuccess then
		return {
			status = 500,
			message = "Table unwritable after readonly was disabled: " .. message
		}
	elseif reFreezeSuccess then
		return {
			status = 500,
			message = "Table writable after readonly was enabled: " .. message
		}
	end

	return {
		status = 200,
		message = `Passed`,
	}
end
