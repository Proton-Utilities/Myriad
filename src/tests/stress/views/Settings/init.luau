--!nocheck

return function(name, tab, titledRow, app, testConfig)
	local pageSection = tab:PageSection({ Title = "Settings", Subtitle = "Configure the stress test suite" })

	-- Loop Configurations
	do
		local form = pageSection:Form()

		titledRow(form, "Passes", "Number of times to loop through the intensive test functions."):Right():Stepper({
			Fielded = true,
			Value = testConfig.passes,
			Minimum = 1,
			Maximum = 1000,
			Step = 1,
			ValueChanged = function(self, value)
				testConfig.passes = value
			end,
		})

		titledRow(form, "Backoff Rate", "Multiplier applied to delay time between iterations (e.g. 0.9 = 10% faster each pass).")
			:Right()
			:Stepper({
				Fielded = true,
				Value = testConfig.backoffRate,
				Minimum = 0,
				Maximum = 1,
				Step = 0.05,
				ValueChanged = function(self, value)
					testConfig.backoffRate = value
				end,
			})
            
        titledRow(form, "Base Delay", "Initial delay (in seconds) between passes."):Right():Stepper({
            Fielded = true,
            Value = testConfig.baseDelay,
            Minimum = 0,
            Maximum = 5,
            Step = 0.1,
            ValueChanged = function(self, value)
                testConfig.baseDelay = value
            end,
        })
	end

	-- Filters
	do
		local form = pageSection:Form()

		titledRow(form, "Included Tests", "Only run these libs or globals during standards spam (comma-delimited).")
			:Right()
			:TextField({
				Placeholder = "include",
				Value = testConfig.includedTests,
				ValueChanged = function(self, value)
					testConfig.includedTests = value
				end,
			})

		titledRow(form, "Excluded Tests", "Exclude libs or globals from testing (comma-delimited)."):Right():TextField({
			Placeholder = "exclude",
			Value = testConfig.excludedTests,
			ValueChanged = function(self, value)
				testConfig.excludedTests = value
			end,
		})
	end

    -- Display options
	do
		local form = pageSection:Form()

		titledRow(form, "Test Timeout", "Maximum seconds a single test may run before being cancelled.")
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
end
