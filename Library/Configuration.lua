local HttpService = game:GetService("HttpService")
local Place = tostring(game.PlaceId)

local Library = {}
local config = {}

pcall(function()
    config = HttpService:JSONDecode(readfile("SoupWareV2/"..Place..".json"))
end)

local function save()
    writefile("SoupWareV2/"..Place..".json", HttpService:JSONEncode(config))
end

function Library:Window(Title, Path)

	--main:

    local Frame = Instance.new("Frame")
    Frame.Name = "conf"
    Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    Frame.Position = UDim2.new(0.725836456, 0, 0.3, 0)
    Frame.Size = UDim2.new(0, 183, 0, 349)
	Frame.Visible = false

	local scroll = Instance.new("ScrollingFrame")
	scroll.Name = "confscroll"
	scroll.Parent = Frame
	scroll.Active = true
	scroll.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	scroll.BackgroundTransparency = 1.000
	scroll.BorderColor3 = Color3.fromRGB(27, 42, 53)
	scroll.BorderSizePixel = 0
	scroll.Position = UDim2.new(0, 0, 0.134670481, 0)
	scroll.Size = UDim2.new(0, 183, 0, 282)
	scroll.ZIndex = 2
	scroll.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
	scroll.ScrollBarThickness = 5
	scroll.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
	scroll.ScrollBarImageColor3 = Color3.fromRGB(83, 83, 83)

	--top:

    local B_Frame = Instance.new("Frame")
    B_Frame.Name = "B_Frame"
    B_Frame.Parent = Frame
    B_Frame.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
    B_Frame.Position = UDim2.new(-0.00175701198, 0, 0.00150996435, 0)
    B_Frame.Size = UDim2.new(0, 183, 0, 45)

    local B_Frame_2 = Instance.new("Frame")
    B_Frame_2.Parent = B_Frame
    B_Frame_2.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
    B_Frame_2.BorderSizePixel = 0
    B_Frame_2.Position = UDim2.new(0, 0, 0.455000013, 0)
    B_Frame_2.Size = UDim2.new(0, 183, 0, 24)

    local B_Line = Instance.new("Frame")
    B_Line.Name = "B_Line"
    B_Line.Parent = Frame
    B_Line.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    B_Line.BorderSizePixel = 0
    B_Line.Position = UDim2.new(0, 0, 0.123209171, 0)
    B_Line.Size = UDim2.new(0, 183, 0, 2)

    local B_Invis = Instance.new("Frame")
    B_Invis.Name = "invis"
    B_Invis.Parent = Frame
    B_Invis.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    B_Invis.BackgroundTransparency = 1.000
    B_Invis.Size = UDim2.new(0, 179, 0, 45)

    local Titles = Instance.new("TextLabel")
    Titles.Name = "Title"
    Titles.Parent = Frame
    Titles.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Titles.BackgroundTransparency = 1.000
    Titles.Position = UDim2.new(0.0546448082, 0, 0, 0)
    Titles.Size = UDim2.new(0, 172, 0, 50)
    Titles.Font = Enum.Font.SourceSansBold
    Titles.Text = Title
    Titles.TextColor3 = Color3.fromRGB(255, 255, 255)
    Titles.TextSize = 17.000
    Titles.TextXAlignment = Enum.TextXAlignment.Left

	--extras:

    local UIListLayout = Instance.new("UIListLayout")
    UIListLayout.Parent = B_Invis
    UIListLayout.FillDirection = Enum.FillDirection.Horizontal
    UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
    UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
    UIListLayout.Padding = UDim.new(0, 5)

    local UIListLayout_2 = Instance.new("UIListLayout")
    UIListLayout_2.Parent = scroll
    UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center
    UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout_2.Padding = UDim.new(0, 5)

    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 15)
    UICorner.Parent = Frame

    local UICorner_2 = Instance.new("UICorner")
    UICorner_2.CornerRadius = UDim.new(0, 15)
    UICorner_2.Parent = B_Frame

	--close
	
    local close = Instance.new("ImageButton")
    close.Name = "close"
    close.Parent = B_Invis
    close.BackgroundColor3 = Color3.fromRGB(79, 79, 79)
    close.BackgroundTransparency = 1.000
    close.LayoutOrder = 5
    close.Position = UDim2.new(0.5, 0, 0.5, 0)
    close.Size = UDim2.new(0, 25, 0, 25)
    close.ZIndex = 2
    close.Image = "rbxassetid://3926305904"
    close.ImageColor3 = Color3.fromRGB(188, 188, 188)
    close.ImageRectOffset = Vector2.new(284, 4)
    close.ImageRectSize = Vector2.new(24, 24)

    close.MouseButton1Click:Connect(function()
        Frame.Visible = false
    end)
    
	--start

	local UI = {}

	local function resize()
		scroll.CanvasSize = UDim2.new(0, 0, 0, UIListLayout_2.AbsoluteContentSize.Y)
	end

    --text:

    function UI:text(title)
        local text = Instance.new("TextLabel")
        text.Name = "text"
        text.Parent = scroll
        text.Text = title
        text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        text.BackgroundTransparency = 1.000
        text.Position = UDim2.new(-0.0464480892, 0, 0.59574455, 0)
        text.Size = UDim2.new(0, 200, 0, 29)
        text.Font = Enum.Font.SourceSansBold
        text.TextColor3 = Color3.fromRGB(255, 255, 255)
        text.TextSize = 14.000

		resize()
    end

    --button

    function UI:button(settings)
        local button = Instance.new("TextButton")
        button.Name = "button"
        button.Parent = scroll
        button.BackgroundColor3 = Color3.fromRGB(46, 46, 46)
        button.Position = UDim2.new(0.085, 0, 0, 0)
        button.Size = UDim2.new(0, 162, 0, 37)
        button.Font = Enum.Font.SourceSans
        button.Text = " "
        button.TextColor3 = Color3.fromRGB(0, 0, 0)
        button.TextSize = 14.000

        local Frame = Instance.new("Frame")
        Frame.Parent = button
        Frame.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
        Frame.Position = UDim2.new(0.0149999997, 0, 0.0780000016, 0)
        Frame.Size = UDim2.new(0, 158, 0, 32)

        local Title = Instance.new("TextLabel")
        Title.Parent = button
        Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Title.BackgroundTransparency = 1.000
        Title.Position = UDim2.new(0.0740740746, 0, 0, 0)
        Title.Size = UDim2.new(0, 79, 0, 34)
        Title.Text = tostring(settings.Name)
        Title.Font = Enum.Font.SourceSansBold
        Title.TextColor3 = Color3.fromRGB(255, 255, 255)
        Title.TextSize = 17.000
        Title.TextXAlignment = Enum.TextXAlignment.Left

        local label = Instance.new("TextLabel")
        label.Parent = button
        label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        label.BackgroundTransparency = 1.000
        label.Position = UDim2.new(0.648148119, 0, 0, 0)
        label.Size = UDim2.new(0, 47, 0, 34)
        label.Font = Enum.Font.SourceSansBold
        label.Text = "button"
        label.TextColor3 = Color3.fromRGB(102, 102, 102)
        label.TextSize = 13.000
        label.TextXAlignment = Enum.TextXAlignment.Right

        local UICorner = Instance.new("UICorner")
        UICorner.CornerRadius = UDim.new(0, 5)
        UICorner.Parent = button

		local UICorner_2 = Instance.new("UICorner")
        UICorner_2.Parent = Frame

		function settings:execute()
            pcall(settings.Callback)
		end

        button.MouseButton1Click:Connect(function()
            settings:execute()
        end)

		resize()

		return settings
    end

    --toggle

    function UI:toggle(settings)
        local toggle = Instance.new("TextButton")
        toggle.Name = "toggle"
        toggle.Parent = scroll
        toggle.BackgroundColor3 = Color3.fromRGB(46, 46, 46)
        toggle.Position = UDim2.new(0.085, 0, 0, 0)
        toggle.Size = UDim2.new(0, 162, 0, 37)
        toggle.Font = Enum.Font.SourceSans
        toggle.Text = " "
        toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
        toggle.TextSize = 14.000

        local Container = Instance.new("Frame")
        Container.Parent = toggle
        Container.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
        Container.Position = UDim2.new(0.0149999997, 0, 0.0780000016, 0)
        Container.Size = UDim2.new(0, 158, 0, 32)

        local Bar = Instance.new("Frame")
        Bar.Parent = Container
        Bar.BackgroundColor3 = Color3.fromRGB(180, 180, 180)
        Bar.Position = UDim2.new(0.727848113, 0, 0.392700195, 0)
        Bar.Size = UDim2.new(0, 34, 0, 5)

        local Title = Instance.new("TextLabel")
        Title.Parent = toggle
        Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Title.BackgroundTransparency = 1.000
        Title.Position = UDim2.new(0.0740740746, 0, 0, 0)
        Title.Size = UDim2.new(0, 79, 0, 34)
        Title.Text = tostring(settings.Name)
        Title.Font = Enum.Font.SourceSansBold
        Title.TextColor3 = Color3.fromRGB(255, 255, 255)
        Title.TextSize = 17.000
        Title.TextXAlignment = Enum.TextXAlignment.Left

        local Dot = Instance.new("Frame")
        Dot.Parent = toggle
        Dot.BackgroundColor3 = Color3.fromRGB(139, 139, 139)
        Dot.Position = UDim2.new(0.701675158, 0, 0.257565081, 0)
        Dot.Size = UDim2.new(0, 15, 0, 15)

        local UICorner = Instance.new("UICorner")
        UICorner.CornerRadius = UDim.new(0, 5)
        UICorner.Parent = toggle

        local UICorner_2 = Instance.new("UICorner")
        UICorner_2.Parent = Container

        local UICorner_3 = Instance.new("UICorner")
        UICorner_3.CornerRadius = UDim.new(0, 15)
        UICorner_3.Parent = Bar

        local UICorner_4 = Instance.new("UICorner")
        UICorner_4.CornerRadius = UDim.new(0, 15)
        UICorner_4.Parent = Dot

		local value = config[Path..settings.Name] and true or settings.Default or false
 
        if value then
			pcall(settings.Callback, true)

            Dot.BackgroundColor3 = Color3.fromRGB(80, 153, 195)
			Dot.Position = UDim2.new(0.845131934, 0, 0.257565081, 0)
        end

		function settings:getvalue()
			return value
		end

		function settings:changevalue(value)
			config[Path..settings.Name] = value

			save()

			if value then
                game:GetService("TweenService"):Create(Dot,TweenInfo.new(0.8),{
					BackgroundColor3 = Color3.fromRGB(80, 153, 195),
                    Position = UDim2.new(0.845131934, 0, 0.257565081, 0)
				}):Play()
			else
                game:GetService("TweenService"):Create(Dot,TweenInfo.new(0.8),{
					BackgroundColor3 = Color3.fromRGB(139, 139, 139),
                    Position = UDim2.new(0.701675158, 0, 0.257565081, 0)
				}):Play()
			end

			pcall(settings.Callback, value)
		end

		function settings:toggle()
			value = not value
			settings:changevalue(value)
		end

		function settings:get()
			return value
		end

        toggle.MouseButton1Click:Connect(function()
			settings:toggle()
        end)

		resize()

		return settings
    end

    --keybind

    function UI:keybind(settings)
        local keybind = Instance.new("TextButton")
        keybind.Name = "keybind"
        keybind.Parent = scroll
        keybind.BackgroundColor3 = Color3.fromRGB(46, 46, 46)
        keybind.Position = UDim2.new(0.0874316916, 0, 0, 0)
        keybind.Size = UDim2.new(0, 162, 0, 37)
        keybind.Font = Enum.Font.SourceSans
        keybind.Text = " "
        keybind.TextColor3 = Color3.fromRGB(0, 0, 0)
        keybind.TextSize = 14.000

        local Container = Instance.new("Frame")
        Container.Parent = keybind
        Container.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
        Container.Position = UDim2.new(0.0149999997, 0, 0.0780000016, 0)
        Container.Size = UDim2.new(0, 158, 0, 32)

        local Title = Instance.new("TextLabel")
        Title.Parent = keybind
        Title.Text = tostring(settings.Name)
        Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Title.BackgroundTransparency = 1.000
        Title.Position = UDim2.new(0.0740740746, 0, 0, 0)
        Title.Size = UDim2.new(0, 79, 0, 34)
        Title.Font = Enum.Font.SourceSansBold
        Title.TextColor3 = Color3.fromRGB(255, 255, 255)
        Title.TextSize = 17.000
        Title.TextXAlignment = Enum.TextXAlignment.Left

        local Input = Instance.new("TextLabel")
        Input.Parent = keybind
        Input.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
		Input.Position = UDim2.new(0.55, 0, 0.175675675, 0)
        Input.Size = UDim2.new(0, 56, 0, 20)
        Input.Font = Enum.Font.SourceSansBold
        Input.TextColor3 = Color3.fromRGB(255, 255, 255)
        Input.TextSize = 16.000

        local UICorner = Instance.new("UICorner")
        UICorner.CornerRadius = UDim.new(0, 5)
        UICorner.Parent = keybind

        local UICorner_2 = Instance.new("UICorner")
        UICorner_2.Parent = Container

        local UICorner_3 = Instance.new("UICorner")
        UICorner_3.CornerRadius = UDim.new(0, 10)
        UICorner_3.Parent = Input

		local ShowKey = config[Path..settings.Name] and Enum.KeyCode[config[Path..settings.Name]].Name or settings.Default and Enum.KeyCode[settings.Default] or settings.Default or nil
		Input.Text = ShowKey and ShowKey or ". . .";

		local Key = ShowKey

        function settings:set(keybind)
            if keybind then
                pcall(function()
                    Key = keybind.KeyCode.Name
    
                    Input.Text = keybind and Enum.KeyCode[keybind].Name or ". . ." 
                end)
            else
                Key = nil

                Input.Text = ". . ."
            end

            save()
        end

		keybind.MouseButton1Click:Connect(function()
			Input.Text = ". . ."
			local inputwait = game:GetService("UserInputService").InputBegan:wait()
			if inputwait.KeyCode.Name ~= "Unknown" then
				Input.Text = inputwait.KeyCode.Name
				Key = inputwait.KeyCode.Name

				config[Path..settings.Name] = inputwait.KeyCode.Name

				save()
			end
		end)

		game:GetService("UserInputService").InputBegan:connect(function(current, p)
			if not p then
				if current.KeyCode.Name == Key then
					pcall(settings.Callback)
				end
			end
		end)

		resize()

        return settings
	end

    --get frame

    function UI:getframe()
        return Frame
    end
    
    return UI
end

return Library
