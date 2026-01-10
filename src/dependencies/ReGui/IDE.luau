--!nocheck
--!nolint

--[[
	@author biggaboy212 & LorekeeperZinnia???
	@description Integrated Development Environment to view and edit code within a ROBLOX experience.
]]

local IDEVersion = "8.0"

--// Compatibility 
local NewReference = function(Ins): Instance 
	return Ins 
end

local Settings = {
	Theme = {
		Syntax = {
			Text = Color3.fromRGB(204, 204, 204),
			Background = Color3.fromRGB(20,20,20),
			Selection = Color3.fromRGB(255,255,255),
			SelectionBack = Color3.fromRGB(102, 161, 255),
			Operator = Color3.fromRGB(204, 204, 204),
			Number = Color3.fromRGB(255, 198, 0),
			String = Color3.fromRGB(172, 240, 148),
			Comment = Color3.fromRGB(102, 102, 102),
			Keyword = Color3.fromRGB(248, 109, 124),
			BuiltIn = Color3.fromRGB(132, 214, 247),
			LocalMethod = Color3.fromRGB(253, 251, 172),
			LocalProperty = Color3.fromRGB(97, 161, 241),
			Nil = Color3.fromRGB(255, 198, 0),
			Bool = Color3.fromRGB(255, 198, 0),
			Function = Color3.fromRGB(248, 109, 124),
			Local = Color3.fromRGB(248, 109, 124),
			Self = Color3.fromRGB(248, 109, 124),
			FunctionName = Color3.fromRGB(253, 251, 172),
			Bracket = Color3.fromRGB(204, 204, 204)
		},
	}
}

--// Service handlers
local Services = setmetatable({}, {
	__index = function(self, Name: string)
		local Service = game:GetService(Name)
		return NewReference(Service)
	end,
})

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

--// Services
local Players: Players = Services.Players
local UserInputService: UserInputService = Services.UserInputService
local RunService: RunService = Services.RunService
local TweenService: TweenService = Services.TweenService

local LocalPlayer = NewReference(Players.LocalPlayer)
local Mouse = NewReference(LocalPlayer:GetMouse())

local function Merge(Base, New)
	for Key, Value in next, New do
		Base[Key] = Value
	end
	return Base
end

local function InputTypeAllowed(Key, Type: string)
	local InputType = Key.UserInputType
	return table.find(UserInputTypes[Type], InputType)
end

local function NewInstance(...)
	return NewReference(Instance.new(...))
end

local function createSimple(class,props)
	local inst = NewInstance(class)
	for i,v in next,props do
		inst[i] = v
	end
	return inst
end

local Lib = {}
local cursor = NewInstance("Frame")

Lib.CheckMouseInGui = function(gui)
	if gui == nil then return false end
	local guiPosition = gui.AbsolutePosition
	local guiSize = gui.AbsoluteSize	

	return Mouse.X >= guiPosition.X and Mouse.X < guiPosition.X + guiSize.X and Mouse.Y >= guiPosition.Y and Mouse.Y < guiPosition.Y + guiSize.Y
end

Lib.Signal = (function()
	local funcs = {}

	local disconnect = function(con)
		local pos = table.find(con.Signal.Connections,con)
		if pos then table.remove(con.Signal.Connections,pos) end
	end

	funcs.Connect = function(self,func)
		if type(func) ~= "function" then error("Attempt to connect a non-function") end		
		local con = {
			Signal = self,
			Func = func,
			Disconnect = disconnect
		}
		self.Connections[#self.Connections+1] = con
		return con
	end

	funcs.Fire = function(self,...)
		for i,v in next,self.Connections do
			xpcall(coroutine.wrap(v.Func),function(e) warn(e.."\n"..debug.traceback()) end,...)
		end
	end

	local mt = {
		__index = funcs,
		__tostring = function(self)
			return "Signal: " .. tostring(#self.Connections) .. " Connections"
		end
	}

	local function new()
		local obj = {}
		obj.Connections = {}

		return setmetatable(obj,mt)
	end

	return {new = new}
end)()

Lib.CreateArrow = function(size,num,dir)
	local max = num
	local arrowFrame = createSimple("Frame",{
		BackgroundTransparency = 1,
		Name = "Arrow",
		Size = UDim2.new(0,size,0,size)
	})
	if dir == "up" then
		for i = 1,num do
			createSimple("Frame",{
				BackgroundColor3 = Color3.new(220/255,220/255,220/255),
				BorderSizePixel = 0,
				Position = UDim2.new(0,math.floor(size/2)-(i-1),0,math.floor(size/2)+i-math.floor(max/2)-1),
				Size = UDim2.new(0,i+(i-1),0,1),
				Parent = arrowFrame
			})
		end
		return arrowFrame
	elseif dir == "down" then
		for i = 1,num do
			createSimple("Frame",{
				BackgroundColor3 = Color3.new(220/255,220/255,220/255),
				BorderSizePixel = 0,
				Position = UDim2.new(0,math.floor(size/2)-(i-1),0,math.floor(size/2)-i+math.floor(max/2)+1),
				Size = UDim2.new(0,i+(i-1),0,1),
				Parent = arrowFrame
			})
		end
		return arrowFrame
	elseif dir == "left" then
		for i = 1,num do
			createSimple("Frame",{
				BackgroundColor3 = Color3.new(220/255,220/255,220/255),
				BorderSizePixel = 0,
				Position = UDim2.new(0,math.floor(size/2)+i-math.floor(max/2)-1,0,math.floor(size/2)-(i-1)),
				Size = UDim2.new(0,1,0,i+(i-1)),
				Parent = arrowFrame
			})
		end
		return arrowFrame
	elseif dir == "right" then
		for i = 1,num do
			createSimple("Frame",{
				BackgroundColor3 = Color3.new(220/255,220/255,220/255),
				BorderSizePixel = 0,
				Position = UDim2.new(0,math.floor(size/2)-i+math.floor(max/2)+1,0,math.floor(size/2)-(i-1)),
				Size = UDim2.new(0,1,0,i+(i-1)),
				Parent = arrowFrame
			})
		end
		return arrowFrame
	end
	error("")
end

Lib.FastWait = (function(arg)
	task.wait(arg)
end)

Lib.ScrollBar = (function()
	local funcs = {}
	local checkMouseInGui = Lib.CheckMouseInGui
	local createArrow = Lib.CreateArrow

	local function drawThumb(self)
		local total = self.TotalSpace
		local visible = self.VisibleSpace
		local scrollThumb = self.GuiElems.ScrollThumb
		local scrollThumbFrame = self.GuiElems.ScrollThumbFrame

		if not (self:CanScrollUp()	or self:CanScrollDown()) then
			scrollThumb.Visible = false
		else
			scrollThumb.Visible = true
		end

		if self.Horizontal then
			scrollThumb.Size = UDim2.new(visible/total,0,1,0)
			if scrollThumb.AbsoluteSize.X < 10 then
				scrollThumb.Size = UDim2.new(0,10,1,0)
			end
			local fs = scrollThumbFrame.AbsoluteSize.X
			local bs = scrollThumb.AbsoluteSize.X
			scrollThumb.Position = UDim2.new(self:GetScrollPercent()*(fs-bs)/fs,0,0,0)
		else
			scrollThumb.Size = UDim2.new(1,0,visible/total,0)
			if scrollThumb.AbsoluteSize.Y < 10 then
				scrollThumb.Size = UDim2.new(1,0,0,10)
			end
			local fs = scrollThumbFrame.AbsoluteSize.Y
			local bs = scrollThumb.AbsoluteSize.Y
			scrollThumb.Position = UDim2.new(0,0,self:GetScrollPercent()*(fs-bs)/fs,0)
		end
	end

	local function createFrame(self)
		local newFrame = createSimple("Frame",{Style=0,Active=true,AnchorPoint=Vector2.new(0,0),BackgroundColor3=Color3.new(0.35294118523598,0.35294118523598,0.35294118523598),BackgroundTransparency=0,BorderColor3=Color3.new(0.10588236153126,0.16470588743687,0.20784315466881),BorderSizePixel=0,ClipsDescendants=false,Draggable=false,Position=UDim2.new(1,-10,0,0),Rotation=0,Selectable=false,Size=UDim2.new(0,10,1,0),SizeConstraint=0,Visible=true,ZIndex=1,Name="ScrollBar",})
		local button1 = nil
		local button2 = nil

		if self.Horizontal then
			newFrame.Size = UDim2.new(1,0,0,10)
			button1 = createSimple("ImageButton",{
				Parent = newFrame,
				Name = "Left",
				Size = UDim2.new(0,10,0,10),
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				AutoButtonColor = false
			})
			createArrow(10,4,"left").Parent = button1
			button2 = createSimple("ImageButton",{
				Parent = newFrame,
				Name = "Right",
				Position = UDim2.new(1,-10,0,0),
				Size = UDim2.new(0,10,0,10),
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				AutoButtonColor = false
			})
			createArrow(10,4,"right").Parent = button2
		else
			newFrame.Size = UDim2.new(0,10,1,0)
			button1 = createSimple("ImageButton",{
				Parent = newFrame,
				Name = "Up",
				Size = UDim2.new(0,10,0,10),
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				AutoButtonColor = false
			})
			createArrow(10,4,"up").Parent = button1
			button2 = createSimple("ImageButton",{
				Parent = newFrame,
				Name = "Down",
				Position = UDim2.new(0,0,1,-10),
				Size = UDim2.new(0,10,0,10),
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				AutoButtonColor = false
			})
			createArrow(10,4,"down").Parent = button2
		end

		local scrollThumbFrame = createSimple("Frame",{
			BackgroundTransparency = 1,
			Parent = newFrame
		})
		if self.Horizontal then
			scrollThumbFrame.Position = UDim2.new(0,10,0,0)
			scrollThumbFrame.Size = UDim2.new(1,-20,1,0)
		else
			scrollThumbFrame.Position = UDim2.new(0,0,0,10)
			scrollThumbFrame.Size = UDim2.new(1,0,1,-20)
		end

		local scrollThumb = createSimple("Frame",{
			BackgroundColor3 = Color3.new(120/255,120/255,120/255),
			BorderSizePixel = 0,
			Parent = scrollThumbFrame
		})

		local markerFrame = createSimple("Frame",{
			BackgroundTransparency = 1,
			Name = "Markers",
			Size = UDim2.new(1,0,1,0),
			Parent = scrollThumbFrame
		})

		local buttonPress = false
		local thumbPress = false
		local thumbFramePress = false

		button1.InputBegan:Connect(function(input)
			if InputTypeAllowed(input, "Movement") and not buttonPress and self:CanScrollUp() then button1.BackgroundTransparency = 0.8 end
			if not InputTypeAllowed(input, "StartAndEnd") or not self:CanScrollUp() then return end
			buttonPress = true
			button1.BackgroundTransparency = 0.5
			if self:CanScrollUp() then 
				self:ScrollUp() 
				self.Scrolled:Fire() 
			end
			local buttonTick = tick()
			local releaseEvent
			releaseEvent = UserInputService.InputEnded:Connect(function(input)
				if not InputTypeAllowed(input, "StartAndEnd") then return end
				releaseEvent:Disconnect()
				if checkMouseInGui(button1) and self:CanScrollUp() then button1.BackgroundTransparency = 0.8 else button1.BackgroundTransparency = 1 end
				buttonPress = false
			end)
			while buttonPress do
				if tick() - buttonTick >= 0.3 and self:CanScrollUp() then
					self:ScrollUp()
					self.Scrolled:Fire()
				end
				wait()
			end
		end)
		button1.InputEnded:Connect(function(input)
			if InputTypeAllowed(input, "Movement") and not buttonPress then button1.BackgroundTransparency = 1 end
		end)
		button2.InputBegan:Connect(function(input)
			if InputTypeAllowed(input, "Movement") and not buttonPress and self:CanScrollDown() then button2.BackgroundTransparency = 0.8 end
			if not InputTypeAllowed(input, "StartAndEnd") or not self:CanScrollDown() then return end
			buttonPress = true
			button2.BackgroundTransparency = 0.5
			if self:CanScrollDown() then 
				self:ScrollDown() 
				self.Scrolled:Fire() 
			end
			local buttonTick = tick()
			local releaseEvent
			releaseEvent = UserInputService.InputEnded:Connect(function(input)
				if not InputTypeAllowed(input, "StartAndEnd") then return end
				releaseEvent:Disconnect()
				if checkMouseInGui(button2) and self:CanScrollDown() then button2.BackgroundTransparency = 0.8 else button2.BackgroundTransparency = 1 end
				buttonPress = false
			end)
			while buttonPress do
				if tick() - buttonTick >= 0.3 and self:CanScrollDown() then
					self:ScrollDown()
					self.Scrolled:Fire()
				end
				wait()
			end
		end)
		button2.InputEnded:Connect(function(input)
			if InputTypeAllowed(input, "Movement") and not buttonPress then button2.BackgroundTransparency = 1 end
		end)

		scrollThumb.InputBegan:Connect(function(input)
			if InputTypeAllowed(input, "Movement") and not thumbPress then 
				scrollThumb.BackgroundTransparency = 0.2 
				scrollThumb.BackgroundColor3 = self.ThumbSelectColor 
			end
			if not InputTypeAllowed(input, "StartAndEnd") then return end

			local dir = self.Horizontal and "X" or "Y"
			local lastThumbPos = nil

			buttonPress = false
			thumbFramePress = false			
			thumbPress = true
			scrollThumb.BackgroundTransparency = 0
			local mouseOffset = Mouse[dir] - scrollThumb.AbsolutePosition[dir]
			local releaseEvent
			local mouseEvent
			releaseEvent = UserInputService.InputEnded:Connect(function(input)
				if not InputTypeAllowed(input, "StartAndEnd") then return end
				releaseEvent:Disconnect()
				if mouseEvent then mouseEvent:Disconnect() end
				if checkMouseInGui(scrollThumb) then 
					scrollThumb.BackgroundTransparency = 0.2 
				else 
					scrollThumb.BackgroundTransparency = 0 
					scrollThumb.BackgroundColor3 = self.ThumbColor 
				end
				thumbPress = false
			end)
			self:Update()

			mouseEvent = UserInputService.InputChanged:Connect(function(input)
				if InputTypeAllowed(input, "Movement") and thumbPress and releaseEvent.Connected then
					local thumbFrameSize = scrollThumbFrame.AbsoluteSize[dir]-scrollThumb.AbsoluteSize[dir]
					local pos = Mouse[dir] - scrollThumbFrame.AbsolutePosition[dir] - mouseOffset
					if pos > thumbFrameSize then
						pos = thumbFrameSize
					elseif pos < 0 then
						pos = 0
					end
					if lastThumbPos ~= pos then
						lastThumbPos = pos
						self:ScrollTo(math.floor(0.5+pos/thumbFrameSize*(self.TotalSpace-self.VisibleSpace)))
					end
					wait()
				end
			end)
		end)
		scrollThumb.InputEnded:Connect(function(input)
			if InputTypeAllowed(input, "Movement") and not thumbPress then 
				scrollThumb.BackgroundTransparency = 0 
				scrollThumb.BackgroundColor3 = self.ThumbColor 
			end
		end)
		scrollThumbFrame.InputBegan:Connect(function(input)
			if not InputTypeAllowed(input, "StartAndEnd") or checkMouseInGui(scrollThumb) then return end

			local dir = self.Horizontal and "X" or "Y"
			local scrollDir = 0
			if Mouse[dir] >= scrollThumb.AbsolutePosition[dir] + scrollThumb.AbsoluteSize[dir] then
				scrollDir = 1
			end

			local function doTick()
				local scrollSize = self.VisibleSpace - 1
				if scrollDir == 0 and Mouse[dir] < scrollThumb.AbsolutePosition[dir] then
					self:ScrollTo(self.Index - scrollSize)
				elseif scrollDir == 1 and Mouse[dir] >= scrollThumb.AbsolutePosition[dir] + scrollThumb.AbsoluteSize[dir] then
					self:ScrollTo(self.Index + scrollSize)
				end
			end

			thumbPress = false			
			thumbFramePress = true
			doTick()
			local thumbFrameTick = tick()
			local releaseEvent
			releaseEvent = UserInputService.InputEnded:Connect(function(input)
				if not InputTypeAllowed(input, "StartAndEnd") then return end
				releaseEvent:Disconnect()
				thumbFramePress = false
			end)
			while thumbFramePress do
				if tick() - thumbFrameTick >= 0.3 and checkMouseInGui(scrollThumbFrame) then
					doTick()
				end
				wait()
			end
		end)

		newFrame.MouseWheelForward:Connect(function()
			self:ScrollTo(self.Index - self.WheelIncrement)
		end)

		newFrame.MouseWheelBackward:Connect(function()
			self:ScrollTo(self.Index + self.WheelIncrement)
		end)

		self.GuiElems.ScrollThumb = scrollThumb
		self.GuiElems.ScrollThumbFrame = scrollThumbFrame
		self.GuiElems.Button1 = button1
		self.GuiElems.Button2 = button2
		self.GuiElems.MarkerFrame = markerFrame

		return newFrame
	end

	funcs.Update = function(self,nocallback)
		local total = self.TotalSpace
		local visible = self.VisibleSpace
		local button1 = self.GuiElems.Button1
		local button2 = self.GuiElems.Button2

		self.Index = math.clamp(self.Index,0,math.max(0,total-visible))

		if self.LastTotalSpace ~= self.TotalSpace then
			self.LastTotalSpace = self.TotalSpace
			self:UpdateMarkers()
		end

		if self:CanScrollUp() then
			for i,v in pairs(button1.Arrow:GetChildren()) do
				v.BackgroundTransparency = 0
			end
		else
			button1.BackgroundTransparency = 1
			for i,v in pairs(button1.Arrow:GetChildren()) do
				v.BackgroundTransparency = 0.5
			end
		end
		if self:CanScrollDown() then
			for i,v in pairs(button2.Arrow:GetChildren()) do
				v.BackgroundTransparency = 0
			end
		else
			button2.BackgroundTransparency = 1
			for i,v in pairs(button2.Arrow:GetChildren()) do
				v.BackgroundTransparency = 0.5
			end
		end

		drawThumb(self)
	end

	funcs.UpdateMarkers = function(self)
		local markerFrame = self.GuiElems.MarkerFrame
		markerFrame:ClearAllChildren()

		for i,v in pairs(self.Markers) do
			if i < self.TotalSpace then
				createSimple("Frame",{
					BackgroundTransparency = 0,
					BackgroundColor3 = v,
					BorderSizePixel = 0,
					Position = self.Horizontal and UDim2.new(i/self.TotalSpace,0,1,-6) or UDim2.new(1,-6,i/self.TotalSpace,0),
					Size = self.Horizontal and UDim2.new(0,1,0,6) or UDim2.new(0,6,0,1),
					Name = "Marker"..tostring(i),
					Parent = markerFrame
				})
			end
		end
	end

	funcs.AddMarker = function(self,ind,color)
		self.Markers[ind] = color or Color3.new(0,0,0)
	end
	funcs.ScrollTo = function(self,ind,nocallback)
		self.Index = ind
		self:Update()
		if not nocallback then
			self.Scrolled:Fire()
		end
	end
	funcs.ScrollUp = function(self)
		self.Index = self.Index - self.Increment
		self:Update()
	end
	funcs.ScrollDown = function(self)
		self.Index = self.Index + self.Increment
		self:Update()
	end
	funcs.CanScrollUp = function(self)
		return self.Index > 0
	end
	funcs.CanScrollDown = function(self)
		return self.Index + self.VisibleSpace < self.TotalSpace
	end
	funcs.GetScrollPercent = function(self)
		return self.Index/(self.TotalSpace-self.VisibleSpace)
	end
	funcs.SetScrollPercent = function(self,perc)
		self.Index = math.floor(perc*(self.TotalSpace-self.VisibleSpace))
		self:Update()
	end

	funcs.Texture = function(self,data)
		self.ThumbColor = data.ThumbColor or Color3.new(0,0,0)
		self.ThumbSelectColor = data.ThumbSelectColor or Color3.new(0,0,0)
		self.GuiElems.ScrollThumb.BackgroundColor3 = data.ThumbColor or Color3.new(0,0,0)
		self.Gui.BackgroundColor3 = data.FrameColor or Color3.new(0,0,0)
		self.GuiElems.Button1.BackgroundColor3 = data.ButtonColor or Color3.new(0,0,0)
		self.GuiElems.Button2.BackgroundColor3 = data.ButtonColor or Color3.new(0,0,0)
		for i,v in pairs(self.GuiElems.Button1.Arrow:GetChildren()) do
			v.BackgroundColor3 = data.ArrowColor or Color3.new(0,0,0)
		end
		for i,v in pairs(self.GuiElems.Button2.Arrow:GetChildren()) do
			v.BackgroundColor3 = data.ArrowColor or Color3.new(0,0,0)
		end
	end

	funcs.SetScrollFrame = function(self,frame)
		if self.ScrollUpEvent then 
			self.ScrollUpEvent:Disconnect() 
			self.ScrollUpEvent = nil 
		end
		if self.ScrollDownEvent then 
			self.ScrollDownEvent:Disconnect() 
			self.ScrollDownEvent = nil 
		end
		self.ScrollUpEvent = frame.MouseWheelForward:Connect(function() self:ScrollTo(self.Index - self.WheelIncrement) end)
		self.ScrollDownEvent = frame.MouseWheelBackward:Connect(function() self:ScrollTo(self.Index + self.WheelIncrement) end)
	end

	local mt = {}
	mt.__index = funcs

	local function new(hor)
		local obj = setmetatable({
			Index = 0,
			VisibleSpace = 0,
			TotalSpace = 0,
			Increment = 1,
			WheelIncrement = 1,
			Markers = {},
			GuiElems = {},
			Horizontal = hor,
			LastTotalSpace = 0,
			Scrolled = Lib.Signal.new()
		},mt)
		obj.Gui = createFrame(obj)
		obj:Texture({
			ThumbColor = Color3.fromRGB(60,60,60),
			ThumbSelectColor = Color3.fromRGB(75,75,75),
			ArrowColor = Color3.new(1,1,1),
			FrameColor = Color3.fromRGB(40,40,40),
			ButtonColor = Color3.fromRGB(75,75,75)
		})
		return obj
	end

	return {new = new}
end)()

Lib.CodeFrame = (function()
	local funcs = {}

	local typeMap = {
		[1] = "String",
		[2] = "String",
		[3] = "String",
		[4] = "Comment",
		[5] = "Operator",
		[6] = "Number",
		[7] = "Keyword",
		[8] = "BuiltIn",
		[9] = "LocalMethod",
		[10] = "LocalProperty",
		[11] = "Nil",
		[12] = "Bool",
		[13] = "Function",
		[14] = "Local",
		[15] = "Self",
		[16] = "FunctionName",
		[17] = "Bracket"
	}

	local specialKeywordsTypes = {
		["nil"] = 11,
		["true"] = 12,
		["false"] = 12,
		["function"] = 13,
		["local"] = 14,
		["self"] = 15
	}

	local keywords = {
		["and"] = true,
		["break"] = true, 
		["do"] = true,
		["else"] = true,
		["elseif"] = true,
		["end"] = true,
		["false"] = true,
		["for"] = true,
		["function"] = true,
		["if"] = true,
		["in"] = true,
		["local"] = true,
		["nil"] = true,
		["not"] = true,
		["or"] = true,
		["repeat"] = true,
		["return"] = true,
		["then"] = true,
		["true"] = true,
		["until"] = true,
		["while"] = true,
		["plugin"] = true
	}

	local builtIns = {
		["delay"] = true,
		["elapsedTime"] = true,
		["require"] = true,
		["spawn"] = true,
		["tick"] = true,
		["time"] = true,
		["typeof"] = true,
		["UserSettings"] = true,
		["wait"] = true,
		["warn"] = true,
		["game"] = true,
		["shared"] = true,
		["script"] = true,
		["workspace"] = true,
		["assert"] = true,
		["collectgarbage"] = true,
		["error"] = true,
		["getfenv"] = true,
		["getmetatable"] = true,
		["ipairs"] = true,
		["loadstring"] = true,
		["newproxy"] = true,
		["next"] = true,
		["pairs"] = true,
		["pcall"] = true,
		["print"] = true,
		["rawequal"] = true,
		["rawget"] = true,
		["rawset"] = true,
		["select"] = true,
		["setfenv"] = true,
		["setmetatable"] = true,
		["tonumber"] = true,
		["tostring"] = true,
		["type"] = true,
		["unpack"] = true,
		["xpcall"] = true,
		["_G"] = true,
		["_VERSION"] = true,
		["coroutine"] = true,
		["debug"] = true,
		["math"] = true,
		["os"] = true,
		["string"] = true,
		["table"] = true,
		["bit32"] = true,
		["utf8"] = true,
		["Axes"] = true,
		["BrickColor"] = true,
		["CFrame"] = true,
		["Color3"] = true,
		["ColorSequence"] = true,
		["ColorSequenceKeypoint"] = true,
		["DockWidgetPluginGuiInfo"] = true,
		["Enum"] = true,
		["Faces"] = true,
		["Instance"] = true,
		["NumberRange"] = true,
		["NumberSequence"] = true,
		["NumberSequenceKeypoint"] = true,
		["PathWaypoint"] = true,
		["PhysicalProperties"] = true,
		["Random"] = true,
		["Ray"] = true,
		["Rect"] = true,
		["Region3"] = true,
		["Region3int16"] = true,
		["TweenInfo"] = true,
		["UDim"] = true,
		["UDim2"] = true,
		["Vector2"] = true,
		["Vector2int16"] = true,
		["Vector3"] = true,
		["Vector3int16"] = true,

		--// Libraries
		["Drawing"] = true,
		["syn"] = true, -- For compatability
		["crypt"] = true,
		["cache"] = true,
		["bit"] = true,

		--// Custom Lua Functions
		-- File Functions
		["readfile"] = true,
		["writefile"] = true,
		["isfile"] = true,
		["appendfile"] = true,
		["listfiles"] = true,
		["loadfile"] = true,
		["isfolder"] = true,
		["makefolder"] = true,
		["delfolder"] = true,
		["delfile"] = true,

		-- Misc Functions
		["setclipboard"] = true,
		["setfflag"] = true,
		["getnamecallmethod"] = true,
		["isluau"] = true, -- For compatability
		["setnonreplicatedproperty"] = true,
		["getspecialinfo"] = true,
		["saveinstance"] = true,
		--[=[ ["messagebox"] = true, ]=] -- Disabled for security

		-- Console Functions (for compatability)
		["rconsoleprint"] = true,
		["rconsoleinfo"] = true,
		["rconsolewarn"] = true,
		["rconsoleerr"] = true,
		["rconsoleclear"] = true,
		["rconsolename"] = true,
		["rconsoleinput"] = true,
		["rconsoleinputasync"] = true,
		["printconsole"] = true,

		--- Reflection Functions
		--[=[ ["loadstring"] = true, ]=] -- Disabled, already stated.
		["checkcaller"] = true,
		["islclosure"] = true,
		["iscclosure"] = true,
		["dumpstring"] = true,
		["decompile"] = true,

		-- Hooking Functions
		["hookfunction"] = true,
		["newcclosure"] = true,

		-- KB/M Functions
		["isrbxactive"] = true,
		["keypress"] = true,
		["keyrelease"] = true,

		["mouse1click"] = true,
		["mouse1press"] = true,
		["mouse1release"] = true,

		["mouse2click"] = true,
		["mouse2press"] = true,
		["mouse2release"] = true,

		["mousescroll"] = true,
		["mousemoveabs"] = true,
		["mousemoverel"] = true,

		-- Table Modification Functions
		["getrawmetatable"] = true,
		["setrawmetatable"] = true,
		["setreadonly"] = true,
		["isreadonly"] = true,

		-- Script Env Functions
		["getsenv"] = true,
		["getcallingscript"] = true,

		-- Env Helping Functions
		["getgenv"] = true,
		["getrenv"] = true,
		["getreg"] = true,
		["getgc"] = true,
		["getinstances"] = true,
		["getnilinstances"] = true,
		["getscripts"] = true,
		["getloadedmodules"] = true,
		["getconnections"] = true,
		["firesignal"] = true,
		["fireclickdetector"] = true,
		["firetouchinterest"] = true,
		["fireproximityprompt"] = true
	}

	local builtInInited = false

	local richReplace = {
		["'"] = "&apos;",
		["\""] = "&quot;",
		["<"] = "&lt;",
		[">"] = "&gt;",
		["&"] = "&amp;"
	}

	local tabSub = "\205"
	local tabReplacement = (" %s%s "):format(tabSub,tabSub)

	local tabJumps = {
		[("[^%s] %s"):format(tabSub,tabSub)] = 0,
		[(" %s%s"):format(tabSub,tabSub)] = -1,
		[("%s%s "):format(tabSub,tabSub)] = 2,
		[("%s [^%s]"):format(tabSub,tabSub)] = 1,
	}

	local lineTweens = {}

	local function initBuiltIn()
		local env = getfenv()
		local type = type
		local tostring = tostring
		for name,_ in next,builtIns do
			local envVal = env[name]
			if type(envVal) == "table" then
				local items = {}
				for i,v in next,envVal do
					items[i] = true
				end
				builtIns[name] = items
			end
		end

		local enumEntries = {}
		local enums = Enum:GetEnums()
		for i = 1,#enums do
			enumEntries[tostring(enums[i])] = true
		end
		builtIns["Enum"] = enumEntries

		builtInInited = true
	end

	local function setupEditBox(obj)
		local editBox = obj.GuiElems.EditBox

		editBox.Focused:Connect(function()
			obj:ConnectEditBoxEvent()
			obj.Editing = true
		end)

		editBox.FocusLost:Connect(function()
			obj:DisconnectEditBoxEvent()
			obj.Editing = false
		end)

		editBox:GetPropertyChangedSignal("Text"):Connect(function()
			local text = editBox.Text
			if #text == 0 or obj.EditBoxCopying then return end

			text = text:gsub("\t", "    ")

			editBox.Text = ""
			obj:AppendText(text)
		end)

	end

	local function setupMouseSelection(obj)
		local codeFrame = obj.GuiElems.LinesFrame
		local lines = obj.Lines

		codeFrame.InputBegan:Connect(function(input)
			if InputTypeAllowed(input, "StartAndEnd") then
				local fontSizeX,fontSizeY = math.ceil(obj.FontSize/2),obj.FontSize

				local relX = Mouse.X - codeFrame.AbsolutePosition.X
				local relY = Mouse.Y - codeFrame.AbsolutePosition.Y
				local selX = math.round(relX / fontSizeX) + obj.ViewX
				local selY = math.floor(relY / fontSizeY) + obj.ViewY

				local releaseEvent,mouseEvent,scrollEvent
				local scrollPowerV,scrollPowerH = 0,0
				selY = math.min(#lines-1,selY)
				local relativeLine = lines[selY+1] or ""
				selX = math.min(#relativeLine, selX + obj:TabAdjust(selX,selY))

				obj.SelectionRange = {{-1,-1},{-1,-1}}
				obj:MoveCursor(selX, selY)
				obj.FloatCursorX = selX

				local function updateSelection()
					local relX = Mouse.X - codeFrame.AbsolutePosition.X
					local relY = Mouse.Y - codeFrame.AbsolutePosition.Y
					local sel2X = math.max(0,math.round(relX / fontSizeX) + obj.ViewX)
					local sel2Y = math.max(0,math.floor(relY / fontSizeY) + obj.ViewY)

					sel2Y = math.min(#lines-1,sel2Y)
					local relativeLine = lines[sel2Y+1] or ""
					sel2X = math.min(#relativeLine, sel2X + obj:TabAdjust(sel2X,sel2Y))

					if sel2Y < selY or (sel2Y == selY and sel2X < selX) then
						obj.SelectionRange = {{sel2X,sel2Y},{selX,selY}}
					else						
						obj.SelectionRange = {{selX,selY},{sel2X,sel2Y}}
					end

					obj:MoveCursor(sel2X,sel2Y)
					obj.FloatCursorX = sel2X
					obj:Refresh()
				end

				releaseEvent = UserInputService.InputEnded:Connect(function(input)
					if InputTypeAllowed(input, "StartAndEnd") then
						releaseEvent:Disconnect()
						mouseEvent:Disconnect()
						scrollEvent:Disconnect()
						obj:SetCopyableSelection()
						--updateSelection()
					end
				end)

				mouseEvent = UserInputService.InputChanged:Connect(function(input)
					if InputTypeAllowed(input, "Movement") then
						local upDelta = Mouse.Y - codeFrame.AbsolutePosition.Y
						local downDelta = Mouse.Y - codeFrame.AbsolutePosition.Y - codeFrame.AbsoluteSize.Y
						local leftDelta = Mouse.X - codeFrame.AbsolutePosition.X
						local rightDelta = Mouse.X - codeFrame.AbsolutePosition.X - codeFrame.AbsoluteSize.X
						scrollPowerV = 0
						scrollPowerH = 0
						if downDelta > 0 then
							scrollPowerV = math.floor(downDelta*0.05) + 1
						elseif upDelta < 0 then
							scrollPowerV = math.ceil(upDelta*0.05) - 1
						end
						if rightDelta > 0 then
							scrollPowerH = math.floor(rightDelta*0.05) + 1
						elseif leftDelta < 0 then
							scrollPowerH = math.ceil(leftDelta*0.05) - 1
						end
						updateSelection()
					end
				end)

				scrollEvent = RunService.RenderStepped:Connect(function()
					if scrollPowerV ~= 0 or scrollPowerH ~= 0 then
						obj:ScrollDelta(scrollPowerH,scrollPowerV)
						updateSelection()
					end
				end)

				obj:Refresh()
			end
		end)
	end

	function funcs.MakeEditorFrame(self)
		local frame = NewInstance('TextButton')
		frame.BackgroundTransparency = 1
		frame.TextTransparency = 1
		frame.BackgroundColor3=Color3.fromRGB(40, 40, 40);
		frame.BorderSizePixel=0; 
		frame.Size=UDim2.fromOffset(100,100);
		frame.Visible=true;
		local elems = {}

		local linesFrame = NewInstance("Frame")
		linesFrame.Name = "Lines"
		linesFrame.BackgroundTransparency = 1
		linesFrame.Size = UDim2.new(1,0,1,0)
		linesFrame.ClipsDescendants = true
		linesFrame.Parent = frame

		local lineNumbersLabel = NewInstance("TextLabel")
		lineNumbersLabel.Name = "LineNumbers"
		lineNumbersLabel.BackgroundTransparency = 1
		lineNumbersLabel.FontFace = self.FontFace
		lineNumbersLabel.TextXAlignment = Enum.TextXAlignment.Right
		lineNumbersLabel.TextYAlignment = Enum.TextYAlignment.Top
		lineNumbersLabel.ClipsDescendants = true
		lineNumbersLabel.RichText = true
		lineNumbersLabel.Parent = frame

		cursor.Name = "Cursor"
		cursor.BackgroundColor3 = Color3.fromRGB(220,220,220)
		cursor.BorderSizePixel = 0
		cursor.Parent = frame

		local editBox = NewInstance("TextBox")
		editBox.Name = "EditBox"
		editBox.MultiLine = true
		editBox.Visible = false
		editBox.Parent = frame
		editBox.TextSize = self.FontSize
		editBox.FontFace = self.FontFace

		lineTweens.Invis = TweenService:Create(cursor,TweenInfo.new(0,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{BackgroundTransparency = 1})
		lineTweens.Vis = TweenService:Create(cursor,TweenInfo.new(0,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{BackgroundTransparency = 0})

		local scrcfrm = NewInstance('Frame')
		scrcfrm.BackgroundColor3=Color3.new(0.15686275064945,0.15686275064945,0.15686275064945);scrcfrm.BorderSizePixel=0;scrcfrm.Name="ScrollCorner";scrcfrm.Position=UDim2.new(1,-10,1,-10);scrcfrm.Size=UDim2.new(0,10,0,10);scrcfrm.Visible=false;
		
		elems.ScrollCorner = scrcfrm
		elems.LinesFrame = linesFrame
		elems.LineNumbersLabel = lineNumbersLabel
		elems.Cursor = cursor
		elems.EditBox = editBox
		elems.ScrollCorner.Parent = frame
		
		linesFrame.InputBegan:Connect(function(input)
			if InputTypeAllowed(input, "StartAndEnd") then
				self:SetEditing(true,input)
			end
		end)

		self.Frame = frame
		self.Gui = frame
		self.GuiElems = elems
		setupEditBox(self)
		setupMouseSelection(self)

		return frame
	end

	funcs.GetSelectionText = function(self)
		if not self:IsValidRange() then return "" end

		local selectionRange = self.SelectionRange
		local selX,selY = selectionRange[1][1], selectionRange[1][2]
		local sel2X,sel2Y = selectionRange[2][1], selectionRange[2][2]
		local deltaLines = sel2Y-selY
		local lines = self.Lines

		if not lines[selY+1] or not lines[sel2Y+1] then return "" end

		if deltaLines == 0 then
			return self:ConvertText(lines[selY+1]:sub(selX+1,sel2X), false)
		end

		local leftSub = lines[selY+1]:sub(selX+1)
		local rightSub = lines[sel2Y+1]:sub(1,sel2X)

		local result = leftSub.."\n" 
		for i = selY+1,sel2Y-1 do
			result = result..lines[i+1].."\n"
		end
		result = result..rightSub

		return self:ConvertText(result,false)
	end

	funcs.SetCopyableSelection = function(self)
		local text = self:GetSelectionText()
		local editBox = self.GuiElems.EditBox

		self.EditBoxCopying = true
		editBox.Text = text
		editBox.SelectionStart = 1
		editBox.CursorPosition = #editBox.Text + 1
		self.EditBoxCopying = false
	end

	funcs.ConnectEditBoxEvent = function(self)
		if self.EditBoxEvent then
			self.EditBoxEvent:Disconnect()
		end

		self.EditBoxEvent = UserInputService.InputBegan:Connect(function(input)
			if input.UserInputType ~= Enum.UserInputType.Keyboard then return end

			local keycodes = Enum.KeyCode
			local keycode = input.KeyCode

			local function setupMove(key,func)
				local endCon,finished
				endCon = UserInputService.InputEnded:Connect(function(input)
					if input.KeyCode ~= key then return end
					endCon:Disconnect()
					finished = true
				end)
				func()
				Lib.FastWait(0.5)
				while not finished do 
					func() 
					Lib.FastWait(0.03) 
				end
			end

			if keycode == keycodes.Down then
				setupMove(keycodes.Down,function()
					self.CursorX = self.FloatCursorX
					self.CursorY = self.CursorY + 1
					self:UpdateCursor()
					self:JumpToCursor()
				end)
			elseif keycode == keycodes.Up then
				setupMove(keycodes.Up,function()
					self.CursorX = self.FloatCursorX
					self.CursorY = self.CursorY - 1
					self:UpdateCursor()
					self:JumpToCursor()
				end)
			elseif keycode == keycodes.Left then
				setupMove(keycodes.Left,function()
					local line = self.Lines[self.CursorY+1] or ""
					self.CursorX = self.CursorX - 1 - (line:sub(self.CursorX-3,self.CursorX) == tabReplacement and 3 or 0)
					if self.CursorX < 0 then
						self.CursorY = self.CursorY - 1
						local line2 = self.Lines[self.CursorY+1] or ""
						self.CursorX = #line2
					end
					self.FloatCursorX = self.CursorX
					self:UpdateCursor()
					self:JumpToCursor()
				end)
			elseif keycode == keycodes.Right then
				setupMove(keycodes.Right,function()
					local line = self.Lines[self.CursorY+1] or ""
					self.CursorX = self.CursorX + 1 + (line:sub(self.CursorX+1,self.CursorX+4) == tabReplacement and 3 or 0)
					if self.CursorX > #line then
						self.CursorY = self.CursorY + 1
						self.CursorX = 0
					end
					self.FloatCursorX = self.CursorX
					self:UpdateCursor()
					self:JumpToCursor()
				end)
			elseif keycode == keycodes.Backspace then
				setupMove(keycodes.Backspace,function()
					local startRange,endRange
					if self:IsValidRange() then
						startRange = self.SelectionRange[1]
						endRange = self.SelectionRange[2]
					else
						endRange = {self.CursorX,self.CursorY}
					end

					if not startRange then
						local line = self.Lines[self.CursorY+1] or ""
						self.CursorX = self.CursorX - 1 - (line:sub(self.CursorX-3,self.CursorX) == tabReplacement and 3 or 0)
						if self.CursorX < 0 then
							self.CursorY = self.CursorY - 1
							local line2 = self.Lines[self.CursorY+1] or ""
							self.CursorX = #line2
						end
						self.FloatCursorX = self.CursorX
						self:UpdateCursor()

						startRange = startRange or {self.CursorX,self.CursorY}
					end

					self:DeleteRange({startRange,endRange},false,true)
					self:ResetSelection(true)
					self:JumpToCursor()
				end)
			elseif keycode == keycodes.Delete then
				setupMove(keycodes.Delete,function()
					local startRange,endRange
					if self:IsValidRange() then
						startRange = self.SelectionRange[1]
						endRange = self.SelectionRange[2]
					else
						startRange = {self.CursorX,self.CursorY}
					end

					if not endRange then
						local line = self.Lines[self.CursorY+1] or ""
						local endCursorX = self.CursorX + 1 + (line:sub(self.CursorX+1,self.CursorX+4) == tabReplacement and 3 or 0)
						local endCursorY = self.CursorY
						if endCursorX > #line then
							endCursorY = endCursorY + 1
							endCursorX = 0
						end
						self:UpdateCursor()

						endRange = endRange or {endCursorX,endCursorY}
					end

					self:DeleteRange({startRange,endRange},false,true)
					self:ResetSelection(true)
					self:JumpToCursor()
				end)
			elseif UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
				if keycode == keycodes.A then
					self.SelectionRange = {{0,5},{#self.Lines[#self.Lines],#self.Lines-1}}
					self:SetCopyableSelection()
					self:Refresh()
				end
			end
		end)
	end

	funcs.DisconnectEditBoxEvent = function(self)
		if self.EditBoxEvent then
			self.EditBoxEvent:Disconnect()
			cursor.BackgroundTransparency = 1
			funcs.CursorAnim(self, false)
		end
	end

	funcs.ResetSelection = function(self,norefresh)
		self.SelectionRange = {{-1,-1},{-1,-1}}
		if not norefresh then self:Refresh() end
	end

	funcs.IsValidRange = function(self,range)
		local selectionRange = range or self.SelectionRange
		local selX,selY = selectionRange[1][1], selectionRange[1][2]
		local sel2X,sel2Y = selectionRange[2][1], selectionRange[2][2]

		if selX == -1 or (selX == sel2X and selY == sel2Y) then return false end

		return true
	end

	funcs.DeleteRange = function(self,range,noprocess,updatemouse)
		range = range or self.SelectionRange
		if not self:IsValidRange(range) then return end

		local lines = self.Lines
		local selX,selY = range[1][1], range[1][2]
		local sel2X,sel2Y = range[2][1], range[2][2]
		local deltaLines = sel2Y-selY

		if not lines[selY+1] or not lines[sel2Y+1] then return end

		local leftSub = lines[selY+1]:sub(1,selX)
		local rightSub = lines[sel2Y+1]:sub(sel2X+1)
		lines[selY+1] = leftSub..rightSub

		local remove = table.remove
		for i = 1,deltaLines do
			remove(lines,selY+2)
		end

		if range == self.SelectionRange then self.SelectionRange = {{-1,-1},{-1,-1}} end
		if updatemouse then
			self.CursorX = selX
			self.CursorY = selY
			self:UpdateCursor()
		end

		if not noprocess then
			self:ProcessTextChange()
		end
	end

	funcs.AppendText = function(self,text)
		self:DeleteRange(nil,true,true)
		local lines,cursorX,cursorY = self.Lines,self.CursorX,self.CursorY
		local line = lines[cursorY+1]
		local before = line:sub(1,cursorX)
		local after = line:sub(cursorX+1)

		text = text:gsub("\r\n","\n")
		text = self:ConvertText(text,true) -- Tab Convert

		local textLines = text:split("\n")
		local insert = table.insert

		for i = 1,#textLines do
			local linePos = cursorY+i
			if i > 1 then insert(lines,linePos,"") end

			local textLine = textLines[i]
			local newBefore = (i == 1 and before or "")
			local newAfter = (i == #textLines and after or "")

			lines[linePos] = newBefore..textLine..newAfter
		end

		if #textLines > 1 then cursorX = 0 end

		self:ProcessTextChange()
		self.CursorX = cursorX + #textLines[#textLines]
		self.CursorY = cursorY + #textLines-1
		self:UpdateCursor()
	end

	funcs.ScrollDelta = function(self,x,y)
		self.ScrollV:ScrollTo(self.ScrollV.Index + y)
		self.ScrollH:ScrollTo(self.ScrollH.Index + x)
	end

	-- x and y starts at 0
	funcs.TabAdjust = function(self,x,y)
		local lines = self.Lines
		local line = lines[y+1]
		x=x+1

		if line then
			local left = line:sub(x-1,x-1)
			local middle = line:sub(x,x)
			local right = line:sub(x+1,x+1)
			local selRange = (#left > 0 and left or " ") .. (#middle > 0 and middle or " ") .. (#right > 0 and right or " ")

			for i,v in pairs(tabJumps) do
				if selRange:find(i) then
					return v
				end
			end
		end
		return 0
	end

	funcs.SetEditing = function(self,on,input)			
		if input then
			self:UpdateCursor(input)
		end

		if on then
			if self.Editable then
				self.GuiElems.EditBox.Text = ""
				self.GuiElems.EditBox:CaptureFocus()
			end
		else
			self.GuiElems.EditBox:ReleaseFocus()
		end
	end

	funcs.CursorAnim = function(self,on)
		local cursor = self.GuiElems.Cursor
		local animTime = tick()
		self.LastAnimTime = animTime

		if not on then return end

		lineTweens.Invis:Cancel()
		lineTweens.Vis:Cancel()
		cursor.BackgroundTransparency = 0

		coroutine.wrap(function()
			while self.Editable do
				Lib.FastWait(0.5)
				if self.LastAnimTime ~= animTime then return end
				lineTweens.Invis:Play()
				Lib.FastWait(0.5)
				if self.LastAnimTime ~= animTime then return end
				lineTweens.Vis:Play()
				--Lib.FastWait(0.2)
			end
		end)()
	end

	funcs.MoveCursor = function(self,x,y)
		self.CursorX = x
		self.CursorY = y
		self:UpdateCursor()
		self:JumpToCursor()
	end

	funcs.JumpToCursor = function(self)
		self:Refresh()
	end

	funcs.UpdateCursor = function(self,input)
		local linesFrame = self.GuiElems.LinesFrame
		local cursor = self.GuiElems.Cursor			
		local hSize = math.max(0,linesFrame.AbsoluteSize.X)
		local vSize = math.max(0,linesFrame.AbsoluteSize.Y)
		local maxLines = math.ceil(vSize / self.FontSize)
		local maxCols = math.ceil(hSize / math.ceil(self.FontSize/2))
		local viewX,viewY = self.ViewX,self.ViewY
		local totalLinesStr = tostring(#self.Lines)
		local fontWidth = math.ceil(self.FontSize / 2)
		local linesOffset = #totalLinesStr*fontWidth + 4*fontWidth

		if input then
			local LinesFrame = self.GuiElems.LinesFrame
			local frameX,frameY = LinesFrame.AbsolutePosition.X,LinesFrame.AbsolutePosition.Y
			local mouseX,mouseY = input.Position.X,input.Position.Y
			local fontSizeX,fontSizeY = math.ceil(self.FontSize/2),self.FontSize

			self.CursorX = self.ViewX + math.round((mouseX - frameX) / fontSizeX)
			self.CursorY = self.ViewY + math.floor((mouseY - frameY) / fontSizeY)
		end

		local cursorX,cursorY = self.CursorX,self.CursorY

		local line = self.Lines[cursorY+1] or ""
		if cursorX > #line then cursorX = #line
		elseif cursorX < 0 then cursorX = 0 end

		if cursorY >= #self.Lines then
			cursorY = math.max(0,#self.Lines-1)
		elseif cursorY < 0 then
			cursorY = 0
		end

		cursorX = cursorX + self:TabAdjust(cursorX,cursorY)

		-- Update modified
		self.CursorX = cursorX
		self.CursorY = cursorY

		local cursorVisible = (cursorX >= viewX) and (cursorY >= viewY) and (cursorX <= viewX + maxCols) and (cursorY <= viewY + maxLines)
		if cursorVisible then
			local offX = (cursorX - viewX)
			local offY = (cursorY - viewY)
			cursor.Position = UDim2.new(0,linesOffset + offX*math.ceil(self.FontSize/2) - 1,0,offY*self.FontSize)
			cursor.Size = UDim2.new(0,1,0,self.FontSize+2)
			cursor.Visible = true
			self:CursorAnim(true)
		else
			cursor.Visible = false
		end
	end

	funcs.MapNewLines = function(self)
		local newLines = {}
		local count = 1
		local text = self.Text
		local find = string.find
		local init = 1

		local pos = find(text,"\n",init,true)
		while pos do
			newLines[count] = pos
			count = count + 1
			init = pos + 1
			pos = find(text,"\n",init,true)
		end

		self.NewLines = newLines
	end

	funcs.PreHighlight = function(self)
		local text = self.Text:gsub("\\\\","  ")
		local textLen = #text
		local found = {}
		local foundMap = {}
		local extras = {}
		local find = string.find
		local sub = string.sub
		self.ColoredLines = {}

		local function findAll(str,pattern,typ,raw)
			local count = #found+1
			local init = 1
			local x,y,extra = find(str,pattern,init,raw)
			while x do
				found[count] = x
				foundMap[x] = typ
				if extra then
					extras[x] = extra
				end

				count = count+1
				init = y+1
				x,y,extra = find(str,pattern,init,raw)
			end
		end

		findAll(text,'"',1,true)
		findAll(text,"'",2,true)
		findAll(text,"%[(=*)%[",3)
		findAll(text,"--",4,true)
		table.sort(found)

		local newLines = self.NewLines
		local curLine = 0
		local lineEnd = 0
		local lastEnding = 0
		local foundHighlights = {}

		for i = 1,#found do
			local pos = found[i]
			if pos <= lastEnding then continue end

			local ending = pos
			local typ = foundMap[pos]
			if typ == 1 then
				ending = find(text,'"',pos+1,true)
				while ending and sub(text,ending-1,ending-1) == "\\" do
					ending = find(text,'"',ending+1,true)
				end
				if not ending then ending = textLen end
			elseif typ == 2 then
				ending = find(text,"'",pos+1,true)
				while ending and sub(text,ending-1,ending-1) == "\\" do
					ending = find(text,"'",ending+1,true)
				end
				if not ending then ending = textLen end
			elseif typ == 3 then
				_,ending = find(text,"]"..extras[pos].."]",pos+1,true)
				if not ending then ending = textLen end
			elseif typ == 4 then
				local ahead = foundMap[pos+2]

				if ahead == 3 then
					_,ending = find(text,"]"..extras[pos+2].."]",pos+1,true)
					if not ending then ending = textLen end
				else
					ending = find(text,"\n",pos+1,true) or textLen
				end
			end

			while pos > lineEnd do
				curLine = curLine + 1
				--lineTableCount = 1
				lineEnd = newLines[curLine] or textLen+1
			end
			while true do
				local lineTable = foundHighlights[curLine]
				if not lineTable then 
					lineTable = {} 
					foundHighlights[curLine] = lineTable 
				end
				lineTable[pos] = {typ,ending}
				--lineTableCount = lineTableCount + 1

				if ending > lineEnd then
					curLine = curLine + 1
					lineEnd = newLines[curLine] or textLen+1
				else
					break
				end
			end

			lastEnding = ending
			--if i < 200 then print(curLine) end
		end
		self.PreHighlights = foundHighlights
		--print(tick()-start)
		--print(#found,curLine)
	end

	funcs.HighlightLine = function(self,line)
		local cached = self.ColoredLines[line]
		if cached then return cached end

		local sub = string.sub
		local find = string.find
		local match = string.match
		local highlights = {}
		local preHighlights = self.PreHighlights[line] or {}
		local lineText = self.Lines[line] or ""
		local lastEnding = 0
		local currentType = 0
		local lastWord = nil
		local wordBeginsDotted = false
		local funcStatus = 0
		local lineStart = self.NewLines[line-1] or 0

		local preHighlightMap = {}
		for pos,data in next,preHighlights do
			local relativePos = pos-lineStart
			if relativePos < 1 then
				currentType = data[1]
				lastEnding = data[2] - lineStart
				--warn(pos,data[2])
			else
				preHighlightMap[relativePos] = {data[1],data[2]-lineStart}
			end
		end

		for col = 1,#lineText do
			if col <= lastEnding then 
				highlights[col] = currentType 
				continue 
			end

			local pre = preHighlightMap[col]
			if pre then
				currentType = pre[1]
				lastEnding = pre[2]
				highlights[col] = currentType
				wordBeginsDotted = false
				lastWord = nil
				funcStatus = 0
			else
				local char = sub(lineText,col,col)
				if find(char,"[%a_]") then
					local word = match(lineText,"[%a%d_]+",col)
					local wordType = (keywords[word] and 7) or (builtIns[word] and 8)

					lastEnding = col+#word-1

					if wordType ~= 7 then
						if wordBeginsDotted then
							local prevBuiltIn = lastWord and builtIns[lastWord]
							wordType = (prevBuiltIn and type(prevBuiltIn) == "table" and prevBuiltIn[word] and 8) or 10
						end

						if wordType ~= 8 then
							local x,_,br = find(lineText,"^%s*([%({\"'])",lastEnding+1)
							if x then
								wordType = (funcStatus > 0 and br == "(" and 16) or 9
								funcStatus = 0
							end
						end
					else
						wordType = specialKeywordsTypes[word] or wordType
						funcStatus = (word == "function" and 1 or 0)
					end

					lastWord = word
					wordBeginsDotted = false
					if funcStatus > 0 then funcStatus = 1 end

					if wordType then
						currentType = wordType
						highlights[col] = currentType
					else
						currentType = nil
					end
				elseif find(char,"%p") then
					local isDot = (char == ".")
					local isNum = isDot and find(sub(lineText,col+1,col+1),"%d")
					highlights[col] = (isNum and 6 or 5)

					if not isNum then
						local dotStr = isDot and match(lineText,"%.%.?%.?",col)
						if dotStr and #dotStr > 1 then
							currentType = 5
							lastEnding = col+#dotStr-1
							wordBeginsDotted = false
							lastWord = nil
							funcStatus = 0
						else
							if isDot then
								if wordBeginsDotted then
									lastWord = nil
								else
									wordBeginsDotted = true
								end
							else
								wordBeginsDotted = false
								lastWord = nil
							end

							funcStatus = ((isDot or char == ":") and funcStatus == 1 and 2) or 0
						end
					end
				elseif find(char,"%d") then
					local _,endPos = find(lineText,"%x+",col)
					local endPart = sub(lineText,endPos,endPos+1)
					if (endPart == "e+" or endPart == "e-") and find(sub(lineText,endPos+2,endPos+2),"%d") then
						endPos = endPos + 1
					end
					currentType = 6
					lastEnding = endPos
					highlights[col] = 6
					wordBeginsDotted = false
					lastWord = nil
					funcStatus = 0
				else
					highlights[col] = currentType
					local _,endPos = find(lineText,"%s+",col)
					if endPos then
						lastEnding = endPos
					end
				end
			end
		end

		self.ColoredLines[line] = highlights
		return highlights
	end

	funcs.Refresh = function(self)
		local linesFrame = self.Frame.Lines
		local hSize = math.max(0,linesFrame.AbsoluteSize.X)
		local vSize = math.max(0,linesFrame.AbsoluteSize.Y)
		local maxLines = math.ceil(vSize / self.FontSize)
		local maxCols = math.ceil(hSize / math.ceil(self.FontSize/2))
		local gsub = string.gsub
		local sub = string.sub

		local viewX,viewY = self.ViewX,self.ViewY

		local lineNumberStr = ""

		for row = 1,maxLines do
			local lineFrame = self.LineFrames[row]
			if not lineFrame then
				lineFrame = NewInstance("Frame")
				lineFrame.Name = "Line"
				lineFrame.Position = UDim2.new(0,0,0,(row-1)*self.FontSize)
				lineFrame.Size = UDim2.new(1,0,0,self.FontSize)
				lineFrame.BorderSizePixel = 0
				lineFrame.BackgroundTransparency = 1

				local selectionHighlight = NewInstance("Frame")
				selectionHighlight.Name = "SelectionHighlight"
				selectionHighlight.BorderSizePixel = 0
				selectionHighlight.BackgroundColor3 = Settings.Theme.Syntax.SelectionBack
				selectionHighlight.Parent = lineFrame
				selectionHighlight.BackgroundTransparency = 0.7

				local label = NewInstance("TextLabel")
				label.Name = "Label"
				label.BackgroundTransparency = 1
				label.FontFace = self.FontFace
				label.TextSize = self.FontSize
				label.Size = UDim2.new(1,0,0,self.FontSize)
				label.RichText = true
				label.TextXAlignment = Enum.TextXAlignment.Left
				label.TextColor3 = self.Colors.Text
				label.ZIndex = 2
				label.Parent = lineFrame

				lineFrame.Parent = linesFrame
				self.LineFrames[row] = lineFrame
			end

			local relaY = viewY + row
			local lineText = self.Lines[relaY] or ""
			local resText = ""
			local highlights = self:HighlightLine(relaY)
			local colStart = viewX + 1

			local richTemplates = self.RichTemplates
			local textTemplate = richTemplates.Text
			local selectionTemplate = richTemplates.Selection
			local curType = highlights[colStart]
			local curTemplate = richTemplates[typeMap[curType]] or textTemplate

			-- Selection Highlight
			local selectionRange = self.SelectionRange
			local selPos1 = selectionRange[1]
			local selPos2 = selectionRange[2]
			local _,selRelaY = viewX,relaY-1

			if selRelaY >= selPos1[2] and selRelaY <= selPos2[2] then
				local fontSizeX = math.ceil(self.FontSize/2)
				local posX = (selRelaY == selPos1[2] and selPos1[1] or 0) - viewX
				local sizeX = (selRelaY == selPos2[2] and selPos2[1]-posX-viewX or maxCols+viewX)

				lineFrame.SelectionHighlight.Position = UDim2.new(0,posX*fontSizeX,0,0)
				lineFrame.SelectionHighlight.Size = UDim2.new(0,sizeX*fontSizeX,1,0)
				lineFrame.SelectionHighlight.Visible = true
			else
				lineFrame.SelectionHighlight.Visible = false
			end

			for col = 2,maxCols do
				local relaX = viewX + col
				local posType = highlights[relaX]

				if posType ~= curType then
					local template = (false and selectionTemplate) or richTemplates[typeMap[posType]] or textTemplate

					if template ~= curTemplate then
						local nextText = gsub(sub(lineText,colStart,relaX-1),"['\"<>&]", richReplace)
						resText = resText .. (curTemplate ~= textTemplate and (curTemplate .. nextText .. "</font>") or nextText)
						colStart = relaX
						curTemplate = template
					end
					curType = posType
				end
			end

			local lastText = gsub(sub(lineText,colStart,viewX+maxCols),"['\"<>&]", richReplace)
			--warn("SUB",colStart,viewX+maxCols-1)
			if #lastText > 0 then
				resText = resText .. (curTemplate ~= textTemplate and (curTemplate .. lastText .. "</font>") or lastText)
			end

			if self.Lines[relaY] then
				lineNumberStr = lineNumberStr .. (relaY-1 == self.CursorY and ('<b>'..relaY.."</b>\n") or relaY .. "\n")
			end

			lineFrame.Label.Text = resText
		end

		for i = maxLines+1,#self.LineFrames do
			self.LineFrames[i]:Destroy()
			self.LineFrames[i] = nil
		end

		self.Frame.LineNumbers.Text = lineNumberStr
		self:UpdateCursor()

		--print("REFRESH TIME",tick()-start)
	end

	funcs.UpdateView = function(self)
		local totalLinesStr = tostring(#self.Lines)
		local fontWidth = math.ceil(self.FontSize / 2)
		local linesOffset = #totalLinesStr*fontWidth + 4*fontWidth

		local linesFrame = self.Frame.Lines
		local hSize = linesFrame.AbsoluteSize.X
		local vSize = linesFrame.AbsoluteSize.Y
		local maxLines = math.ceil(vSize / self.FontSize)
		local totalWidth = self.MaxTextCols*fontWidth
		local scrollV = self.ScrollV
		local scrollH = self.ScrollH

		scrollV.VisibleSpace = maxLines
		scrollV.TotalSpace = #self.Lines + 1
		scrollH.VisibleSpace = math.ceil(hSize/fontWidth)
		scrollH.TotalSpace = self.MaxTextCols + 1

		scrollV.Gui.Visible = #self.Lines + 1 > maxLines
		scrollH.Gui.Visible = totalWidth > hSize

		local oldOffsets = self.FrameOffsets
		self.FrameOffsets = Vector2.new(scrollV.Gui.Visible and -10 or 0, scrollH.Gui.Visible and -10 or 0)
		if oldOffsets ~= self.FrameOffsets then
			self:UpdateView()
		else
			scrollV:ScrollTo(self.ViewY,true)
			scrollH:ScrollTo(self.ViewX,true)

			if scrollV.Gui.Visible and scrollH.Gui.Visible then
				scrollV.Gui.Size = UDim2.new(0,10,1,-10)
				scrollH.Gui.Size = UDim2.new(1,-10,0,10)
				self.GuiElems.ScrollCorner.Visible = true
			else
				scrollV.Gui.Size = UDim2.new(0,10,1,0)
				scrollH.Gui.Size = UDim2.new(1,0,0,10)
				self.GuiElems.ScrollCorner.Visible = false
			end

			self.ViewY = scrollV.Index
			self.ViewX = scrollH.Index
			self.Frame.Lines.Position = UDim2.new(0,linesOffset,0,0)
			self.Frame.Lines.Size = UDim2.new(1,-linesOffset+oldOffsets.X,1,oldOffsets.Y)
			self.Frame.LineNumbers.Position = UDim2.new(0,fontWidth,0,0)
			self.Frame.LineNumbers.Size = UDim2.new(0,#totalLinesStr*fontWidth,1,oldOffsets.Y)
			self.Frame.LineNumbers.TextSize = self.FontSize
		end
	end

	funcs.ProcessTextChange = function(self)
		local maxCols = 0
		local lines = self.Lines

		for i = 1,#lines do
			local lineLen = #lines[i]
			if lineLen > maxCols then
				maxCols = lineLen
			end
		end

		self.MaxTextCols = maxCols
		self:UpdateView()	
		self.Text = table.concat(self.Lines,"\n")
		self:MapNewLines()
		self:PreHighlight()
		self:Refresh()
		--self.TextChanged:Fire()
	end

	funcs.ConvertText = function(self,text,toEditor)
		if toEditor then
			local new = text:gsub("\t", "    ")
			return new:gsub("\t",(" %s%s "):format(tabSub,tabSub))
		else
			return text:gsub((" %s%s "):format(tabSub,tabSub),"\t")
		end
	end

	funcs.GetText = function(self) -- TODO: better (use new tab format)
		local source = table.concat(self.Lines,"\n")
		return self:ConvertText(source,false) -- Tab Convert
	end

	funcs.SetText = function(self,txt)
		txt = self:ConvertText(txt,true) -- Tab Convert
		local lines = self.Lines
		table.clear(lines)
		local count = 1

		for line in txt:gmatch("([^\n\r]*)[\n\r]?") do
			lines[count] = line
			count = count + 1
		end

		self:ProcessTextChange()
	end

	funcs.ClearText = function(self)
		local txt = self:ConvertText('',true)
		local lines = self.Lines
		table.clear(lines)
		local count = 1

		for line in txt:gmatch("([^\n\r]*)[\n\r]?") do
			lines[count] = line
			count = count + 1
		end

		self:ProcessTextChange()
	end

	funcs.CompileText = function(self)
		local loaded = pcall(function()
			local source = table.concat(self.Lines, "\n")
			local convertedSource = self:ConvertText(source, false)
			loadstring(convertedSource)()
		end)

		return loaded
	end

	funcs.ReturnErrors = function(self)
		local loaded, err = pcall(function()
			local source = table.concat(self.Lines, "\n")
			local convertedSource = self:ConvertText(source, false)
			loadstring(convertedSource)()
		end)

		return not loaded and err or nil
	end

	funcs.GetVersion = function(self)
		return IDEVersion
	end

	funcs.MakeRichTemplates = function(self)
		local floor = math.floor
		local templates = {}

		for name,color in pairs(self.Colors) do
			templates[name] = ('<font color="rgb(%s,%s,%s)">'):format(floor(color.r*255),floor(color.g*255),floor(color.b*255))
		end

		self.RichTemplates = templates
	end

	funcs.ApplyTheme = function(self)
		local colors = Settings.Theme.Syntax
		self.Colors = colors
		self.Frame.LineNumbers.TextColor3 = colors.Text
		self.Frame.BackgroundColor3 = colors.Background
	end

	local mt = {__index = funcs}

	local function new(Overwrites)
		Overwrites = Overwrites or {}
		if not builtInInited then initBuiltIn() end

		local scrollV = Lib.ScrollBar.new()
		local scrollH = Lib.ScrollBar.new(true)
		scrollH.Gui.Position = UDim2.new(0,0,1,-10)
		
		local Base = {
			FontFace = Font.fromEnum(Enum.Font.Code),
			FontSize = 14,
			ViewX = 0,
			ViewY = 0,
			Colors = Settings.Theme.Syntax,
			ColoredLines = {},
			Lines = {""},
			LineFrames = {},
			Editable = true,
			Editing = false,
			CursorX = 0,
			CursorY = 0,
			FloatCursorX = 0,
			Text = "",
			PreHighlights = {},
			SelectionRange = {{-1,-1},{-1,-1}},
			NewLines = {},
			FrameOffsets = Vector2.new(0,0),
			MaxTextCols = 0,
			ScrollV = scrollV,
			ScrollH = scrollH
		}
		
		local Properties = Merge(Base, Overwrites)
		local obj = setmetatable(Properties, mt)

		funcs.SetTextMultiplier = (function(arg)
			obj.FontSize = arg
		end)
		funcs.GetTextMultiplier = (function()
			return obj.FontSize
		end)

		scrollV.WheelIncrement = 3
		scrollH.Increment = 2
		scrollH.WheelIncrement = 7

		scrollV.Scrolled:Connect(function()
			obj.ViewY = scrollV.Index
			obj:Refresh()
		end)

		scrollH.Scrolled:Connect(function()
			obj.ViewX = scrollH.Index
			obj:Refresh()
		end)

		obj:MakeEditorFrame(obj)
		obj:MakeRichTemplates()
		obj:ApplyTheme()
		scrollV:SetScrollFrame(obj.Frame.Lines)
		scrollV.Gui.Parent = obj.Frame
		scrollH.Gui.Parent = obj.Frame

		obj:UpdateView()
		obj:SetText(Properties.Text)

		obj.Frame:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
			obj:UpdateView()
			obj:Refresh()
		end)

		return obj
	end

	return {new = new}
end)()

return Lib