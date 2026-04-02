--!nocheck

return function(name, tab, titledRow, app, testConfig)
	local pageSection = tab:PageSection({ Title = "Settings", Subtitle = "Configure the standards test" })

	-- Filters
	do
		local form = pageSection:Form()

		titledRow(form, "Status Filter", "Filter by status codes"):Right():PopUpButton({
			Options = {
				"All",
				"✅ Pass",
				"❓ Ambiguous",
				"🔎 Missing",
				"📦 Dependency",
				"🛠️ Functionality",
				"🏷️ Alias",
			},
			Value = 1,
			ValueChanged = function(self, value: number)
				local reference = {
					[1] = false,
					[2] = 200,
					[3] = 0,
					[4] = 400,
					[5] = 401,
					[6] = 500,
					[7] = 501,
				}

				testConfig.statusFilter = reference[value]
			end,
		})

		titledRow(form, "Included Tests", "Only run these libs or globals (comma-delimited). Leave blank to run all.")
			:Right()
			:TextField({
				Placeholder = "debug, crypt.encrypt",
				Value = "",
				ValueChanged = function(self, value)
					testConfig.includedTests = value
				end,
			})

		titledRow(form, "Excluded Tests", "Exclude libs or globals from testing (comma-delimited)."):Right():TextField({
			Placeholder = "crypt, debug.info",
			Value = "",
			ValueChanged = function(self, value)
				testConfig.excludedTests = value
			end,
		})
	end

	-- Delays
	do
		local form = pageSection:Form()

		titledRow(form, "Checkpoint Delay", "Add delay per-checkpoint to analyze easily."):Right():Stepper({
			Fielded = true,
			Value = 0,
			Minimum = 0,
			Maximum = 1,
			Step = 0.01,
			ValueChanged = function(self, value)
				testConfig.checkpointDelay = value
			end,
		})

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

	-- Display options
	do
		local form = pageSection:Form()

		titledRow(form, "Include Metadata", "Includes metadata in the output. Useful for sharing formatted results.")
			:Right()
			:Toggle({
				Value = false,
				ValueChanged = function(self, value)
					testConfig.includeMetadata = value
				end,
			})

		titledRow(form, "Strip Richtext", "Strips the richtext from output. Useful for sharing formatted results.")
			:Right()
			:Toggle({
				Value = false,
				ValueChanged = function(self, value)
					testConfig.stripRichtext = value
				end,
			})

		titledRow(form, "Diff Output", "Formats the output in diff. Useful for sharing formatted results.")
			:Right()
			:Toggle({
				Value = false,
				ValueChanged = function(self, value)
					testConfig.formatDiff = value
				end,
			})
	end
end
