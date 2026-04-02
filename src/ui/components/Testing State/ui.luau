local cascade = require("@packages/cascade")

return function(self, properties: any)
	local creator = cascade.Creator
	local binder = cascade.Binder

	local create = creator.Create
	local apply = binder.Apply

	local parent = self.__container or self.__instance or self
	local structures = {}

	structures.Body = apply(properties, create("Frame")({
		Name = "TestingState",
		Size = UDim2.new(1, 0, 0, 140),
		Parent = parent,
		BackgroundTransparency = 1,

		create("UIListLayout")({
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 8),
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center,
		}),

		create("TextLabel")({
			Name = "CurrentTestLabel",
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 24),
			FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.Bold),
			TextSize = 18,
			Text = "Testing: Waiting...",
			__dynamicKeys = {
				TextColor3 = self.Theme.Text.Primary[1],
				TextTransparency = self.Theme.Text.Primary[2],
			},
		}),

		create("TextLabel")({
			Name = "NextTestLabel",
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 16),
			FontFace = Font.new("rbxassetid://12187365364"),
			TextSize = 14,
			Text = "Next: Waiting...",
			__dynamicKeys = {
				TextColor3 = self.Theme.Text.Secondary[1],
				TextTransparency = self.Theme.Text.Secondary[2],
			},
		}),
		
		create("Frame")({
			Name = "StatsFrame",
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 20),
			
			create("UIListLayout")({
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, 20),
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
			}),

			create("TextLabel")({
				Name = "PassedLabel",
				BackgroundTransparency = 1,
				Size = UDim2.fromOffset(100, 20),
				FontFace = Font.new("rbxassetid://12187365364"),
				TextSize = 14,
				Text = "Passed: 0",
				__dynamicKeys = {
					TextColor3 = self.Theme.Controls.SelectionFocused[1],
					TextTransparency = self.Theme.Controls.SelectionFocused[2],
				},
			}),

			create("TextLabel")({
				Name = "FailedLabel",
				BackgroundTransparency = 1,
				Size = UDim2.fromOffset(100, 20),
				FontFace = Font.new("rbxassetid://12187365364"),
				TextSize = 14,
				Text = "Failed: 0",
				__dynamicKeys = {
					TextColor3 = self.Theme.Accents.Red[1],
					TextTransparency = self.Theme.Accents.Red[2],
				},
			})
		}),

		create("Frame")({
			Name = "ElapsedFrame",
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 20),

			create("UIListLayout")({
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, 20),
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
			}),

			create("TextLabel")({
				Name = "TotalElapsedLabel",
				BackgroundTransparency = 1,
				Size = UDim2.fromOffset(120, 20),
				FontFace = Font.new("rbxassetid://12187365364"),
				TextSize = 14,
				Text = "Total: 0.00s",
				__dynamicKeys = {
					TextColor3 = self.Theme.Text.Secondary[1],
					TextTransparency = self.Theme.Text.Secondary[2],
				},
			}),

			create("TextLabel")({
				Name = "CheckElapsedLabel",
				BackgroundTransparency = 1,
				Size = UDim2.fromOffset(120, 20),
				FontFace = Font.new("rbxassetid://12187365364"),
				TextSize = 14,
				Text = "Check: 0.00s",
				__dynamicKeys = {
					TextColor3 = self.Theme.Text.Secondary[1],
					TextTransparency = self.Theme.Text.Secondary[2],
				},
			})
		})
	})) :: Frame

	structures.CurrentTestLabel = structures.Body:FindFirstChild("CurrentTestLabel") :: TextLabel
	structures.NextTestLabel = structures.Body:FindFirstChild("NextTestLabel") :: TextLabel
	local statsFrame = structures.Body:FindFirstChild("StatsFrame") :: Frame
	structures.PassedLabel = statsFrame:FindFirstChild("PassedLabel") :: TextLabel
	structures.FailedLabel = statsFrame:FindFirstChild("FailedLabel") :: TextLabel
	local elapsedFrame = structures.Body:FindFirstChild("ElapsedFrame") :: Frame
	structures.TotalElapsedLabel = elapsedFrame:FindFirstChild("TotalElapsedLabel") :: TextLabel
	structures.CheckElapsedLabel = elapsedFrame:FindFirstChild("CheckElapsedLabel") :: TextLabel

	return structures, self.Theme
end
