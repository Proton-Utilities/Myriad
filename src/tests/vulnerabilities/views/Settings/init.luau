--!nocheck

return function(name, tab, titledRow, app, testConfig)
	local pageSection = tab:PageSection({ Title = "Settings", Subtitle = "Configure the vulnerabilities test" })

	-- Delays
	do
		local form = pageSection:Form()

		titledRow(form, "Checkpoint Delay", "Adds delay per test. Useful to check for crashes."):Right():Stepper({
			Fielded = true,
			Value = 0,
			Minimum = 0,
			Maximum = 0.5,
			Step = 0.01,
			ValueChanged = function(self, value)
				testConfig.checkpointDelay = value
			end,
		})

		titledRow(form, "Test Timeout", "Maximum seconds a single module test may run before being cancelled.")
			:Right()
			:Stepper({
				Fielded = true,
				Value = testConfig.testTimeout,
				Minimum = 1,
				Maximum = 30,
				Step = 1,
				ValueChanged = function(self, value)
					testConfig.testTimeout = value
				end,
			})
	end

	-- Display options
	do
		local form = pageSection:Form()

		titledRow(form, "Show Safe Results", "Shows functions that are safe. Disable to only show vulnerabilities.")
			:Right()
			:Toggle({
				Value = true,
				ValueChanged = function(self, value)
					testConfig.showSafe = value
				end,
			})

		titledRow(form, "Include Metadata", "Shows executor metadata at the end."):Right():Toggle({
			Value = false,
			ValueChanged = function(self, value)
				testConfig.includeMetadata = value
			end,
		})
	end
end
