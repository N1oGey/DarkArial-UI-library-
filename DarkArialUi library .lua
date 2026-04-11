local UI = {}

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")

local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "DarkArialUi library"
gui.Parent = player:WaitForChild("PlayerGui")
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.ResetOnSpawn = false

local function makeDraggable(obj)
	local dragging = false
	local dragInput, startPos, startInputPos

	obj.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			startInputPos = input.Position
			startPos = obj.Position

			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)

	obj.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)

	UIS.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			local delta = input.Position - startInputPos
			obj.Position = UDim2.new(
				startPos.X.Scale,
				startPos.X.Offset + delta.X,
				startPos.Y.Scale,
				startPos.Y.Offset + delta.Y
			)
		end
	end)
end

function UI:CreateWindow(cfg)
	local Window = {}
	local Tabs = {}

	local Wind = Instance.new("Frame", gui)
	Wind.Size = UDim2.new(0, 536, 0, 280)
	Wind.Position = UDim2.new(0, 200, 0, 100)
	Wind.BackgroundColor3 = Color3.fromRGB(35,35,35)
	Wind.BorderSizePixel = 0
	Instance.new("UICorner", Wind).CornerRadius = UDim.new(0,5)

	makeDraggable(Wind)

	local Title = Instance.new("TextLabel", Wind)
	Title.Size = UDim2.new(1,0,0,34)
	Title.BackgroundColor3 = Color3.fromRGB(55,55,55)
	Title.TextColor3 = Color3.fromRGB(255,255,255)
	Title.TextXAlignment = Enum.TextXAlignment.Left
	Title.Text = cfg.Title or "Title"
	Title.Font = Enum.Font.SourceSansBold
	Title.TextSize = 18
	Title.BorderSizePixel = 0
	Instance.new("UICorner", Title).CornerRadius = UDim.new(0,5)

	local padding = Instance.new("UIPadding", Title)
	padding.PaddingLeft = UDim.new(0,7)

	local Close = Instance.new("TextButton", Title)
	Close.Size = UDim2.new(0,24,0,28)
	Close.Position = UDim2.new(1,-30,0,3)
	Close.Text = "X"
	Close.BackgroundTransparency = 1
	Close.TextColor3 = Color3.fromRGB(255,255,255)
	Close.Font = Enum.Font.SourceSansBold
	Close.TextSize = 24

	local TabsFrame = Instance.new("ScrollingFrame", Wind)
	TabsFrame.Size = UDim2.new(0,108,0,232)
	TabsFrame.Position = UDim2.new(0,6,0,40)
	TabsFrame.BackgroundColor3 = Color3.fromRGB(55,55,55)
	TabsFrame.ScrollBarThickness = 0
	TabsFrame.BorderSizePixel = 0
	TabsFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
	TabsFrame.CanvasSize = UDim2.new(0,0,0,0)
	Instance.new("UICorner", TabsFrame).CornerRadius = UDim.new(0,5)

	local TabsLayout = Instance.new("UIListLayout", TabsFrame)
	TabsLayout.Padding = UDim.new(0,6)
	TabsLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	TabsLayout.SortOrder = Enum.SortOrder.LayoutOrder

	local Open = Instance.new("TextButton", gui)
	Open.Size = UDim2.new(0,52,0,42)
	Open.Position = UDim2.new(0,30,0,20)
	Open.Text = "P"
	Open.BackgroundColor3 = Color3.fromRGB(55,55,55)
	Open.TextColor3 = Color3.fromRGB(255,255,255)
	Open.Font = Enum.Font.SourceSansBold
	Open.TextSize = 24
	Instance.new("UICorner", Open).CornerRadius = UDim.new(0,5)

	makeDraggable(Open)
	Open.Visible = false

	Close.MouseButton1Click:Connect(function()
		Wind.Visible = false
		Open.Visible = true
	end)

	Open.MouseButton1Click:Connect(function()
		Wind.Visible = true
		Open.Visible = false
	end)

	function Window:AddTab(tabCfg)
		local Tab = {}

		local Button = Instance.new("TextButton", TabsFrame)
		Button.Size = UDim2.new(1,-16,0,36)
		Button.Text = tabCfg.TabName or "Tab"
		Button.BackgroundColor3 = Color3.fromRGB(133,133,133)
		Button.TextColor3 = Color3.fromRGB(255,255,255)
		Button.Font = Enum.Font.SourceSansBold
		Button.TextSize = 18
		Button.BorderSizePixel = 0
		Instance.new("UICorner", Button).CornerRadius = UDim.new(0,5)

		local Page = Instance.new("ScrollingFrame", Wind)
		Page.Size = UDim2.new(0,410,0,232)
		Page.Position = UDim2.new(0,120,0,40)
		Page.BackgroundColor3 = Color3.fromRGB(55,55,55)
		Page.ScrollBarThickness = 0
		Page.BorderSizePixel = 0
		Page.AutomaticCanvasSize = Enum.AutomaticSize.Y
		Page.CanvasSize = UDim2.new(0,0,0,0)
		Page.Visible = false
		Instance.new("UICorner", Page).CornerRadius = UDim.new(0,5)

		local Layout = Instance.new("UIListLayout", Page)
		Layout.Padding = UDim.new(0,6)
		Layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
		Layout.SortOrder = Enum.SortOrder.LayoutOrder

		Button.MouseButton1Click:Connect(function()
			for _,v in pairs(Tabs) do
				v.Page.Visible = false
			end
			Page.Visible = true
		end)

		function Tab:AddButton(cfg)
			local btn = Instance.new("TextButton", Page)
			btn.Size = UDim2.new(0,398,0,38)
			btn.Text = cfg.Name or "Button"
			btn.BackgroundColor3 = Color3.fromRGB(133,133,133)
			btn.TextColor3 = Color3.fromRGB(255,255,255)
			btn.Font = Enum.Font.SourceSansBold
			btn.TextSize = 18
			btn.BorderSizePixel = 0
			Instance.new("UICorner", btn).CornerRadius = UDim.new(0,5)

			btn.MouseButton1Click:Connect(function()
				if cfg.Callback then
					cfg.Callback()
				end
			end)
		end

		function Tab:AddLabel(cfg)
			local lbl = Instance.new("TextLabel", Page)
			lbl.Size = UDim2.new(0,398,0,34)
			lbl.Text = cfg.Text or "Label"
			lbl.BackgroundTransparency = 1
			lbl.TextColor3 = Color3.fromRGB(177,177,177)
			lbl.Font = Enum.Font.SourceSansBold
			lbl.TextSize = 18
			lbl.TextXAlignment = Enum.TextXAlignment.Left
		end

		function Tab:AddBox(cfg)
			local box = Instance.new("TextBox", Page)
			box.Size = UDim2.new(0,398,0,40)
			box.Text = ""
			box.PlaceholderText = "Enter here..."
			box.BackgroundColor3 = Color3.fromRGB(116,116,116)
			box.TextColor3 = Color3.fromRGB(204,204,204)
			box.Font = Enum.Font.SourceSansBold
			box.TextSize = 18
			box.ClearTextOnFocus = false
			box.BorderSizePixel = 0
			Instance.new("UICorner", box).CornerRadius = UDim.new(0,5)

			local pad = Instance.new("UIPadding", box)
			pad.PaddingLeft = UDim.new(0,5)

			return box
		end

		Tab.Page = Page
		table.insert(Tabs, Tab)

		if #Tabs == 1 then
			Page.Visible = true
		end

		return Tab
	end

	return Window
end

return UI