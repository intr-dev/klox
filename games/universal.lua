
local PLIST = {}
for i,v in pairs(game:GetService("Players"):GetPlayers()) do
    table.insert(PLIST,v.DisplayName)
end

local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/bloodball/UI-Librarys/main/Elerium')))()
do
    

	local Window = library:AddWindow("Universal | klox", {
		main_color = Color3.fromRGB(41, 74, 122),
		min_size = Vector2.new(300, 400),
		toggle_key = Enum.KeyCode.P,
		can_resize = true,
	})
	local Tab = Window:AddTab("LocalPlayer")
    local Tab1 = Window:AddTab("Executor")
    do
		local Slider = Tab:AddSlider("Slider", function(x)
			print(x)
		end, { -- (options are optional)
			["min"] = 0, -- Default: 0
			["max"] = 100, -- Default: 100
			["readonly"] = false, -- Default: false
		})
		Slider:Set(50)


		local Dropdown = Tab:AddDropdown("Dropdown", function(object)
			print(object)
		end)
		for i = 1, 9 do
			Dropdown:Add(tostring(i))
		end


		local Console = Tab1:AddConsole({
			["y"] = 100,
			["source"] = "Lua",
		})
		Console:Set("-- Enter A Script")
		print(Console:Get())

		local HA = Tab1:AddHorizontalAlignment()
		HA:AddButton("Execute", function()
			loadstring(Console:Get())()
		end)
		HA:AddButton("Clear", function()
			Console:Set("")
		end)
    end
	Tab:Show()
	library:FormatWindows()
end
--[[local UI = GUI:CreateWindow("Universal | klox","made by: intr_dev")
local LP = UI:addPage("LocalPlayer",1,true,6)

LP:addLabel("LocalPlayer","WARN: you can get ban for advanced games for this.")
LP:addSlider("WalkSpeed",math.floor(game.Players.LocalPlayer.Character.Humanoid.WalkSpeed),1000,function(value)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
end)
LP:addSlider("JumpPower",math.floor(game.Players.LocalPlayer.Character.Humanoid.JumpPower),1000,function(value)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = value
end)
LP:addDropdown("Teleport to Player",PLIST,4,function(value)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =  game.Players[value].Character.HumanoidRootPart.CFrame * CFrame.new(0,2,1)
end)
]]


