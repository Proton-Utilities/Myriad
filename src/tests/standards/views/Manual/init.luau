--!nocheck

local groups = {
	FileDialog = require("@self/FileDialog"),
}

return function(name, tab, titledRow)
	--// Pages
	local landing = tab:Page()

	--// Landing
	for groupKey, group in groups do
		local section = landing:PageSection({
			Title = group.title,
			Subtitle = group.subtitle,
		})

		local form = section:Form()

		for testName, testData in group.tests do
			local testPage = tab:Page()

			testPage:Button({
				Label = "← Back",
				State = "Secondary",
				Pushed = function()
					tab:Navigate(landing)
				end,
			})

			local testSection = testPage:PageSection({
				Title = testName,
				Subtitle = testData.subtitle,
			})

			local testForm = testSection:Form()

			if testData.instructions then
				titledRow(testForm, "Instructions", testData.instructions)
					:Right()
			end

			local resultStack = testForm:Row():Left():TitleStack({
				Title = "Result",
				Subtitle = "Waiting…",
			})

			if type(testData.run) == "table" then
				local variants = testData.run

				titledRow(testForm, "Run Test"):Right():PullDownButton({
					Label = "Test",
					Options = (function()
						local labels = {}
						for _, v in ipairs(variants) do
							table.insert(labels, v.label)
						end
						return labels
					end)(),
					ValueChanged = function(self, idx)
						resultStack.Subtitle = "Running…"
						coroutine.wrap(function()
							local result = variants[idx].fn(testPage, tab, titledRow)

							if not result then
								resultStack.Subtitle = "❌ Errored: Did not return a status table"
								return
							end

							local icon = result.status == 200 and "✅" or "❌"
							resultStack.Subtitle = `{icon} [{result.status}] {result.message}`
						end)()
					end,
				})
			else
				titledRow(testForm, "Run Test"):Right():Button({
					Label = "Run",
					Pushed = function()
						resultStack.Subtitle = "Running…"
						coroutine.wrap(function()
							local result = testData.run(testPage, tab, titledRow)

							if not result then
								resultStack.Subtitle = "❌ Errored: Did not return a status table"
								return
							end

							local icon = result.status == 200 and "✅" or "❌"
							resultStack.Subtitle = `{icon} [{result.status}] {result.message}`
						end)()
					end,
				})
			end

			if testData.expected then
				titledRow(testForm, "Expected Outcome", testData.expected):Right()
			end

			titledRow(form, testName):Right():Button({
				Label = "Test",
				Pushed = function()
					tab:Navigate(testPage)
				end,
			})
		end
	end

	tab:Navigate(landing)
end
