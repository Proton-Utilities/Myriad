local cascade = require("@packages/cascade")

local CATEGORY_CONFIG = {
	added = {
		label = "Added",
		color = function(theme)
			return Color3.fromRGB(48, 209, 88)
		end,
	},
	changed = {
		label = "Changed",
		color = function(theme)
			return Color3.fromRGB(255, 214, 10)
		end,
	},
	deprecated = {
		label = "Deprecated",
		color = function(theme)
			return Color3.fromRGB(255, 159, 10)
		end,
	},
	removed = {
		label = "Removed",
		color = function(theme)
			return Color3.fromRGB(255, 69, 58)
		end,
	},
	fixed = {
		label = "Fixed",
		color = function(theme)
			return Color3.fromRGB(10, 132, 255)
		end,
	},
	security = {
		label = "Security",
		color = function(theme)
			return Color3.fromRGB(191, 90, 242)
		end,
	},
}
local CATEGORY_ORDER = { "added", "changed", "deprecated", "removed", "fixed", "security" }
local TAG_CONFIG = {
	STABLE = {
		label = "Stable",
		bgColor = function(theme)
			return Color3.fromRGB(48, 209, 88)
		end,
	},
	HOTFIX = {
		label = "Hotfix",
		bgColor = function(theme)
			return Color3.fromRGB(255, 69, 58)
		end,
	},
	["PRE-RELEASE"] = {
		label = "Pre-release",
		bgColor = function(theme)
			return Color3.fromRGB(255, 159, 10)
		end,
	},
}

local FONT_BOLD = Font.new("rbxassetid://12187365364", Enum.FontWeight.Bold)
local FONT_MEDIUM = Font.new("rbxassetid://12187365364", Enum.FontWeight.Medium)
local FONT_REG = Font.new("rbxassetid://12187365364")

return function(self, properties: any)
	local creator = cascade.Creator
	local binder = cascade.Binder

	local create = creator.Create
	local apply = binder.Apply

	local parent = self.__container or self.__instance or self
	local structures = {}
	local theme = self.Theme

	structures.Body = apply(
		properties,
		create("Frame")({
			Name = "ChangelogEntry",
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			Parent = parent,

			create("UIListLayout")({
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, 0),
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				VerticalAlignment = Enum.VerticalAlignment.Top,
			}),
		})
	) :: Frame

	local headerFrame = create("Frame")({
		Name = "HeaderFrame",
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1,
		LayoutOrder = 1,
		Parent = structures.Body.__instance,

		create("UIListLayout")({
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 8),
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Center,
		}),
		create("UIPadding")({
			PaddingTop = UDim.new(0, 12),
			PaddingBottom = UDim.new(0, 10),
			PaddingLeft = UDim.new(0, 2),
		}),
	})

	structures.VersionLabel = create("TextLabel")({
		Name = "VersionLabel",
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.XY,
		Size = UDim2.fromOffset(0, 0),
		FontFace = FONT_BOLD,
		TextSize = 20,
		Text = `v{properties.Version or ""}`,
		LayoutOrder = 1,
		Parent = headerFrame.__instance,
		__dynamicKeys = {
			TextColor3 = theme.Text.Primary[1],
			TextTransparency = theme.Text.Primary[2],
		},
	}) :: TextLabel

	structures.TagsFrame = create("Frame")({
		Name = "TagsFrame",
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.XY,
		Size = UDim2.fromOffset(0, 0),
		LayoutOrder = 2,
		Parent = headerFrame.__instance,

		create("UIListLayout")({
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 5),
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Center,
		}),
	}) :: Frame

	create("Frame")({
		Name = "Separator",
		Size = UDim2.new(1, 0, 0, 1),
		BackgroundTransparency = 0,
		BorderSizePixel = 0,
		LayoutOrder = 2,
		Parent = structures.Body.__instance,
		__dynamicKeys = {
			BackgroundColor3 = theme.Controls.ViewBorder[1],
			BackgroundTransparency = theme.Controls.ViewBorder[2],
		},
	})

	structures.ChangesFrame = create("Frame")({
		Name = "ChangesFrame",
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1,
		LayoutOrder = 3,
		Parent = structures.Body.__instance,

		create("UIListLayout")({
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 12),
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
		}),
		create("UIPadding")({
			PaddingTop = UDim.new(0, 12),
			PaddingBottom = UDim.new(0, 14),
			PaddingLeft = UDim.new(0, 2),
		}),
	}) :: Frame

	local function buildTagPill(tag: string)
		local upperTag = tag:upper()
		local cfg = TAG_CONFIG[upperTag] or TAG_CONFIG["PRE-RELEASE"]
		local bgColorValue = cfg.bgColor(theme)

		local pillProps: { [any]: any } = {
			Name = `Tag_{tag}`,
			AutomaticSize = Enum.AutomaticSize.XY,
			Size = UDim2.fromOffset(0, 0),
			BorderSizePixel = 0,
			BackgroundColor3 = bgColorValue or Color3.fromRGB(100, 100, 100),
			Parent = structures.TagsFrame.__instance,

			create("UICorner")({ CornerRadius = UDim.new(0, 4) }),
			create("UIPadding")({
				PaddingTop = UDim.new(0, 2),
				PaddingBottom = UDim.new(0, 2),
				PaddingLeft = UDim.new(0, 6),
				PaddingRight = UDim.new(0, 6),
			}),
			create("TextLabel")({
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.XY,
				Size = UDim2.fromOffset(0, 0),
				FontFace = FONT_MEDIUM,
				TextSize = 11,
				Text = cfg.label:upper(),
				TextColor3 = Color3.fromRGB(255, 255, 255),
			}),
		}

		return create("Frame")(pillProps)
	end

	local function buildCategoryBlock(categoryKey: string, items: { string }, layoutOrder: number)
		local cfg = CATEGORY_CONFIG[categoryKey]
		if not cfg then
			return
		end

		local block = create("Frame")({
			Name = `Category_{categoryKey}`,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			LayoutOrder = layoutOrder,
			Parent = structures.ChangesFrame.__instance,

			create("UIListLayout")({
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, 4),
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
			}),
		})

		local color = cfg.color(theme)
		local headingProps: { [any]: any } = {
			Name = "CategoryHeading",
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.XY,
			Size = UDim2.fromOffset(0, 0),
			FontFace = FONT_BOLD,
			TextSize = 11,
			Text = cfg.label:upper(),
			LayoutOrder = 1,
			TextColor3 = color,
			Parent = block.__instance,
		}
		create("TextLabel")(headingProps)

		for i, item in ipairs(items) do
			create("TextLabel")({
				Name = `Item_{i}`,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				FontFace = FONT_REG,
				TextSize = 14,
				Text = `– {item}`,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextWrapped = true,
				LayoutOrder = i + 1,
				Parent = block.__instance,
				__dynamicKeys = {
					TextColor3 = theme.Text.Primary[1],
					TextTransparency = theme.Text.Primary[2],
				},
			})
		end
	end

	local function populate(version: string?, tags: { string }?, changes: { [string]: { string } }?)
		if structures.VersionLabel then
			structures.VersionLabel.Text = `v{version or "?"}`
		end

		for _, child in ipairs(structures.TagsFrame:GetChildren()) do
			if not child:IsA("UIListLayout") then
				child:Destroy()
			end
		end

		if tags then
			for _, tag in ipairs(tags) do
				buildTagPill(tag)
			end
		end

		for _, child in ipairs(structures.ChangesFrame:GetChildren()) do
			if not child:IsA("UIListLayout") and not child:IsA("UIPadding") then
				child:Destroy()
			end
		end

		if changes then
			local order = 1
			for _, categoryKey in ipairs(CATEGORY_ORDER) do
				local items = changes[categoryKey]
				if items and #items > 0 then
					buildCategoryBlock(categoryKey, items, order)
					order += 1
				end
			end
		end
	end

	populate(properties.Version, properties.Tags, properties.Changes)

	structures._populate = populate

	return structures, theme
end
