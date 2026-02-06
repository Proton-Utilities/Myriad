--!nocheck
local Console = {}
Console.__index = Console

--// Constants
local FONT = Enum.Font.RobotoMono
local TEXT_SIZE = 14
local PADDING = 8

--// Helper: Create Instance
local function create(className, props)
	local instance = Instance.new(className)
	for k, v in pairs(props) do
		instance[k] = v
	end
	return instance
end

function Console.new(parent, props)
	local self = setmetatable({}, Console)

	self.Props = props or {}
	self.RichText = self.Props.RichText ~= false
	self.ReadOnly = self.Props.ReadOnly ~= false

	self.Container = create("Frame", {
		Name = "ConsoleComponent",
		BackgroundColor3 = Color3.fromRGB(20, 20, 20),
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 0, 300),
		Parent = parent,
		ClipsDescendants = true,
	})

	create("UICorner", { CornerRadius = UDim.new(0, 6), Parent = self.Container })

	create("UIPadding", {
		PaddingTop = UDim.new(0, PADDING),
		PaddingBottom = UDim.new(0, PADDING),
		PaddingLeft = UDim.new(0, PADDING),
		PaddingRight = UDim.new(0, PADDING),
		Parent = self.Container,
	})

	self.ScrollView = create("ScrollingFrame", {
		Name = "Scroll",
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		CanvasSize = UDim2.new(0, 0, 0, 0),
		ScrollBarThickness = 4,
		ScrollBarImageColor3 = Color3.fromRGB(80, 80, 80),
		AutomaticCanvasSize = Enum.AutomaticSize.Y,
		Parent = self.Container,
	})

	self.Layout = create("UIListLayout", {
		SortOrder = Enum.SortOrder.LayoutOrder,
		Padding = UDim.new(0, 2),
		VerticalAlignment = Enum.VerticalAlignment.Top,
		Parent = self.ScrollView,
	})

	if self.Props.Height then
		self.Container.Size = UDim2.new(1, 0, 0, self.Props.Height)
	end

	self.Layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
		self.ScrollView.CanvasSize = UDim2.new(0, 0, 0, self.Layout.AbsoluteContentSize.Y)

		local canvasPos = self.ScrollView.CanvasPosition.Y
		local windowHeight = self.ScrollView.AbsoluteWindowSize.Y
		local canvasSize = self.Layout.AbsoluteContentSize.Y

		if (canvasSize - windowHeight - canvasPos) < 50 then
			self.ScrollView.CanvasPosition = Vector2.new(0, canvasSize - windowHeight)
		end
	end)

	return self
end

function Console:AppendText(text)
	create("TextLabel", {
		Name = "Line",
		BackgroundTransparency = 1,
		Text = text,
		TextColor3 = Color3.fromRGB(220, 220, 220),
		TextSize = TEXT_SIZE,
		Font = FONT,
		RichText = self.RichText,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextYAlignment = Enum.TextYAlignment.Top,
		TextWrapped = true,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		Parent = self.ScrollView,
	})
end

function Console:SetValue(text)
	self:Clear()

	create("TextLabel", {
		Name = "Status",
		BackgroundTransparency = 1,
		Text = text,
		TextColor3 = Color3.fromRGB(255, 255, 255),
		TextSize = TEXT_SIZE + 2,
		Font = FONT,
		RichText = self.RichText,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextYAlignment = Enum.TextYAlignment.Top,
		TextWrapped = true,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		Parent = self.ScrollView,
	})
end

function Console:Clear()
	for _, child in ipairs(self.ScrollView:GetChildren()) do
		if child:IsA("GuiObject") then
			child:Destroy()
		end
	end
	self.ScrollView.CanvasPosition = Vector2.new(0, 0)
end

function Console:GetValue()
	local lines = {}
	for _, child in ipairs(self.ScrollView:GetChildren()) do
		if child:IsA("TextLabel") then
			table.insert(lines, child.Text)
		end
	end
	return table.concat(lines, "\n")
end

function Console:__index(key)
	if Console[key] then
		return Console[key]
	end
	if key == "__instance" then
		return self.Container
	end
	return
end

return Console
