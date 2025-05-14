--!nocheck
--!nolint LocalUnused

return function(name, tab)
	--// Variables
	local output = nil

	local lastEntreePerGroup = {}
	local numStandards = 0
	local passed = 0
	local failed = 0

	local uni = {
		bullet = "•",
	}
	local statusCodes = {
		[0] = "❓", -- Call errored/failed
		[200] = "✅", -- Passed
		[400] = "🚫", -- Not mitigated
		[401] = "📦", -- Dependency not found
	}

	--// Functions
	local printc = function(...)
		local message = table.concat({ ... }, " ")
		output:AppendText(message)
	end
	
	local warnc = function(...)
		local message = table.concat({ ... }, " ")
		output:AppendText(`<font color="#FFA500">{message}</font>`)
	end	

	--// Initialize
	output = tab:Console({
		ReadOnly = true,
		RichText = true,
		LineHeight = 1.3,
		Fill = true,
	}):Clear()

	printc("Not implemented.")

	return {
		passed = passed,
		failed = failed,
	}
end
