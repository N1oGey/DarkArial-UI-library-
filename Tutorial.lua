-- DarkArial UI v1.1 tutorial
local UI = loadstring(game:HttpGet("https://raw.githubusercontent.com/N1oGey/DarkArial-UI-library-test-versions/refs/heads/main/DarkArial%20UI%20library%20test.lua"))() -- Load lib

local Window = UI:CreateWindow({  -- Create window
	Title = "DarkArial UI Test"
})

local Tab = Window:AddTab({ -- Create Tab
	TabName = "Main"
})

Tab:AddLabel({             -- Create label
	Text = "This is a label"
})

Tab:AddButton({            -- Create button
	Name = "Print Hello",
	Callback = function()
		print("Hello from button")
	end
})

Tab:AddBox({                -- Create textbox
	Name = "Enter text"
})

Tab:AddToggle({             -- Create toggle button
	Name = "God Mode",
	Callback = function(state)
		print("Toggle:", state)
	end
})

Tab:AddSlider({             -- Create slider
	Name = "Speed",
	Min = 0,
	Max = 100,
	Callback = function(value)
		print("Slider:", value)
	end
})

-- thats all! Lib created by Krystal Arial