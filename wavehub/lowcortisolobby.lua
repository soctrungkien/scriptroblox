if loadername == nil then
	game.Players.LocalPlayer:Kick("run loader to use")
	return
end

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local VirtualUser = game:GetService("VirtualUser")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
local Backpack = LocalPlayer:WaitForChild("Backpack")
local camera = workspace.CurrentCamera
local screenSize = camera.ViewportSize
local desiredWidth = 200
local desiredHeight = 130
local maxWidth = math.min(desiredWidth, screenSize.X * 0.9)
local maxHeight = math.min(desiredHeight, screenSize.Y * 0.9)
local ReGui = loadstring(game:HttpGet('https://raw.githubusercontent.com/depthso/Dear-ReGui/refs/heads/main/ReGui.lua'))()
local Window = ReGui:Window({
	Title = "Wave Hub",
	Size = UDim2.fromOffset(maxWidth, maxHeight)
})
local auto1 = false
local auto2 = false
Window:Checkbox({
	Value = false,
	Label = "Auto1",
	Callback = function(self, Value: boolean)
		auto1 = Value
	end
})
Window:Checkbox({
	Value = false,
	Label = "Auto2",
	Callback = function(self, Value: boolean)
		auto2 = Value
	end
})
task.spawn(function()
while true do
if auto1 then

end
end)
task.spawn(function()
while true do
if auto2 then

end
end)
