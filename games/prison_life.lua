
local PLIST = {}
for i,v in pairs(game:GetService("Players"):GetPlayers()) do
    table.insert(PLIST,v.DisplayName)
end

local GUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/intr-dev/klox/main/ui.lua"))()
local UI = GUI:CreateWindow("Prison Life","made by: intr_dev")
local LP = UI:addPage("LocalPlayer",1,true,6)
local KL = UI:addPage("Kill",2,false,6)

LP:addLabel("LocalPlayer","In here you can change a speed and others.")
LP:addSlider("WalkSpeed",math.floor(game.Players.LocalPlayer.Character.Humanoid.WalkSpeed),1000,function(value)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
end)
LP:addSlider("JumpPower",math.floor(game.Players.LocalPlayer.Character.Humanoid.JumpPower),1000,function(value)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = value
end)
LP:addDropdown("Teleport to Player",PLIST,4,function(value)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =  game.Players[value].Character.HumanoidRootPart.CFrame * CFrame.new(0,2,1)
end)