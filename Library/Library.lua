for _,v in pairs(game:FindFirstChildWhichIsA("CoreGui"):GetDescendants()) do
    if v:IsA("ScreenGui") and v.Name == "SoupWareV2" then
        v:Destroy()
    end
end

if not isfolder("SoupWareV2") then makefolder("SoupWareV2") end

local TweenService = game:GetService("TweenService")
local TextService = game:GetService('TextService')
local copy = setclipboard or toclipboard

local ITEMS = {}

ITEMS.Service = {
	["Players"] = game:GetService("Players"),
	["UserInputService"] = game:GetService("UserInputService"),
	["Player"] = game:GetService("Players").LocalPlayer
}

local SoupWareV2 = Instance.new("ScreenGui")
SoupWareV2.Name = "SoupWareV2"
SoupWareV2.Parent = game.CoreGui

-----------------------------------------------------------

local function IsRunning()
	return SoupWareV2.Parent == game:GetService("CoreGui")
end

function ITEMS:AddConnection(Signal, Function)
	if IsRunning() then
		local SignalConnect = Signal:Connect(Function)
		table.insert(ITEMS.Connections, SignalConnect)

		return SignalConnect
	end
end

task.spawn(function()
	while (IsRunning()) do
		wait()
	end

	if next(ITEMS.Connections) then
		for _, Connection in next, ITEMS.Connections do
			Connection:Disconnect()
		end
	end
end)

-----------------------------------------------------------

local function drag(Frame, dragSpeed)
	local dragToggle, dragInput, dragStart, startPos
	local dragSpeed = dragSpeed or 0.15

	local function updateInput(input)
		local Delta = input.Position - dragStart
		local Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
		
		game:GetService("TweenService"):Create(Frame, TweenInfo.new(dragSpeed), {Position = Position}):Play()
	end

	Frame.InputBegan:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
			dragToggle = true
			dragStart = input.Position
			startPos = Frame.Position
			input.Changed:Connect(function()
				if (input.UserInputState == Enum.UserInputState.End) then
					dragToggle = false
				end
			end)
		end
	end)

	Frame.InputChanged:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
			dragInput = input
		end
	end)

	game:GetService("UserInputService").InputChanged:Connect(function(input)
		if (input == dragInput and dragToggle) then
			updateInput(input)
		end
	end)
end

-----------------------------------------------------------

local function ReturnProperty(Object)
	if Object:IsA("Frame") or Object:IsA("TextButton") then
		return "BackgroundTransparency"
	end 
	if Object:IsA("ScrollingFrame") then
		return "ScrollBarImageTransparency"
	end 
	if Object:IsA("TextLabel") or Object:IsA("TextBox") then
		return "TextTransparency"
	end   
	if Object:IsA("ImageLabel") or Object:IsA("ImageButton") then
		return "ImageTransparency"
	end   
end

-----------------------------------------------------------

local Config = loadstring(game:HttpGet("https://raw.githubusercontent.com/0xBqz/SoupWareV2/main/Library/Configuration.lua", true))()

local Gui = Config:Window("configuration", "Main", true)

local Interface = Gui:getframe()
Interface.Parent = SoupWareV2

drag(Interface)

-----------------------------------------------------------

Gui:text("Links:")

for Index, Link in pairs({
	["SWv2 web page"] = "https://0xbqz.github.io/SoupWareV2",
	["SWv2 repo"] = "https://github.com/0xBqz/SoupWareV2",
	["SWv1 repo"] = "https://github.com/0xBqz/SoupWare",
	["0xBqz's profile"] = "https://www.roblox.com/users/3120331018/profile"
}) do
	Gui:button({
		Name = Index,
		Callback = function()
			copy(Link)
		end
	})
end

Gui:text("Gui:")

local StartInvisible = Gui:toggle({Name = "start invisible"})
local StartTransparency = Gui:toggle({Name = "start transparent"})

-----------------------------------------------------------

local Frame = Instance.new("Frame")
Frame.Parent = SoupWareV2
Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
Frame.Size = UDim2.new(0, 448, 0, 349)
Frame.AnchorPoint = Vector2.new(0.5, 0.5)

drag(Frame)

local scroll = Instance.new("ScrollingFrame")
scroll.Name = "scroll"
scroll.Parent = Frame
scroll.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
scroll.BackgroundTransparency = 1.000
scroll.BorderColor3 = Color3.fromRGB(27, 42, 53)
scroll.BorderSizePixel = 0
scroll.Position = UDim2.new(0.0167597365, 0, 0.154727787, 0)
scroll.Size = UDim2.new(0, 441, 0, 241)
scroll.ZIndex = 2
scroll.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
scroll.ScrollBarThickness = 5
scroll.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
scroll.ScrollBarImageColor3 = Color3.fromRGB(83, 83, 83)
scroll.CanvasSize = UDim2.new(0, 0, 0, 0)

--top:

local B_Roundy = Instance.new("Frame")
B_Roundy.Name = "B_Roundy"
B_Roundy.Parent = Frame
B_Roundy.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
B_Roundy.Position = UDim2.new(0.000594684039, 0, 0.00028296528, 0)
B_Roundy.Size = UDim2.new(0, 447, 0, 45)

local B_Frame = Instance.new("Frame")
B_Frame.Name = "B_Frame"
B_Frame.Parent = Frame
B_Frame.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
B_Frame.BorderSizePixel = 0
B_Frame.Position = UDim2.new(0.000594684039, 0, 0.057589557, 0)
B_Frame.Size = UDim2.new(0, 447, 0, 25)

local B_Line = Instance.new("Frame")
B_Line.Name = "B_Line"
B_Line.Parent = Frame
B_Line.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
B_Line.BorderSizePixel = 0
B_Line.Position = UDim2.new(0, 0, 0.128939822, 0)
B_Line.Size = UDim2.new(0, 448, 0, 2)

local B_Gradient = Instance.new("Frame")
B_Gradient.Name = "B_Gradient"
B_Gradient.Parent = Frame
B_Gradient.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
B_Gradient.BorderSizePixel = 0
B_Gradient.Position = UDim2.new(-0.000779986382, 0, 0.133419752, 0)
B_Gradient.Size = UDim2.new(0, 448, 0, 53)

--searchbox:

local SearchBoxFrame = Instance.new("Frame")
SearchBoxFrame.Name = "SearchBoxFrame"
SearchBoxFrame.Parent = Frame
SearchBoxFrame.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
SearchBoxFrame.Position = UDim2.new(0.114426166, 0, 0.86, 0)
SearchBoxFrame.Size = UDim2.new(0, 344, 0, 39)

local zoom = Instance.new("ImageButton")
zoom.Name = "zoom"
zoom.Parent = SearchBoxFrame
zoom.BackgroundTransparency = 1.000
zoom.Position = UDim2.new(0.0180914607, 0, 0.171662614, 0)
zoom.Size = UDim2.new(0, 25, 0, 25)
zoom.ZIndex = 5
zoom.Image = "rbxassetid://6764432408"
zoom.ImageColor3 = Color3.fromRGB(188, 188, 188)
zoom.ImageRectOffset = Vector2.new(0, 800)
zoom.ImageRectSize = Vector2.new(50, 50)

local SeachBox = Instance.new("TextBox")
SeachBox.Name = "SeachBox"
SeachBox.Parent = SearchBoxFrame
SeachBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SeachBox.BackgroundTransparency = 1.000
SeachBox.Position = UDim2.new(0.105820462, 0, 0.0231154561, 0)
SeachBox.Size = UDim2.new(0, 302, 0, 38)
SeachBox.Font = Enum.Font.SourceSansBold
SeachBox.PlaceholderColor3 = Color3.fromRGB(204, 204, 204)
SeachBox.PlaceholderText = "TYPE HERE TO SEARCH BUTTONS"
SeachBox.Text = ""
SeachBox.TextColor3 = Color3.fromRGB(255, 255, 255)
SeachBox.TextSize = 17.000
SeachBox.TextXAlignment = Enum.TextXAlignment.Left

--main

local Title = Instance.new("TextLabel")
Title.Parent = Frame
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.BorderSizePixel = 0
Title.Position = UDim2.new(0.0316573568, 0, 0, 0)
Title.Size = UDim2.new(0, 407, 0, 45)
Title.Font = Enum.Font.SourceSansBold
Title.Text = "Soup-Ware v2"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 22.000
Title.TextXAlignment = Enum.TextXAlignment.Left

local List = Instance.new("Frame")
List.Name = "Configuration"
List.Parent = Frame
List.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
List.BackgroundTransparency = 1.000
List.Position = UDim2.new(0.478584707, 0, 0, 0)
List.Size = UDim2.new(0, 224, 0, 45)

local Conf = Instance.new("ImageButton")
Conf.Name = "aaa"
Conf.Parent = List
Conf.BackgroundColor3 = Color3.fromRGB(79, 79, 79)
Conf.BackgroundTransparency = 1.000
Conf.LayoutOrder = 1
Conf.Position = UDim2.new(0.5, 0, 0.5, 0)
Conf.Size = UDim2.new(0, 25, 0, 25)
Conf.ZIndex = 2
Conf.Image = "rbxassetid://3926307971"
Conf.ImageColor3 = Color3.fromRGB(188, 188, 188)
Conf.ImageRectOffset = Vector2.new(684, 204)
Conf.ImageRectSize = Vector2.new(36, 36)

local Minimize = Instance.new("ImageButton")
Minimize.Name = "bbb"
Minimize.Parent = List
Minimize.BackgroundColor3 = Color3.fromRGB(79, 79, 79)
Minimize.BackgroundTransparency = 1.000
Minimize.LayoutOrder = 2
Minimize.Position = UDim2.new(0.5, 0, 0.5, 0)
Minimize.Size = UDim2.new(0, 25, 0, 25)
Minimize.ZIndex = 2
Minimize.Image = "rbxassetid://3926305904"
Minimize.ImageColor3 = Color3.fromRGB(188, 188, 188)
Minimize.ImageRectOffset = Vector2.new(404, 844)
Minimize.ImageRectSize = Vector2.new(36, 36)

local Close = Instance.new("ImageButton")
Close.Name = "ccc"
Close.Parent = List
Close.BackgroundColor3 = Color3.fromRGB(79, 79, 79)
Close.BackgroundTransparency = 1.000
Close.LayoutOrder = 3
Close.Position = UDim2.new(0.5, 0, 0.5, 0)
Close.Size = UDim2.new(0, 25, 0, 25)
Close.ZIndex = 2
Close.Image = "rbxassetid://3926305904"
Close.ImageColor3 = Color3.fromRGB(188, 188, 188)
Close.ImageRectOffset = Vector2.new(284, 4)
Close.ImageRectSize = Vector2.new(24, 24)

-----------

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 25)
UICorner.Parent = Frame

local UICorner_2 = Instance.new("UICorner")
UICorner_2.CornerRadius = UDim.new(0, 25)
UICorner_2.Parent = B_Roundy

local UICorner_3 = Instance.new("UICorner")
UICorner_3.CornerRadius = UDim.new(0, 5)
UICorner_3.Parent = SearchBoxFrame

-----------

local UIGridLayout = Instance.new("UIGridLayout")
UIGridLayout.Parent = scroll
UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIGridLayout.CellPadding = UDim2.new(0, 5, 0, 10)
UIGridLayout.CellSize = UDim2.new(0, 140, 0, 120)

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Parent = List
UIListLayout.FillDirection = Enum.FillDirection.Horizontal
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
UIListLayout.Padding = UDim.new(0, 5)

-----------

local UIGradient = Instance.new("UIGradient")
UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(63, 63, 63)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(63, 63, 63))}
UIGradient.Rotation = 270
UIGradient.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 1.00), NumberSequenceKeypoint.new(1.00, 0.74)}
UIGradient.Parent = B_Gradient

--Details--

local Details = Instance.new("Frame")
Details.Name = "Details"
Details.Parent = SoupWareV2
Details.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Details.BackgroundTransparency = 1.000
Details.Position = UDim2.new(0, 0, 0.250793666, 0)
Details.Size = UDim2.new(0, 137, 0, 349)

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Parent = Details
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
UIListLayout.Padding = UDim.new(0, 10)

local container = Instance.new("Folder")
container.Name = "Container"
container.Parent = Frame

-----------

Frame.Size = UDim2.new(0, 0, 0, 0)
UICorner.CornerRadius = UDim.new(0, 40)
Frame.BackgroundTransparency = 1

-----------

local TransparencyItems = {
	Title,
	Conf,
	Minimize,
	Close,
	SearchBoxFrame,
	SeachBox,
	zoom,
	B_Gradient,
	B_Line,
	B_Roundy,
	B_Frame,
	scroll,
}

for _,Obj in pairs(TransparencyItems) do
	Obj[ReturnProperty(Obj)] = 1
end

local transparency = StartTransparency:getvalue()
local visible = not StartInvisible:getvalue()
local enabled = visible

-----------

function ITEMS:TRANS(time, value, buttons)
	local time = time or 0.5
	if value or value == nil then
		TweenService:Create(Frame, TweenInfo.new(time), {BackgroundTransparency = 0.6}):Play()
		TweenService:Create(Title, TweenInfo.new(time), {TextTransparency = 0.4}):Play()
		TweenService:Create(Conf, TweenInfo.new(time), {ImageTransparency = 0.5}):Play()
		TweenService:Create(Minimize, TweenInfo.new(time), {ImageTransparency = 0.5}):Play()
		TweenService:Create(Close, TweenInfo.new(time), {ImageTransparency = 0.5}):Play()
		TweenService:Create(SearchBoxFrame, TweenInfo.new(time), {BackgroundTransparency = 0.5}):Play()
		TweenService:Create(SeachBox, TweenInfo.new(time), {TextTransparency = 0.5}):Play()
		TweenService:Create(zoom, TweenInfo.new(time), {ImageTransparency = 0.6}):Play()
		TweenService:Create(B_Gradient, TweenInfo.new(time), {BackgroundTransparency = 0.7}):Play()
		TweenService:Create(B_Line, TweenInfo.new(time), {BackgroundTransparency = 1}):Play()
		TweenService:Create(B_Roundy, TweenInfo.new(time), {BackgroundTransparency = 0.7}):Play()
		TweenService:Create(B_Frame, TweenInfo.new(time), {BackgroundTransparency = 1}):Play()
		TweenService:Create(scroll, TweenInfo.new(time), {ScrollBarImageTransparency = 0.5}):Play()
		if buttons or buttons == nil then
			for _,v in pairs(scroll:GetDescendants()) do
				if v:IsA("Frame") or v:IsA("TextButton") then
					TweenService:Create(v, TweenInfo.new(time), {BackgroundTransparency = 0.6}):Play()
				elseif v:IsA("TextButton") or v:IsA("TextLabel") then
					TweenService:Create(v, TweenInfo.new(time), {TextTransparency = 0.6}):Play()
				elseif v:IsA("ImageButton") then
					TweenService:Create(v, TweenInfo.new(time), {ImageTransparency = 0.6}):Play()
				end
			end
		end
	else
		TweenService:Create(Title, TweenInfo.new(time), {TextTransparency = 0}):Play()
		TweenService:Create(Conf, TweenInfo.new(time), {ImageTransparency = 0}):Play()
		TweenService:Create(Minimize, TweenInfo.new(time), {ImageTransparency = 0}):Play()
		TweenService:Create(Close, TweenInfo.new(time), {ImageTransparency = 0}):Play()
		TweenService:Create(SearchBoxFrame, TweenInfo.new(time), {BackgroundTransparency = 0}):Play()
		TweenService:Create(SeachBox, TweenInfo.new(time), {TextTransparency = 0}):Play()
		TweenService:Create(zoom, TweenInfo.new(time), {ImageTransparency = 0}):Play()
		TweenService:Create(B_Gradient, TweenInfo.new(time), {BackgroundTransparency = 0}):Play()
		TweenService:Create(B_Line, TweenInfo.new(time), {BackgroundTransparency = 0}):Play()
		TweenService:Create(B_Roundy, TweenInfo.new(time), {BackgroundTransparency = 0}):Play()
		TweenService:Create(B_Frame, TweenInfo.new(time), {BackgroundTransparency = 0}):Play()
		TweenService:Create(scroll, TweenInfo.new(time), {ScrollBarImageTransparency = 0}):Play()
		if buttons or buttons == nil then
			for _,v in pairs(scroll:GetDescendants()) do
				if v:IsA("Frame") or v:IsA("TextButton") then
					TweenService:Create(v, TweenInfo.new(time), {BackgroundTransparency = 0}):Play()
				elseif v:IsA("TextButton") or v:IsA("TextLabel") then
					TweenService:Create(v, TweenInfo.new(time), {TextTransparency = 0}):Play()
				elseif v:IsA("ImageButton") then
					TweenService:Create(v, TweenInfo.new(time), {ImageTransparency = 0}):Play()
				end
			end
		end
		TweenService:Create(Frame, TweenInfo.new(time), {BackgroundTransparency = 0}):Play()
	end
end

function ITEMS:Visible(time, value, buttons)
	local time = time or 0.5

	for _, v in next, container:GetChildren() do
		v.Visible = false
	end

	if value or value == nil then
		TweenService:Create(Frame, TweenInfo.new(time), {BackgroundTransparency = 0}):Play()
		TweenService:Create(Frame, TweenInfo.new(time), {Size = UDim2.new(0, 448, 0, 349)}):Play()
		TweenService:Create(UICorner, TweenInfo.new(time), {CornerRadius = UDim.new(0, 25)}):Play()

		wait(time)

		for _, Obj in pairs(TransparencyItems) do
			TweenService:Create(Obj, TweenInfo.new(time), {[ReturnProperty(Obj)] = 0}):Play()
		end
		
		if buttons or buttons == nil then
			for _,v in pairs(scroll:GetDescendants()) do
				if v:IsA("Frame") or v:IsA("TextButton") then
					TweenService:Create(v, TweenInfo.new(time), {BackgroundTransparency = 0}):Play()
				elseif v:IsA("TextButton") or v:IsA("TextLabel") then
					TweenService:Create(v, TweenInfo.new(time), {TextTransparency = 0}):Play()
				elseif v:IsA("ImageButton") then
					TweenService:Create(v, TweenInfo.new(time), {ImageTransparency = 0}):Play()
				end
			end
		end
	else
		for _, Obj in pairs(TransparencyItems) do
			TweenService:Create(Obj, TweenInfo.new(time), {[ReturnProperty(Obj)] = 1}):Play()
		end

		if buttons or buttons == nil then
			for _,v in pairs(scroll:GetDescendants()) do
				if v:IsA("Frame") or v:IsA("TextButton") then
					TweenService:Create(v, TweenInfo.new(time), {BackgroundTransparency = 1}):Play()
				elseif v:IsA("TextButton") or v:IsA("TextLabel") then
					TweenService:Create(v, TweenInfo.new(time), {TextTransparency = 1}):Play()
				elseif v:IsA("ImageButton") then
					TweenService:Create(v, TweenInfo.new(time), {ImageTransparency = 1}):Play()
				end
			end
		end

		wait(time + 0.1)
		TweenService:Create(Frame, TweenInfo.new(time), {BackgroundTransparency = 1}):Play()
		TweenService:Create(Frame, TweenInfo.new(time), {Size = UDim2.new(0, 0, 0, 0)}):Play()
		TweenService:Create(UICorner, TweenInfo.new(time), {CornerRadius = UDim.new(0, 40)}):Play()
	end
end

local moving = true

if visible then
	ITEMS:Visible(1, true, false)
	if transparency then
		ITEMS:TRANS(0.5, true, true)	
	end
end

-----------

Gui:keybind({
	Name = "visible",
	Callback = function()
		if moving then
			moving = false

			ITEMS:Visible(enabled and 0.4 or 0.5, not enabled)
			enabled = not enabled

			wait(enabled and 0.4 or 0.6)

			moving = true

			if enabled then
				ITEMS:TRANS(0.3, transparency, true)
			end
		end
	end
})

Gui:keybind({
	Name = "opacity",
	Callback = function()
		transparency = not transparency

		ITEMS:TRANS(0.5, transparency, true)
	end
})

Gui:keybind({
	Name = "focus bar",
	Callback = function()
		wait(0.3)
		SeachBox:CaptureFocus()
	end
})

local function MouseEnterColor(frame,colorin,colorout, anotherone)
	local main = anotherone or frame
	frame.MouseEnter:Connect(function()
		if frame:IsA("ImageButton") or frame:IsA("ImageLabel") then
			TweenService:Create(main, TweenInfo.new(0.4), {ImageColor3 = colorin, Size = UDim2.new(0, 30, 0, 30)}):Play()
		else
			TweenService:Create(main, TweenInfo.new(0.4), {BackgroundColor3 = colorin}):Play()
		end
	end)
	frame.MouseLeave:Connect(function()
		if frame:IsA("ImageButton") or frame:IsA("ImageLabel") then
			TweenService:Create(main, TweenInfo.new(0.4), {ImageColor3 = colorout, Size = UDim2.new(0, 25, 0, 25)}):Play()
		else
			TweenService:Create(main, TweenInfo.new(0.4), {BackgroundColor3 = colorout}):Play()
		end
		TweenService:Create(main, TweenInfo.new(0.4), {
			BackgroundColor3 = colorout
		}):Play()
	end)

	if frame:IsA("ImageButton") or frame:IsA("ImageLabel") then
		frame.MouseButton1Click:Connect(function()
			local color = frame.ImageColor3
			local size = frame.Size
	
			TweenService:Create(main, TweenInfo.new(0.1), {
				ImageColor3 = Color3.fromRGB(255, 255, 255)
			}):Play()
			TweenService:Create(main, TweenInfo.new(0.1), {
				Size = UDim2.new(0, 33, 0, 33)
			}):Play()
	
			wait(0.2)
	
	
			TweenService:Create(main, TweenInfo.new(0.2), {
				ImageColor3 = color
			}):Play()
			TweenService:Create(main, TweenInfo.new(0.2), {
				Size = size
			}):Play()
		end)
	end
end

do
	Minimize.MouseButton1Click:Connect(function()
		transparency = not transparency
	
		ITEMS:TRANS(0.5, transparency, true)
	end)
	
	Conf.MouseButton1Click:Connect(function()
		Interface.Visible = not Interface.Visible
	end)
	
	Close.MouseButton1Click:Connect(function()
		ITEMS:Visible(0.6, false, true)
	end)	

	for _,Obj in pairs({Close, Minimize, Conf}) do
		MouseEnterColor(Obj, Color3.fromRGB(233, 233, 233), Color3.fromRGB(188, 188, 188))
	end
end

--search box

do
	local reading = false

	SearchBoxFrame.MouseEnter:Connect(function()
		reading = true
	end)

	SearchBoxFrame.MouseLeave:Connect(function()
		if reading then reading = false end
	end)

	SeachBox.Focused:Connect(function()
		TweenService:Create(zoom, TweenInfo.new(0.1), {
			ImageColor3 = Color3.fromRGB(233, 233, 233)
		}):Play()
		TweenService:Create(zoom, TweenInfo.new(0.1), {
			Size = UDim2.new(0, 30, 0, 30)
		}):Play()
		TweenService:Create(zoom, TweenInfo.new(0.1), {
			Position = UDim2.new(0.0160914607, 0, 0.1, 0)
		}):Play()

	reading = false
	end)

	SeachBox.FocusLost:Connect(function()
		TweenService:Create(zoom, TweenInfo.new(0.1), {
			ImageColor3 = Color3.fromRGB(188, 188, 188)
		}):Play()
		TweenService:Create(zoom, TweenInfo.new(0.1), {
			Size = UDim2.new(0, 25, 0, 25)
		}):Play()
		TweenService:Create(zoom, TweenInfo.new(0.1), {
			Position = UDim2.new(0.0180914607, 0, 0.171662614, 0)
		}):Play()

		SeachBox.Text = ""

		reading = true
	end)

	SeachBox.Changed:Connect(function()
		local Match = {}
		if SeachBox.Text == "" then
			for _,UI in pairs(scroll:GetChildren()) do
				if UI:IsA("TextButton") then
					UI.Visible = true;
				end;
			end;
			scroll.CanvasSize = UDim2.new(0, 0, 0, UIGridLayout.AbsoluteContentSize.Y)
		else
			for _,UI in pairs(scroll:GetChildren()) do
				if UI:IsA("TextButton") then
					if UI.Title ~= nil then
						if UI.Title.Text:find(SeachBox.Text) then
							table.insert(Match, UI);
						end;
						UI.Visible = false;
					end
				end;
			end;
			for _,UI in pairs(Match) do
				UI.Visible = true
			end
			scroll.CanvasSize = UDim2.new(0, 0, 0, UIGridLayout.AbsoluteContentSize.Y)
		end
	end)
end

-----------------------------------------------------------

--images

local function simbol(simbol)
	local simbols = {
		["run"] = {
			"rbxassetid://3926305904",
			Vector2.new(924, 684),
			Vector2.new(36, 36)
		},
		["body"] = {
			"rbxassetid://3926307971",
			Vector2.new(164, 124),
			Vector2.new(36, 36)
		},
		["conf"] = {
			"rbxassetid://3926307971",
			Vector2.new(164, 12),
			Vector2.new(36, 36)
		},
		["plugin"] = {
			"rbxassetid://3926305904",
			Vector2.new(924, 244),
			Vector2.new(36, 36)
		},
		["hd"] = {
			"rbxassetid://3926305904",
			Vector2.new(284, 164),
			Vector2.new(36, 36)
		}
	}

	local Simbol = Instance.new("ImageButton")
	Simbol.BackgroundTransparency = 1.000
	Simbol.Position = UDim2.new(0.32100001, 0, 0.125, 0)
	Simbol.Size = UDim2.new(0, 50, 0, 50)
	Simbol.ZIndex = 2

	Simbol.Image           = simbols[simbol][1]
	Simbol.ImageRectOffset = simbols[simbol][2]
	Simbol.ImageRectSize   = simbols[simbol][3]

	return Simbol
end

--config

local function SetButton(settings)
	local ConfigLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/0xBqz/SoupWareV2/main/Library/Configuration.lua"))()
	local Lib = ConfigLibrary:Window(settings.Name, settings.Name, false)

	local Interface = Lib:getframe()
	Interface.Parent = container
	Interface.Position = UDim2.new(Frame.Position.X.Scale + 0.52, Frame.Position.X.Offset, 0, 0)

	local Frame = settings.Frame

	MouseEnterColor(Frame, Color3.fromRGB(59, 59, 59), Color3.fromRGB(46, 46, 46))
	MouseEnterColor(Frame.Frame, Color3.fromRGB(31, 31, 31),Color3.fromRGB(34, 34, 34))

	local Value = Lib:toggle({
		Name = "start on execute",
		Default = false
	})

	local value = Value:getvalue()

	if value then
		pcall(function() 
			settings:set(value, false, 0.3)
		end)

		pcall(settings.Callback, true)
	end

	function settings:Execute()
		if IsRunning() then
			if settings.toggle then
				value = not value
	
				settings:set(value, true)
			else
				pcall(settings.Callback)
			end
		end
	end

	function settings:Get()
		return value
	end

	Lib:button({
		Name = "execute",
		Callback = function()
			settings:Execute()
		end
	})

	Lib:keybind({
		Name = "keybind",
		Default = nil,
		Callback = function() 
			settings:Execute()
		end
	})

	Frame.MouseButton1Click:Connect(function()
		settings:Execute()
	end)

	Frame.MouseButton2Click:Connect(function()
		local visible = Interface.Visible

		for _, Obj in next, container:GetChildren() do
			Obj.Visible = false
		end

		Interface.Visible = not visible
	end)

	scroll.CanvasSize = UDim2.new(0, 0, 0, UIGridLayout.AbsoluteContentSize.Y)

	return settings, value
end

--get:

function ITEMS:GetLib()
	return game.CoreGui.SoupWareV2
end

--button

function ITEMS:button(settings)
	local Button = Instance.new("TextButton")
	Button.Name = "Button"
	Button.Parent = scroll
	Button.BackgroundColor3 = Color3.fromRGB(46, 46, 46)
	Button.Size = UDim2.new(0, 140, 0, 120)
	Button.ZIndex = 2
	Button.Font = Enum.Font.SourceSans
	Button.Text = ""
	Button.TextColor3 = Color3.fromRGB(0, 0, 0)
	Button.TextSize = 14.000
	Button.Active = false
	Button.AutoButtonColor = false
	
	local Title = Instance.new("TextLabel")
	Title.Name = "Title"
	Title.Parent = Button
	Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Title.BackgroundTransparency = 1.000
	Title.Position = UDim2.new(0.0199, 0, 0.60, 0)
	Title.Size = UDim2.new(0, 133, 0, 24)
	Title.ZIndex = 3
	Title.Font = Enum.Font.SourceSansBold
	Title.TextColor3 = Color3.fromRGB(255, 255, 255)
	Title.TextScaled = true
	Title.TextSize = 17.000
	Title.TextWrapped = true
	Title.Text = tostring(settings.Name)

	local Frame = Instance.new("Frame")
	Frame.Parent = Button
	Frame.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
	Frame.Position = UDim2.new(0.025, 0, 0.0169998165, 0)
	Frame.Size = UDim2.new(0, 134, 0, 115)
	Frame.ZIndex = 2

	local UICorner = Instance.new("UICorner")
	UICorner.CornerRadius = UDim.new(0, 5)
	UICorner.Parent = Button

	local UICorner_2 = Instance.new("UICorner")
	UICorner_2.CornerRadius = UDim.new(0, 5)
	UICorner_2.Parent = Frame

	local Sim = simbol(settings.Image)
	Sim.Parent = Button

	local TransparencyObjects = {
		Button,
		Title,
		Frame,
		Sim
	}

	for _,Obj in pairs(TransparencyObjects) do
		Obj[ReturnProperty(Obj)] = 1

		if not StartInvisible:getvalue() then
			if transparency then
				TweenService:Create(Obj, TweenInfo.new(0.5), {[ReturnProperty(Obj)] = 0.5}):Play()
			else
				TweenService:Create(Obj, TweenInfo.new(0.5), {[ReturnProperty(Obj)] = 0}):Play()
			end
		end
	end

	settings.Frame = Button
	settings.toggle = false

	return SetButton(settings)
end

--toggle

function ITEMS:toggle(settings)
	local Toggle = Instance.new("TextButton")
	Toggle.Name = "Toggle"
	Toggle.Parent = scroll
	Toggle.BackgroundColor3 = Color3.fromRGB(46, 46, 46)
	Toggle.Size = UDim2.new(0, 140, 0, 120)
	Toggle.ZIndex = 2
	Toggle.Font = Enum.Font.SourceSans
	Toggle.Text = ""
	Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
	Toggle.TextSize = 14.000
	Toggle.AutoButtonColor = false
	Toggle.Active = false

	local Title = Instance.new("TextLabel")
	Title.Name = "Title"
	Title.Parent = Toggle
	Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Title.BackgroundTransparency = 1.000
	Title.Position = UDim2.new(0.0262438096, 0, 0.400000006, 0)
	Title.Size = UDim2.new(0, 133, 0, 24)
	Title.ZIndex = 3
	Title.Font = Enum.Font.SourceSansBold
	Title.TextColor3 = Color3.fromRGB(255, 255, 255)
	Title.TextScaled = true
	Title.TextSize = 17.000
	Title.Text = tostring(settings.Name)
	Title.TextWrapped = true

	local UICorner = Instance.new("UICorner")
	UICorner.CornerRadius = UDim.new(0, 5)
	UICorner.Parent = Toggle

	local Frame = Instance.new("Frame")
	Frame.Parent = Toggle
	Frame.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
	Frame.Position = UDim2.new(0.025, 0, 0.0169998165, 0)
	Frame.Size = UDim2.new(0, 134, 0, 115)
	Frame.ZIndex = 2
	
	local UICorner_2 = Instance.new("UICorner")
	UICorner_2.CornerRadius = UDim.new(0, 5)
	UICorner_2.Parent = Frame

	local Frame_2 = Instance.new("Frame")
	Frame_2.Parent = Toggle
	Frame_2.BackgroundColor3 = Color3.fromRGB(46, 46, 46)
	Frame_2.Position = UDim2.new(0.269675553, 0, 0.649999976, 0)
	Frame_2.Size = UDim2.new(0, 67, 0, 30)
	Frame_2.ZIndex = 3

	local UICorner_3 = Instance.new("UICorner")
	UICorner_3.CornerRadius = UDim.new(0, 5)
	UICorner_3.Parent = Frame_2

	local Frame_3 = Instance.new("Frame")
	Frame_3.Parent = Frame_2
	Frame_3.BackgroundColor3 = Color3.fromRGB(68, 68, 68)
	Frame_3.Position = UDim2.new(-0.0123128891, 0, 0, 0)
	Frame_3.Size = UDim2.new(0, 30, 0, 30)
	Frame_3.ZIndex = 3

	local UICorner_4 = Instance.new("UICorner")
	UICorner_4.CornerRadius = UDim.new(0, 5)
	UICorner_4.Parent = Frame_3

	local Sim = simbol(settings.Image)
	Sim.Parent = Toggle
	Sim.Position = UDim2.new(0.32100001, 0, 0.025, 0)

	local TransparencyObjects = {
		Toggle,
		Title,
		Frame,
		Frame_2,
		Frame_3,
		Sim
	}

	for _,Obj in pairs(TransparencyObjects) do
		Obj[ReturnProperty(Obj)] = 1

		if StartInvisible:getvalue() then
		else
			if transparency then
				TweenService:Create(Obj, TweenInfo.new(0.5), {[ReturnProperty(Obj)] = 0.5}):Play()
			else
				TweenService:Create(Obj, TweenInfo.new(0.5), {[ReturnProperty(Obj)] = 0}):Play()
			end
		end
	end

	function settings:set(value, callback, time)
		time = time or 0.8

		if callback then
			pcall(settings.Callback, value)
		end

		if value then
			TweenService:Create(Frame_2,TweenInfo.new(time),{
				BackgroundColor3 = Color3.fromRGB(80, 153, 195)
			}):Play()
			TweenService:Create(Frame_3,TweenInfo.new(time),{
				Position = UDim2.new(0.6, 0, 0, 0)
			}):Play()
		else
			TweenService:Create(Frame_2,TweenInfo.new(time + 0.2),{
				BackgroundColor3 = Color3.fromRGB(46, 46, 46)
			}):Play()
			TweenService:Create(Frame_3,TweenInfo.new(time + 0.2),{
				Position =  UDim2.new(-0.0123128891, 0, 0, 0)
			}):Play()
		end
	end
	
	settings.Frame = Toggle
	settings.toggle = true

	return SetButton(settings)
end

--detail

function ITEMS:GetDetail(settings)
	local Frame = Instance.new("Frame")
	Frame.Name = "Frame"
	Frame.Parent = Details
	Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	Frame.BorderColor3 = Color3.fromRGB(136, 136, 136)
	Frame.BorderSizePixel = 2
	Frame.Position = UDim2.new(0, 0, 0.356733531, 0)
	Frame.Size = UDim2.new(0, 133, 0, 30)
	Frame.Visible = settings.Visible or false
	Frame.ZIndex = 5

	local text = Instance.new("TextLabel")
	text.Name = "text"
	text.Parent = Frame
	text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	text.BackgroundTransparency = 1.000
	text.Position = UDim2.new(0, 0, -0.20, 0)
	text.Size = UDim2.new(0, 127, 0, 40)
	text.Font = Enum.Font.SourceSansBold
	text.TextColor3 = Color3.fromRGB(255, 255, 255)
	text.TextSize = 24.000
	text.ZIndex = 6
	text.TextXAlignment = Enum.TextXAlignment.Left

	local texts = ""

	if typeof(settings) == "string" then
		texts = settings
		
		settings = {}
	else
		texts = settings.Name or settings[1]
	end

	function settings:visible(value)
		Frame.Visible = value
	end

	function settings:set(title)
		text.Text = tostring(" "..title)

		Frame.Size = UDim2.new(0, TextService:GetTextSize(text.Text, 24, Enum.Font.SourceSansBold, Vector2.new()).X + 10, 0, 30)
	end

	function settings:get()
		return text.Text
	end

	pcall(function()
		settings:set(tostring(texts))
	end)

	Frame.BackgroundTransparency = 1
	text.TextTransparency = 1

	TweenService:Create(Frame, TweenInfo.new(1), {BackgroundTransparency = 0}):Play()
	TweenService:Create(text, TweenInfo.new(1), {TextTransparency = 0}):Play()

	return settings
end

return ITEMS
