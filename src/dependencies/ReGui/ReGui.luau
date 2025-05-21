--!nocheck
--!nolint

--[[

      _       ,-'REGUI`-._
    (,-.`._,'( By Depso |\`-/|
        `-.-' \ )-----`( , o o)
               `-       \`_---_
			
    Written by depso
    MIT License
    
    https://github.com/depthso
]]

local ReGui = {
	--// Package data
	Version = "1.4.3",
	Author = "Depso",
	License = "MIT",
	Repository = "https://github.com/depthso/Dear-ReGui/",

	--// Configuration
	Debug = false,
	PrefabsId = 71968920594655,
	DefaultTitle = "ReGui",
	ContainerName = "ReGui",
	DoubleClickThreshold = 0.3,
	TooltipOffset = 15,
	IniToSave = {
		"Value"
	},

	--// Objects
	Container = nil,
	Prefabs = nil,
	FocusedWindow = nil,

	--// Classes
	ThemeConfigs = {},
	Elements = {},
	Signaling = {},
	Animation = {
		DefaultTweenInfo = TweenInfo.new(0.08),
	},

	--// Collections
	_FlagCache = {},
	_ErrorCache = {},
	Windows = {},
	ActiveTooltips = {},
	IniSettings = {},
	AnimationConnections = {}
}

ReGui.Icons = {
	Dot = "rbxasset://textures/whiteCircle.png",
	Arrow = "rbxasset://textures/DeveloperFramework/button_arrow_right.png",
	Close = "rbxasset://textures/AnimationEditor/icon_close.png",
	Checkmark = "rbxasset://textures/AnimationEditor/icon_checkmark.png",
	Cat = "rbxassetid://16211812161",
	Script = "rbxassetid://11570895459",
	Settings = "rbxassetid://9743465390",
	Info = "rbxassetid://18754976792",
	Move = "rbxassetid://6710235139",
	Roblox = "rbxassetid://7414445494",
	Warning = "rbxassetid://11745872910",
	Audio = "rbxassetid://302250236",
	Shop = "rbxassetid://6473525198",
	CharacterDance = "rbxassetid://11932783331",
	Pants = "rbxassetid://10098755331",
	Home = "rbxassetid://4034483344",
	Robux = "rbxassetid://5986143282",
	Badge = "rbxassetid://16170504068",
	SpawnLocation = "rbxassetid://6400507398",
	Sword = "rbxassetid://7485051715",
	Clover = "rbxassetid://11999300014",
	Star = "rbxassetid://3057073083",
	Code = "rbxassetid://11348555035",
	Paw = "rbxassetid://13001190533",
	Shield = "rbxassetid://7461510428",
	Shield2 = "rbxassetid://7169354142",
	File = "rbxassetid://7276823330",
	Book = "rbxassetid://16061686835",
	Location = "rbxassetid://13549782519",
	Puzzle = "rbxassetid://8898417863",
	Discord = "rbxassetid://84828491431270",
	Premium = "rbxassetid://6487178625",
	Friend = "rbxassetid://10885655986",
	User = "rbxassetid://18854794412",
	Duplicate = "rbxassetid://11833749507",
	ChatBox = "rbxassetid://15839118471",
	ChatBox2 = "rbxassetid://15839116089",
	Devices = "rbxassetid://4458812712",
	Weight = "rbxassetid://9855685269",
	Image = "rbxassetid://123311808092347",
	Profile = "rbxassetid://13585614795",
	Admin = "rbxassetid://11656483170",
	PaintBrush = "rbxassetid://12111879608",
	Speed = "rbxassetid://12641434961",
	NoConnection = "rbxassetid://9795340967",
	Connection = "rbxassetid://119759670842477",
	Globe = "rbxassetid://18870359747",
	Box = "rbxassetid://140217940575618",
	Crown = "rbxassetid://18826490498",
	Control = "rbxassetid://18979524646",
	Send = "rbxassetid://18940312887",
	FastForward = "rbxassetid://112963221295680",
	Pause = "rbxassetid://109949100737970",
	Reload = "rbxassetid://11570018242",
	Joystick = "rbxassetid://18749336354",
	Controller = "rbxassetid://11894535915",
	Lock = "rbxassetid://17783082088",
	Calculator = "rbxassetid://85861816563977",
	Sun = "rbxassetid://13492317832",
	Moon = "rbxassetid://8498174594",
	Prohibited = "rbxassetid://5248916036",
	Flag = "rbxassetid://251346532",
	Website = "rbxassetid://98455290625865",
	Telegram = "rbxassetid://115860270107061",
	MusicNote = "rbxassetid://18187351229",
	Music = "rbxassetid://253830398",
	Headphones = "rbxassetid://1311321471",
	Phone = "rbxassetid://8411963035",
	Smartphone = "rbxassetid://14040313879",
	Desktop = "rbxassetid://3120635703",
	Desktop2 = "rbxassetid://4728059490",
	Laptop = "rbxassetid://4728059725",
	Server = "rbxassetid://9692125126",
	Wedge = "rbxassetid://9086583059",
	Drill = "rbxassetid://11959189471",
	Character = "rbxassetid://13285102351",
}

ReGui.DynamicImages = {
	[ReGui.Icons.Arrow] = "ImageFollowsText",
	[ReGui.Icons.Close] = "ImageFollowsText",
	[ReGui.Icons.Dot] = "ImageFollowsText",
}

ReGui.Accent = {
	--// ReGui acent colors
	Light = Color3.fromRGB(50, 150, 250),
	Dark = Color3.fromRGB(30, 66, 115),
	ExtraDark = Color3.fromRGB(28, 39, 53),
	White = Color3.fromRGB(240, 240, 240),
	Gray = Color3.fromRGB(172, 171, 175),
	Black = Color3.fromRGB(15, 19, 24),
	Yellow = Color3.fromRGB(230, 180, 0),
	Orange = Color3.fromRGB(230, 150, 0),
	Green = Color3.fromRGB(130, 188, 91),
	Red = Color3.fromRGB(255, 69, 69),

	--// ImGui acent colors
	ImGui = {
		Light = Color3.fromRGB(66, 150, 250),
		Dark = Color3.fromRGB(41, 74, 122),
		Black = Color3.fromRGB(15, 15, 15),
		Gray = Color3.fromRGB(36, 36, 36)
	}
}

type ThemeData = {
	[string]: any
}
-- If you are forking just to edit this, please use ReGui:DefineTheme instead
local ThemeConfigs = ReGui.ThemeConfigs
ThemeConfigs.DarkTheme = {
	Values = {
		AnimationTweenInfo = TweenInfo.new(0.08),
		TextFont = Font.fromEnum(Enum.Font.RobotoMono),
		TextSize = 14,
		Text = ReGui.Accent.White,
		TextDisabled = ReGui.Accent.Gray,
		ErrorText = ReGui.Accent.Red,

		FrameBg = ReGui.Accent.Dark,
		FrameBgTransparency = 0.4,
		FrameBgActive = ReGui.Accent.Light,
		FrameBgTransparencyActive = 0.4,
		FrameRounding = UDim.new(0, 0),

		--// Elements
		SliderGrab = ReGui.Accent.Light,
		ButtonsBg = ReGui.Accent.Light,
		CollapsingHeaderBg = ReGui.Accent.Light,
		CollapsingHeaderText = ReGui.Accent.White,
		CheckMark = ReGui.Accent.Light,
		ResizeGrab = ReGui.Accent.Light,
		HeaderBg = ReGui.Accent.Gray,
		HeaderBgTransparency = 0.7,
		HistogramBar = ReGui.Accent.Yellow,
		ProgressBar = ReGui.Accent.Yellow,
		RegionBg = ReGui.Accent.Dark,
		RegionBgTransparency = 0.1,
		Separator = ReGui.Accent.Gray,
		SeparatorTransparency = 0.5,
		ConsoleLineNumbers = ReGui.Accent.White,
		LabelPaddingTop = UDim.new(0, 0),
		LabelPaddingBottom = UDim.new(0, 0),
		MenuBar = ReGui.Accent.ExtraDark,
		MenuBarTransparency = 0.1,
		PopupCanvas = ReGui.Accent.Black,

		--// TabSelector
		TabTextPaddingTop = UDim.new(0, 3),
		TabTextPaddingBottom = UDim.new(0, 8),
		TabText = ReGui.Accent.Gray,
		TabBg = ReGui.Accent.Dark,
		TabTextActive = ReGui.Accent.White,
		TabBgActive = ReGui.Accent.Light,
		TabsBarBg = Color3.fromRGB(36, 36, 36),
		TabsBarBgTransparency = 1,
		TabPagePadding = UDim.new(0, 8),

		--// Window
		ModalWindowDimBg = Color3.fromRGB(230, 230, 230),
		ModalWindowDimTweenInfo = TweenInfo.new(0.2),

		WindowBg = ReGui.Accent.Black,
		WindowBgTransparency = 0.05,

		Border = ReGui.Accent.Gray,
		BorderTransparency = 0.8,
		BorderTransparencyActive = 0.5,

		Title = ReGui.Accent.White,
		TitleAlign = Enum.TextXAlignment.Left,
		TitleBarBg = ReGui.Accent.Black,
		TitleBarTransparency = 0,
		TitleActive = ReGui.Accent.White,
		TitleBarBgActive = ReGui.Accent.Dark,
		TitleBarTransparencyActive = 0.05,
		TitleBarBgCollapsed = Color3.fromRGB(0, 0, 0),
		TitleBarTransparencyCollapsed = 0.6,
	}
}
ThemeConfigs.LightTheme = {
	BaseTheme = ThemeConfigs.DarkTheme,
	Values = {
		Text = ReGui.Accent.Black,
		TextFont = Font.fromEnum(Enum.Font.Ubuntu),
		TextSize = 14,

		FrameBg = ReGui.Accent.Gray,
		FrameBgTransparency = 0.4,
		FrameBgActive = ReGui.Accent.Light,
		FrameBgTransparencyActive = 0.6,

		SliderGrab = ReGui.Accent.Light,
		ButtonsBg = ReGui.Accent.Light,
		CollapsingHeaderText = ReGui.Accent.Black,
		Separator = ReGui.Accent.Black,
		ConsoleLineNumbers = ReGui.Accent.Yellow,
		MenuBar = Color3.fromRGB(219, 219, 219),
		PopupCanvas = ReGui.Accent.White,

		TabText = ReGui.Accent.Black,
		TabTextActive = ReGui.Accent.Black,

		WindowBg = ReGui.Accent.White,
		Border = ReGui.Accent.Gray,
		ResizeGrab = ReGui.Accent.Gray,

		Title = ReGui.Accent.Black,
		TitleAlign = Enum.TextXAlignment.Center,
		TitleBarBg = ReGui.Accent.Gray,
		TitleActive = ReGui.Accent.Black,
		TitleBarBgActive = Color3.fromRGB(186, 186, 186),
		TitleBarBgCollapsed = ReGui.Accent.Gray
	}
}
ThemeConfigs.ImGui = {
	BaseTheme = ThemeConfigs.DarkTheme,
	Values = {
		AnimationTweenInfo = TweenInfo.new(0),
		Text = Color3.fromRGB(255, 255, 255),

		FrameBg = ReGui.Accent.ImGui.Dark,
		FrameBgTransparency = 0.4,
		FrameBgActive = ReGui.Accent.ImGui.Light,
		FrameBgTransparencyActive = 0.5,
		FrameRounding = UDim.new(0, 0),

		ButtonsBg = ReGui.Accent.ImGui.Light,
		CollapsingHeaderBg = ReGui.Accent.ImGui.Light,
		CollapsingHeaderText = ReGui.Accent.White,
		CheckMark = ReGui.Accent.ImGui.Light,
		ResizeGrab = ReGui.Accent.ImGui.Light,
		MenuBar = ReGui.Accent.ImGui.Gray,
		MenuBarTransparency = 0,
		PopupCanvas = ReGui.Accent.ImGui.Black,
		
		TabText = ReGui.Accent.Gray,
		TabBg = ReGui.Accent.ImGui.Dark,
		TabTextActive = ReGui.Accent.White,
		TabBgActive = ReGui.Accent.ImGui.Light,

		WindowBg = ReGui.Accent.ImGui.Black,
		WindowBgTransparency = 0.05,
		Border = ReGui.Accent.Gray,
		BorderTransparency = 0.7,
		BorderTransparencyActive = 0.4,

		Title = ReGui.Accent.White,
		TitleBarBg = ReGui.Accent.ImGui.Black,
		TitleBarTransparency = 0,
		TitleBarBgActive = ReGui.Accent.ImGui.Dark,
		TitleBarTransparencyActive = 0,
	}
}

ReGui.ElementColors = {
	["MenuBar"] = {
		BackgroundColor3 = "MenuBar",
		BackgroundTransparency = "MenuBarTransparency",
	},
	["FrameRounding"] = {
		CornerRadius = "FrameRounding"
	},
	["PopupCanvas"] = {
		BackgroundColor3 = "PopupCanvas"
	},
	["ModalWindowDim"] = {
		BackgroundColor3 = "ModalWindowDimBg"
	},
	["Selectable"] = "Button",
	["MenuButton"] = "Button",
	["Separator"] = {
		BackgroundColor3 = "Separator",
		BackgroundTransparency = "SeparatorTransparency",
	},
	["Region"] = {
		BackgroundColor3 = "RegionBg",
		BackgroundTransparency = "RegionBgTransparency",
	},
	["Label"] = {
		TextColor3 = "Text",
		FontFace = "TextFont",
		TextSize = "TextSize",
	},
	["ImageFollowsText"] = {
		ImageColor3 = "Text",
	},
	["ConsoleLineNumbers"] = {
		TextColor3 = "ConsoleLineNumbers",
		FontFace = "TextFont",
		TextSize = "TextSize",
	},
	["ConsoleText"] = "Label",
	["LabelDisabled"] = {
		TextColor3 = "TextDisabled",
		FontFace = "TextFont",
		TextSize = "TextSize",
	},
	["Plot"] = {
		BackgroundColor3 = "HistogramBar",
	},
	["Header"] = {
		BackgroundColor3 = "HeaderBg",
		BackgroundTransparency = "HeaderBgTransparency",
	},
	["WindowTitle"] = {
		TextXAlignment = "TitleAlign",
		FontFace = "TextFont",
		TextSize = "TextSize",
	},
	["TitleBar"] = {
		BackgroundColor3 = "TitleBarBgActive"
	},
	["Window"] = {
		BackgroundColor3 = "WindowBg",
		BackgroundTransparency = "WindowBgTransparency"
	},
	["TitleBarBgCollapsed"] = {
		BackgroundColor3 = "TitleBarBgCollapsed",
		BackgroundTransparency = "TitleBarTransparencyCollapsed"
	},
	["TitleBarBgActive"] = {
		BackgroundColor3 = "TitleBarBgActive",
		BackgroundTransparency = "TitleBarTransparencyActive"
	},
	["TitleBarBg"] = {
		BackgroundColor3 = "TitleBarBg",
		BackgroundTransparency = "TitleBarTransparency"
	},
	["TabsBar"] = {
		BackgroundColor3 = "TabsBarBg",
		BackgroundTransparency = "TabsBarBgTransparency",
	},
	["Border"] = {
		Color = "Border",
		Transparency = "BorderTransparency"
	},
	["ResizeGrab"] = {
		TextColor3 = "ResizeGrab"
	},
	["BorderActive"] = {
		Transparency = "BorderTransparencyActive"
	},
	["Frame"] = {
		BackgroundColor3 = "FrameBg",
		BackgroundTransparency = "FrameBgTransparency",
		TextColor3 = "Text",
		FontFace = "TextFont",
		TextSize = "TextSize",
	},
	["FrameActive"] = {
		BackgroundColor3 = "FrameBgActive",
		BackgroundTransparency = "FrameBgTransparencyActive"
	},
	["SliderGrab"] = {
		BackgroundColor3 = "SliderGrab"
	},
	["Button"] = {
		BackgroundColor3 = "ButtonsBg",
		TextColor3 = "Text",
		FontFace = "TextFont",
		TextSize = "TextSize",
	},
	["CollapsingHeader"] = {
		FontFace = "TextFont",
		TextSize = "TextSize",
		TextColor3 = "CollapsingHeaderText",
		BackgroundColor3 = "CollapsingHeaderBg",
	},
	["Checkbox"] = {
		BackgroundColor3 = "FrameBg",
	},
	["CheckMark"] = {
		ImageColor3 = "CheckMark",
		BackgroundColor3 = "CheckMark",
	},
	["RadioButton"] = {
		BackgroundColor3 = "ButtonsBg",
	}
}

ReGui.Styles = {
	RadioButton = {
		Animation = "RadioButtons",
		CornerRadius = UDim.new(1, 0),
	},
	Button = {
		Animation = "Buttons"
	},
	CollapsingHeader = {
		Animation = "Buttons"
	},
	TreeNode = {
		Animation = "TransparentButtons"
	},
	TransparentButton = {
		Animation = "TransparentButtons"
	}
}

ReGui.Animations = {
	["Invisible"] = {
		Connections = {
			MouseEnter = {
				Visible = true,
			},
			MouseLeave = {
				Visible = false,
			}
		},
		Init = "MouseLeave"
	},
	["Buttons"] = {
		Connections = {
			MouseEnter = {
				BackgroundTransparency = 0.3,
			},
			MouseLeave = {
				BackgroundTransparency = 0.7,
			}
		},
		Init = "MouseLeave"
	},
	["TextButtons"] = {
		Connections = {
			MouseEnter = {
				TextTransparency = 0.3,
			},
			MouseLeave = {
				TextTransparency = 0.7,
			}
		},
		Init = "MouseLeave"
	},
	["TransparentButtons"] = {
		Connections = {
			MouseEnter = {
				BackgroundTransparency = 0.3,
			},
			MouseLeave = {
				BackgroundTransparency = 1,
			}
		},
		Init = "MouseLeave"
	},
	["RadioButtons"] = {
		Connections = {
			MouseEnter = {
				BackgroundTransparency = 0.5,
			},
			MouseLeave = {
				BackgroundTransparency = 1,
			}
		},
		Init = "MouseLeave"
	},
	["Inputs"] = {
		Connections = {
			MouseEnter = {
				BackgroundTransparency = 0,
			},
			MouseLeave = {
				BackgroundTransparency = 0.5,
			},
		},
		Init = "MouseLeave"
	},
	["Plots"] = {
		Connections = {
			MouseEnter = {
				BackgroundTransparency = 0.3,
			},
			MouseLeave = {
				BackgroundTransparency = 0,
			},
		},
		Init = "MouseLeave"
	},
	["Border"] = {
		Connections = {
			Selected = {
				Transparency = 0,
				Thickness = 1
			},
			Deselected = {
				Transparency = 0.7,
				Thickness = 1
			}
		},
		Init = "Selected"
	},
}

--// Global flags for styling
type FlagFunc = {
	Data: {
		Class: {},
		WindowClass: table?
	},
	Object: GuiObject
}
ReGui.ElementFlags = {
	{
		Properties = {"Center"},
		Callback = function<FlagFunc>(Data, Object, Value)
			local Position = Object.Position
			ReGui:SetProperties(Object, {
				Position = UDim2.new(
					Value:find("X") and 0.5 or Position.X.Scale,
					Position.X.Offset,
					Value:find("Y") and 0.5 or Position.Y.Scale,
					Position.Y.Offset
				),
				AnchorPoint = Vector2.new(
					Value:find("X") and 0.5 or 0,
					Value:find("Y") and 0.5 or 0
				)
			})
		end,
	},
	{
		Properties = {"ElementStyle"},
		Callback = function<StyleFunc>(Data, Object, Value)
			ReGui:ApplyStyle(Object, Value)
		end,
	},
	{
		Properties = {"ColorTag"},
		Callback = function<StyleFunc>(Data, Object, Value)
			local Class = Data.Class
			local WindowClass = Data.WindowClass
			local NoAutoTheme = Class.NoAutoTheme
			
			--// Check if theming is enabled
			if not WindowClass then return end
			if NoAutoTheme then return end

			ReGui:UpdateColors({
				Object = Object,
				Tag = Value,
				NoAnimation = true,
				Theme = WindowClass.Theme,
			})
		end,
	},
	{
		Properties = {"Animation"},
		Callback = function<StyleFunc>(Data, Object, Value)
			--// Check if animations are disabled
			local NoAnimation = Data.Class.NoAnimation
			if NoAnimation then return end
			
			ReGui:SetAnimation(Object, Value)
		end,
	},
	{
		Properties = {"Image"},
		Callback = function<StyleFunc>(Data, Object, Value)
			local WindowClass = Data.WindowClass
			Object.Image = ReGui:CheckAssetUrl(Value)
			ReGui:DynamicImageTag(Object, Value, WindowClass)
		end,
	},
	{
		Properties = {"Icon", "IconSize", "IconRotation", "IconPadding"},
		Callback = function<StyleFunc>(Data, Object, Value)
			--// Locate icon element
			local Icon = Object:FindFirstChild("Icon", true)
			if not Icon then 
				return ReGui:Warn("No icon for", Object) 
			end 
			
			--// Check class data for missing values
			local Class = Data.Class
			ReGui:CheckConfig(Class, {
				Icon = "",
				IconSize = UDim2.fromScale(1,1),
				IconRotation = 0,
				IconPadding = UDim2.new(0, 2)
			})
			
			--// Apply icon padding
			local Padding = Icon.Parent:FindFirstChild("UIPadding")
			ReGui:SetPadding(Padding, Class.IconPadding)

			--// Check image asset url
			local Image = Class.Icon
			Image = ReGui:CheckAssetUrl(Image)
			
			--// Dynamic image
			local WindowClass = Data.WindowClass
			ReGui:DynamicImageTag(Icon, Image, WindowClass)
			ReGui:SetProperties(Icon, {
				Visible = Icon ~= "",
				Image = ReGui:CheckAssetUrl(Image),
				Size = Class.IconSize,
				Rotation = Class.IconRotation
			})
		end,
	},
	{
		Properties = {"BorderThickness", "Border", "BorderColor"},
		Callback = function<StyleFunc>(Data, Object, Value)
			local Class = Data.Class
			local WindowClass = Data.WindowClass
			local Enabled = Class.Border == true

			ReGui:CheckConfig(Class, {
				BorderTransparency = Data:GetThemeKey("BorderTransparencyActive"),
				BorderColor = Data:GetThemeKey("Border"),
				BorderThickness = 1,
				BorderStrokeMode = Enum.ApplyStrokeMode.Border,
			})

			--// Apply properties to UIStroke
			local Stroke = ReGui:GetChildOfClass(Object, "UIStroke")
			ReGui:SetProperties(Stroke, {
				Transparency = Class.BorderTransparency,
				Thickness = Class.BorderThickness,
				Color = Class.BorderColor,
				ApplyStrokeMode = Class.BorderStrokeMode,
				Enabled = Enabled
			})
		end,
	},
	{
		Properties = {"Ratio"},
		Callback = function<StyleFunc>(Data, Object, Value)
			local Class = Data.Class

			ReGui:CheckConfig(Class, {
				Ratio = 4/3,
				RatioAxis = Enum.DominantAxis.Height,
				RatioAspectType = Enum.AspectType.ScaleWithParentSize
			})

			--// Unpack data
			local AspectRatio = Class.Ratio
			local Axis = Class.RatioAxis
			local AspectType = Class.RatioAspectType

			local Ratio = ReGui:GetChildOfClass(Object, "UIAspectRatioConstraint")
			ReGui:SetProperties(Ratio, {
				DominantAxis = Axis,
				AspectType = AspectType,
				AspectRatio = AspectRatio
			})
		end,
	},
	{
		Properties = {"FlexMode"},
		Callback = function<StyleFunc>(Data, Object, Value)
			local FlexItem = ReGui:GetChildOfClass(Object, "UIFlexItem")
			FlexItem.FlexMode = Value
		end,
	},
	{
		--Recursive = true,
		Properties = {"CornerRadius"},
		Callback = function<StyleFunc>(Data, Object, Value)
			local UICorner = ReGui:GetChildOfClass(Object, "UICorner")
			UICorner.CornerRadius = Value
		end,
	},
	{
		Properties = {"Fill"},
		Callback = function<StyleFunc>(Data, Object, Value)
			if Value ~= true then return end

			local Class = Data.Class

			ReGui:CheckConfig(Class, {
				Size = UDim2.fromScale(1, 1),
				UIFlexMode = Enum.UIFlexMode.Fill,
				AutomaticSize = Enum.AutomaticSize.None
			})

			--// Create FlexLayout property
			local Flex = ReGui:GetChildOfClass(Object, "UIFlexItem")
			Flex.FlexMode = Class.UIFlexMode

			Object.Size = Class.Size
			Object.AutomaticSize = Class.AutomaticSize
		end,
	},
	{
		Properties = {"Label"},
		Callback = function<StyleFunc>(Data, Object, Value)
			local Label = Object:FindFirstChild("Label")
			if not Label then return end

			local Class = Data.Class
			function Class:SetLabel(Text)
				Label.Text = Text
				return self
			end

			Label.Text = tostring(Value)
		end,
	},
	{
		Properties = {"NoGradient"},
		WindowProperties = {"NoGradients"},
		Callback = function<StyleFunc>(Data, Object, Value)
			local UIGradient = Object:FindFirstChildOfClass("UIGradient")
			if not UIGradient then return end

			UIGradient.Enabled = Value
		end,
	},
	{
		Properties = {
			"UiPadding", 
			"PaddingBottom", 
			"PaddingTop",
			"PaddingRight", 
			"PaddingTop"
		},
		Callback = function<StyleFunc>(Data, Object, Value)
			Value = Value or 0

			--// Convert number value into a UDim
			if typeof(Value) == "number" then
				Value = UDim.new(0, Value)
			end

			local Class = Data.Class

			local IsUiPadding = Class.UiPadding
			if IsUiPadding then
				ReGui:CheckConfig(Class, {
					PaddingBottom = Value,
					PaddingLeft = Value,
					PaddingRight = Value,
					PaddingTop = Value,
				})
			end

			local UIPadding = ReGui:GetChildOfClass(Object, "UIPadding")
			ReGui:SetProperties(UIPadding, {
				PaddingBottom = Class.PaddingBottom,
				PaddingLeft = Class.PaddingLeft,
				PaddingRight = Class.PaddingRight,
				PaddingTop = Class.PaddingTop,
			})
		end,
	},
	{
		Properties = {"Callback"},
		Callback = function<StyleFunc>(Data, Object)
			local Class = Data.Class

			function Class:SetCallback(NewCallback)
				self.Callback = NewCallback
				return self
			end
			function Class:FireCallback(NewCallback)
				self.Callback(Object)
				return self
			end
		end,
	},
	{
		Properties = {"Value"},
		Callback = function<StyleFunc>(Data, Object)
			local Class = Data.Class
			ReGui:CheckConfig(Class, {
				GetValue = function(self)
					return Class.Value
				end,
			})
		end,
	}
}

type table = { 
	[any]: any 
}
type ObjectTable = { 
	[GuiObject]: any 
}
type TagsList = {
	[GuiObject]: string 
}

--// Compatibility 
local EmptyFunction = function() end
local GetHiddenUI = get_hidden_gui or gethui
local NewReference = cloneref or function(Ins): Instance 
	return Ins 
end

--// Service handlers
local Services = setmetatable({}, {
	__index = function(self, Name: string)
		local Service = game:GetService(Name)
		return NewReference(Service)
	end,
})

--// Core functions 
--// Services
local HttpService = game:GetService("HttpService")
local Players: Players = Services.Players
local CoreGui = Services.CoreGui
local UserInputService = Services.UserInputService
local TweenService = Services.TweenService
local RunService = Services.RunService

--// Local player
local LocalPlayer = Players.LocalPlayer
ReGui.PlayerGui = LocalPlayer.PlayerGui
ReGui.Mouse = LocalPlayer:GetMouse()

--// Animation class
local Animation = ReGui.Animation

type AnimationTween = {
	Object: Instance,
	NoAnimation: boolean?,
	Tweeninfo: TweenInfo?,
	EndProperties: {},
	Completed: (() -> any?)?
}
function Animation:Tween(Data: AnimationTween): Tween?
	local DefaultTweenInfo = self.DefaultTweenInfo

	--// Unpack animation data for the Tween
	local Object = Data.Object
	local NoAnimation = Data.NoAnimation
	local Tweeninfo = Data.Tweeninfo or DefaultTweenInfo
	local EndProperties = Data.EndProperties
	local StartProperties = Data.StartProperties
	local Completed = Data.Completed

	--// Apply Start Properties to the object
	if StartProperties then
		ReGui:SetProperties(Object, StartProperties)
	end

	--// Set properties without a tween for NoAnimation flag
	if NoAnimation then
		ReGui:SetProperties(Object, EndProperties)

		--// Invoke Completed event
		if Completed then
			Completed()
		end
		return
	end

	--// Create the tween animation
	local MasterTween = nil
	for Key, Value in next, EndProperties do
		local Properties = {
			[Key] = Value
		}

		--// Create the tween for the property
		local Success, Tween = pcall(function()
			return TweenService:Create(Object, Tweeninfo, Properties)
		end)

		--// Set Properties instead of tweening
		if not Success then
			ReGui:SetProperties(Object, Properties)
			continue
		end

		--// Set the MasterTween if it does not exist
		if not MasterTween then
			MasterTween = Tween
		end
		
		Tween:Play()
	end

	--// Connect the TweenCompleted event
	if Completed then
		if MasterTween then
			MasterTween.Completed:Connect(Completed)
		else
			Completed()
		end
	end

	return MasterTween
end

type Animate = {
	NoAnimation: boolean?,
	Objects: ObjectTable,
	Tweeninfo: TweenInfo?,
	Completed: () -> any,
}
function Animation:Animate(Data: Animate): Tween
	local NoAnimation = Data.NoAnimation
	local Objects = Data.Objects
	local Tweeninfo = Data.Tweeninfo
	local Completed = Data.Completed

	local BaseTween = nil

	--// Create tweens
	for Object, EndProperties in next, Objects do
		local Tween = self:Tween({
			NoAnimation = NoAnimation,
			Object = Object,
			Tweeninfo = Tweeninfo, 
			EndProperties = EndProperties
		})

		if not BaseTween then
			BaseTween = Tween
		end
	end

	--// Connect completed event call
	if Completed then
		BaseTween.Completed:Connect(Completed)
	end

	return BaseTween
end

type HeaderCollapseToggle = {
	Rotations: {
		Open: number?,
		Closed: number?
	},
	Toggle: GuiObject,
	NoAnimation: boolean?,
	Collapsed: boolean,
	Tweeninfo: TweenInfo?,
}
function Animation:HeaderCollapseToggle(Data: HeaderCollapseToggle)
	--// Check configuration
	ReGui:CheckConfig(Data, {
		Rotations = {
			Open = 90,
			Closed = 0
		}
	})

	--// Unpack configuration
	local Toggle = Data.Toggle
	local NoAnimation = Data.NoAnimation
	local Rotations = Data.Rotations
	local Collapsed = Data.Collapsed
	local Tweeninfo = Data.Tweeninfo

	local Rotation = Collapsed and Rotations.Closed or Rotations.Open

	--// Animate toggle
	self:Tween({
		Tweeninfo = Tweeninfo,
		NoAnimation = NoAnimation,
		Object = Toggle,
		EndProperties = {
			Rotation = Rotation,
		}
	})
end

type HeaderCollapse = {
	Collapsed: boolean,
	ClosedSize: UDim2,
	OpenSize: UDim2,
	Toggle: Instance,
	Resize: Instance?,
	Hide: Instance?,
	NoAnimation: boolean?,
	NoAutomaticSize: boolean?,
	IconOnly: boolean?,
	Completed: (() -> any)?,
	IconRotations: {
		Open: number?,
		Closed: number?
	}
}
function Animation:HeaderCollapse(Data: HeaderCollapse): Tween
	--// Unpack config
	local Tweeninfo = Data.Tweeninfo
	local Collapsed = Data.Collapsed
	local ClosedSize = Data.ClosedSize
	local OpenSize: UDim2 = Data.OpenSize
	local Toggle = Data.Toggle
	local Resize = Data.Resize
	local Hide = Data.Hide
	local NoAnimation = Data.NoAnimation
	local NoAutomaticSize = Data.NoAutomaticSize
	local Rotations = Data.IconRotations
	local Completed = Data.Completed

	--// Apply base properties
	if not NoAutomaticSize then
		Resize.AutomaticSize = Enum.AutomaticSize.None
	end
	if not Collapsed then
		Hide.Visible = true
	end

	--// Build and play animation keyframes
	self:HeaderCollapseToggle({
		Tweeninfo = Tweeninfo,
		Collapsed = Collapsed,
		NoAnimation = NoAnimation,
		Toggle = Toggle,
		Rotations = Rotations
	})

	local Tween = self:Tween({
		Tweeninfo = Tweeninfo,
		NoAnimation = NoAnimation,
		Object = Resize,
		StartProperties = {
			Size = Collapsed and OpenSize or ClosedSize
		},
		EndProperties = {
			Size = Collapsed and ClosedSize or OpenSize
		},
		Completed = function()
			Hide.Visible = not Collapsed

			--// Invoke completed callback function
			if Completed then 
				Completed() 
			end

			--// Reset AutomaticSize after animation
			if Collapsed then return end
			if NoAutomaticSize then return end

			--// Reset sizes of the object
			Resize.Size = UDim2.fromScale(1, 0)
			Resize.AutomaticSize = Enum.AutomaticSize.Y
		end,
	})

	return Tween
end

--// Signal service
type SignalClass = {
	Connections: {
		[number]: (...any) -> nil	
	},
	Fire: (SignalClass, ...any) -> nil,
	GetConnections: (SignalClass) -> table,
	Connect: (SignalClass, (...any) -> nil) -> table,
	DisconnectConnections: (SignalClass) -> nil,
}

local Signaling = ReGui.Signaling

local Signal: SignalClass = {}
Signal.__index = Signal

function Signal:Fire(...)
	local Connections = self:GetConnections()
	if #Connections <= 0 then return end
	
	for _, Connection in next, Connections do
		Connection(...)
	end
end
function Signal:GetConnections(): table
	local Connections = self.Connections
	return Connections
end
function Signal:Connect(Func: (...any) -> nil)
	local Connections = self:GetConnections()
	table.insert(Connections, Func)
end
function Signal:DisconnectConnections()
	local Connections = self:GetConnections()
	table.clear(Connections)
end

function Signaling:NewSignal(): SignalClass
	return NewClass(Signal, {
		Connections = {}
	})
end

function GetAndRemove(Key: string, Dict: table)
	local Value = Dict[Key]
	if Value then
		Dict[Key] = nil
	end
	return Value
end

function MoveTableItem(Table: table, Item, NewPosition: number)
	local Index = table.find(Table, Item)
	if not Index then return end

	local Value = table.remove(Table, Index)
	table.insert(Table, NewPosition, Value)
end

function Merge(Base, New)
	for Key, Value in next, New do
		Base[Key] = Value
	end
end

function Copy(Original: table, Insert: table?)
	local Table = table.clone(Original)

	--// Merge Insert values
	if Insert then
		Merge(Table, Insert)
	end

	return Table
end

local function GetMatchPercentage(Value, Query: string): number
	Value = tostring(Value):lower()
	Query = Query:lower()

	local Letters = Value:split("")
	local LetterCount = #Query
	local MatchedCount = 0

	for Index, Letter in Letters do
		local Match = Query:sub(Index, Index)

		--// Compare letters
		if Letter == Match then
			MatchedCount += 1
		end
	end

	local Percentage = (MatchedCount/LetterCount) * 100
	return math.round(Percentage)
end

local function SortByQuery(Table: table, Query: string): table
	local IsArray = Table[1]
	local Sorted = {}

	for A, B in Table do
		local Value = IsArray and B or A
		local Percentage = GetMatchPercentage(Value, Query)
		local Position = 100 - Percentage

		table.insert(Sorted, Position, Value)
	end

	return Sorted
end

function NewClass(Class, Merge)
	Merge = Merge or {}
	Class.__index = Class
	return setmetatable(Merge, Class)
end

function ReGui:Warn(...: string?)
	warn("[ReGui]::", ...)
end

function ReGui:Error(...: string?)
	local Concated = ReGui:Concat({...}, " ")
	local Message = `\n[ReGui]:: {Concated}`
	coroutine.wrap(error)(Message)
end

function ReGui:IsDoubleClick(TickRange: number): boolean
	local ClickThreshold = self.DoubleClickThreshold
	return TickRange < ClickThreshold
end

function ReGui:Init(Overwrites)
	Overwrites = Overwrites or {}

	--// Check if the library has already initalised
	if self.Initialised then return end

	--// Merge overwrites
	Merge(self, Overwrites)
	Merge(self, {
		Initialised = true,
		HasGamepad = self:IsConsoleDevice(),
		HasTouchScreen = self:IsMobileDevice(),
	})

	--// Fetch folders
	self:CheckConfig(self, {
		ContainerParent = function()
			return self:ResolveUIParent()
		end,
		Prefabs = function()
			return self:LoadPrefabs()
		end,
	}, true)

	--// Fetch required assets
	self:CheckConfig(self, {
		Container = function()
			return self:InsertPrefab("Container", {
				Parent = self.ContainerParent,
				Name = self.ContainerName
			})
		end,
	}, true)

	--// Input events
	local Container = self.Container
	local TooltipOffset = self.TooltipOffset
	local ActiveTooltips = self.ActiveTooltips
	local Overlays = Container.Overlays
	local LastClick = 0


	ReGui:SetProperties(Container.Windows, {
		OnTopOfCoreBlur = true
	})
	ReGui:SetProperties(Overlays, {
		OnTopOfCoreBlur = true
	})

	--// Create tooltips container
	self.TooltipsContainer = ReGui.Elements:Overlay({
		Parent = Overlays
	})

	--// Key press
	UserInputService.InputBegan:Connect(function(Input: InputObject)
		if not self:IsMouseEvent(Input, true) then return end

		local ClickTick = tick()
		local ClickRange = ClickTick - LastClick
		local IsDoubleClick = self:IsDoubleClick(ClickRange)
		
		--// DoubleClick
		LastClick = IsDoubleClick and 0 or ClickTick

		--// WindowActiveStates
		self:UpdateWindowFocuses()
	end)

	local function InputUpdate()
		local Tooltips = self.TooltipsContainer
		local Visible = #ActiveTooltips > 0
		Tooltips.Visible = Visible
		
		if not Visible then return end

		--// Set frame position to mosue location
		local X, Y = ReGui:GetMouseLocation()
		local Position = Overlays.AbsolutePosition

		Tooltips.Position = UDim2.fromOffset(
			X - Position.X + TooltipOffset, 
			Y - Position.Y + TooltipOffset
		)
	end

	--// Bind events
	RunService:BindToRenderStep("ReGui_InputUpdate", Enum.RenderPriority.Input.Value, InputUpdate)
end

function ReGui:GetVersion(): string
	return self.Version
end

function ReGui:IsMobileDevice(): boolean
	return UserInputService.TouchEnabled
end

function ReGui:IsConsoleDevice(): boolean
	return UserInputService.GamepadEnabled
end

function ReGui:GetScreenSize(): Vector2
	return workspace.CurrentCamera.ViewportSize
end

function ReGui:LoadPrefabs(): Folder?
	local PlayerGui = self.PlayerGui
	local Name = "ReGui-Prefabs"

	--// Check script for prefabs
	local ScriptUi = script:WaitForChild(Name, 2)
	if ScriptUi then return ScriptUi end

	--// Check PlayerGui for prefabs (Studio Debug)
	local PlayerUI = PlayerGui:WaitForChild(Name, 2)
	if PlayerUI then return PlayerUI end

	return nil
end

function ReGui:ResolveUIParent(): GuiObject?
	local PlayerGui = self.PlayerGui
	local Debug = self.Debug

	local Steps = {
		[1] = function()
			local Parent = GetHiddenUI()
			if Parent.Parent == CoreGui then return end
			
			return Parent
		end,
		[2] = function()
			return CoreGui
		end,
		[3] = function()
			return PlayerGui
		end
	}

	local Test = self:CreateInstance("ScreenGui")

	--// Test each step for a successful parent
	for Step, Func in next, Steps do
		--// Test fetching the parent
		local Success, Parent = pcall(Func)
		if not Success or not Parent then continue end

		--// Test parenting
		local CanParent = pcall(function()
			Test.Parent = Parent
		end)
		if not CanParent then continue end

		if Debug then
			self:Warn(`Step: {Step} was chosen as the parent!: {Parent}`)
		end

		return Parent
	end

	--// Error message
	self:Warn("The ReGui container does not have a parent defined")

	return nil
end

function ReGui:CheckConfig(Source: table, Base: table, Call: boolean?, IgnoreKeys: table?)
	if not Source then return end 

	for Key: string?, Value in next, Base do
		if Source[Key] ~= nil then continue end
		
		--// Check the key should be ignored
		if IgnoreKeys then
			if table.find(IgnoreKeys, Key) then continue end
		end

		--// Call value function
		if Call then
			Value = Value()
		end

		--// Set value
		Source[Key] = Value
	end

	return Source
end

function ReGui:CheckAssetUrl(Url: (string|number)): string
	--// Convert Id number to asset URL
	if tonumber(Url) then
		return `rbxassetid://{Url}`
	end
	return Url
end

function ReGui:CreateInstance(Class, Parent, Properties): Instance
	local Object = Instance.new(Class, Parent)

	--// Apply Properties
	if Properties then
		local UseProps = Properties.UsePropertiesList

		if not UseProps then
			self:SetProperties(Object, Properties)
		else
			self:ApplyFlags({
				Object = Object,
				Class = Properties
			})
		end
	end

	return Object
end

function ReGui:ConnectMouseEvent(Object: GuiObject, Config)
	local Callback = Config.Callback
	local DoubleClick = Config.DoubleClick
	local OnlyMouseHovering = Config.OnlyMouseHovering

	local LastClick = 0
	local HoverSignal = nil

	if OnlyMouseHovering then
		HoverSignal = self:DetectHover(OnlyMouseHovering)
	end

	Object.Activated:Connect(function(...)
		local ClickTick = tick()
		local ClickRange = ClickTick-LastClick

		--// OnlyMouseHovering
		if HoverSignal and not HoverSignal.Hovering then return end

		--// DoubleClick
		if DoubleClick then
			if not ReGui:IsDoubleClick(ClickRange) then
				LastClick = ClickTick
				return
			end
			LastClick = 0
		end

		Callback(...)
	end)
end

function ReGui:GetAnimation(Animate: boolean?)
	return Animate and self.Animation or TweenInfo.new(0)
end

function ReGui:DynamicImageTag(Object: Instance, Image: string, WindowClass: table)
	local Tags = self.DynamicImages
	local Tag = Tags[Image]
	
	if not Tag then return end
	if not WindowClass then return end
	
	WindowClass:TagElements({
		[Object] = Tag
	})
end

function ReGui:GetDictSize(Dict: table): number
	local Count = 0
	for Key, Value in Dict do
		Count += 1
	end
	return Count
end

function ReGui:RemoveAnimations(Object: GuiObject)
	local Data = self:GetAnimationData(Object)
	local Connections = Data.Connections

	--// Disconnect each connection 
	for _, Connection in next, Connections do
		Connection:Disconnect()
	end
end

function ReGui:GetAnimationData(Object: GuiObject): table
	local Connections = self.AnimationConnections
	local Existing = Connections[Object]
	
	--// Check for existing
	if Existing then return Existing end
	
	local Data = {
		Connections = {}
	}
	
	Connections[Object] = Data
	return Data
end

function ReGui:AddAnimationSignal(Object: GuiObject, Connection: RBXScriptSignal)
	local Data = self:GetAnimationData(Object)
	local Connections = Data.Connections

	table.insert(Connections, Connection)
end

function ReGui:SetAnimationsEnabled(Enabled: boolean)
	self.NoAnimations = not Enabled
end

function ReGui:SetAnimation(Object: GuiObject, Reference: (string|table), Listener: GuiObject?)
	Listener = Listener or Object

	local Animations = self.Animations
	
	--// Get animation properties
	local Data = Reference 
	if typeof(Reference) ~= "table" then
		Data = Animations[Reference]
	end

	assert(Data, `No animation data for Class {Reference}!`)

	--// Disconnect previous
	self:RemoveAnimations(Listener)
	
	--// Unpack data
	local Init = Data.Init
	local Connections = Data.Connections
	local Tweeninfo = Data.Tweeninfo
	local NoAnimation = Data.NoAnimation
	
	--// Get animation data
	local StateData = self:GetAnimationData(Object)
	local State = StateData.State

	--// Connect signals
	local InitFunc = nil
	local AnimationEnabled = true
	local CurrentSignal = nil
	local Signals = {}

	--// Interface for the animation
	local Module = {}
	function Module:Reset(NoAnimation: boolean?)
		if not InitFunc then return end
		InitFunc(NoAnimation)
	end
	function Module:FireSignal(SignalName: string, NoAnimation: boolean?)
		Signals[SignalName](NoAnimation)
	end
	function Module:Refresh(NoAnimation: boolean?)
		if not CurrentSignal then return end
		Signals[CurrentSignal](NoAnimation)
	end
	function Module:SetEnabled(Enabled: boolean)
		AnimationEnabled = Enabled
	end

	for SignalName: string, Properties in next, Connections do
		local function OnSignal(NoAnim: boolean?)
			NoAnim = NoAnim == true --// Convert to boolean
			CurrentSignal = SignalName
			
			--// Check if animations are enabled
			local NoAnimations = self.NoAnimations
			if NoAnimations then return end

			--// Check if the animation is enabled
			if not AnimationEnabled then return end
			
			StateData.State = SignalName
			
			Animation:Tween({
				NoAnimation = NoAnim or NoAnimation,
				Object = Object,
				Tweeninfo = Tweeninfo, 
				EndProperties = Properties
			})
		end

		--// Connect animation to signal
		local Signal = Listener[SignalName]
		local Connection = Signal:Connect(OnSignal)

		--// Collect signal into array
		self:AddAnimationSignal(Listener, Connection)

		Signals[SignalName] = OnSignal

		--// Call init connection
		if SignalName == Init then
			InitFunc = OnSignal
		end
	end

	if State then
		--// Update the animation to the previous state, e.g MouseHover
		Module:FireSignal(State)
	else
		--// Update the animation state to default
		Module:Reset(true)
	end

	return Module
end

function ReGui:GetChildOfClass(Object: GuiObject, ClassName: string): GuiObject
	local Child = Object:FindFirstChildOfClass(ClassName)

	--// Create missing child
	if not Child then
		Child = self:CreateInstance(ClassName, Object)
	end

	return Child
end

function ReGui:SetPadding(UiPadding: UIPadding, Padding: UDim)
	if not UiPadding then return end
	
	self:SetProperties(UiPadding, {
		PaddingBottom = Padding,
		PaddingLeft = Padding,
		PaddingRight = Padding,
		PaddingTop = Padding
	})
end

export type ConnectDrag = {
	DragStart: () -> nil,
	DragEnd: () -> nil,
	DragMovement: () -> nil,
}
function ReGui:ConnectDrag(Frame: GuiObject, Data)
	self:CheckConfig(Data, {
		DragStart = EmptyFunction,
		DragEnd = EmptyFunction,
		DragMovement = EmptyFunction,
		OnDragStateChange = EmptyFunction,
	})

	--// Unpack Configuration
	local DragStart = Data.DragStart
	local DragEnd = Data.DragEnd
	local DragMovement = Data.DragMovement
	local OnDragStateChange = Data.OnDragStateChange

	--// Whitelist
	local UserInputTypes = {
		StartAndEnd = {
			Enum.UserInputType.MouseButton1,
			Enum.UserInputType.Touch
		},
		Movement = {
			Enum.UserInputType.MouseMovement,
			Enum.UserInputType.Touch
		}
	}

	local IsDragging = false

	local function InputTypeAllowed(Key, Type: string)
		local InputType = Key.UserInputType
		return table.find(UserInputTypes[Type], InputType)
	end
	local function KeyToVector(Key): Vector2
		local InputPosition = Key.Position
		return Vector2.new(InputPosition.X, InputPosition.Y)
	end
	local function SetIsDragging(DraggingState: boolean)
		--// Globally disable drag on other objects
		self._DraggingDisabled = DraggingState
		
		IsDragging = DraggingState
		OnDragStateChange(DraggingState)
	end
	local function MakeSignal(Data)
		local IsDraggingState = Data.IsDragging
		local InputType = Data.InputType
		local Callback = Data.Callback

		return function(Key)
			if Data.DraggingRequired ~= IsDragging then return end
			if Data.CheckDraggingDisabled and self._DraggingDisabled then return end
			if not InputTypeAllowed(Key, InputType) then return end

			--// Update drag state
			if Data.UpdateState then
				SetIsDragging(IsDraggingState)
			end

			local InputVector = KeyToVector(Key)
			Callback(InputVector)
		end
	end

	--// Connect movement events
	Frame.InputBegan:Connect(MakeSignal({
		CheckDraggingDisabled = true,
		DraggingRequired = false,
		UpdateState = true,
		IsDragging = true,
		InputType = "StartAndEnd",
		Callback = DragStart,
	}))
	UserInputService.InputEnded:Connect(MakeSignal({
		DraggingRequired = true,
		UpdateState = true,
		IsDragging = false,
		InputType = "StartAndEnd",
		Callback = DragEnd,
	}))
	UserInputService.InputChanged:Connect(MakeSignal({
		DraggingRequired = true,
		InputType = "Movement",
		Callback = DragMovement,
	}))
end

type MakeDraggableFlags = {
	Move: Instance,
	Grab: Instance,
	Enabled: boolean?,
	OnUpdate: ((Vector2) -> ...any)?,
	DragBegin: ((InputObject) -> ...any)?,
	StateChanged: ((MakeDraggableFlags) -> any)?
}
function ReGui:MakeDraggable(Config: MakeDraggableFlags)
	--// Unpack config
	local Move = Config.Move
	local Grab = Config.Grab
	local OnDragStateChange = Config.OnDragStateChange

	local PositionOrgin = nil
	local InputOrgin = nil

	--// Interface
	local Interface = {}
	function Interface:SetEnabled(State: boolean)
		local StateChanged = Config.StateChanged
		self.Enabled = State
		--DragDetector.Enabled = State

		--// Invoke the state changed callback function
		if StateChanged then 
			StateChanged(self)
		end
	end
	function Interface:CanDrag(Key): boolean
		return self.Enabled
	end

	--// Movement event functions
	local function DragStart(InputVector)
		if not Interface:CanDrag() then return end
		local DragBegin = Config.DragBegin

		InputOrgin = InputVector
		DragBegin(InputOrgin)
	end

	local function DragMovement(InputVector)
		if not Interface:CanDrag() then return end

		local Delta = InputVector - InputOrgin
		local OnUpdate = Config.OnUpdate

		OnUpdate(Delta)
	end

	--// Movement functions
	local function PositionBegan(Key)
		PositionOrgin = Move.Position
	end
	local function UpdatePosition(Delta: number)
		local Position = UDim2.new(
			PositionOrgin.X.Scale, 
			PositionOrgin.X.Offset + Delta.X, 
			PositionOrgin.Y.Scale, 
			PositionOrgin.Y.Offset + Delta.Y
		)
		Config:SetPosition(Position)
	end
	local function SetPosition(self, Position: UDim2)
		--// Tween frame element to the new size
		Animation:Tween({
			Object = Move,
			EndProperties = {
				Position = Position
			}
		})
	end

	--// Check configuration
	self:CheckConfig(Config, {
		Enabled = true,
		OnUpdate = UpdatePosition,
		SetPosition = SetPosition,
		DragBegin = PositionBegan
	})

	--// Connect movement events
	self:ConnectDrag(Grab, {
		DragStart = DragStart,
		DragMovement = DragMovement,
		OnDragStateChange = OnDragStateChange
	})

	--// Set enabled state
	local Enabled = Config.Enabled
	Interface:SetEnabled(Enabled)

	return Interface
end

export type MakeResizableFlags = {
	MinimumSize: Vector2,
	MaximumSize: Vector2?,
	--Grab: Instance,
	Resize: Instance,
	OnUpdate: (UDim2) -> ...any
}
function ReGui:MakeResizable(Config: MakeResizableFlags)
	ReGui:CheckConfig(Config, {
		MinimumSize = Vector2.new(160, 90),
		MaximumSize = Vector2.new(math.huge, math.huge)
	})

	--// Unpack config
	local MaximumSize = Config.MaximumSize
	local MinimumSize = Config.MinimumSize
	local Resize = Config.Resize
	local OnUpdate = Config.OnUpdate

	local SizeOrgin = nil

	--// Create grab element
	local Grab = ReGui:InsertPrefab("ResizeGrab", {
		Parent = Resize
	})

	local function StateChanged(Interface)
		Grab.Visible = Interface.Enabled
	end

	--// Resize functions
	local function UpdateSize(Delta)
		local NewSize = SizeOrgin + Delta

		--// Clamp size
		local Size = UDim2.fromOffset(
			math.clamp(NewSize.X, MinimumSize.X, MaximumSize.X), 
			math.clamp(NewSize.Y, MinimumSize.Y, MaximumSize.Y)
		)

		--// Call update function instead of tweening
		if OnUpdate then
			OnUpdate(Size)
			return
		end

		--// Tween frame element to the new size
		Animation:Tween({
			Object = Resize,
			EndProperties = {
				Size = Size
			}
		})
	end
	local function ResizeBegin(InputPosition)
		SizeOrgin = Resize.AbsoluteSize
	end

	--// Connect movement events
	local DragDetection = self:MakeDraggable({
		Grab = Grab,
		OnUpdate = UpdateSize,
		DragBegin = ResizeBegin,
		StateChanged = StateChanged
	})

	DragDetection.Grab = Grab

	return DragDetection
end

function ReGui:IsMouseEvent(Input: InputObject, IgnoreMovement: boolean)
	local Name = Input.UserInputType.Name

	--// IgnoreMovement 
	if IgnoreMovement and Name:find("Movement") then return end

	return Name:find("Touch") or Name:find("Mouse")
end

export type DetectHover = {
	OnInput: ((boolean, InputObject?) -> ...any?)?,
	Anykey: boolean?,
	MouseMove: boolean?,
	MouseOnly: boolean?,
	MouseEnter: boolean?,
	Hovering: boolean?,
}
function ReGui:DetectHover(Object: GuiObject, Config: DetectHover)
	Config = Config or {}

	--// Unpack configuration
	local OnInput = Config.OnInput
	local OnHoverChange = Config.OnHoverChange
	local Anykey = Config.Anykey
	local MouseMove = Config.MouseMove
	local MouseEnter = Config.MouseEnter
	local MouseOnly = Config.MouseOnly

	Config.Hovering = false

	local function Update(Input, IsHovering: boolean?, IsMouseEvent: boolean?)
		--// Check if the input is mouse or touch
		if Input and MouseOnly then
			if not ReGui:IsMouseEvent(Input, true) then return end
		end

		--// Set new IsHovering state
		if IsHovering ~= nil then
			local Previous = Config.Hovering
			Config.Hovering = IsHovering

			--// Invoke OnHoverChange
			if IsHovering ~= Previous and OnHoverChange then
				OnHoverChange(IsHovering)
			end
		end

		--// Mouse Enter events
		if not MouseEnter and IsMouseEvent then return end

		--// Call OnInput function
		if OnInput then
			local Value = Config.Hovering
			return OnInput(Value, Input)
		end
	end

	--// Connect Events
	local Connections = {
		Object.MouseEnter:Connect(function()
			Update(nil, true, true)
		end),
		Object.MouseLeave:Connect(function()
			Update(nil, false, true)
		end)
	}

	--// Update on keyboard events or Mouse eveents
	if Anykey or MouseOnly then
		table.insert(Connections, UserInputService.InputBegan:Connect(function(Input)
			Update(Input)
		end))
	end

	--// Update on mouse move
	if MouseMove then
		local Connection = Object.MouseMoved:Connect(function()
			Update()
		end)
		table.insert(Connections, Connection)
	end

	function Config:Disconnect()
		for _, Connection in next, Connections do
			Connection:Disconnect()
		end
	end

	return Config
end

function ReGui:StackWindows()
	local Windows = self.Windows
	local Offset = 20

	for Index, Class in next, Windows do
		local Window = Class.WindowFrame

		local Position = UDim2.fromOffset(Offset*Index, Offset*Index)

		Class:Center()
		Window.Position += Position
	end
end

function ReGui:GetElementFlags(Object: GuiObject): table?
	local Cache = self._FlagCache
	return Cache[Object]
end

type UpdateColors = {
	Object: GuiObject,
	Tag: (string|table),
	NoAnimation: boolean?,
	Theme: string?,
	TagsList: TagsList?,
	Tweeninfo: TweenInfo?
}
function ReGui:UpdateColors(Config: UpdateColors)
	--// Unpack config
	local Object = Config.Object
	local Tag = Config.Tag
	local NoAnimation = Config.NoAnimation
	local Elements = Config.TagsList
	local Theme = Config.Theme
	local Tweeninfo = Config.Tweeninfo
	
	--// Unpack global configuration
	local ElementColors = self.ElementColors
	local Themes = self.ThemeConfigs
	local Debug = self.Debug
	local Flags = self:GetElementFlags(Object)
	
	local Coloring = ElementColors[Tag]
	
	--// Resolve string into color data
	if typeof(Coloring) == "string" then
		Coloring = ElementColors[Coloring]
	end

	if typeof(Tag) == "table" then
		Coloring = Tag
	elseif Elements then
		Elements[Object] = Tag --// Update the element's tag in the dict
	end

	--// Check if coloring data exists
	if not Coloring then return end

	--// Add coloring data to properties
	local Properties = {}
	for Key: string, Name: string in next, Coloring do
		local Color = self:GetThemeKey(Theme, Name)

		--// Ignore if flags has a overwrite
		if Flags and Flags[Key] then 
			continue 
		end

		--// Color not found debug
		if not Color then 
			if Debug then
				self:Warn(`Color: '{Name}' does not exist!`)
			end
			continue
		end

		Properties[Key] = Color
	end

	--// Tween new properties
	Animation:Tween({
		Tweeninfo = Tweeninfo,
		Object = Object,
		NoAnimation = NoAnimation,
		EndProperties = Properties
	})
end

export type MultiUpdateColorsConfig = {
	Objects: ObjectsTable,
	TagsList: TagsList?,
	Theme: string?,
	Animate: boolean?,
	Tweeninfo: TweenInfo?
}
function ReGui:MultiUpdateColors(Config: MultiUpdateColorsConfig)
	local Objects = Config.Objects

	for Object: GuiObject, Tag: string? in next, Objects do
		self:UpdateColors({
			TagsList = Config.TagsList,
			Theme = Config.Theme,
			NoAnimation = not Config.Animate,
			Tweeninfo = Config.Tweeninfo,

			Object = Object,
			Tag = Tag,
		})
	end
end

function ReGui:ApplyStyle(Object: GuiObject, StyleName: string)
	local Styles = self.Styles

	local Style = Styles[StyleName]
	if not Style then return end

	--// Apply style properties
	self:ApplyFlags({
		Object = Object,
		Class = Style
	})
end

function ReGui:MergeMetatables(Class, Object: GuiObject)
	local Debug = self.Debug
	local Metadata = {}

	Metadata.__index = function(_, Key: string)
		--// Fetch value from class
		local Value = Class[Key]
		if Value ~= nil then return Value end

		--// Fetch value from Object
		local Success, Value = pcall(function()
			local Value = Object[Key]
			return self:PatchSelf(Object, Value)  
		end)
		
		return Success and Value or nil
	end

	Metadata.__newindex = function(_, Key: string, Value)
		local IsClassValue = Class[Key] ~= nil or typeof(Value) == "function"

		if IsClassValue then
			Class[Key] = Value
			return
		end

		xpcall(function()
			Object[Key] = Value
		end, function(err)
			if Debug then
				self:Warn(`Newindex Error: {Object}.{Key} = {Value}\n{err}`)
			end

			Class[Key] = Value
		end)
	end

	return setmetatable({}, Metadata)
end

function ReGui:Concat(Table, Separator: " ") 
	local Concatenated = ""
	for Index, String in next, Table do
		Concatenated ..= tostring(String) .. (Index ~= #Table and Separator or "")
	end
	return Concatenated
end

function ReGui:GetValueFromAliases(Aliases, Table)
	for _, Alias: string in Aliases do
		local Value = Table[Alias]
		if Value ~= nil then
			return Value
		end
	end

	return nil
end

function ReGui:RecursiveCall(Object: GuiObject, Func: (GuiObject)->...any)
	for _, Child in next, Object:GetDescendants() do
		Func(Child)
	end
end

export type ApplyFlags = {
	Object: Instance,
	Class: table,
	WindowClass: table?
}
function ReGui:ApplyFlags(Config: ApplyFlags)
	local Properties = self.ElementFlags

	--// Unpack config
	local Object = Config.Object
	local Class = Config.Class
	local WindowClass = Config.WindowClass

	function Config:GetThemeKey(Tag: string)
		if WindowClass then
			return WindowClass:GetThemeKey(Tag)
		else
			return ReGui:GetThemeKey(nil, Tag)
		end
	end

	--// Set base properties
	self:SetProperties(Object, Class)

	--// Check for callbacks
	for _, Flag in next, Properties do
		local Aliases = Flag.Properties
		local Callback = Flag.Callback
		local Recursive = Flag.Recursive
		local WindowFlags = Flag.WindowProperties

		--// Find value from element class
		local Value = self:GetValueFromAliases(Aliases, Class)

		--// Find value from window class
		if WindowClass and WindowFlags and Value == nil then
			Value = self:GetValueFromAliases(WindowFlags, WindowClass)
		end

		if Value == nil then continue end

		--// Apply flag
		Callback(Config, Object, Value)

		--// Recursively apply flag
		if Recursive then
			self:RecursiveCall(Object, function(Child)
				Callback(Config, Child, Value)
			end)
		end
	end
end

function ReGui:SetProperties(Object: Instance, Properties: table)
	for Key: string, Value in next, Properties do
		pcall(function()
			Object[Key] = Value
		end)
	end
end

function ReGui:InsertPrefab(Name: string, Properties): GuiObject
	local Folder = self.Prefabs
	local Prefabs = Folder.Prefabs

	local Prefab = Prefabs:WaitForChild(Name)
	local Object = Prefab:Clone()

	--// Apply properties
	if Properties then 
		local UseProps = Properties.UsePropertiesList

		if not UseProps then
			self:SetProperties(Object, Properties)
		else
			self:ApplyFlags({
				Object = Object,
				Class = Properties
			})
		end
	end

	return Object
end

function ReGui:GetContentSize(Object: GuiObject, IngoreUIList: boolean?): Vector2
	local UIListLayout = Object:FindFirstChildOfClass("UIListLayout")
	local UIPadding = Object:FindFirstChildOfClass("UIPadding")
	local UIStroke = Object:FindFirstChildOfClass("UIStroke")

	local ContentSize: Vector2

	--// Fetch absolute size
	if UIListLayout and not IngoreUIList then
		ContentSize = UIListLayout.AbsoluteContentSize
	else
		ContentSize = Object.AbsoluteSize
	end

	--// Apply padding
	if UIPadding then
		local Top = UIPadding.PaddingTop.Offset
		local Bottom = UIPadding.PaddingBottom.Offset
		local Left = UIPadding.PaddingLeft.Offset
		local Right = UIPadding.PaddingRight.Offset

		ContentSize += Vector2.new(Left+Right, Top+Bottom)
	end

	if UIStroke then
		local Thickness = UIStroke.Thickness
		ContentSize += Vector2.new(Thickness/2, Thickness/2)
	end

	return ContentSize
end

function ReGui:PatchSelf(Self, Func)
	--// Check if the passed value is a function
	if typeof(Func) ~= "function" then 
		return Func
	end

	return function(_, ...)
		return Func(Self, ...)
	end
end

type MakeCanvas = {
	Element: Instance,
	WindowClass: WindowClass?,
	Class: {}?
}
function ReGui:MakeCanvas(Config: MakeCanvas)
	--// Unpack ReGui data
	local ElementsClass = self.Elements
	local Debug = self.Debug
	local Signaling = self.Signaling

	--// Unpack configuration
	local Element = Config.Element
	local WindowClass = Config.WindowClass
	local Class = Config.Class
	local OnChildChange = Config.OnChildChange
	
	local ChildChangeSignal = Signaling:NewSignal()
	
	--// Connect OnChildChange argument
	if OnChildChange then
		ChildChangeSignal:Connect(OnChildChange)
	end

	--// Debug report
	if not WindowClass and Debug then
		self:Warn(`No WindowClass for {Element}`)
		self:Warn(Config)
	end

	--// Create new canvas class
	local Canvas = NewClass(ElementsClass, {
		Class = Class,
		RawObject = Element,
		WindowClass = WindowClass or false,
		OnChildChange = ChildChangeSignal,
		Elements = {}
	})

	--// Create metatable merge
	local Meta = {
		__index = function(_, Key: string)
			--// Check Canvas class for value
			local CanvasValue = Canvas[Key]
			if CanvasValue ~= nil then 
				return self:PatchSelf(Canvas, CanvasValue)  
			end

			--// Check class for value
			local ClassValue = Class[Key]
			if ClassValue ~= nil then 
				return self:PatchSelf(Class, ClassValue)  
			end

			--// Fetch value from Element
			local ElementValue = Element[Key]
			return self:PatchSelf(Element, ElementValue)  
		end,
		__newindex = function(self, Key: string, Value)
			local IsClassValue = Class[Key] ~= nil

			--// Update key value
			if IsClassValue then
				Class[Key] = Value
			else
				Element[Key] = Value
			end
		end,
	}

	return setmetatable({}, Meta)
end

--// Ini service
function ReGui:GetIniData(Class): table
	local IniToSave = self.IniToSave
	local Ini = {}
	
	for _, Name in next, IniToSave do
		Ini[Name] = Class[Name]
	end
	
	return Ini
end

function ReGui:DumpIni(JsonEncode: boolean?): table
	local IniSettings = self.IniSettings
	local Parsed = {}
	
	for Flag, Element in next, IniSettings do
		Parsed[Flag] = self:GetIniData(Element)
	end
	
	--// Parse into Json string
	if JsonEncode then
		return HttpService:JSONEncode(Parsed)
	end
	
	return Parsed
end

function ReGui:LoadIniIntoElement(Element, Values: table)
	local ValueFunctions = {
		["Value"] = function(Value)
			Element:SetValue(Value)
		end,
	}
	
	for Name, Value in next, Values do
		--// Check if setting the value requires a function call
		local SetValue = ValueFunctions[Name]
		if SetValue then
			SetValue(Value)
			continue
		end
		
		Element[Name] = Value
	end
end

function ReGui:LoadIni(NewSettings: (table|string), JsonEncoded: boolean?)
	local IniSettings = self.IniSettings
	assert(NewSettings, "No Ini configuration was passed")
	
	--// Decode Json into a dict table
	if JsonEncoded then
		NewSettings = HttpService:JSONDecode(NewSettings)
	end
	
	for Flag, Values in next, NewSettings do
		local Element = IniSettings[Flag]
		self:LoadIniIntoElement(Element, Values)
	end
end

function ReGui:AddIniFlag(Flag: string, Element: table)
	local IniSettings = self.IniSettings
	IniSettings[Flag] = Element
end

type OnElementCreateData = {
	Flags: table,
	Object: GuiObject,
	Canvas: table
}
function ReGui:OnElementCreate(Data: OnElementCreateData)
	local FlagCache = self._FlagCache
	
	local Flags = Data.Flags
	local Object = Data.Object
	local Canvas = Data.Canvas
	local Class = Data.Class

	local WindowClass = Canvas.WindowClass

	local NoAutoTag = Flags.NoAutoTag
	local NoAutoFlags = Flags.NoAutoFlags
	local ColorTag = Flags.ColorTag
	local NoStyle = Flags.NoStyle
	local IniFlag = Flags.IniFlag
	
	--// Cache element flags
	FlagCache[Object] = Flags
	
	--// Registor element into IniSettings
	if IniFlag then
		self:AddIniFlag(IniFlag, Class)
	end
	
	--// NoStyle
	if NoStyle then return end

	--// Registor element into WindowClass
	if not NoAutoTag and WindowClass then
		WindowClass:TagElements({
			[Object] = ColorTag
		})
	end

	--// Apply style functions to the element
	if WindowClass then
		WindowClass:LoadStylesIntoElement(Data)
	end

	if not NoAutoFlags then
		--// Apply flags to the element
		self:ApplyFlags({
			Object = Object,
			Class = Flags,
			WindowClass = WindowClass
		})
	end
end

function ReGui:WrapGeneration(Function, Data: table)
	local ErrorCache = self._ErrorCache
	
	local Base = Data.Base
	local IgnoreDefaults = Data.IgnoreDefaults
	
	return function(Canvas, Flags, ...)
		Flags = Flags or {}

		--// Check Flags with Base flags from the Element
		self:CheckConfig(Flags, Base)

		--// Get generation flags
		local CloneTable = Flags.CloneTable

		--// Clone configuration table flag
		if CloneTable then
			Flags = table.clone(Flags)
		end
		
		local Parent = Canvas.RawObject
		local Elements = Canvas.Elements
		local OnChildChange = Canvas.OnChildChange

		--// Check flags again as the element generation may have modified
		self:CheckConfig(Flags, {
			Parent = Parent,
			Name = Flags.ColorTag
		}, nil, IgnoreDefaults)

		--// Convert self from 'ReGui' to 'Elements'
		if Canvas == self then
			Canvas = self.Elements
		end

		--// Create element and apply properties
		--local Class, Element = Function(Canvas, Flags, ...)
		local Success, Class, Element = pcall(Function, Canvas, Flags, ...)

		--// Check for errors
		if Success == false then
			if Parent then
				if ErrorCache[Parent] then return end
				ErrorCache[Parent] = Class
			end

			--// Create visual error message
			if Canvas.Error then
				Canvas:Error({
					Parent = Parent,
					Text = Class
				})
			end

			self:Error("Class:", Class)
			self:Error(debug.traceback())
		end

		--// Some elements may return the instance without a class
		if Element == nil then
			Element = Class
		end

		--// Invoke OnChildChange
		if OnChildChange then
			OnChildChange:Fire(Class)
		end

		--// Add element into the flag Cache
		if Element then
			if Elements then
				table.insert(Elements, Element)
			end
			
			self:OnElementCreate({
				Object = Element,
				Flags = Flags,
				Class = Class,
				Canvas = Canvas
			})
		end

		return Class, Element
	end
end

function ReGui:DefineElement(Name: string, Data)
	local Elements = self.Elements
	local Themes = self.ThemeConfigs
	local ElementColors = self.ElementColors

	local BaseTheme = Themes.DarkTheme

	--// Element data
	local Base = Data.Base
	local Create = Data.Create
	local Export = Data.Export
	local ThemeTags = Data.ThemeTags
	local ColorData = Data.ColorData

	--// Add missing keys to base config
	self:CheckConfig(Base, {
		ColorTag = Name,
		ElementStyle = Name
	})

	--// Declare new coloring variables into theme
	if ThemeTags then
		Merge(BaseTheme, ThemeTags)
	end

	--// Declare new ColorData
	if ColorData then
		Merge(ElementColors, ColorData)
	end

	--// Create element function wrap
	local Generate = self:WrapGeneration(Create, Data)

	--// Export creation function into ReGui dict
	if Export then
		self[Name] = Generate
	end

	--// Add element into the Elements class
	Elements[Name] = Generate

	return Generate
end

function ReGui:DefineGlobalFlag(Flag)
	local Flags = self.ElementFlags
	table.insert(Flags, Flag)
end

function ReGui:DefineTheme(Name: string, ThemeData: ThemeData)
	local Themes = self.ThemeConfigs

	--// Check theme configuration for missing data
	self:CheckConfig(ThemeData, {
		BaseTheme = Themes.DarkTheme
	})

	local BaseTheme = GetAndRemove("BaseTheme", ThemeData)
	local Theme = {
		BaseTheme = BaseTheme,
		Values = ThemeData
	}

	--// Push theme into the ThemeConfigs dict
	Themes[Name] = Theme

	return Theme
end

function ReGui:GetMouseLocation(): (number, number)
	local Mouse = self.Mouse
	return Mouse.X, Mouse.Y
end

function ReGui:SetWindowFocusesEnabled(Enabled: boolean)
	self.WindowFocusesEnabled = Enabled
end

function ReGui:UpdateWindowFocuses()
	local Windows = self.Windows
	local FocusesEnabled = self.WindowFocusesEnabled

	if not FocusesEnabled then return end

	--// Update each window state
	for _, Class in Windows do
		local Connection = Class.HoverConnection
		if not Connection then continue end

		--// Check hover state
		local Hovering = Connection.Hovering
		if Hovering then
			self:SetFocusedWindow(Class)
			return
		end
	end

	self:SetFocusedWindow(nil)
end

function ReGui:WindowCanFocus(WindowClass: table): boolean
	if WindowClass.NoSelect then return false end
	if WindowClass.Collapsed then return false end
	if WindowClass._SelectDisabled then return false end

	return true
end

function ReGui:GetFocusedWindow(): table?
	return self.FocusedWindow
end

function ReGui:BringWindowToFront(WindowClass: table)
	local Windows = self.Windows

	--// Check if the NoBringToFrontOnFocus flag is enabled
	local NoBringToFront = WindowClass.NoBringToFrontOnFocus
	if NoBringToFront then return end

	--// Change position of window in the Windows array to 1
	MoveTableItem(Windows, WindowClass, 1)
end

function ReGui:SetFocusedWindow(ActiveClass: table?)
	local Previous = self:GetFocusedWindow()
	local Windows = self.Windows

	--// Check if the Active window is the same as previous
	if Previous == ActiveClass then return end
	self.FocusedWindow = ActiveClass

	--// Only update the window if the NoSelect flag is enabled
	if ActiveClass then
		local CanSelect = self:WindowCanFocus(ActiveClass)
		if not CanSelect then return end

		--// Bring Window to the front
		self:BringWindowToFront(ActiveClass)
	end

	--// Update active state for each window
	local ZIndex = #Windows
	for _, Class in Windows do
		local CanSelect = self:WindowCanFocus(Class)
		local Window = Class.WindowFrame

		--// Ignore NoSelect windows with NoSelect flag
		if not CanSelect then continue end

		ZIndex -= 1

		--// Set Window ZIndex
		if ZIndex then
			Window.ZIndex = ZIndex
		end

		--// Update Window focus state
		local Active = Class == ActiveClass
		Class:SetFocused(Active, ZIndex)
	end
end

function ReGui:SetItemTooltip(Parent: GuiObject, Render: (Elements) -> ...any)
	local Elements = self.Elements
	local Tooltips = self.TooltipsContainer
	local ActiveTooltips = self.ActiveTooltips

	--// Create canvas object
	local Canvas, Object = Tooltips:Canvas({
		Visible = false,
		UiPadding = UDim.new()
	})

	--// Create content
	task.spawn(Render, Canvas)

	--// Connect events
	ReGui:DetectHover(Parent, {
		MouseMove = true,
		MouseEnter = true,
		OnHoverChange = function(Hovering: boolean)
			--// Registor tooltip into ActiveTooltips
			if Hovering then
				table.insert(ActiveTooltips, Canvas)
				return 
			end

			--// Remove from ActiveTooltips
			local Index = table.find(ActiveTooltips, Canvas)
			table.remove(ActiveTooltips, Index)
		end,
		OnInput = function(Hovering: boolean, Input)
			Object.Visible = Hovering
		end,
	})
end

function ReGui:CheckFlags(Flags, Config)
	for Name: string, Func in next, Flags do
		local Value = Config[Name]
		if not Value then continue end

		Func(Value)
	end
end

function ReGui:GetThemeKey(Theme: (string|table), Key: string)
	local Themes = self.ThemeConfigs
	
	--// Fetch theme data from the name
	if typeof(Theme) == "string" then
		Theme = Themes[Theme]
	end

	local BaseTheme = Themes.DarkTheme
	Theme = Theme or BaseTheme

	local BaseTheme = Theme.BaseTheme
	local Values = Theme.Values

	--// Test for a direct value
	local Value = Values[Key]
	if Value then return Value end

	--// Fetch value from the base theme
	if BaseTheme then
		return self:GetThemeKey(BaseTheme, Key)
	end
end

function ReGui:SelectionGroup(Elements)
	local Previous = nil
	local Debounce = false
	
	local function ForEach(Func, Ignore)
		for _, Element in next, Elements do
			if typeof(Element) == "Instance" then continue end
			if Element == Ignore then continue end
			
			Func(Element)
		end
	end
	
	local function Callback(self)
		if Debounce then return end
		Debounce = true
		
		local Value = Previous
		Previous = self:GetValue()
		
		if not Value then
			Value = Previous
		end
		
		ForEach(function(Element)
			Element:SetValue(Value)
		end, self)
		
		Debounce = false
	end
	
	ForEach(function(Element)
		Element.Callback = Callback
	end)
end

--// Container class
local Elements = ReGui.Elements
Elements.__index = Elements

function Elements:GetObject()
	return self.RawObject
end

function Elements:ApplyFlags(Object, Flags)
	local WindowClass = self.WindowClass
	
	ReGui:ApplyFlags({
		WindowClass = WindowClass,
		Object = Object,
		Class = Flags
	})
end

function Elements:Remove()
	local OnChildChange = self.OnChildChange
	local Object = self:GetObject()
	local Class = self.Class

	--// Check if the class has a remove function
	local ClassRemove = Class.Remove
	if ClassRemove then
		return ClassRemove(Class)
	end

	--// Invoke OnChildChange
	if OnChildChange then
		OnChildChange:Fire(Class or self)
	end

	if Class then
		table.clear(Class)
	end

	Object:Destroy()
	table.clear(self)
end

function Elements:GetChildElements(): table
	local Elements = self.Elements
	return Elements
end

function Elements:ClearChildElements()
	local Elements = self:GetChildElements()
	for _, Object in next, Elements do
		Object:Destroy()
	end
end

function Elements:TagElements(Objects: ObjectTable)
	local WindowClass = self.WindowClass
	local Debug = ReGui.Debug

	--// Missing WindowClass
	if not WindowClass then 	
		if Debug then
			ReGui:Warn("No WindowClass for TagElements:", Objects)
		end
		return
	end

	WindowClass:TagElements(Objects)
end

function Elements:GetThemeKey(Key: string)
	local WindowClass = self.WindowClass

	if WindowClass then 
		return WindowClass:GetThemeKey(Key)
	end

	return ReGui:GetThemeKey(nil, Key)
end

function Elements:SetColorTags(Objects: ObjectTables, Animate: boolean?)
	local WindowClass = self.WindowClass
	if not WindowClass then return end

	local Elements = WindowClass.TagsList
	local Theme = WindowClass.Theme

	ReGui:MultiUpdateColors({
		Animate = Animate,
		Theme = Theme,
		TagsList = Elements,
		Objects = Objects,
	})
end

function Elements:SetElementFocused(Object: GuiObject, Data)
	local WindowClass = self.WindowClass
	local IsMobileDevice = ReGui.HasTouchScreen

	local Focused = Data.Focused
	local Animation = Data.Animation

	--// Change global animation state
	ReGui:SetAnimationsEnabled(not Focused)

	--// Reset animation state
	if not Focused and Animation then
		Animation:Refresh()
	end

	--// Window modification
	if not WindowClass then return end
	if not IsMobileDevice then return end
	local ContentCanvas = WindowClass.ContentCanvas

	--// Disable interaction with other elements for touchscreens
	ContentCanvas.Interactable = not Focused
end

ReGui:DefineElement("Dropdown", {
	Base = {
		ColorTag = "PopupCanvas",
		Disabled = false,
		AutoClose = true,
		OnSelected = EmptyFunction
	},
	Create = function(Canvas, Config)
		Config.Parent = ReGui.Container.Overlays

		--// Unpack configuration
		local Selected = Config.Selected
		local Items = Config.Items
		local OnSelected = Config.OnSelected
		
		--// Create overlay object
		local Popup, Object = Canvas:PopupCanvas(Config)
		local Class = ReGui:MergeMetatables(Config, Popup)
		
		local Entries = {}

		local function SetValue(Value)
			OnSelected(Value) -- Invoke selected callback
		end

		function Config:ClearEntries()
			for _, Entry in Entries do
				Entry:Remove()
			end
		end

		function Config:SetItems(Items: table, Selected)
			local IsArray = Items[1]

			--// Clear previous entries
			self:ClearEntries()

			--// Append items
			for A, B in Items do
				local Value = IsArray and B or A
				local IsSelected = A == Selected or B == Selected

				--// Create selectable
				local Entry = Popup:Selectable({
					Text = tostring(Value),
					Selected = IsSelected,
					ZIndex = 6,
					Callback = function()
						return SetValue(Value)
					end,
				})

				table.insert(Entries, Entry)
			end
		end

		--// Update object
		if Items then
			Config:SetItems(Items, Selected)
		end

		return Class, Object
	end,
})

ReGui:DefineElement("OverlayScroll", {
	Base = {
		ElementClass = "OverlayScroll",
		Spacing = UDim.new(0, 4),
	},
	Create = function(self, Config)
		local WindowClass = self.WindowClass
		
		local ElementClass = Config.ElementClass
		local Spacing = Config.Spacing

		--// Create overlay object
		local Object = ReGui:InsertPrefab(ElementClass, Config)
		local ContentFrame = Object:FindFirstChild("ContentFrame") or Object
		local ListLayout = Object:FindFirstChild("UIListLayout", true)

		ListLayout.Padding = Spacing
		
		local Class = ReGui:MergeMetatables(self, Config)

		--// Content canvas
		local Canvas = ReGui:MakeCanvas({
			Element = ContentFrame,
			WindowClass = WindowClass,
			Class = Class
		})

		function Config:GetCanvasSize()
			return ContentFrame.AbsoluteCanvasSize
		end

		return Canvas, Object
	end,
})

ReGui:DefineElement("Overlay", {
	Base = {
		ElementClass = "Overlay"
	},
	Create = Elements.OverlayScroll,
})

export type Image = {
	Image: (string|number),
	Callback: ((...any) -> unknown)?
}
ReGui:DefineElement("Image", {
	Base = {
		Image = "",
		Callback = EmptyFunction
	},
	Create = function(self, Config: Image): ImageButton
		--// Create image object
		local Object = ReGui:InsertPrefab("Image", Config)
		Object.Activated:Connect(function(...)
			local Func = Config.Callback
			return Func(Object, ...)
		end)

		return Object
	end,
})

export type VideoPlayer = {
	Video: (string|number),
	Callback: ((...any) -> unknown)?
}
ReGui:DefineElement("VideoPlayer", {
	Base = {
		Video = "",
		Callback = EmptyFunction
	},
	Create = function(self, Config: VideoPlayer): VideoFrame
		--// Correct configuration
		local Video = Config.Video
		Config.Video = ReGui:CheckAssetUrl(Video)

		--// Create object
		local Object = ReGui:InsertPrefab("VideoPlayer", Config)
		return Object
	end,
})

export type Button = {
	Text: string?,
	DoubleClick: boolean?,
	Callback: ((...any) -> unknown)?,
}
ReGui:DefineElement("Button", {
	Base = {
		Text = "Button",
		DoubleClick = false,
		Callback = EmptyFunction
	},
	Create = function(self, Config: Button): TextButton
		--// Create button object
		local Object = ReGui:InsertPrefab("Button", Config)

		local DoubleClick = Config.DoubleClick

		--// MouseEvents
		ReGui:ConnectMouseEvent(Object, {
			DoubleClick = DoubleClick,
			Callback = function(...)
				local Func = Config.Callback
				return Func(Object, ...)
			end,
		})

		return Object
	end,
})

export type Selectable = {
	Text: string?,
	Selected: boolean?,
	Disabled: boolean?,
	Callback: ((...any) -> unknown)?,
}
ReGui:DefineElement("Selectable", {
	Base = {
		Text = "Selectable",
		Callback = EmptyFunction,
		Selected = false,
		Disabled = false,
		Size = UDim2.fromScale(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		TextXAlignment = Enum.TextXAlignment.Left,
		AnimationTags = {
			Selected = "Buttons",
			Unselected = "TransparentButtons"
		},
	},
	Create = function(self, Config: Selectable): (table, TextButton)
		local AfterClick = self.Class.AfterClick
		
		local Selected = Config.Selected
		local Disabled = Config.Disabled

		--// Create button object
		local Object = ReGui:InsertPrefab("Button", Config)
		local Class = ReGui:MergeMetatables(Config, Object)

		Object.Activated:Connect(function(...)
			--// Invoke callback
			local Func = Config.Callback
			Func(Object, ...)
			
			--// The canvas after click event
			if AfterClick then
				AfterClick(Object, ...)
			end
		end)

		function Config:SetSelected(Selected: boolean?)
			local Animations = self.AnimationTags
			local Animation = Selected and Animations.Selected or Animations.Unselected

			self.Selected = Selected
			ReGui:SetAnimation(Object, Animation)
		end

		function Config:SetDisabled(Disabled: boolean?)
			self.Disabled = Disabled
			Object.Interactable = not Disabled
		end

		--// Update object state
		Config:SetSelected(Selected)
		Config:SetDisabled(Disabled)

		return Class, Object
	end,
})

export type ImageButton = {
	Image: (string|number),
	Callback: ((...any) -> unknown)?
}
ReGui:DefineElement("ImageButton", {
	Base = {
		ElementStyle = "Button",
		Callback = EmptyFunction
	},
	Create = Elements.Image,
})

ReGui:DefineElement("SmallButton", {
	Base = {
		Text = "Button",
		PaddingTop = UDim.new(),
		PaddingBottom = UDim.new(),
		PaddingLeft = UDim.new(0, 2),
		PaddingRight = UDim.new(0, 2),
		ColorTag = "Button",
		ElementStyle = "Button",
		Callback = EmptyFunction,
	},
	Create = Elements.Button
})

type KeyId = (Enum.UserInputType | Enum.KeyCode)
export type Keybind = {
	Value: Enum.KeyCode?,
	DeleteKey: Enum.KeyCode?,
	Enabled: boolean?,
	IgnoreGameProcessed: boolean?,
	Callback: ((KeyId) -> any)?,
	OnKeybindSet: ((KeyId) -> any)?,
	OnBlacklistedKeybindSet: ((KeyId) -> any)?,
	KeyBlacklist: {
		[number]: KeyId
	},

	SetValue: ((Keybind, New: Enum.KeyCode) -> any)?,
	WaitForNewKey: ((Keybind) -> any)?,
}
ReGui:DefineElement("Keybind", {
	Base = {
		Label = "Keybind",
		ColorTag = "Frame",
		Value = nil,
		DeleteKey = Enum.KeyCode.Backspace,
		IgnoreGameProcessed = true,
		Enabled = true,
		Disabled = false,
		Callback = EmptyFunction,
		OnKeybindSet = EmptyFunction,
		OnBlacklistedKeybindSet = EmptyFunction,
		KeyBlacklist = {},
		UiPadding = UDim.new(),
		AutomaticSize = Enum.AutomaticSize.None,
		Size = UDim2.new(0.3, 0, 0, 19)
	},
	Create = function(Canvas, Config: Keybind)
		local Value = Config.Value
		local LabelText = Config.Label
		local Disabled = Config.Disabled
		local KeyBlacklist = Config.KeyBlacklist

		--// Create keybind object
		local Object = ReGui:InsertPrefab("Button", Config)
		local Class = ReGui:MergeMetatables(Config, Object)

		local Label = Canvas:Label({
			Parent = Object, 
			Text = LabelText,
			Position = UDim2.new(1, 4, 0.5),
			AnchorPoint = Vector2.new(0, 0.5)
		})

		local function Callback(Func, ...)
			return Func(Object, ...)
		end

		local function KeyIsBlacklisted(KeyId: KeyId)
			local Blacklisted = table.find(KeyBlacklist, KeyId)
			return Blacklisted
		end

		function Config:SetDisabled(Disabled: boolean)
			self.Disabled = Disabled
			Object.Interactable = not Disabled
			Canvas:SetColorTags({
				[Label] = Disabled and "LabelDisabled" or "Label"
			}, true)
		end

		function Config:SetValue(KeyId: KeyId)
			local OnKeybindSet = self.OnKeybindSet
			local DeleteKey = self.DeleteKey

			--// Remove keybind 
			if KeyId == DeleteKey then
				KeyId = nil
			end

			self.Value = KeyId
			Object.Text = KeyId and KeyId.Name or "Not set"

			--// Invoke OnKeybindSet callback
			Callback(OnKeybindSet, KeyId)
		end

		function Config:WaitForNewKey()
			self._WaitingForNewKey = true
			Object.Text = "..."
			Object.Interactable = false
		end

		local function GetKeyId(Input: InputObject)
			local KeyCode = Input.KeyCode
			local InputType = Input.UserInputType

			--// Convert mouse input
			if InputType ~= Enum.UserInputType.Keyboard then
				return InputType
			end

			return KeyCode
		end

		local function CheckNewKey(Input: InputObject)
			local OnBlacklistedKeybindSet = Config.OnBlacklistedKeybindSet
			local Previous = Config.Value

			local KeyId = GetKeyId(Input)

			--// Check if window is focused
			if not UserInputService.WindowFocused then return end 

			--// Check if keycode is blacklisted
			if KeyIsBlacklisted(KeyId) then
				--// Invoke OnKeybindSet callback
				Callback(OnBlacklistedKeybindSet, KeyId)
				return
			end

			Object.Interactable = true
			Config._WaitingForNewKey = false

			--// Reset back to previous if new key is unknown
			if KeyId.Name == "Unknown" then
				return Config:SetValue(Previous)
			end

			--// Set new keybind
			Config:SetValue(KeyId)
		end

		local function InputBegan(Input: InputObject, GameProcessed: boolean)
			local IgnoreGameProcessed = Config.IgnoreGameProcessed
			local DeleteKey = Config.DeleteKey
			local Enabled = Config.Enabled
			local Value = Config.Value
			local Func = Config.Callback

			local KeyId = GetKeyId(Input)

			--// OnKeybindSet
			if Config._WaitingForNewKey then
				CheckNewKey(Input)
				return
			end

			--// Check input state
			if not Enabled and Object.Interactable then return end
			if not IgnoreGameProcessed and GameProcessed then return end

			--// Check KeyCode
			if not Value then return end
			if KeyId == DeleteKey then return end
			if KeyId.Name ~= Value.Name then return end 

			--// Invoke callback
			Callback(Func, KeyId)
		end

		--// Update object state
		Config:SetValue(Value)
		Config:SetDisabled(Disabled)

		--// Connect events
		Config.Connection = UserInputService.InputBegan:Connect(InputBegan)
		Object.Activated:Connect(function()
			Config:WaitForNewKey()
		end)

		ReGui:SetAnimation(Object, "Inputs")

		return Class, Object
	end
})

ReGui:DefineElement("ArrowButton", {
	Base = {
		Direction = "Left",
		ColorTag = "Button",
		Icon = ReGui.Icons.Arrow,
		Size = UDim2.fromOffset(21, 21),
		IconSize = UDim2.fromScale(1, 1),
		IconPadding = UDim.new(0, 4),
		Rotations = {
			Left = 180,
			Right = 0,
		}
	},
	Create = function(self, Config): ScrollingFrame
		--// Unpack configuration
		local Direction = Config.Direction
		local Rotations = Config.Rotations

		local Rotation = Rotations[Direction]
		Config.IconRotation = Rotation

		--// Create object
		local Object = ReGui:InsertPrefab("ArrowButton", Config)
		Object.Activated:Connect(function(...)
			local Func = Config.Callback
			return Func(Object, ...)
		end)

		return Object
	end,
})

export type Label = {
	Text: string,
	Bold: boolean?,
	Italic: boolean?,
	Font: string?
}
ReGui:DefineElement("Label", {
	Base = {
		Font = "Inconsolata"
	},
	ColorData = {
		["LabelPadding"] = {
			PaddingTop = "LabelPaddingTop",
			PaddingBottom = "LabelPaddingBottom"
		},
	},
	Create = function(self, Config: Label): TextLabel
		--// Unpack config
		local IsBold = Config.Bold
		local IsItalic = Config.Italic
		local FontName = Config.Font
		local FontFace = Config.FontFace

		--// Weghts
		local Medium = Enum.FontWeight.Medium
		local Bold = Enum.FontWeight.Bold

		--// Styles
		local Normal = Enum.FontStyle.Normal
		local Italic = Enum.FontStyle.Italic

		local Weight = IsBold and Bold or Medium
		local Style = IsItalic and Italic or Normal
		local AddFlag = IsBold or IsItalic

		if not FontFace and AddFlag then
			Config.FontFace = Font.fromName(FontName, Weight, Style)
		end

		local Label = ReGui:InsertPrefab("Label", Config)
		local Padding = Label:FindFirstChildOfClass("UIPadding")

		self:TagElements({
			[Padding] = "LabelPadding",
		})

		--// Create label
		return Label
	end,
})

ReGui:DefineElement("Error", {
	Base = {
		RichText = true,
		TextWrapped = true
	},
	ColorData = {
		["Error"] = {
			TextColor3 = "ErrorText",
			FontFace = "TextFont",
		},
	},
	Create = function(self, Config: Label)
		local Message = Config.Text
		Config.Text = `<b>⛔ Error:</b> {Message}`

		return self:Label(Config)
	end,
})

------// MenuBar class
local MenuBar = {
	Engaged = false
}
MenuBar.__index = MenuBar

function MenuBar:SetEngaged(Engaged: boolean)
	local Object = self.Object
	local Window = self.WindowClass
	
	self.Engaged = Engaged
	
	--// Set the Window interaction state based on the MenuBar enagement
	if Window then
		Window:SetCanvasInteractable(not Engaged)
	end
end

function MenuBar:IsHovering(): boolean
	local Hovering = false
	
	--// Check the hover state for each menu
	self:Foreach(function(Data)
		Hovering = Data.Popup:IsMouseHovering()
		return Hovering
	end)
	
	return Hovering
end

function MenuBar:Foreach(Func)
	local Menus = self.Menus
	for _, Data in next, Menus do
		--// Invoke callback
		local Break = Func(Data)
		if Break then break end
	end
end

function MenuBar:SetFocusedMenu(Menu)
	self:Foreach(function(Data)
		--// Set active state based on if MenuItem is the requested
		local Active = Data == Menu
		Data:SetActiveState(Active)
	end)
end

function MenuBar:Close()
	self:SetEngaged(false)
	self:SetFocusedMenu(nil)
end

function MenuBar:MenuItem(Config)
	local Canvas = self.Canvas
	local Menus = self.Menus
	
	--// Create elements
	local Selectable = Canvas:MenuButton(Config)
	local Popup = Canvas:PopupCanvas({
		RelativeTo = Selectable,
		MaxSizeX = 210,
		Visible = false,
		AutoClose = false,
		AfterClick = function()
			self:Close()
		end,
	})

	--// Menu data for the array
	local MenuData = {
		Popup = Popup,
		Button = Selectable
	}
	
	--// Connect mouse focus events
	ReGui:DetectHover(Selectable, {
		MouseEnter = true,
		OnInput = function()
			if not self.Engaged then return end
			self:SetFocusedMenu(MenuData)
		end,
	})
	
	function MenuData:SetActiveState(Active: boolean)
		Popup:SetPopupVisible(Active)
		Selectable:SetSelected(Active)
	end
	
	--// Engage button connections
	Selectable.Activated:Connect(function()
		self:SetFocusedMenu(MenuData)
		self:SetEngaged(true)
	end)
	
	--// Add menu to the Menu array
	table.insert(Menus, MenuData)
	
	return Popup, MenuData
end

ReGui:DefineElement("MenuBar", {
	Base = {},
	Create = function(self, Config): Elements
		local WindowClass = self.WindowClass

		--// Create object
		local Object = ReGui:InsertPrefab("MenuBar", Config)

		--// Content canvas
		local Canvas = ReGui:MakeCanvas({
			Element = Object,
			WindowClass = WindowClass,
			Class = Config
		})
		
		--// Make menu bar class
		local Class = NewClass(MenuBar, {
			WindowClass = WindowClass,
			Canvas = Canvas,
			Object = Object,
			Menus = {}
		})
		Merge(Class, Config)
		
		--// Mouse click detection for closure
		ReGui:DetectHover(Object, {
			MouseOnly = true,
			OnInput = function()
				if not Class.Engaged then return end
				if Class:IsHovering() then return end
				
				Class:Close()
			end,
		})
		
		local Meta = ReGui:MergeMetatables(Class, Canvas)
		return Meta, Object
	end,
})

ReGui:DefineElement("MenuButton", {
	Base = {
		Text = "MenuButton",
		PaddingLeft = UDim.new(0, 8),
		PaddingRight = UDim.new(0, 8),
		Size = UDim2.fromOffset(0, 19),
		AutomaticSize = Enum.AutomaticSize.XY
	},
	Create = Elements.Selectable
})

----// TabsBar class
local TabBarClass = {
	ColorTags = {
		BGSelected = {
			[true] = "SelectedTab",
			[false] = "DeselectedTab"
		},
		LabelSelected = {
			[true] = "SelectedTabLabel",
			[false] = "DeselectedTabLabel"
		},
	}
}
function TabBarClass:SetButtonSelected(Tab: table, Selected: boolean)	
	--// Ignore update if the value is identical
	if Tab.IsSelected == Selected then return end
	Tab.IsSelected = Selected

	local NoAnimation = self.NoAnimation
	local WindowClass = self.WindowClass
	local ColorTags = self.ColorTags
	
	--// Coloring dicts
	local Theme = WindowClass.Theme
	local Elements = WindowClass.TagsList
	
	--// Colors tags
	local BGSelected = ColorTags.BGSelected
	local LabelSelected = ColorTags.LabelSelected
	
	local TabButton = Tab.TabButton
	local Button = TabButton.Button
	local Label = Button.Label

	ReGui:MultiUpdateColors({
		Animate = not NoAnimation,
		Theme = Theme,
		TagsList = Elements,
		Objects = {
			[Button] = BGSelected[Selected],
			[Label] = LabelSelected[Selected],
		},
	})
end

function TabBarClass:CompareTabs(Tab, Match)
	if not Tab then return false end
	return Tab.MatchBy == Match or Tab == Match
end

function TabBarClass:ForEachTab(Match: (Tab|string), Func: (Tab, IsMatch: boolean, Index: number) -> nil)
	local CompareName = typeof(Match) == "string"
	local Tabs = self.Tabs
	
	for Index, Tab in Tabs do
		local Name = Tab.Name
		local IsMatch = false

		--// Match for requested content type
		if CompareName then
			IsMatch = Name == Match
		else
			IsMatch = self:CompareTabs(Tab, Match)
		end
		
		--// Invoke callback
		Func(Tab, IsMatch, Index)
	end
end

function TabBarClass:RemoveTab(Target: (Tab|string))
	local OnTabRemove = self.OnTabRemove
	local Tabs = self.Tabs
	
	self:ForEachTab(Target, function(Tab, IsMatch, Index)
		if not IsMatch then return end
		local TabButton = Tab.TabButton
		local OnClosure = Tab.OnClosure
		
		--// Remove
		table.remove(Tabs, Index)
		TabButton:Destroy()

		--// Invoke OnClosure
		OnTabRemove(self, Tab)
		OnClosure(Tab)
	end)

	return self
end

export type Tab = {
	Name: string,
	Focused: boolean?,
	TabButton: boolean?,
	Closeable: boolean?,
	OnClosure: (Tab) -> nil,
	Icon: (string|number)?
}
function TabBarClass:CreateTab(Config: Tab): Elements
	Config = Config or {}
	ReGui:CheckConfig(Config, {
		Name = "Tab",
		AutoSize = "Y",
		Focused = false,
		OnClosure = EmptyFunction
	})

	--// Unpack class data
	local AutoSelectNewTabs = self.AutoSelectNewTabs
	local WindowClass = self.WindowClass
	local ParentCanvas = self.ParentCanvas
	local Tabs = self.Tabs
	local TabsFrame = self.TabsFrame
	local OnTabCreate = self.OnTabCreate

	--// Unpack config
	local Focused = Config.Focused
	local Name = Config.Name
	local Icon = Config.Icon
	local IsFocused = Focused or #Tabs <= 0 and AutoSelectNewTabs

	--// Template sources
	local TabButton = ReGui:InsertPrefab("TabButton", Config)
	TabButton.Parent = TabsFrame

	--// Create new tab button
	local Button = TabButton.Button
	local TextPadding = Button:FindFirstChildOfClass("UIPadding")
	local Label = Button.Label
	Label.Text = tostring(Name)
	
	Merge(Config, {
		TabButton = TabButton
	})

	local function SetActive()
		self:SetActiveTab(Config)
	end

	--// Addional flags
	local ExtraFlags = {
		["Closeable"] = function()
			local Button = ParentCanvas:RadioButton({
				Parent = Button,
				Visible = not self.NoClose,
				Icon = ReGui.Icons.Close,
				IconSize = UDim2.fromOffset(11,11),
				LayoutOrder = 3,
				ZIndex = 2,
				UsePropertiesList = true,
				Callback = function()
					self:RemoveTab(Config)
				end,
			})

			--// Animate close icon on hover
			local Icon = Button.Icon
			ReGui:SetAnimation(Icon, {
				Connections = {
					MouseEnter = {
						ImageTransparency = 0,
					},
					MouseLeave = {
						ImageTransparency = 1,
					}
				},
				Init = "MouseLeave"
			}, TabButton)
		end,
	}

	--// Connect events
	Button.Activated:Connect(SetActive)

	--// Apply flags
	ReGui:CheckFlags(ExtraFlags, Config)

	--// Add to tabs dict
	table.insert(Tabs, Config)

	--// Add color infomation
	if WindowClass then
		WindowClass:TagElements({
			[TextPadding] = "TabPadding",
		})
	end

	--// Set animation for tab button
	ReGui:SetAnimation(Button, "Buttons")
	self:SetButtonSelected(Config, IsFocused)	

	--// Apply flags
	ParentCanvas:ApplyFlags(TabButton, Config)
	
	local Responce = OnTabCreate(self, Config)
	
	--// Change tab focus
	if IsFocused then
		self:SetActiveTab(Config)
	end
	
	return Responce or Config
end

function TabBarClass:SetActiveTab(Target: (table|string))
	--// Unpack class data
	local Tabs = self.Tabs
	local NoAnimation = self.NoAnimation
	local Previous = self.ActiveTab
	local OnActiveTabChange = self.OnActiveTabChange

	local MatchName = typeof(Target) == "string"
	local MatchedTab = nil
	local IsVisible = false
	
	self:ForEachTab(Target, function(Tab, IsMatch, Index)
		if IsMatch then
			MatchedTab = Tab
		end
		self:SetButtonSelected(Tab, IsMatch)
	end)
	
	if not MatchedTab then return self end
	if self:CompareTabs(MatchedTab, Previous) then return self end
	
	self.ActiveTab = MatchedTab
	
	--// Invoke OnActiveTabChange
	OnActiveTabChange(self, MatchedTab, Previous)
	
	return self
end

export type TabBar = {
	AutoSelectNewTabs: boolean,
	OnActiveTabChange: ((TabBar, Tab: Tab, Previous: Tab) -> nil)?,
	OnTabCreate: ((TabBar, Tab: Tab) -> nil)?,
	OnTabRemove: ((TabBar, Tab: Tab) -> nil)?
}
ReGui:DefineElement("TabBar", {
	Base = {
		AutoSelectNewTabs = true,
		OnActiveTabChange = EmptyFunction,
		OnTabCreate = EmptyFunction,
		OnTabRemove = EmptyFunction,
	},
	ColorData = {
		["DeselectedTab"] = {
			BackgroundColor3 = "TabBg"
		},
		["SelectedTab"] = {
			BackgroundColor3 = "TabBgActive"
		},
		["DeselectedTabLabel"] = {
			FontFace = "TextFont",
			TextColor3 = "TabText",
		},
		["SelectedTabLabel"] = {
			FontFace = "TextFont",
			TextColor3 = "TabTextActive",
		},
		["TabsBarSeparator"] = {
			BackgroundColor3 = "TabBgActive",
		},
		["TabPadding"] = {
			PaddingTop = "TabTextPaddingTop",
			PaddingBottom = "TabTextPaddingBottom"
		},
		["TabPagePadding"] = {
			PaddingBottom = "TabPagePadding",
			PaddingLeft = "TabPagePadding",
			PaddingRight = "TabPagePadding",
			PaddingTop = "TabPagePadding",
		}
	},
	Create = function(self, Config: TabBar)
		local WindowClass = self.WindowClass

		--// Create object
		local Object = ReGui:InsertPrefab("TabsBar", Config)
		local Class = NewClass(TabBarClass)

		local Separator = Object.Separator
		local TabsFrame = Object.TabsFrame
		
		--// Create canvas
		local TabsRailCanvas = ReGui:MakeCanvas({
			Element = TabsFrame,
			WindowClass = WindowClass,
			Class = Class
		})
		
		--// Merge configurations into the class
		Merge(Class, Config)
		Merge(Class, {
			ParentCanvas = self,
			Object = Object,
			TabsFrame = TabsFrame,
			WindowClass = WindowClass,
			Tabs = {}
		})
		
		--// Tag elementss
		self:TagElements({
			[Object] = "TabsBar",
			[Separator] = "TabsBarSeparator",
		})
		
		local Merged = ReGui:MergeMetatables(TabsRailCanvas, Object)
		return Merged, Object
	end,
})

export type TabSelector = {
	NoTabsBar: boolean?,
	NoAnimation: boolean?,
} & TabBar
ReGui:DefineElement("TabSelector", {
	Base = {
		NoTabsBar = false,
		OnActiveTabChange = EmptyFunction,
		OnTabCreate = EmptyFunction,
		OnTabRemove = EmptyFunction,
	},
	Create = function(Canvas, Config: TabSelector): (TabSelector, GuiObject)
		local WindowClass = Canvas.WindowClass
		
		local NoTabsBar = Config.NoTabsBar
		local NoAnimation = Config.NoAnimation
		
		--// Create TabSelector object
		local Object = ReGui:InsertPrefab("TabSelector", Config)
		
		local Body = Object.Body
		local PageTemplate = Body.PageTemplate
		PageTemplate.Visible = false
		
		--// TabsBar functions
		local function OnTabCreate(self, Tab, ...)
			local AutoSize = Tab.AutoSize
			local Name = Tab.Name
			
			--// Create page
			local Page = PageTemplate:Clone()
			local PagePadding = ReGui:GetChildOfClass(Page, "UIPadding")
			
			ReGui:SetProperties(Page, {
				Parent = Body,
				Name = Name,
				AutomaticSize = Enum.AutomaticSize[AutoSize],
				Size = UDim2.fromScale(
					AutoSize == "Y" and 1 or 0, 
					AutoSize == "X" and 1 or 0
				)
			})
			
			--// Page padding
			Canvas:TagElements({
				[PagePadding] = "TabPagePadding",
			})

			--// Create canvas
			local Canvas = ReGui:MakeCanvas({
				Element = Page,
				WindowClass = WindowClass,
				Class = Tab
			})
			
			--// Invoke user callback
			Config.OnTabCreate(self, Tab, ...)
			
			Merge(Tab, {
				Page = Page,
				MatchBy = Canvas
			})

			return Canvas
		end
		local function OnActiveTabChange(self, Tab, ...)
			self:ForEachTab(Tab, function(Tab, IsMatch, Index)
				local Page = Tab.Page
				Page.Visible = IsMatch
				
				if not IsMatch then return end

				--// Slide in effect
				local Tweeninfo = Canvas:GetThemeKey("AnimationTweenInfo")
				Animation:Tween({
					Object = Page,
					Tweeninfo = Tweeninfo,
					NoAnimation = NoAnimation,
					StartProperties = {
						Position = UDim2.fromOffset(0, 4)
					},
					EndProperties = {
						Position = UDim2.fromOffset(0, 0)
					}
				})
			end)
			
			--// Invoke user callback
			Config.OnActiveTabChange(self, Tab, ...)
		end
		
		--// Create tabs bar
		local TabsBar = Canvas:TabBar({
			Parent = Object,
			Visible = not NoTabsBar,
			OnTabCreate = OnTabCreate,
			OnActiveTabChange = OnActiveTabChange,
			OnTabRemove = function(self, Tab, ...)
				Tab.Page:Remove()
				Config.OnTabRemove(...) --// Invoke user callback
			end,
		})
		
		local Class = ReGui:MergeMetatables(TabsBar, Object)
		return Class, Object
	end,
})

export type RadioButton = {
	Icon: string?,
	IconRotation: number?,
	Callback: ((...any) -> unknown)?,
}
ReGui:DefineElement("RadioButton", {
	Base = {
		Callback = EmptyFunction,
	},
	Create = function(self, Config: RadioButton): GuiButton
		local Object = ReGui:InsertPrefab("RadioButton", Config)
		Object.Activated:Connect(function(...)
			local Callback = Config.Callback
			return Callback(Object, ...)
		end)
		
		return Object
	end,
})

export type Checkbox = {
	Label: string?,
	IsRadio: boolean?,
	Value: boolean,
	NoAnimation: boolean?,
	Callback: ((...any) -> unknown)?,
	SetValue: (self: Checkbox, Value: boolean, NoAnimation: boolean) -> ...any,
	Toggle: (self: Checkbox) -> ...any,
	TickedImageSize: UDim2,
	UntickedImageSize: UDim2,
}
ReGui:DefineElement("Checkbox", {
	Base = {
		Label = "Checkbox",
		IsRadio = false,
		Value = false,
		NoAutoTag = true,
		TickedImageSize = UDim2.fromScale(1, 1),
		UntickedImageSize = UDim2.fromScale(0,0),
		Callback = EmptyFunction,
		Disabled = false
	},
	Create = function(Canvas, Config: Checkbox): Checkbox
		--// Unpack configuration
		local IsRadio = Config.IsRadio
		local Value = Config.Value
		local Text = Config.Label
		local TickedSize = Config.TickedImageSize
		local UntickedSize = Config.UntickedImageSize
		local Disabled = Config.Disabled

		--// Check checkbox object
		local Object = ReGui:InsertPrefab("CheckBox", Config)
		local Class = ReGui:MergeMetatables(Config, Object)

		local Tickbox = Object.Tickbox
		local Tick = Tickbox.Tick
		Tick.Image = ReGui.Icons.Checkmark

		--// Styles
		local UIPadding = Tickbox:FindFirstChildOfClass("UIPadding")
		local UICorner = ReGui:GetChildOfClass(Tickbox, "UICorner")

		--// Create label
		local Label = Canvas:Label({
			Text = Text,
			Parent = Object,
			LayoutOrder = 2
		})

		--// Stylise to correct type
		local PaddingSize = UDim.new(0, 3)
		if IsRadio then
			Tick.ImageTransparency = 1
			Tick.BackgroundTransparency = 0
			UICorner.CornerRadius = UDim.new(1, 0)
		else
			PaddingSize = UDim.new(0, 2)
		end

		--// Apply UIPadding sizes
		ReGui:SetProperties(UIPadding, {
			PaddingBottom = PaddingSize,
			PaddingLeft = PaddingSize,
			PaddingRight = PaddingSize,
			PaddingTop = PaddingSize,
		})

		--// Callback
		local function Callback(...)
			local func = Config.Callback
			return func(Class, ...)
		end

		local function SetStyle(Value: boolean, NoAnimation: boolean)
			local Tweeninfo = Canvas:GetThemeKey("AnimationTweenInfo")

			--// Animate tick
			local Size = Value and TickedSize or UntickedSize
			Animation:Tween({
				Object = Tick,
				Tweeninfo = Tweeninfo,
				NoAnimation = NoAnimation,
				EndProperties = {
					Size = Size
				}
			})
		end

		function Config:SetDisabled(Disabled: boolean)
			self.Disabled = Disabled
			Object.Interactable = not Disabled

			Canvas:SetColorTags({
				[Label] = Disabled and "LabelDisabled" or "Label"
			}, true)
		end

		function Config:SetValue(Value: boolean, NoAnimation: boolean)
			self.Value = Value

			--// Animate
			SetStyle(Value, NoAnimation)

			--// Fire callback
			Callback(Value)

			return self
		end
		
		function Config:SetTicked(...)
			ReGui:Warn("Checkbox:SetTicked is deprecated, please use :SetValue")
			return self:SetValue(...)
		end

		function Config:Toggle()
			local Value = not self.Value
			self.Value = Value
			self:SetValue(Value)

			return self
		end

		--// Connect functions
		local function Clicked()
			Config:Toggle()
		end

		--// Connect events
		Object.Activated:Connect(Clicked)
		Tickbox.Activated:Connect(Clicked)

		--// Update object state
		Config:SetValue(Value, true)
		Config:SetDisabled(Disabled)

		--// Style elements
		ReGui:SetAnimation(Tickbox, "Buttons", Object)
		Canvas:TagElements({
			[Tick] = "CheckMark",
			[Tickbox] = "Checkbox"
		})

		return Class, Object
	end,
})

ReGui:DefineElement("Radiobox", {
	Base = {
		IsRadio = true,
		CornerRadius = UDim.new(1,0),
	},
	Create = Elements.Checkbox,
})

export type PlotHistogram = {
	Label: string?,
	Points: {
		[number]: number
	},
	Minimum: number?,
	Maximum: number?,
	GetBaseValues: (PlotHistogram) -> (number, number),
	UpdateGraph: (PlotHistogram) -> PlotHistogram,
	PlotGraph: (PlotHistogram, Points: {
		[number]: number
	}) -> PlotHistogram,
	Plot: (PlotHistogram, Value: number) -> {
		SetValue: (Plot, Value: number) -> nil,
		GetPointIndex: (Plot) -> number,
		Remove: (Plot, Value: number) -> nil,
	},
}
ReGui:DefineElement("PlotHistogram", {
	Base = {
		ColorTag = "Frame",
		Label = "Histogram"
	},
	Create = function(Canvas, Config: PlotHistogram)
		--// Unpack configuration
		local LabelText = Config.Label
		local Points = Config.Points

		--// Create Object
		local Object = ReGui:InsertPrefab("Histogram", Config)
		local Class = ReGui:MergeMetatables(Config, Object)

		local GraphCanvas = Object.Canvas
		local PointTemplate = GraphCanvas.PointTemplate
		PointTemplate.Visible = false --// Hide template

		local Label = Canvas:Label({
			Text = LabelText,
			Parent = Object,
			Position = UDim2.new(1, 4)
		})

		--// Create tooltip
		local ValueLabel = nil
		ReGui:SetItemTooltip(Object, function(Canvas)
			ValueLabel = Canvas:Label()
		end)

		Merge(Config, {
			_Plots = {},
			_Cache = {}
		})

		function Config:GetBaseValues(): (number, number)
			local Minimum = self.Minimum
			local Maximum = self.Maximum

			--// User defined minimum
			if Minimum and Maximum then
				return Minimum, Maximum
			end

			local Plots = self._Plots

			for _, Data in Plots do
				local Value = Data.Value

				--// Minimum
				if not Minimum or Value < Minimum then
					Minimum = Value
				end

				--// Maximum
				if not Maximum or Value > Maximum then
					Maximum = Value
				end
			end

			return Minimum, Maximum
		end

		function Config:UpdateGraph()
			local Plots = self._Plots

			local Minimum, Maximum = self:GetBaseValues()
			if not Minimum or not Maximum then return end

			local Difference = Maximum - Minimum

			--// Update each plot on the graph
			for _, Data in Plots do
				local Point = Data.Point
				local Value = Data.Value

				local Scale = (Value - Minimum) / Difference
				Scale = math.clamp(Scale, 0.05, 1)

				Point.Size = UDim2.fromScale(1, Scale)
			end

			return self
		end

		function Config:Plot(Value)
			local Plots = self._Plots
			local Module = {}

			--// Create a new plot Object
			local Plot = PointTemplate:Clone()
			local Point = Plot.Bar

			ReGui:SetProperties(Plot, {
				Parent = GraphCanvas,
				Visible = true
			})

			local HoverConnection = ReGui:DetectHover(Plot, {
				MouseEnter = true,
				OnInput = function()
					Module:UpdateTooltip()
				end,
			})

			local Data = {
				Object = Plot,
				Point = Point,
				Value = Value
			}

			function Module:UpdateTooltip()
				local Index = Module:GetPointIndex()
				ValueLabel.Text = `{Index}:	{Data.Value}`
			end

			function Module:SetValue(Value)
				Data.Value = Value
				Config:UpdateGraph()

				--// Update tooltip value if hovered
				if HoverConnection.Hovering then
					self:UpdateTooltip()
				end
			end

			function Module:GetPointIndex(): number
				return table.find(Plots, Data)
			end

			function Module:Remove(Value)
				table.remove(Plots, self:GetPointIndex())
				Plot:Remove()
				Config:UpdateGraph()
			end

			--// Registor plot
			table.insert(Plots, Data)

			--// Update the graph with new values
			self:UpdateGraph()

			--// Style the plot object
			ReGui:SetAnimation(Point, "Plots", Plot)
			Canvas:TagElements({
				[Point] = "Plot"
			})

			return Module
		end

		function Config:PlotGraph(Points)
			local Cache = self._Cache

			--// Remove unsused graph points
			local Extra = #Cache-#Points 
			if Extra >= 1 then
				--// Remove unused graph points
				for Index = 1, Extra do
					local Point = table.remove(Cache, Index)
					if Point then
						Point:Remove()
					end
				end
			end

			for Index, Value in Points do
				--// Use existing point
				local Point = Cache[Index]
				if Point then
					Point:SetValue(Value)
					continue
				end

				--// Create new point
				Cache[Index] = self:Plot(Value)
			end

			return self
		end

		--// Display points
		if Points then
			Config:PlotGraph(Points)
		end

		return Class, Object
	end,
})


export type Viewport = {
	Model: Instance,
	WorldModel: WorldModel?,
	Viewport: ViewportFrame?,
	Camera: Camera?,
	Clone: boolean?,

	SetCamera: (self: Viewport, Camera: Camera) -> Viewport,
	SetModel: (self: Viewport, Model: Model, PivotTo: CFrame?) -> Model,
}
ReGui:DefineElement("Viewport", {
	Base = {
		IsRadio = true,
	},
	Create = function(self, Config: Viewport): Viewport
		--// Unpack configuration
		local Model = Config.Model
		local Camera = Config.Camera 
		
		--// Create viewport object
		local Object = ReGui:InsertPrefab("Viewport", Config)
		local Class = ReGui:MergeMetatables(Config, Object)

		local Viewport = Object.Viewport
		local WorldModel = Viewport.WorldModel
	
		if not Camera then
			Camera = ReGui:CreateInstance("Camera", Viewport)
			Camera.CFrame = CFrame.new(0,0,0)
		end

		Merge(Config, {
			Camera = Camera,
			WorldModel = WorldModel,
			Viewport = Viewport
		})

		function Config:SetCamera(Camera)
			self.Camera = Camera
			Viewport.CurrentCamera = Camera
			return self
		end

		function Config:SetModel(Model: Model, PivotTo: CFrame?)
			local CreateClone = self.Clone

			WorldModel:ClearAllChildren()

			--// Set new model
			if CreateClone then
				Model = Model:Clone()
			end
			
			if PivotTo then
				Model:PivotTo(PivotTo)
			end

			Model.Parent = WorldModel
			self.Model = Model

			return Model
		end

		--// Set model
		if Model then
			Config:SetModel(Model)
		end

		Config:SetCamera(Camera)

		return Class, Object
	end,
})

export type InputText = {
	Value: string,
	Placeholder: string?,
	MultiLine: boolean?,
	Label: string?,
	Disabled: boolean?,
	
	Callback: ((string, ...any) -> unknown)?,
	Clear: (InputText) -> InputText,
	SetValue: (InputText, Value: string) -> InputText,
	SetDisabled: (InputText, Disabled: boolean) -> InputText,
}
ReGui:DefineElement("InputText", {
	Base = {
		Value = "",
		Placeholder = "",
		Label = "Input text",
		Callback = EmptyFunction,
		MultiLine = false,
		NoAutoTag = true,
		Disabled = false
	},
	Create = function(Canvas, Config: InputText): InputText
		--// Unpack configuration
		local MultiLine = Config.MultiLine
		local Placeholder = Config.Placeholder
		local Label = Config.Label
		local Disabled = Config.Disabled
		local Value = Config.Value

		--// Create Text input object
		local Object = ReGui:InsertPrefab("InputBox", Config)
		local Frame = Object.Frame
		local TextBox = Frame.Input

		local Class = ReGui:MergeMetatables(Config, Object)

		Canvas:Label({
			Parent = Object,
			Text = Label,
			AutomaticSize = Enum.AutomaticSize.X,
			Size = UDim2.fromOffset(0, 19),
			Position = UDim2.new(1, 4),
			LayoutOrder = 2
		})

		ReGui:SetProperties(TextBox, {
			PlaceholderText = Placeholder,
			MultiLine = MultiLine
		})

		local function Callback(...)
			local Func = Config.Callback
			Func(Class, ...)
		end

		function Config:SetValue(Value: string?)
			TextBox.Text = tostring(Value)
			self.Value = Value
			return self
		end

		function Config:SetDisabled(Disabled: boolean)
			self.Disabled = Disabled
			Object.Interactable = not Disabled
			Canvas:SetColorTags({
				[Label] = Disabled and "LabelDisabled" or "Label"
			}, true)
			return self
		end

		function Config:Clear()
			TextBox.Text = ""
			return self
		end

		local function TextChanged()
			local Value = TextBox.Text
			Config.Value = Value
			Callback(Value)
		end

		--// Connect events
		TextBox:GetPropertyChangedSignal("Text"):Connect(TextChanged)

		--// Update object state
		Config:SetDisabled(Disabled)
		Config:SetValue(Value)

		Canvas:TagElements({
			[TextBox] = "Frame"
		})

		return Class, Object
	end,
})

export type InputInt = {
	Value: number,
	Maximum: number?,
	Minimum: number?,
	Placeholder: string?,
	MultiLine: boolean?,
	NoButtons: boolean?,
	Label: string?,
	Increment: number?,
	Callback: ((string, ...any) -> unknown)?,
	SetValue: (InputInt, Value: number, NoTextUpdate: boolean?) -> InputInt,
	Decrease: (InputInt) -> nil,
	Increase: (InputInt) -> nil,
}
ReGui:DefineElement("InputInt", {
	Base = {
		Value = 0,
		Increment = 1,
		Placeholder = "",
		Label = "Input Int",
		Callback = EmptyFunction,
	},
	Create = function(Canvas, Config: InputInt): InputInt
		--// Unpack configuration
		local Value = Config.Value
		local Placeholder = Config.Placeholder
		local LabelText = Config.Label
		local Disabled = Config.Disabled
		local NoButtons = Config.NoButtons

		--// Create Text input object
		local Object = ReGui:InsertPrefab("InputBox", Config)
		local Class = ReGui:MergeMetatables(Config, Object)

		local Frame = Object.Frame
		local TextBox = Frame.Input
		TextBox.PlaceholderText = Placeholder

		--// Decrease
		local Decrease = Canvas:Button({
			Text = "-",
			Parent = Frame,
			LayoutOrder = 2,
			Ratio = 1,
			AutomaticSize = Enum.AutomaticSize.None,
			FlexMode = Enum.UIFlexMode.None,
			Size = UDim2.fromScale(1,1),
			Visible = not NoButtons,
			Callback = function()
				Config:Decrease()
			end,
		})

		--// Increase
		local Increase = Canvas:Button({
			Text = "+",
			Parent = Frame,
			LayoutOrder = 3,
			Ratio = 1,
			AutomaticSize = Enum.AutomaticSize.None,
			FlexMode = Enum.UIFlexMode.None,
			Size = UDim2.fromScale(1,1),
			Visible = not NoButtons,
			Callback = function()
				Config:Increase()
			end,
		})

		local Label = Canvas:Label({
			Parent = Object,
			Text = LabelText,
			AutomaticSize = Enum.AutomaticSize.X,
			Size = UDim2.fromOffset(0, 19),
			Position = UDim2.new(1, 4),
			LayoutOrder = 4
		})

		local function Callback(...)
			local Func = Config.Callback
			Func(Class, ...)
		end

		function Config:Increase()
			local Value = self.Value
			local Increment = self.Increment
			Config:SetValue(Value + Increment)
		end

		function Config:Decrease()
			local Value = self.Value
			local Increment = self.Increment
			Config:SetValue(Value - Increment)
		end

		function Config:SetDisabled(Disabled: boolean)
			self.Disabled = Disabled
			Object.Interactable = not Disabled
			Canvas:SetColorTags({
				[Label] = Disabled and "LabelDisabled" or "Label"
			}, true)
		end

		function Config:SetValue(Value: number?)
			local Previous = self.Value
			local Minimum = self.Minimum
			local Maximum = self.Maximum

			--// Replace empty string value with 0
			Value = tonumber(Value)

			--// Check if value is accepted
			if not Value then 
				Value = Previous
			end

			--// Clamp value into a limied range
			if Minimum and Maximum then
				Value = math.clamp(Value, Minimum, Maximum)
			end

			--// Update values
			TextBox.Text = Value
			Config.Value = Value
			Callback(Value)

			return self
		end

		local function TextChanged()
			local New = TextBox.Text
			Config:SetValue(New)
		end

		--// Update object state
		Config:SetValue(Value)
		Config:SetDisabled(Disabled)

		--// Connect events
		TextBox.FocusLost:Connect(TextChanged)

		--// Register elements
		Canvas:TagElements({
			[Increase] = "Button",
			[Decrease] = "Button",
			[TextBox] = "Frame",
		})

		return Class, Object
	end,
})

ReGui:DefineElement("InputTextMultiline", {
	Base = {
		Label = "",
		Size = UDim2.new(1, 0, 0, 39),
		Border = false,
		ColorTag = "Frame"
	},
	Create = function(self, Config)
		return self:Console(Config)
	end,
})

export type Console = {
	Enabled: boolean?,
	ReadOnly: boolean?,
	Value: string?,
	RichText: boolean?,
	TextWrapped: boolean?,
	LineNumbers: boolean?,
	AutoScroll: boolean,
	LinesFormat: string,
	MaxLines: number,
	
	CountLines: (Console) -> number,
	UpdateLineNumbers: (Console) -> Console,
	UpdateScroll: (Console) -> Console,
	SetValue: (Console, Value: string) -> Console,
	GetValue: (Console) -> string,
	Clear: (Console) -> Console,
	AppendText: (Console, ...string) -> Console,
	CheckLineCount: (Console) -> Console
}
ReGui:DefineElement("Console", {
	Base = {
		Enabled = true,
		Value = "",
		TextWrapped = false,
		Border = true,
		MaxLines = 300,
		LinesFormat = "%s",
		Callback = EmptyFunction,
	},
	Create = function(self, Config: Console): Console
		--// Unpack configuration
		local ReadOnly = Config.ReadOnly
		local LineNumbers = Config.LineNumbers
		local Fill = Config.Fill
		local Value = Config.Value
		local Placeholder = Config.Placeholder

		--// Create console object
		local Object = ReGui:InsertPrefab("Console", Config)
		local Class = ReGui:MergeMetatables(Config, Object)

		local Source: TextBox = Object.Source
		local Lines = Object.Lines
		Lines.Visible = LineNumbers
		
		function Config:CountLines(ExcludeEmpty: boolean?): number
			local Lines = Source.Text:split("\n")
			local Count = #Lines
			
			if Count == 1 and Lines[1] == "" then
				return 0 
			end
			
			return Count
		end

		function Config:UpdateLineNumbers()
			--// configuration
			local LineNumbers = self.LineNumbers
			local Format = self.LinesFormat

			--// If line counts are disabled
			if not LineNumbers then return end

			--// Update lines text
			local LinesCount = self:CountLines()
			Lines.Text = ""

			for Line = 1, LinesCount do
				local Text = Format:format(Line)
				local End = Line ~= LinesCount and '\n' or ''
				Lines.Text ..= `{Text}{End}`
			end

			--// Update console size to fit line numbers
			local LinesWidth = Lines.AbsoluteSize.X
			Source.Size = UDim2.new(1, -LinesWidth, 0, 0)

			return self
		end

		function Config:CheckLineCount()
			--// configuration
			local MaxLines = Config.MaxLines
			if not MaxLines then return end

			local Text = Source.Text
			local Lines = Text:split("\n")

			--// Cut the first line
			if #Lines > MaxLines then
				local Line = `{Lines[1]}\\n`
				local Cropped = Text:sub(#Line)
				self:SetValue(Cropped)
			end

			return self
		end

		function Config:UpdateScroll()
			local CanvasSize = Object.AbsoluteCanvasSize
			Object.CanvasPosition = Vector2.new(0, CanvasSize.Y)
			return self
		end

		function Config:SetValue(Text: string?)
			if not self.Enabled then return end

			Source.Text = tostring(Text)
			self:Update()

			return self
		end

		function Config:GetValue()
			return Source.Text
		end

		function Config:Clear()
			Source.Text = ""
			self:Update()
			return self
		end

		function Config:AppendText(...)
			local Lines = self:CountLines(true)
			local Concated = ReGui:Concat({...}, " ")
			
			--// Set the content if there are no lines
			if Lines == 0 then
				return self:SetValue(Concated)
			end
			
			local Value = self:GetValue()
			local NewString = `{Value}\n{Concated}`

			--// Write new content
			self:SetValue(NewString)
			
			return self
		end

		function Config:Update()
			--// Configuration
			local AutoScroll = self.AutoScroll
			
			self:CheckLineCount()
			self:UpdateLineNumbers()

			--// Automatically scroll to bottom
			if AutoScroll then
				self:UpdateScroll()
			end
		end

		local function Changed()
			local Value = Config:GetValue()
			Config:Update()
			Config.Callback(Value)
		end

		--// Update element
		Config:SetValue(Value)
		
		--// Set properties
		ReGui:SetProperties(Source, Config)
		ReGui:SetProperties(Source, {
			TextEditable = not ReadOnly,
			Parent = Object,
			PlaceholderText = Placeholder
		})

		self:TagElements({
			[Source] = "ConsoleText",
			[Lines] = "ConsoleLineNumbers",
		})

		--// Connect events
		Source:GetPropertyChangedSignal("Text"):Connect(Changed)

		return Class, Object
	end,
})

export type Table = {
	Align: string?,
	Border: boolean?,
	RowBackground: boolean?,
	RowBgTransparency: number?,
	MaxColumns: number?,

	Row: (Table) -> {
		Column: (Row) -> Elements
	},
	ClearRows: (Table) -> unknown,
}
ReGui:DefineElement("Table", {
	Base = {
		VerticalAlignment = Enum.VerticalAlignment.Top,
		RowBackground = false,
		RowBgTransparency = 0.87,
		Border = false,
		Spacing = UDim.new(0, 4)
	},
	Create = function(Canvas, Config: Table): Table
		local WindowClass = Canvas.WindowClass

		--// Unpack configuration
		local RowTransparency = Config.RowBgTransparency
		local RowBackground = Config.RowBackground
		local Border = Config.Border
		local VerticalAlignment = Config.VerticalAlignment
		local MaxColumns = Config.MaxColumns
		local Spacing = Config.Spacing

		--// Create table object
		local Object = ReGui:InsertPrefab("Table", Config)
		local Class = ReGui:MergeMetatables(Config, Object)

		local RowTemplate = Object.RowTemp
		local RowsCount = 0
		local Rows = {}
		local HasStyling = Border and RowBackground

		function Config:Row(Config)
			Config = Config or {}

			local IsHeader = Config.IsHeader

			local ColumnIndex = 0
			local Columns = {}

			--// Create Row object (Different to :Row)
			local Row = RowTemplate:Clone()
			ReGui:SetProperties(Row, {
				Name = "Row",
				Visible = true,
				Parent = Object,
			})

			--// Set alignment
			local UIListLayout = Row:FindFirstChildOfClass("UIListLayout")
			ReGui:SetProperties(UIListLayout, {
				VerticalAlignment = VerticalAlignment,
				Padding = not HasStyling and Spacing or UDim.new(0, 1)
			})

			--// Apply header styles
			if IsHeader then
				Canvas:TagElements({
					[Row] = "Header"
				})
			else
				RowsCount += 1
			end

			--// RowBackground background colors for rows
			if RowBackground and not IsHeader then
				local Transparency = RowsCount % 2 ~= 1 and RowTransparency or 1
				Row.BackgroundTransparency = Transparency
			end

			--// Row class
			local RowClass = {}
			local Class = ReGui:MergeMetatables(RowClass, Row)

			function RowClass:Column(Config)
				Config = Config or {}

				ReGui:CheckConfig(Config, {
					HorizontalAlign = Enum.HorizontalAlignment.Left,
					VerticalAlignment = Enum.VerticalAlignment.Top,
				})

				--// Create column object
				local Column = Row.ColumnTemp:Clone()
				
				--// ListLayout Properties
				local ListLayout = Column:FindFirstChildOfClass("UIListLayout")
				ReGui:SetProperties(ListLayout, Config)
				
				--// Set border enabled based on Flag
				local Stroke = Column:FindFirstChildOfClass("UIStroke")
				Stroke.Enabled = Border
				
				--// Remove padding if there is no styling
				local UIPadding = Column:FindFirstChildOfClass("UIPadding")
				if not HasStyling then
					UIPadding:Destroy()
				end

				--// Column Properties
				ReGui:SetProperties(Column, {
					Parent = Row,
					Visible = true,
					Name = "Column"
				})
				
				--// Content canvas
				return ReGui:MakeCanvas({
					Element =  Column,
					WindowClass = WindowClass,
					Class = Class
				})
			end

			function RowClass:NextColumn()
				ColumnIndex += 1

				local Index = ColumnIndex % MaxColumns + 1
				local Column = Columns[Index]

				--// Create Column
				if not Column then
					Column = self:Column()	
					Columns[Index] = Column
				end

				return Column
			end

			table.insert(Rows, RowClass)

			--// Content canvas
			return Class
		end

		--// TODO: 
		function Config:NextRow()
			return self:Row()
		end

		function Config:HeaderRow()
			return self:Row({
				IsHeader = true
			})
		end

		function Config:ClearRows()
			RowsCount = 0

			--// Destroy each row
			for _, Row: Frame in next, Object:GetChildren() do
				if not Row:IsA("Frame") then continue end
				if Row == RowTemplate then continue end

				Row:Destroy()
			end

			return Config
		end

		return Class, Object
	end,
})

export type List = {
	Spacing: number?
}
ReGui:DefineElement("List", {
	Base = {
		Spacing = 4,
		HorizontalFlex = Enum.UIFlexAlignment.None,
		VerticalFlex = Enum.UIFlexAlignment.None,
		HorizontalAlignment = Enum.HorizontalAlignment.Left,
		VerticalAlignment = Enum.VerticalAlignment.Top,
		FillDirection = Enum.FillDirection.Horizontal,
	},
	Create = function(self, Config)
		local WindowClass = self.WindowClass

		--// Unpack configuration
		local Spacing = Config.Spacing
		local HorizontalFlex = Config.HorizontalFlex
		local VerticalFlex = Config.VerticalFlex
		local HorizontalAlignment = Config.HorizontalAlignment
		local VerticalAlignment = Config.VerticalAlignment
		local FillDirection = Config.FillDirection

		--// Create object
		local Object = ReGui:InsertPrefab("List", Config)
		local Class = ReGui:MergeMetatables(Config, Object)

		local ListLayout: UIListLayout = Object.UIListLayout
		ReGui:SetProperties(ListLayout, {
			Padding = UDim.new(0, Spacing),
			HorizontalFlex = HorizontalFlex,
			VerticalFlex = VerticalFlex,
			HorizontalAlignment = HorizontalAlignment,
			VerticalAlignment = VerticalAlignment,
			FillDirection = FillDirection,
		})

		--// Content canvas
		local Canvas = ReGui:MakeCanvas({
			Element = Object,
			WindowClass = WindowClass,
			Class = Class
		})

		return Canvas, Object
	end,
})

export type CollapsingHeader = {
	Title: string,
	CollapseIcon: string?,
	Icon: string?,
	NoAnimation: boolean?,
	Collapsed: boolean?,
	Offset: number?,
	NoArrow: boolean?,
	OpenOnDoubleClick: boolean?, -- Need double-click to open node
	OpenOnArrow: boolean?, -- Only open when clicking on the arrow
	Activated: (CollapsingHeader) -> nil,

	Remove: (CollapsingHeader) -> nil,
	SetArrowVisible: (CollapsingHeader, Visible: boolean) -> nil,
	SetTitle: (CollapsingHeader, Title: string) -> nil,
	SetIcon: (CollapsingHeader, Icon: string) -> nil,
	SetVisible: (CollapsingHeader, Visible: boolean) -> nil,
	SetCollapsed: (CollapsingHeader, Open: boolean) -> CollapsingHeader
}
ReGui:DefineElement("CollapsingHeader", {
	Base = {
		Title = "Collapsing Header",
		CollapseIcon = ReGui.Icons.Arrow,
		Collapsed = true,
		Offset = 0,
		NoAutoTag = true,
		NoAutoFlags = true,
		IconPadding = UDim.new(0, 4),
		Activated = EmptyFunction
	},
	Create = function(Canvas, Config: CollapsingHeader): CollapsingHeader
		--// Unpack config
		local Title = Config.Title
		local Collapsed = Config.Collapsed
		local Style = Config.ElementStyle
		local Offset = Config.Offset
		local TitleProperties = Config.TitleBarProperties
		local OpenOnDoubleClick = Config.OpenOnDoubleClick
		local OpenOnArrow = Config.OpenOnArrow
		local CollapseIcon = Config.CollapseIcon
		local IconPadding = Config.IconPadding
		local Icon = Config.Icon
		local NoArrow = Config.NoArrow

		--// Create header object
		local Object = ReGui:InsertPrefab("CollapsingHeader", Config)

		local Titlebar = Object.TitleBar
		local Collapse = Titlebar.Collapse
		local IconImage = Titlebar.Icon
		Canvas:ApplyFlags(IconImage, {
			Image = Icon
		})
		
		local CollapseButton = Collapse.CollapseIcon
		local CollapsePadding = Collapse.UIPadding
		ReGui:SetPadding(CollapsePadding, IconPadding)
		Canvas:ApplyFlags(CollapseButton, {
			Image = CollapseIcon
		})

		local TitleText = Canvas:Label({
			ColorTag = "CollapsingHeader",
			Parent = Titlebar,
			LayoutOrder = 2
		})

		--// Content canvas
		local Canvas, ContentFrame = Canvas:Indent({
			Class = Config,
			Parent = Object,
			Offset = Offset,
			LayoutOrder = 2,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.None,
			PaddingTop = UDim.new(0, 4),
			PaddingBottom = UDim.new(0, 1),
		})

		local function Activated()
			local Callback = Config.Activated
			Callback(Canvas)
		end

		function Config:Remove()
			Object:Destroy()
			table.clear(self)
		end
		function Config:SetArrowVisible(Visible: boolean)
			CollapseButton.Visible = Visible
		end
		function Config:SetTitle(Title: string)
			TitleText.Text = Title
		end
		function Config:SetVisible(Visible: boolean)
			Object.Visible = Visible
		end
		function Config:SetIcon(Icon: (string|number)?)
			local Visible = Icon and Icon ~= ""
			IconImage.Visible = Visible

			if Visible then 
				IconImage.Image = ReGui:CheckAssetUrl(Icon) 
			end
		end

		--// Open Animations
		function Config:SetCollapsed(Collapsed)
			self.Collapsed = Collapsed

			local ContentSize = ReGui:GetContentSize(ContentFrame)
			local Tweeninfo = Canvas:GetThemeKey("AnimationTweenInfo")

			--// Sizes
			local ClosedSize = UDim2.fromScale(1, 0)
			local OpenSize = ClosedSize + UDim2.fromOffset(0, ContentSize.Y)

			Animation:HeaderCollapse({
				Tweeninfo = Tweeninfo,
				Collapsed = Collapsed,
				Toggle = CollapseButton,
				Resize = ContentFrame,
				Hide = ContentFrame,

				--// Sizes
				ClosedSize = ClosedSize,
				OpenSize = OpenSize,
			})

			return self
		end

		local function Toggle()
			Config:SetCollapsed(not Config.Collapsed)
		end

		--// Apply flags
		if TitleProperties then
			Canvas:ApplyFlags(Titlebar, TitleProperties)
		end

		--// Connect events
		if not OpenOnArrow then
			ReGui:ConnectMouseEvent(Titlebar, {
				DoubleClick = OpenOnDoubleClick,
				Callback = Toggle,
			})
		end
		CollapseButton.Activated:Connect(Toggle)
		Titlebar.Activated:Connect(Activated)

		--// Update object state
		Config:SetCollapsed(Collapsed)
		Config:SetTitle(Title)
		Config:SetArrowVisible(not NoArrow)

		--// Style elements
		ReGui:ApplyStyle(Titlebar, Style)
		Canvas:TagElements({
			[Titlebar] = "CollapsingHeader",
		})

		return Canvas, Object
	end,
})

ReGui:DefineElement("TreeNode", {
	Base = {
		Offset = 21,
		IconPadding = UDim.new(0, 2),
		TitleBarProperties = {
			Size = UDim2.new(1, 0, 0, 13)
		}
	},
	Create = Elements.CollapsingHeader,
})

export type Separator = {
	Text: string?
}
ReGui:DefineElement("Separator", {
	Base = {
		NoAutoTag = true,
		NoAutoTheme = true
	},
	Create = function(self, Config)
		local Text = Config.Text

		--// Create septator object
		local Object = ReGui:InsertPrefab("SeparatorText", Config)

		local Label = self:Label({
			Text = tostring(Text),
			Visible = Text ~= nil,
			Parent = Object,
			LayoutOrder = 2,
			Size = UDim2.new(),
			PaddingLeft = UDim.new(0, 4),
			PaddingRight = UDim.new(0, 4),
		})

		self:TagElements({
			[Object.Left] = "Separator",
			[Object.Right] = "Separator",
		})

		return Object
	end,
})

export type Canvas = {
	Scroll: boolean?,
	Class: table?
}
ReGui:DefineElement("Canvas", {
	Base = {},
	Create = function(self, Config: Canvas)
		local WindowClass = self.WindowClass

		local Scroll = Config.Scroll
		local Class = Config.Class or Config

		--// Create object
		local ObjectClass = Scroll and "ScrollingCanvas" or "Canvas"
		local Object = ReGui:InsertPrefab(ObjectClass, Config)

		--// Content canvas
		local Canvas = ReGui:MakeCanvas({
			Element = Object,
			WindowClass = WindowClass,
			Class = Class
		})

		return Canvas, Object
	end,
})

ReGui:DefineElement("ScrollingCanvas", {
	Base = {
		Scroll = true
	},
	Create = Elements.Canvas
})

export type Region = {
	Scroll: boolean?
}
ReGui:DefineElement("Region", {
	Base = {
		Scroll = false,
		AutomaticSize = Enum.AutomaticSize.Y
	},
	Create = function(self, Config: Region)
		local WindowClass = self.WindowClass

		local Scroll = Config.Scroll
		local Class = Scroll and "ScrollingCanvas" or "Canvas"

		--// Create object
		local Object = ReGui:InsertPrefab(Class, Config)

		--// Content canvas
		local Canvas = ReGui:MakeCanvas({
			Element = Object,
			WindowClass = WindowClass,
			Class = Config
		})

		return Canvas, Object
	end,
})

ReGui:DefineElement("Group", {
	Base = {
		Scroll = false,
		AutomaticSize = Enum.AutomaticSize.Y
	},
	Create = function(self, Config)
		local WindowClass = self.WindowClass

		--// Create object
		local Object = ReGui:InsertPrefab("Group", Config)

		--// Content canvas
		local Canvas = ReGui:MakeCanvas({
			Element = Object,
			WindowClass = WindowClass,
			Class = Config
		})

		return Canvas, Object
	end,
})

export type Indent = {
	Offset: number?
}
ReGui:DefineElement("Indent", {
	Base = {
		Offset = 15,
		PaddingTop = UDim.new(),
		PaddingBottom = UDim.new(),
		PaddingRight = UDim.new(),
	},
	Create = function(self, Config: Indent)
		local Offset = Config.Offset
		Config.PaddingLeft = UDim.new(0, Offset)

		return self:Canvas(Config)
	end,
})

export type BulletText = {
	Padding: number,
	Icon: (string|number)?,
	Rows: {
		[number]: string?,
	}
} 
ReGui:DefineElement("BulletText", {
	Base = {},
	Create = function(self, Config: BulletText)
		local Rows = Config.Rows

		--// Create each row
		for _, Text in next, Rows do
			local Object = self:Bullet(Config)
			Object:Label({
				Text = tostring(Text),
				LayoutOrder = 2,
				Size = UDim2.fromOffset(0,14),
			})
		end
	end,
})

export type Bullet = {
	Padding: number?
}
ReGui:DefineElement("Bullet", {
	Base = {
		Padding = 3,
		Icon = ReGui.Icons.Dot,
		IconSize = UDim2.fromOffset(5,5)
	},
	Create = function(self, Config: Bullet)
		local WindowClass = self.WindowClass

		--// Unpack configuration
		local Padding = Config.Padding

		--// Create object
		local Object = ReGui:InsertPrefab("Bullet", Config)

		--// Content canvas
		local Canvas = ReGui:MakeCanvas({
			Element = Object,
			WindowClass = WindowClass,
			Class = self
		})

		--// Apply padding
		local ListLayout = Object.UIListLayout
		ListLayout.Padding = UDim.new(0, Padding)

		return Canvas, Object
	end,
})

export type Row = {
	Spacing: number?,
	Expanded: boolean?,
	HorizontalFlex: Enum.UIFlexAlignmen?,
	VerticalFlex: Enum.UIFlexAlignmen?,
	Expand: (Row) -> Row
}
ReGui:DefineElement("Row", {
	Base = {
		Spacing = 4,
		Expanded = false, 
		HorizontalFlex = Enum.UIFlexAlignment.None,
		VerticalFlex = Enum.UIFlexAlignment.None,
	},
	Create = function(self, Config: Row)
		local WindowClass = self.WindowClass

		--// Unpack configuration
		local Spacing = Config.Spacing
		local Expanded = Config.Expanded
		local HorizontalFlex = Config.HorizontalFlex
		local VerticalFlex = Config.VerticalFlex

		--// Create row object
		local Object = ReGui:InsertPrefab("Row", Config)
		local Class = ReGui:MergeMetatables(Config, Object)

		local UIListLayout = Object:FindFirstChildOfClass("UIListLayout")
		UIListLayout.Padding = UDim.new(0, Spacing)
		UIListLayout.HorizontalFlex = HorizontalFlex
		UIListLayout.VerticalFlex = VerticalFlex

		--// Content canvas
		local Canvas = ReGui:MakeCanvas({
			Element = Object,
			WindowClass = WindowClass,
			Class = Class
		})
		
		function Config:Expand()
			UIListLayout.HorizontalFlex = Enum.UIFlexAlignment.Fill
			return self
		end

		--// Expand if Fill flag is enabled
		if Expanded then
			Config:Expand()
		end

		return Canvas, Object
	end,
})

--TODO
-- Vertical
export type SliderIntFlags = {
	Value: number?,
	Format: string?,
	Label: string?,
	Progress: boolean?,
	NoGrab: boolean?,
	Minimum: number,
	Maximum: number,
	NoAnimation: boolean?,
	Callback: (number) -> any?,
	ReadOnly: boolean?,
	SetValue: (SliderInt, Value: number, IsSlider: boolean?) -> SliderInt?,
	SetDisabled: (SliderInt, Disabled: boolean) -> SliderInt,
	MakeProgress: (SliderInt) -> nil?,
}
ReGui:DefineElement("SliderBase", {
	Base = {
		Format = "%.f", -- "%.f/%s",
		Label = "",
		Type = "Slider",
		Callback = EmptyFunction,
		NoGrab = false,
		NoClick = false,
		Minimum = 0,
		Maximum = 100,
		ColorTag = "Frame",
		Disabled = false,
	},
	Create = function(Canvas, Config)
		--// Unpack config
		local Value = Config.Value or Config.Minimum
		local Format = Config.Format
		local LabelText = Config.Label
		local NoAnimation = Config.NoAnimation
		local NoGrab = Config.NoGrab
		local NoClick = Config.NoClick
		local Type = Config.Type
		local Disabled = Config.Disabled

		--// Create slider element
		local Object = ReGui:InsertPrefab("Slider")
		local Track = Object.Track
		local Grab = Track.Grab
		local ValueText = Track.ValueText

		--local Drag = ReGui:GetChildOfClass(Track, "UIDragDetector")
		local UIPadding = Track:FindFirstChildOfClass("UIPadding")

		local Class = ReGui:MergeMetatables(Config, Object)
		local GrabSize = Grab.AbsoluteSize

		--// Set object animations
		local HoverAnimation = ReGui:SetAnimation(Object, "Inputs")

		local Label = Canvas:Label({
			Parent = Object, 
			Text = LabelText,
			Position = UDim2.new(1, 4),
			Size = UDim2.fromScale(0, 1)
		})

		Merge(Config, {
			Grab = Grab,
			Name = LabelText,
		})

		--// Temporary solution
		if Type == "Slider" then
			Track.Position = UDim2.fromOffset(GrabSize.X/2, 0)
			Track.Size = UDim2.new(1, -GrabSize.X, 1, 0)
		end

		local Types = {
			["Slider"] = function(Percentage)
				return {
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(Percentage, 0.5)
				}
			end,
			["Progress"] = function(Percentage)
				return {
					Size = UDim2.fromScale(Percentage, 1)
				}
			end,
			["Snap"] = function(Percentage, Value, Minimum, Maximum)
				local X = (math.round(Value) - Minimum) / Maximum
				return {
					Size = UDim2.fromScale(1 / Maximum, 1),
					Position = UDim2.fromScale(X, 0.5)
				}
			end,
		}

		local function Callback(...)
			local func = Config.Callback
			return func(Class, ...)
		end

		function Config:SetDisabled(Disabled: boolean)
			self.Disabled = Disabled
			Object.Interactable = not Disabled
			Canvas:SetColorTags({
				[Label] = Disabled and "LabelDisabled" or "Label"
			}, true)
			return self
		end

		function Config:SetValueText(Text: string)
			ValueText.Text = tostring(Text)
		end

		function Config:SetValue(Value, IsPercentage: boolean)
			local Tweeninfo = Canvas:GetThemeKey("AnimationTweenInfo")

			local Minimum = Config.Minimum
			local Maximum = Config.Maximum

			local Percentage = Value
			local Difference = Maximum - Minimum

			--// Convert Value into a Percentage
			if not IsPercentage then
				Percentage = (Value - Minimum) / Difference
			else
				--// Convert Percentage into Value
				Value = Minimum + (Difference * Percentage)
			end

			--// Clamp the percentage to ensure the grab stays within bounds
			Percentage = math.clamp(Percentage, 0, 1)

			--// Get properties for the Grab
			local Props = Types[Type](Percentage, Value, Minimum, Maximum) 

			--// Animate
			Animation:Tween({
				Object = Grab,
				Tweeninfo = Tweeninfo,
				NoAnimation = NoAnimation,
				EndProperties = Props
			})

			--// Update object state
			self.Value = Value
			self:SetValueText(Format:format(Value, Maximum))

			--// Fire callback
			Callback(Value)

			return self
		end

		local function SetFocused(Focused: boolean)
			--// Update object colors from a style
			Canvas:SetColorTags({
				[Object] = Focused and "FrameActive" or "Frame"
			}, true)
			Canvas:SetElementFocused(Object, {
				Focused = Focused,
				Animation = HoverAnimation
			})
		end

		------// Move events
		local function CanDrag()
			if Config.Disabled then return end
			if Config.ReadOnly then return end

			return true 
		end
		local function DragMovement(InputPosition)
			if not CanDrag() then return end

			--// Track Position and Size
			local TrackLeft = Track.AbsolutePosition.X
			local TrackWidth = Track.AbsoluteSize.X

			--// Get the mouse position relative to the track
			local MouseX = InputPosition.X
			local RelativeX = MouseX - TrackLeft

			--// Get the percentage based on the width of the track
			local Percentage = math.clamp(RelativeX / TrackWidth, 0, 1)

			Config:SetValue(Percentage, true)
		end
		local function DragBegan(...)
			if not CanDrag() then return end

			SetFocused(true)

			if not NoClick then
				DragMovement(...)
			end
		end
		local function DragEnded()
			SetFocused(false)
		end

		--// Update object state
		Grab.Visible = not NoGrab
		Config:SetValue(Value) -- Ensure the grab is positioned correctly on initialization
		Config:SetDisabled(Disabled)

		Canvas:TagElements({
			[ValueText] = "Label",
			[Grab] = "SliderGrab"
		})

		--// Connect movement events
		ReGui:ConnectDrag(Track, {
			DragStart = DragBegan,
			DragMovement = DragMovement,
			DragEnd = DragEnded,
		})

		return Class, Object
	end,
})

export type SliderEnumFlags = {
	Items: {
		[number]: any
	},
	Label: string,
	Value: number,
} & SliderIntFlags
ReGui:DefineElement("SliderEnum", {
	Base = {
		Items = {},
		Label = "Slider Enum",
		Type = "Snap",
		Minimum = 1,
		Maximum = 10,
		Value = 1,
		Callback = EmptyFunction,
		ColorTag = "Frame"
	},
	Create = function(self, Config: SliderEnumFlags)
		--// Unpack configuration
		local Callback = Config.Callback
		local Value = Config.Value

		local function Calculate(self, Value: number)
			Value = math.round(Value)

			--// Dynamic size
			local Items = self.Items
			self.Maximum = #Items

			--// Get value from array
			return Items[Value]
		end

		--// Custom callback for the Enum type
		Config.Callback = function(self, Index, NoCallback: boolean)
			local Value = Calculate(self, Index)
			self:SetValueText(Value)

			Config.Value = Value

			return Callback(self, Value)
		end

		Calculate(Config, Value)

		--// Create object 
		return self:SliderBase(Config)
	end,
})

ReGui:DefineElement("SliderInt", {
	Base = {
		Label = "Slider Int",
		ColorTag = "Frame",
	},
	Create = Elements.SliderBase,
})

ReGui:DefineElement("SliderFloat", {
	Base = {
		Label = "Slider Float",
		Format = "%.3f", --"%.3f/%s",
		ColorTag = "Frame",
	},
	Create = Elements.SliderBase,
})

export type DragIntFlags = {
	Format: string?,
	Label: string?,
	Callback: (DragIntFlags, number) -> any,
	Minimum: number?,
	Maximum: number?,
	Value: number?,
	ReadOnly: boolean?,

	SetValue: (DragIntFlags, number) -> DragIntFlags,
}
ReGui:DefineElement("DragInt", {
	Base = {
		Format = "%.f",
		Label = "Drag Int",
		Callback = EmptyFunction,
		Minimum = 0,
		Maximum = 100,
		ColorTag = "Frame",
		Disabled = false
	},
	Create = function(Canvas, Config: DragIntFlags)
		--// Unpack config
		local Value = Config.Value or Config.Minimum
		local Format = Config.Format
		local LabelText = Config.Label
		local Disabled = Config.Disabled

		--// Create slider element
		local Object = ReGui:InsertPrefab("Slider")
		local Class = ReGui:MergeMetatables(Config, Object)

		local Track = Object.Track
		local ValueText = Track.ValueText
		local Grab = Track.Grab
		Grab.Visible = false

		local Drag = ReGui:GetChildOfClass(Track, "UIDragDetector")

		local Label = Canvas:Label({
			Parent = Object, 
			Text = LabelText,
			Position = UDim2.new(1, 7),
			Size = UDim2.fromScale(0, 1)
		})

		local InputBeganPosition = nil
		local Percentage = 0
		local BeganPercentage = 0

		--// Set object animations
		local HoverAnimation = ReGui:SetAnimation(Object, "Inputs")

		local function Callback(...)
			local Func = Config.Callback
			return Func(Class, ...)
		end

		function Config:SetValue(Value: number, IsPercentage: boolean)
			local Minimum = self.Minimum
			local Maximum = self.Maximum

			local Difference = Maximum - Minimum

			--// Convert Value into a Percentage
			if not IsPercentage then
				Percentage = ((Value - Minimum) / Difference) * 100
			else
				--// Convert Percentage into Value
				Value = Minimum + (Difference * (Percentage / 100))
			end

			Value = math.clamp(Value, Minimum, Maximum)

			--// Update object state
			self.Value = Value
			ValueText.Text = Format:format(Value, Maximum) 

			--// Fire callback
			Callback(Value)

			return self
		end
		function Config:SetDisabled(Disabled: boolean)
			self.Disabled = Disabled

			Canvas:SetColorTags({
				[Label] = Disabled and "LabelDisabled" or "Label"
			}, true)
		end

		local function SetFocused(Focused: boolean)
			--// Update object colors from a style
			Canvas:SetColorTags({
				[Object] = Focused and "FrameActive" or "Frame"
			}, true)

			Canvas:SetElementFocused(Object, {
				Focused = Focused,
				Animation = HoverAnimation
			})
		end

		------// Move events
		local function CanDrag(): boolean
			if Config.Disabled then return end
			if Config.ReadOnly then return end

			return true
		end
		local function DragStart(InputPosition)
			if not CanDrag() then return end
			SetFocused(true)

			InputBeganPosition = InputPosition
			BeganPercentage = Percentage
		end
		local function DragMovement(InputPosition)
			if not CanDrag() then return end

			local Delta = InputPosition.X - InputBeganPosition.X
			local New = BeganPercentage + (Delta/2)

			Percentage = math.clamp(New, 0, 100)
			Config:SetValue(Percentage, true)
		end
		local function DragEnded()
			SetFocused(false)
		end

		--// Update object state
		Config:SetValue(Value)
		Config:SetDisabled(Disabled)

		--// Connect movement events
		ReGui:ConnectDrag(Track, {
			DragStart = DragStart,
			DragEnd = DragEnded,
			DragMovement = DragMovement,
		})

		Canvas:TagElements({
			[ValueText] = "Label"
		})

		return Class, Object
	end,
})

ReGui:DefineElement("DragFloat", {
	Base = {
		Format = "%.3f", --"%.3f/%s",
		Label = "Drag Float",
		ColorTag = "Frame"
	},
	Create = Elements.DragInt,
})

ReGui:DefineElement("MultiElement", {
	Base = {
		Callback = EmptyFunction,
		Label = "",
		Disabled = false,
		BaseInputConfig = {},
		InputConfigs = {},
		Value = {},
		Minimum = {},
		Maximum = {},
		MultiCallback = EmptyFunction,
	},
	Create = function(Canvas, Config)
		--// Unpack configuration
		local LabelText = Config.Label
		local BaseInputConfig = Config.BaseInputConfig
		local InputConfigs = Config.InputConfigs
		local InputType = Config.InputType
		local Disabled = Config.Disabled
		local Value = Config.Value
		local Minimum = Config.Minimum
		local Maximum = Config.Maximum

		assert(InputType, "No input type provided for MultiElement")
		--assert(#Minimum ~= #InputConfigs, `Minimum does not match input count ({Minimum} != {#InputConfigs})`)
		--assert(#Maximum ~= #InputConfigs, `Maximum does not match input count ({Maximum} != {#InputConfigs})`)

		--// Create container row
		local ContainerRow, Object = Canvas:Row({
			Spacing = 4
		})

		local Row = ContainerRow:Row({
			Size = UDim2.fromScale(0.65, 0),
			Expanded = true,
		})

		local Label = ContainerRow:Label({
			Size = UDim2.fromScale(0.35, 0),
			LayoutOrder = 2,
			Text = LabelText
		})

		local Class = ReGui:MergeMetatables(Config, ContainerRow)
		local Inputs = {}
		local _CallbackEnabled = false

		local function GetValue()
			local Value = {}
			for Index, Input in Inputs do
				Value[Index] = Input:GetValue()
			end

			Config.Value = Value
			return Value
		end

		local function Callback(...)
			local Callback = Config.MultiCallback
			Callback(Class, ...)
		end

		local function InputChanged()
			--// Check if all the elements have loaded
			if #Inputs ~= #InputConfigs then return end
			if not _CallbackEnabled then return end

			local Values = GetValue()
			Callback(Values)
		end

		function Config:SetDisabled(Disabled: boolean)
			self.Disabled = Disabled

			--// Chaneg the tag of the Label
			Canvas:SetColorTags({
				[Label] = Disabled and "LabelDisabled" or "Label"
			}, true)

			--// Set state of each Drag element
			for _, Input in Inputs do
				Input:SetDisabled(Disabled)
			end
		end

		function Config:SetValue(Values)
			_CallbackEnabled = false

			--// Invoke :SetValue on each input object
			for Index, Value in Values do
				local Input = Inputs[Index]
				assert(Input, `No input object for index: {Index}`)

				Input:SetValue(Value)
			end

			_CallbackEnabled = true
			Callback(Values)
		end

		--// BaseInputConfig
		BaseInputConfig = Copy(BaseInputConfig, {
			Size = UDim2.new(1, 0, 0, 19),
			Label = "",
			Callback = InputChanged,
		})

		--// Create DragInt elements
		for Index, Overwrites in InputConfigs do
			local Config = Copy(BaseInputConfig, Overwrites)
			ReGui:CheckConfig(Config, {
				Minimum = Minimum[Index],
				Maximum = Maximum[Index],
			})

			--// Create input object
			local Input = Row[InputType](Row, Config)
			table.insert(Inputs, Input)
		end

		--// Merge properties into the configuration
		Merge(Config, {
			Row = Row,
			Inputs = Inputs
		})

		_CallbackEnabled = true

		--// Update object states
		Config:SetDisabled(Disabled)
		Config:SetValue(Value)

		return Class, Object
	end,
})

local function GenerateMultiInput(Name: string, Class: string, InputCount: number, Extra)
	ReGui:DefineElement(Name, {
		Base = {
			Label = Name,
			Callback = EmptyFunction,
			InputType = Class,
			InputConfigs = table.create(InputCount, {}),
			BaseInputConfig = {},
		},
		Create = function(self, Config)
			local BaseInputConfig = Config.BaseInputConfig
			local Object = nil

			if Extra then
				Merge(BaseInputConfig, Extra)
			end

			ReGui:CheckConfig(BaseInputConfig, {
				ReadOnly = Config.ReadOnly,
				Format = Config.Format,
			})

			Config.MultiCallback = function(...)
				local Callback = Config.Callback
				Callback(...)
			end

			return self:MultiElement(Config)
		end,
	})
end

export type InputColor3Flags = {
	Label: string?,
	Value: Color3?,
	Callback: (InputColor3Flags, Value: Color3) -> any,

	ValueChanged: (InputColor3Flags) -> nil,
	SetValue: (InputColor3Flags, Value: Color3) -> InputColor3Flags,
}
local function GenerateColor3Input(Name: string, InputType: string, InputCount: number, Extra)
	Extra = Extra or {}
	ReGui:DefineElement(Name, {
		Base = {
			Label = Name,
			Callback = EmptyFunction,
			Value = ReGui.Accent.Light,
			Disabled = false,
			Minimum = {0,0,0},
			Maximum = {255,255,255,100},
			BaseInputConfig = {},
			InputConfigs = {
				[1] = {Format = "R: %.f"},
				[2] = {Format = "G: %.f"},
				[3] = {Format = "B: %.f"},
			}
		},
		Create = function(self, Config: InputColor3Flags)
			--// Unpack configuration
			local BaseInputConfig = Config.BaseInputConfig
			local InputConfigs = Config.InputConfigs
			local Value = Config.Value
			local Disabled = Config.Disabled
			
			--// Add alpha slider
			if Extra.Color4 then
				InputConfigs[4] = {Format = "A: %.f"}
			end

			--// Create Object
			local InputConfig = Copy(Config, {
				Value = {1,1,1},
				Callback = function(self, ...)
					if Config.ValueChanged then
						Config:ValueChanged(...)
					end
				end,
			})

			local Element, Object = self[InputType](self, InputConfig)
			local Class = ReGui:MergeMetatables(Config, Element)
			local Row = Element.Row

			--// Preview frame
			local Preview = Row:Button({
				BackgroundTransparency = 0,
				Size = UDim2.fromOffset(19, 19),
				UiPadding = 0,
				Text = "",
				Ratio = 1,
				ColorTag = "",
				ElementStyle = ""
			})

			local function Callback(...)
				local func = Config.Callback
				return func(Class, ...)
			end

			local function SetPreview(Color: Color3)
				Preview.BackgroundColor3 = Color
				Callback(Color)
			end

			function Config:ValueChanged(Value)
				local R, G, B = Value[1], Value[2], Value[3]
				local Color = Color3.fromRGB(R, G, B)

				self.Value = Color
				SetPreview(Color)
			end

			function Config:SetValue(Color: Color3)
				self.Value = Color
				SetPreview(Color)

				--// Update Drag elements
				Element:SetValue({
					math.round(Color.R*255),
					math.round(Color.G*255),
					math.round(Color.B*255)
				})
			end

			--// Update object state
			Config:SetValue(Value)

			return Class, Object
		end,
	})
end

export type InputCFrameFlags = {
	Label: string?,
	Value: CFrame?,
	Callback: (InputCFrameFlags, Value: CFrame) -> any,

	ValueChanged: (InputCFrameFlags) -> nil,
	SetValue: (InputCFrameFlags, Value: CFrame) -> InputCFrameFlags,
}
local function GenerateCFrameInput(Name: string, InputType: string, InputCount: number, Extra)
	ReGui:DefineElement(Name, {
		Base = {
			Label = Name,
			Callback = EmptyFunction,
			Disabled = false,
			Value = CFrame.new(10,10,10),
			Minimum = CFrame.new(0,0,0),
			Maximum = CFrame.new(100,100,100),
			BaseInputConfig = {},
			InputConfigs = {
				[1] = {Format = "X: %.f"},
				[2] = {Format = "Y: %.f"},
				[3] = {Format = "Z: %.f"}
			}
		},
		Create = function(self, Config: InputCFrameFlags)
			--// Unpack configuration
			local BaseInputConfig = Config.BaseInputConfig
			local Value = Config.Value
			local Disabled = Config.Disabled
			local Maximum = Config.Maximum
			local Minimum = Config.Minimum

			local InputConfig = Copy(Config, {
				Maximum = {Maximum.X, Maximum.Y, Maximum.Z},
				Minimum = {Minimum.X, Minimum.Y, Minimum.Z},
				Value = {Value.X, Value.Y, Value.Z},
				Callback = function(self, ...)
					if Config.ValueChanged then
						Config:ValueChanged(...)
					end
				end,
			})

			--// Create Object
			local Element, Object = self[InputType](self, InputConfig)
			local Class = ReGui:MergeMetatables(Config, Element)
			local Row = Element.Row
			
			local function Callback(...)
				local func = Config.Callback
				return func(Class, ...)
			end

			function Config:ValueChanged(Values)
				local X, Y, Z = Values[1], Values[2], Values[3]
				local Value = CFrame.new(X, Y, Z)
				self.Value = Value
				Callback(Value)
			end

			function Config:SetValue(Value: CFrame)
				self.Value = Value

				--// Update Drag elements
				Element:SetValue({
					math.round(Value.X),
					math.round(Value.Y),
					math.round(Value.Z)
				})
			end

			--// Update object state
			Config:SetValue(Value)

			return Class, Object
		end,
	})
end

GenerateMultiInput("InputInt2", "InputInt", 2, {NoButtons=true})
GenerateMultiInput("InputInt3", "InputInt", 3, {NoButtons=true})
GenerateMultiInput("InputInt4", "InputInt", 4, {NoButtons=true})
GenerateMultiInput("SliderInt2", "SliderInt", 2)
GenerateMultiInput("SliderInt3", "SliderInt", 3)
GenerateMultiInput("SliderInt4", "SliderInt", 4)
GenerateMultiInput("SliderFloat2", "SliderFloat", 2)
GenerateMultiInput("SliderFloat3", "SliderFloat", 3)
GenerateMultiInput("SliderFloat4", "SliderFloat", 4)
GenerateMultiInput("DragInt2", "DragInt", 2)
GenerateMultiInput("DragInt3", "DragInt", 3)
GenerateMultiInput("DragInt4", "DragInt", 4)
GenerateMultiInput("DragFloat2", "DragFloat", 2)
GenerateMultiInput("DragFloat3", "DragFloat", 3)
GenerateMultiInput("DragFloat4", "DragFloat", 4)

GenerateColor3Input("InputColor3", "InputInt3")
GenerateColor3Input("SliderColor3", "SliderInt3")
GenerateColor3Input("DragColor3", "DragInt3")

GenerateCFrameInput("InputCFrame", "InputInt3")
GenerateCFrameInput("SliderCFrame", "SliderInt3")
GenerateCFrameInput("DragCFrame", "DragInt3")

ReGui:DefineElement("SliderProgress", {
	Base = {
		Label = "Slider Progress",
		Type = "Progress",
		ColorTag = "Frame",
	},
	Create = Elements.SliderBase,
})

export type ProgressBar = {
	SetPercentage: (ProgressBar, Value: number) -> nil
}
ReGui:DefineElement("ProgressBar", {
	Base = {
		Label = "Progress Bar",
		Type = "Progress",
		ReadOnly = true,
		MinValue = 0,
		MaxValue = 100,
		Format = "% i%%",
		Interactable = false,
		ColorTag = "Frame"
	},
	Create = function(self, Config)
		function Config:SetPercentage(Value: number)
			Config:SetValue(Value)
		end

		local Slider, Object = self:SliderBase(Config)
		local Grab = Slider.Grab

		self:TagElements({
			[Grab] = {
				BackgroundColor3 = "ProgressBar"
			}
		})

		return Slider, Object
	end,
})

export type Combo = {
	Label: string?,
	Placeholder: string?,
	Callback: ((Combo, Value: any) -> any)?,
	Items: {[number?]: any}?,
	GetItems: (() -> table)?,
}
ReGui:DefineElement("Combo", {
	Base = {
		Value = "",
		Placeholder = "",
		Callback = EmptyFunction,
		Items = {},
		Disabled = false,
		WidthFitPreview = false,
		Label = "Combo"
	},
	Create = function(Canvas, Config: Combo)
		--// Unpack configuration
		local Placeholder = Config.Placeholder
		local NoAnimation = Config.NoAnimation
		local Selected = Config.Selected
		local LabelText = Config.Label
		local Disabled = Config.Disabled
		local WidthFitPreview = Config.WidthFitPreview
		--local NoPreview = Config.NoPreview

		--// Create combo element
		local Object = ReGui:InsertPrefab("Combo", Config)
		local Class = ReGui:MergeMetatables(Config, Object)

		local Combo = Object.Combo
		local Dropdown = nil
		
		--// Elements
		local ValueText = Canvas:Label({
			Text = tostring(Placeholder),
			Parent = Combo,
			--Visible = not NoPreview,
			Name = "ValueText"
		})
		local ArrowButton = Canvas:ArrowButton({
			Parent = Combo,
			Interactable = false,
			Size = UDim2.fromOffset(19, 19),
			LayoutOrder = 2,
		})
		local Label = Canvas:Label({
			Text = LabelText,
			Parent = Object,
			LayoutOrder = 2,
		})

		--// Enable automatic sizes
		if WidthFitPreview then
			ReGui:SetProperties(Object, {
				AutomaticSize = Enum.AutomaticSize.XY,
				Size = UDim2.new(0, 0, 0, 0)
			})
			ReGui:SetProperties(Combo, {
				AutomaticSize = Enum.AutomaticSize.XY,
				Size = UDim2.fromScale(0, 1)
			})
		end

		local function Callback(Value, ...)
			Config:SetOpen(false)
			return Config.Callback(Class, Value, ...)
		end

		local function SetAnimationState(Open: boolean, NoAnimation: boolean?)
			local Tweeninfo = Canvas:GetThemeKey("AnimationTweenInfo")

			Object.Interactable = not Open

			--// Animate Arrow button
			Animation:HeaderCollapseToggle({
				Tweeninfo = Tweeninfo,
				NoAnimation = NoAnimation,
				Collapsed = not Open,
				Toggle = ArrowButton.Icon,
			})
		end

		local function GetItems()
			local GetItems = Config.GetItems
			local Items = Config.Items

			--// Invoke the GetItems function
			if GetItems then
				return GetItems()
			end

			--// Return Dict/Array
			return Items
		end

		function Config:SetValueText(Value: string?)
			ValueText.Text = tostring(Value)
		end
		
		function Config:ClosePopup()
			if Dropdown then
				Dropdown:ClosePopup(true)
			end
		end

		function Config:SetDisabled(Disabled: boolean)
			self.Disabled = Disabled
			Object.Interactable = not Disabled
			Canvas:SetColorTags({
				[Label] = Disabled and "LabelDisabled" or "Label"
			}, true)
		end

		function Config:SetValue(Selected)
			local Items = GetItems()
			local DictValue = Items[Selected]
			local Value = DictValue or Selected

			self.Selected = Selected
			self.Value = Value
			
			self:ClosePopup()

			--// Update Value text with selected item
			if typeof(Selected) == "number" then
				self:SetValueText(Value)
			else
				self:SetValueText(Selected)
			end

			return Callback(Selected, Value)
		end

		function Config:SetOpen(Open: boolean)
			local Selected = self.Selected

			self.Open = Open
			SetAnimationState(Open, NoAnimation)

			if not Open	then 
				--// Close open dropdown
				self:ClosePopup()
				return 
			end

			--// Create dropdown
			Dropdown = Canvas:Dropdown({
				RelativeTo = Combo,
				Items = GetItems(),
				Selected = Selected,
				OnSelected = function(...)
					Config:SetValue(...)
				end,
				OnClosed = function()
					self:SetOpen(false)
				end,
			})

			return self
		end

		local function ToggleOpen()
			local IsOpen = Config.Open
			Config:SetOpen(not IsOpen)
		end

		--// Connect events
		Combo.Activated:Connect(ToggleOpen)

		--// Update object state
		SetAnimationState(false, true)
		Config:SetDisabled(Disabled)

		if Selected then
			Config:SetValue(Selected)
		end

		--// Set object animations
		ReGui:SetAnimation(Combo, "Inputs")

		Canvas:TagElements({
			[Combo] = "Frame",
		})

		return Class, Object 
	end,
})

--ReGui:DefineElement("ComboFilter", {
--	Base = {
--		Value = "",
--		Placeholder = "",
--		Callback = EmptyFunction,
--		Items = {},
--		Disabled = false,
--		Label = "Combo Filter"
--	},
--	Create = function(Canvas, Config: Combo)
--		--// Unpack configuration
--		local Placeholder = Config.Placeholder
--		local NoAnimation = Config.NoAnimation
--		local Selected = Config.Selected
--		local LabelText = Config.Label
--		local Disabled = Config.Disabled

--		local InputConfig = Copy(Config, {
--			Callback = function(self, ...)
--				print("InputText", ...)

--				if Config.ResolveQuery then
--					print("ResolveQuery", ...)
--					Config:ResolveQuery(...)
--				end
--			end,
--		})

--		--// Create inputText element
--		local Object = Canvas:InputText(InputConfig)
--		local Class = ReGui:MergeMetatables(Config, Object)
--		local Dropdown = nil

--		local function Callback(Value, ...)
--			local Func = Config.Callback
--			Config:SetOpen(false)

--			return Func(Class, Value, ...)
--		end

--		local function GetItems()
--			local GetItems = Config.GetItems
--			local Items = Config.Items

--			--// Invoke the GetItems function
--			if GetItems then
--				return GetItems()
--			end

--			--// Return Dict/Array
--			return Items
--		end

--		function Config:SetDropdownVisible(Visible: boolean)
--			if self.Open == Visible then return end
--			self.Open = Visible

--			--// Close open dropdown
--			if not Visible	then 
--				if Dropdown then
--					Dropdown:Close()
--				end
--				return 
--			end

--			--// Create dropdown
--			Dropdown = Canvas:Dropdown({
--				ParentObject = Object,
--				Selected = Selected,
--				OnSelected = function(...)
--					Config:SetValue(...)
--				end,
--				OnClosed = function()
--					self:SetOpen(false)
--				end,
--			})
--		end

--		function Config:ResolveQuery(Query: string)
--			local Items = GetItems()
--			local Sorted = SortByQuery(Items, Query)

--			--// Create dropdown
--			self:SetDropdownVisible(true)

--			--// Set dropdown items
--			Dropdown:SetItems(Sorted, 1)
--		end

--		function Config:SetValue(Selected)
--			--local Items = GetItems()

--			--local DictValue = Items[Selected]
--			--local Value = DictValue or Selected

--			--self.Selected = Selected
--			--self.Value = Value

--			----// Update Value text with selected item
--			--if typeof(Selected) == "number" then
--			--	self:SetValueText(Value)
--			--else
--			--	self:SetValueText(Selected)
--			--end

--			--return Callback(Selected, Value)
--		end

--		return Class, Object 
--	end,
--})

local WindowClass = {
	--// Icons
	TileBarConfig = {
		Close = {
			Image = ReGui.Icons.Close,
			IconPadding = UDim.new(0, 3)
		},
		Collapse = {
			Image = ReGui.Icons.Arrow,
			IconPadding = UDim.new(0, 3)
		},
	},

	CloseCallback = EmptyFunction, --// Placeholder

	--// States
	Collapsible = true,
	Open = true,
	Focused = false
}

function WindowClass:Tween(Data)
	ReGui:CheckConfig(Data, {
		Tweeninfo = self:GetThemeKey("AnimationTweenInfo")
	})
	return Animation:Tween(Data)
end

function WindowClass:TagElements(Objects: ObjectTable)
	local Debug = ReGui.Debug

	--// Unpack WindowClass
	local Elements = self.TagsList
	local Theme = self.Theme

	ReGui:MultiUpdateColors({
		Theme = Theme,
		TagsList = Elements,
		Objects = Objects
	})
end

export type TitleBarCanvas = {
	Right: table,
	Left: table,
}
function WindowClass:MakeTitleBarCanvas(): TitleBarCanvas
	local TitleBar = self.TitleBar

	--// Create canvas for each side
	local Canvas = ReGui:MakeCanvas({
		WindowClass = self,
		Element = TitleBar
	})
	self.TitleBarCanvas = Canvas

	return Canvas
end

function WindowClass:AddDefaultTitleButtons()
	local Config = self.TileBarConfig
	local TitleBar = self.TitleBar

	local Toggle = Config.Collapse
	local Close = Config.Close

	--// Check for Titlebar canvas
	local Canvas = self.TitleBarCanvas
	if not Canvas then
		Canvas = self:MakeTitleBarCanvas()
	end

	ReGui:CheckConfig(self, {
		--// Create window interaction buttons
		Toggle = Canvas:RadioButton({
			Icon = Toggle.Image,
			IconPadding = Toggle.IconPadding,
			LayoutOrder = 1,
			Ratio = 1,
			Size = UDim2.new(0, 0),
			Callback = function()
				self:ToggleCollapsed()
			end,
		}),
		CloseButton = Canvas:RadioButton({
			Icon = Close.Image,
			IconPadding = Close.IconPadding,
			LayoutOrder = 3,
			Ratio = 1,
			Size = UDim2.new(0, 0),
			Callback = function()
				self:SetVisible(false)
			end,
		}),
		TitleLabel = Canvas:Label({
			ColorTag = "Title",
			LayoutOrder = 2,
			Size = UDim2.new(1, 0),
			Active = false,
			Fill = true,
			ClipsDescendants = true,
			AutomaticSize = Enum.AutomaticSize.XY
		})
	})

	--// Registor Elements into Window class
	self:TagElements({
		[self.TitleLabel] = "WindowTitle"
	})
end

function WindowClass:Close()
	local Callback = self.CloseCallback

	--// Test for interupt
	if Callback then
		local ShouldClose = Callback(self)
		if ShouldClose == false then return end
	end

	self:Remove()
end

function WindowClass:SetVisible(Visible: boolean): WindowClass
	local Window = self.WindowFrame
	local NoFocusOnAppearing = self.NoFocusOnAppearing

	self.Visible = Visible
	Window.Visible = Visible

	--// Update window focus
	if Visible and not NoFocusOnAppearing then
		ReGui:SetFocusedWindow(self)
	end

	return self
end

function WindowClass:ToggleVisibility(Visible: boolean): WindowClass
	local IsVisible = self.Visible
	self:SetVisible(not IsVisible)
end

function WindowClass:GetWindowSize(): Vector2
	return self.WindowFrame.AbsoluteSize
end

function WindowClass:GetTitleBarSizeY(): number
	local TitleBar = self.TitleBar
	return TitleBar.Visible and TitleBar.AbsoluteSize.Y or 0
end

function WindowClass:SetTitle(Text: string?): WindowClass
	self.TitleLabel.Text = tostring(Text)
	return self
end

function WindowClass:SetPosition(Position): WindowClass
	self.WindowFrame.Position = Position
	return self
end

function WindowClass:SetSize(Size: (Vector2|UDim2), NoAnimation: boolean): WindowClass
	local Window = self.WindowFrame
	
	--// Convert Vector2 to UDim2
	if typeof(Size) == "Vector2" then
		Size = UDim2.fromOffset(Size.X, Size.Y)
	end
	
	Window.Size = Size
	self.Size = Size

	return self
end

function WindowClass:SetCanvasInteractable(Interactable: boolean)
	local Body = self.Body 
	Body.Interactable = Interactable
end

function WindowClass:Center(): WindowClass --// Without an Anchor point
	local Size = self:GetWindowSize() / 2
	local Position = UDim2.new(0.5, -Size.X, 0.5, -Size.Y)

	self:SetPosition(Position)
	return self
end

function WindowClass:LoadStylesIntoElement(Data)
	local Flags = Data.Flags
	local Object = Data.Object
	local Canvas = Data.Canvas

	local TagFunctions = {
		["FrameRounding"] = function()
			if Flags.CornerRadius then return end
			if not Canvas then return end
			
			local UICorner = Object:FindFirstChild("FrameRounding", true)
			if not UICorner then return end
			
			Canvas:TagElements({
				[UICorner] = "FrameRounding"
			})
		end,
	}

	for Tag, Func in TagFunctions do
		local Value = self:GetThemeKey(Tag)
		if Value == nil then continue end

		task.spawn(Func, Value)
	end
end

function WindowClass:SetTheme(ThemeName: string): WindowClass
	local Themes = ReGui.ThemeConfigs

	local Elements = self.TagsList
	local Focused = self.Focused
	local WindowState = self.WindowState

	--// Use the current theme if no theme is defined
	if not ThemeName then
		ThemeName = self.Theme
	end

	--// Check if the theme actually exists
	assert(Themes[ThemeName], `{ThemeName} is not a valid theme!`)

	self.Theme = ThemeName

	--// Update elements with new colors
	ReGui:MultiUpdateColors({
		Animate = false,
		Theme = ThemeName,
		Objects = Elements
	})

	--// Refresh Focus styles
	self:SetFocusedColors(WindowState)

	return self
end

function WindowClass:SetFocusedColors(State: string)
	--// Unpack class values
	local WindowFrame = self.WindowFrame
	local TitleBar = self.TitleBar
	local Theme = self.Theme
	local TitleLabel = self.TitleLabel
	local Tweeninfo = self:GetThemeKey("AnimationTweenInfo")

	local Border = WindowFrame:FindFirstChildOfClass("UIStroke")
	
	--// Color tags
	local Tags = {
		Focused = {
			[Border] = "BorderActive",
			[TitleBar] = "TitleBarBgActive",
			[TitleLabel] = {
				TextColor3 = "TitleActive"
			}
		},
		UnFocused = {
			[Border] = "Border",
			[TitleBar] = "TitleBarBg",
			[TitleLabel] = {
				TextColor3 = "Title"
			}
		},
		Collapsed = {
			[Border] = "Border",
			[TitleBar] = "TitleBarBgCollapsed",
			[TitleLabel] = {
				TextColor3 = "Title"
			}
		}
	}
	
	--// Update colors
	ReGui:MultiUpdateColors({
		Tweeninfo = Tweeninfo,
		Animate = true,
		Objects = Tags[State],
		Theme = Theme,
	})
end

function WindowClass:SetFocused(Focused: true)
	Focused = Focused == nil and true or Focused
	
	--// Unpack class values
	local Collapsed = self.Collapsed
	local CurrentState = self.WindowState

	--// Update Window focus
	if Focused then
		ReGui:SetFocusedWindow(self)
	end

	--// Theme tags for Window state
	local NewState = Collapsed and "Collapsed" or Focused and "Focused" or "UnFocused"

	--// Check if the window state is identical
	if NewState == CurrentState then return end
	self.Focused = Focused
	self.WindowState = NewState
	
	--// Update colors
	self:SetFocusedColors(NewState)
end

function WindowClass:GetThemeKey(Key: string)
	return ReGui:GetThemeKey(self.Theme, Key)
end

function WindowClass:ResetColors(): WindowClass
	local Defaults = ReGui.Theme
	local Theme = self.Theme
	local Elements = self.TagsList

	--// Reset values
	table.clear(Theme)

	ReGui:MultiUpdateColors({
		Animate = false,
		Theme = Defaults,
		Objects = Elements
	})

	return WindowClass
end

function WindowClass:SetCollapsible(Collapsible: boolean): WindowClass
	self.Collapsible = Collapsible
	return self
end

function WindowClass:ToggleCollapsed(NoCheck: boolean?): WindowClass
	local Collapsed = self.Collapsed
	local Collapsible = self.Collapsible

	--// Check if the window can be opened
	if not NoCheck and not Collapsible then return self end

	self:SetCollapsed(not Collapsed)
	return self
end

function WindowClass:SetCollapsed(Collapsed: boolean, NoAnimation: false): WindowClass
	local Window = self.WindowFrame
	local Body = self.Body
	local Toggle = self.Toggle
	local ResizeGrab = self.ResizeGrab
	local OpenSize = self.Size
	local AutoSize = self.AutoSize
	local Tweeninfo = self:GetThemeKey("AnimationTweenInfo")

	local WindowSize = self:GetWindowSize()
	local TitleBarSizeY = self:GetTitleBarSizeY()

	local ToggleIcon = Toggle.Icon
	local ClosedSize = UDim2.fromOffset(WindowSize.X, TitleBarSizeY)

	self.Collapsed = Collapsed
	self:SetCollapsible(false)

	--// Change the window focus
	self:SetFocused(not Collapsed)

	--// Animate the closing
	Animation:HeaderCollapse({
		Tweeninfo = Tweeninfo,
		NoAnimation = NoAnimation,
		Collapsed = Collapsed,
		Toggle = ToggleIcon,
		Resize = Window,
		NoAutomaticSize = not AutoSize,
		Hide = Body,
		--// Sizes
		ClosedSize = ClosedSize,
		OpenSize = OpenSize,
		Completed = function()
			self:SetCollapsible(true)
		end
	})

	--// ResizeGrab
	self:Tween({
		Object = ResizeGrab,
		NoAnimation = NoAnimation,
		EndProperties = {
			TextTransparency = Collapsed and 1 or 0.6,
			Interactable = not Collapsed
		}
	})

	return self
end

function WindowClass:UpdateConfig(Config)
	local Flags = {
		NoTitleBar = function(Value)
			local Object = self.TitleBar
			Object.Visible = not Value
		end,
		NoClose = function(Value)
			local Object = self.CloseButton
			Object.Visible = not Value
		end,
		NoCollapse = function(Value)
			local Object = self.Toggle
			Object.Visible = not Value
		end,
		NoTabsBar = function(Value)
			local Object = self.WindowTabSelector
			if not Object then return end

			local TabsBar = Object.TabsBar
			TabsBar.Visible = not Value
		end,
		NoScrollBar = function(Value)
			local ScrollBarThickness = Value and 0 or 9
			local NoScroll = self.NoScroll
			local TabSelector = self.WindowTabSelector
			local ContentCanvas = self.ContentCanvas

			--// TabSelector
			if TabSelector then 
				TabSelector.Body.ScrollBarThickness = ScrollBarThickness
			end
			--// Check if the window is a scrolling type
			if not NoScroll then
				ContentCanvas.ScrollBarThickness = ScrollBarThickness
			end
		end,
		NoScrolling = function(Value)
			local NoScroll = self.NoScroll
			local TabSelector = self.WindowTabSelector
			local ContentCanvas = self.ContentCanvas

			if TabSelector then 
				TabSelector.Body.ScrollingEnabled = not Value
			end
			if not NoScroll then
				ContentCanvas.ScrollingEnabled = not Value
			end
		end,
		NoMove = function(Value)
			local Drag = self.DragConnection
			Drag:SetEnabled(not Value)
		end,
		NoResize = function(Value)
			local Drag = self.ResizeConnection
			Drag:SetEnabled(not Value)
		end,
		NoBackground = function(Value)
			local Transparency = self:GetThemeKey("WindowBgTransparency")
			local Frame = self.CanvasFrame
			Frame.BackgroundTransparency = Value and 1 or Transparency
		end,
	}

	--// Update class data
	Merge(self, Config)

	--// Invoke functions connected to flags
	for Key, Value in Config do
		local Func = Flags[Key]
		if Func then
			Func(Value)
		end
	end

	return self
end

--// Window removal function 
function WindowClass:Remove()
	local Window = self.WindowFrame
	local WindowClass = self.WindowClass
	local Windows = ReGui.Windows

	--// Remove Window from the Windows array
	local Index = table.find(Windows, WindowClass)
	if Index then
		table.remove(Windows, Index)
	end

	--// Destroy the Window frame
	Window:Destroy()
end

function WindowClass:MenuBar(Config, ...)
	local ContentCanvas = self.ContentCanvas
	local ContentFrame = self.ContentFrame
	
	Config = Config or {}
	
	Merge(Config, {
		Parent = ContentFrame,
		Layout = -1
	})
	
	return ContentCanvas:MenuBar(Config, ...)
end

export type WindowFlags = {
	AutoSize: string?,
	CloseCallback: (Window) -> boolean?,
	Collapsed: boolean?,
	IsDragging: boolean?,
	MinSize: Vector2?,
	Theme: any?,
	Title: string?,
	NoTabs: boolean?,
	NoMove: boolean?,
	NoResize: boolean?,
	NoTitleBar: boolean?,
	NoClose: boolean?,
	NoCollapse: boolean?,
	NoScrollBar: boolean?,
	NoSelectEffect: boolean?,
	NoFocusOnAppearing: boolean?,
	NoDefaultTitleBarButtons: boolean?,
	NoWindowRegistor: boolean?,
	OpenOnDoubleClick: boolean?,
	SetTheme: (Window, ThemeName: string) -> Window,
	SetTitle: (Window, Title: string) -> Window,
	UpdateConfig: (Window, Config: table) -> Window,
	SetCollapsed: (Window, Collapsed: boolean, NoAnimation: boolean?) -> Window,
	SetCollapsible: (Window, Collapsible: boolean) -> Window,
	SetFocused: (Window, Focused: boolean) -> Window,
	Center: (Window) -> Window,
	SetVisible: (Window, Visible: boolean) -> Window,
	TagElements: (Window, Objects: {
		[GuiObject]: string
	}) -> nil,
	Close: (Window) -> nil,
}
ReGui:DefineElement("Window", {
	Export = true,
	Base = {
		Theme = "DarkTheme",
		NoSelect = false,
		NoTabs = true,
		NoScroll = false,
		Collapsed = false,
		Visible = true,
		AutoSize = false,
		MinimumSize = Vector2.new(160, 90),
		OpenOnDoubleClick = true,
		NoAutoTheme = true,
		NoWindowRegistor = false,
		NoBringToFrontOnFocus = false,
		IsDragging = false,
	},
	Create = function(self, Config: WindowFlags)
		--// Global config unpack
		local Windows = ReGui.Windows
		local WindowsContainer = ReGui.Container.Windows

		ReGui:CheckConfig(Config, {
			Parent = WindowsContainer,
			Title = ReGui.DefaultTitle
		})

		--// Unpack config
		local NoTitleButtons = Config.NoDefaultTitleBarButtons
		local Collapsed = Config.Collapsed
		local MinimumSize = Config.MinimumSize
		local Title = Config.Title
		local NoTabs = Config.NoTabs
		local NoScroll = Config.NoScroll
		local Theme = Config.Theme
		local AutomaticSize = Config.AutomaticSize
		local NoWindowRegistor = Config.NoWindowRegistor
		local AutoSelectNewTabs = Config.AutoSelectNewTabs
		local OpenOnDoubleClick = Config.OpenOnDoubleClick
		local NoCollapse = Config.NoCollapse
		local _SelectDisabled = Config.Parent ~= WindowsContainer

		local CanvasConfig = {
			Scroll = not NoScroll,
			Fill = not AutomaticSize and true or nil,
			UiPadding = UDim.new(0, NoTabs and 8 or 0),
			AutoSelectNewTabs = AutoSelectNewTabs
		}

		--// Merge AutomaticSize configuration 
		if AutomaticSize then
			Merge(CanvasConfig, {
				AutomaticSize = AutomaticSize,
				Size = UDim2.new(1, 0)
			})
		end

		--// Create Window frame
		local Window: CanvasGroup = ReGui:InsertPrefab("Window", Config)
		local ContentFrame: Frame = Window.Content
		local TitleBar: Frame = ContentFrame.TitleBar

		--// Create window class
		local Class = NewClass(WindowClass)

		--// Content canvas
		local BaseCanvas = ReGui:MakeCanvas({
			Element = ContentFrame,
			WindowClass = Class,
			Class = Class
		})

		--// Create Window content canvas
		local Canvas, Body, WindowClass = nil, nil, nil
		local WindowCanvas, CanvasFrame = BaseCanvas:Canvas(Copy(CanvasConfig, {
			Parent = ContentFrame,
			CornerRadius = UDim.new(0, 0),
			--NoStyle = true
		}))
		
		--// Make the window resizable
		local ResizeConnection = ReGui:MakeResizable({
			MinimumSize = MinimumSize,
			Resize = Window,
			OnUpdate = function(Size)
				Class:SetSize(Size, true)
			end,
		})

		--// Merge tables
		Merge(Class, Config)
		Merge(Class, {
			WindowFrame = Window,  
			ContentFrame = ContentFrame,
			CanvasFrame = CanvasFrame,
			ResizeGrab = ResizeConnection.Grab,
			TitleBar = TitleBar,
			Elements = Elements,
			TagsList = {},
			_SelectDisabled = _SelectDisabled,

			--// Connections
			ResizeConnection = ResizeConnection,
			HoverConnection = ReGui:DetectHover(ContentFrame),
			DragConnection = ReGui:MakeDraggable({
				Grab = ContentFrame,
				Move = Window,
				SetPosition = function(self, Position: UDim2)
					local Tweeninfo = Canvas:GetThemeKey("AnimationTweenInfo")
					--// Tween frame element to the new size
					Animation:Tween({
						Tweeninfo = Tweeninfo,
						Object = self.Move,
						EndProperties = {
							Position = Position
						}
					})
				end,
				OnDragStateChange = function(IsDragging: boolean)
					Class.IsDragging = IsDragging
					CanvasFrame.Interactable = not IsDragging

					--// Change window focus on drag
					if IsDragging then
						ReGui:SetFocusedWindow(WindowClass)
					end

					--// Disable other window focuses if dragging
					ReGui:SetWindowFocusesEnabled(not IsDragging)
				end,
			}),
		})

		--// Create canvas for Window type
		if NoTabs then
			--// Window
			Canvas, Body = WindowCanvas, CanvasFrame
		else
			--// TabsWindow
			Canvas, Body = WindowCanvas:TabSelector(CanvasConfig)
			Class.WindowTabSelector = Canvas
		end

		--// Create Window class from Canvas and Class merge
		WindowClass = ReGui:MergeMetatables(Class, Canvas)

		--// Merge canvas data
		Merge(Class, {
			ContentCanvas = Canvas,
			WindowClass = WindowClass,
			Body = Body
		})

		--// Connect double click events to the collapse
		ReGui:ConnectMouseEvent(ContentFrame, {
			DoubleClick = true,
			OnlyMouseHovering = TitleBar,
			Callback = function(...)
				if not Class.OpenOnDoubleClick then return end
				if Class.NoCollapse then return end

				Class:ToggleCollapsed()
			end,
		})

		--// Create default title bar
		if not NoTitleButtons then
			Class:AddDefaultTitleButtons()
		end

		--// Update window UI
		Class:SetTitle(Title)
		Class:SetCollapsed(Collapsed, true)

		--// Update window configuration
		Class:SetTheme(Theme)
		Class:UpdateConfig(Config)

		--// Update selection
		Class:SetFocused()

		--// Register elements into Window Class
		local ResizeGrab = ResizeConnection.Grab
		ReGui:SetAnimation(ResizeGrab, "TextButtons")

		WindowClass:TagElements({
			[ResizeGrab] = "ResizeGrab",
			[TitleBar] = "TitleBar",
			[CanvasFrame] = "Window"
		})

		--// Append to Windows array
		if not NoWindowRegistor then
			table.insert(Windows, WindowClass)
		end

		return WindowClass, Window
	end,
})

export type TabsWindowFlags = {
	AutoSelectNewTabs: boolean?,
} & WindowFlags
ReGui:DefineElement("TabsWindow", {
	Export = true,
	Base = {
		NoTabs = false,
		AutoSelectNewTabs = true
	},
	Create = function(self, Config: TabsWindowFlags)
		return self:Window(Config)
	end,
})

export type PopupCanvas = {
	Scroll: boolean?,
	AutoClose: boolean?,
	RelativeTo: GuiObject,
	MaxSizeY: number?,
	MinSizeX: number?,
	MaxSizeX: number?,

	UpdateScale: (PopupCanvas) -> nil,
	UpdatePosition: (PopupCanvas) -> nil,
	ClosePopup: (PopupCanvas) -> nil,
	SetPopupVisible: (PopupCanvas, Visible: boolean) -> nil
}
ReGui:DefineElement("PopupCanvas", {
	Base = {
		AutoClose = false,
		Scroll = false,
		Visible = true,
		Spacing = UDim.new(0, 1),
		AutomaticSize = Enum.AutomaticSize.XY,
		MaxSizeY = 150,
		MinSizeX = 100,
		MaxSizeX = math.huge,
		OnClosed = EmptyFunction
	},
	Create = function(self, Config: PopupCanvas)
		Config.Parent = ReGui.Container.Overlays

		local RelativeTo = Config.RelativeTo
		local MaxSizeY = Config.MaxSizeY
		local MinSizeX = Config.MinSizeX
		local MaxSizeX = Config.MaxSizeX
		local Visible = Config.Visible
		local AutoClose = Config.AutoClose
		local NoAnimation = Config.NoAnimation

		--// Create object
		local Canvas, Object = self:OverlayScroll(Config)
		local UIStroke = Object.UIStroke

		local Padding = UIStroke.Thickness
		local Relative = Object.Parent.AbsolutePosition
		
		local Position, Size, YSize, XSize

		--// Connect mouse events
		local Hover = ReGui:DetectHover(Object, {
			MouseOnly = true,
			OnInput = function(MouseHovering, Input)
				if MouseHovering then return end
				if not Object.Visible then return end
				Config:OnFocusLost()
			end,
		})
		
		function Config:FetchScales()
			--// Roblox does not support UISizeConstraint on a scrolling frame grr
			local CanvasSize = Canvas:GetCanvasSize()
			
			Position = RelativeTo.AbsolutePosition
			Size = RelativeTo.AbsoluteSize
			
			YSize = math.clamp(CanvasSize.Y, Size.Y, MaxSizeY)
			XSize = math.clamp(Size.X, MinSizeX, MaxSizeX)
		end

		function Config:UpdatePosition()
			Object.Position = UDim2.fromOffset(
				Position.X - Relative.X + Padding,
				Position.Y - Relative.Y + Size.Y
			)
		end

		function Config:GetScale(Visible: boolean): UDim2
			local OpenSize = UDim2.fromOffset(XSize, YSize)
			local ClosedSize = UDim2.fromOffset(XSize, 0)
			
			return Visible and OpenSize or ClosedSize
		end
		
		function Config:IsMouseHovering(): boolean
			return Hover.Hovering
		end
		
		function Config:OnFocusLost()
			local OnClosed = self.OnClosed
			
			self:SetPopupVisible(false)
			OnClosed(self) -- Invoke closed callback
			
			--// Automatically destroy popup
			if AutoClose then
				self:ClosePopup()
			end
		end

		function Config:ClosePopup(Wait: boolean?)
			self:SetPopupVisible(false, NoAnimation, Wait)
			Hover:Disconnect()
			Object:Remove()
		end

		function Config:SetPopupVisible(Visible: boolean, Wait: boolean?)
			--// Check if the visiblity is the same
			if Object.Visible == Visible then return end
			
			RelativeTo.Interactable = not Visible
			self:UpdateScales(Visible, NoAnimation, Wait)
			self.Visible = Visible
		end
		
		function Config:UpdateScales(Visible: boolean, NoAnimation: boolean, Wait: boolean?)
			local Tweeninfo = Canvas:GetThemeKey("AnimationTweenInfo")
			
			if Visible == nil then 
				Visible = Object.Visible 
			end
			
			Config:FetchScales()
			Config:UpdatePosition()
			
			local Tween = Animation:Tween({
				Tweeninfo = Tweeninfo,
				Object = Object,
				NoAnimation = NoAnimation,
				EndProperties = {
					Size = Config:GetScale(Visible),
					Visible = Visible,
				}
			})
			
			--// Wait for tween to finish
			if Tween and Wait then
				Tween.Completed:Wait()
			end
		end
		
		--// Update object
		Config:UpdateScales(false, true)
		Config:SetPopupVisible(Visible)
		
		Canvas.OnChildChange:Connect(Config.UpdateScales)

		return Canvas, Object
	end,
})

ReGui:DefineElement("PopupModal", {
	Export = true,
	Base = {
		NoAnimation = false,
		NoCollapse = true,
		NoClose = true,
		NoResize = true,
		NoSelect = true,
		NoAutoFlags = true,
		NoWindowRegistor = true,
		NoScroll = true,
	},
	Create = function(self, Config: WindowFlags)
		Config.Parent = ReGui.Container.Overlays
		
		local WindowClass = self.WindowClass
		
		--// Unpack configuration
		local NoAnimation = Config.NoAnimation
		local WindowDimTweenInfo = nil

		--// Get addional configuration from the Window Class
		if WindowClass then 
			WindowDimTweenInfo = WindowClass:GetThemeKey("ModalWindowDimTweenInfo")
			Config.Theme = WindowClass.Theme
		end

		--// Create Effect object
		local ModalEffect = ReGui:InsertPrefab("ModalEffect", Config)

		--// Create window used for the modal
		local Window = self:Window(Copy(Config, {
			NoAutoFlags = false,
			Parent = ModalEffect,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.fromOffset(372, 38),
			AutomaticSize = Enum.AutomaticSize.Y
		}))

		function Config:ClosePopup()
			Animation:Tween({
				Object = ModalEffect,
				Tweeninfo = WindowDimTweenInfo,
				NoAnimation = NoAnimation,
				EndProperties = {
					BackgroundTransparency = 1
				},
				Completed = function()
					ModalEffect:Destroy()
				end
			})

			Window:Close()
		end

		--// Fade modal effect 
		Animation:Tween({
			Object = ModalEffect,
			Tweeninfo = WindowDimTweenInfo,
			NoAnimation = NoAnimation,
			StartProperties = {
				BackgroundTransparency = 1
			},
			EndProperties = {
				BackgroundTransparency = 0.8
			}
		})

		--// Tag elements into the theme
		self:TagElements({
			[ModalEffect] = "ModalWindowDim"
		})

		--// Create the modal class
		local ModalClass = ReGui:MergeMetatables(Config, Window)
		return ModalClass, ModalEffect
	end,
})

local PrefabsId = `rbxassetid://` .. ReGui.PrefabsId
ReGui:Init({
	Prefabs = game:GetService("InsertService"):LoadLocalAsset(PrefabsId),
})

return ReGui