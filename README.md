# DarkArial library Docs

## 1. Load lib
```lua
local UI = loadstring (game:HttpGet("https://raw.githubusercontent.com/N1oGey/DarkArial-UI-library-/refs/heads/main/DarkArialUi%20library%20.lua" ))()
```
## 

## 2. Create window 
```lua
local window = UI:CreateWindow({
    Title = "My Window", 
    Icon = "rbxassetid://image-id" -- Enter image id here for creating icon
})
```
## 

##  3. Create Preview
```lua
window:AddPreview({
    Title = "Welcome",
    Subtitle = "Library loaded"
})
```
## 

## 4. Create Tab
```lua
local tab = window:AddTab({
    TabName = "Main"
})
```
## 

## 5. Create Button
```lua
tab:AddButton({
    Name = "Click me",
    Callback = function()
        print("Button pressed")
    end
})
```
## 

## 6. Create Label
```lua
tab:AddLabel({
    Text = "Hello world"
})
```
## 

## 7. Create TextBox
```lua
local box = tab:AddBox({
    Placeholder = "Enter text"
})

print(box.Text)
```
## 

## 8. Create Toggle
```lua
tab:AddToggle({
    Name = "Enable feature",
    Callback = function(state)
        print(state)
    end
})
```
## 

## 9. Create Slider
```lua
tab:AddSlider({
    Name = "Volume",
    Min = 0,
    Max = 100,
    Callback = function(value)
        print(value)
    end
})
```
## 


## Test code:
```lua
local UI = loadstring(game:HttpGet("https://raw.githubusercontent.com/N1oGey/DarkArial-UI-library-/refs/heads/main/DarkArialUi%20library%20.lua"))()

local window = UI:CreateWindow({
    Title = "Demo",
    Icon = "rbxassetid://11928520022"
})

window:AddPreview({
    Title = "Demo UI",
    Subtitle = "Library example"
})

local tab = window:AddTab({
    TabName = "Main"
})

tab:AddLabel({
    Text = "Main page"
})

tab:AddButton({
    Name = "Print message",
    Callback = function()
        print("Hello")
    end
})

tab:AddToggle({
    Name = "Power",
    Callback = function(state)
        print("Toggle:", state)
    end
})

tab:AddBox({
    Placeholder = "Type something"
})

tab:AddSlider({
    Name = "Speed",
    Min = 1,
    Max = 10,
    Callback = function(value)
        print("Value:", value)
    end
})
```

![](https://i.ibb.co/G4qTvSkr/1778964024642.png)

[Join to our community](https://t.me/arialteammodern)
[Visit our website](https://arihubweb.wasmer.app/)
[Dev telegram](t.me/KrystalArial)
