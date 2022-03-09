
local PLIST = {}
for i,v in pairs(game:GetService("Players"):GetPlayers()) do
    table.insert(PLIST,v.DisplayName)
end

local GUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/intr-dev/klox/main/ui.lua"))()
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
local Window = GUI:AddWindow("Universal | klox", {
    main_color = Color3.fromRGB(29, 187, 55),
    min_size = Vector2.new(300, 400),
    toggle_key = Enum.KeyCode.P,
    can_resize = true,
})
local Tab = Window:AddTab("LocalPlayer")

do
    Tab:AddLabel("Hello World!")

    local JP = Tab:AddSlider("WalkSpeed", function(x)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = x
    end, { -- (options are optional)
        ["min"] = math.floor(game.Players.LocalPlayer.Character.Humanoid.WalkSpeed), -- Default: 0
        ["max"] = 1000, -- Default: 100
        ["readonly"] = false, -- Default: false
    })
    JP:Set(math.floor(game.Players.LocalPlayer.Character.Humanoid.WalkSpeed))

    local JP = Tab:AddSlider("JumpPower", function(x)
        print(x)
    end, { -- (options are optional)
        ["min"] = math.floor(game.Players.LocalPlayer.Character.Humanoid.JumpPower), -- Default: 0
        ["max"] = 1000, -- Default: 100
        ["readonly"] = false, -- Default: false
    })
    JP:Set(math.floor(game.Players.LocalPlayer.Character.Humanoid.JumpPower))

    Tab:AddKeybind("Keybind", function(key)
        print(key)
    end, { -- (options are optional)
        ["standard"] = Enum.KeyCode.RightShift -- Default: RightShift
    })

    local Dropdown = Tab:AddDropdown("Dropdown", function(object)
        print(object)
    end)
    Dropdown:Add(PLIST)

end

Tab:Show()
GUI:FormatWindows()