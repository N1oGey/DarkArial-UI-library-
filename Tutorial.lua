-- A simple tutorial
local UI = loadstring(game:HttpGet("https://raw.githubusercontent.com/N1oGey/DarkArial-UI-library-/refs/heads/main/DarkArialUi%20library%20.lua"))() -- Load ui

-- Window Settig --

local Window = UI:CreateWindow({ -- Add window
	Title = "Test UI", -- Window title
	Icon = "rbxassetid://11318961749" -- Window icon
})

-- Tab setting --

local MainTab = Window:AddTab({ -- Add Tab
	TabName = "Main" -- Tab name
})

-- Label setting --

MainTab:AddLabel({ -- Add label 
	Text = "Label example" -- Text in this label
})

-- Button Setting --

MainTab:AddButton({ -- Add button
	Name = "Button",  -- Button name
	Callback = function() -- the code that this button will activate
		print("clicked")
	end
})

-- TextBox setting --

local box = MainTab:AddBox({ -- Add box 
	Name = "TextBox"  -- TextBox Name
})

box.FocusLost:Connect(function() -- Box function
	print(box.Text)
end)

-- Toggle Setting --

MainTab:AddToggle({ -- Add Toggle
	Name = "Toggle", -- Toggle name
	Callback = function(state) -- Function toggle
		print("toggle:", state)
	end
})

-- Slider Setting --

MainTab:AddSlider({ -- Add Setting
	Name = "Slider", -- Name slider
	Min = 0, -- minimal slider
	Max = 100, -- maximum slider
	Callback = function(v) -- function slider
		print("value:", v)
	end
})

-- Thats all! Ui lib by Krystal Arial. Join to our team: https://t.me/arialteammodern