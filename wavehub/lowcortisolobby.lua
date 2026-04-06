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
local v1 = game:GetService("Players")
local v_u_2 = game:GetService("TweenService")
local v_u_3 = game:GetService("Debris")
local v_u_4 = game:GetService("SoundService"):WaitForChild("Checkpoint")
local v5 = v1.LocalPlayer:WaitForChild("leaderstats")
local v6 = v5:WaitForChild("Stage")
local player = game:GetService("Players").LocalPlayer
local ReGui = loadstring(game:HttpGet('https://raw.githubusercontent.com/depthso/Dear-ReGui/refs/heads/main/ReGui.lua'))()
local Window = ReGui:Window({
	Title = "Wave Hub",
	Size = UDim2.fromOffset(maxWidth, maxHeight)
})
local function tp()
	if not player.Character then
		player.CharacterAdded:Wait()
	end

	local char = player.Character
	local root = char:WaitForChild("HumanoidRootPart")

	local target = workspace:FindFirstChild("Checkpoints"):FindFirstChild(tostring(v6.Value + 1))
	if not target then return end

	root.CFrame = target.CFrame + Vector3.new(0, 3, 0)
end
local auto1 = false
local auto2 = false
Window:Checkbox({
	Value = false,
	Label = "Auto Stage",
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
RunService.RenderStepped:Connect(function()
	if not auto1 then return end

	local char = player.Character
	if not char then return end

	local root = char:FindFirstChild("HumanoidRootPart")
	if not root then return end

	local checkpoints = workspace:FindFirstChild("Checkpoints")
	if not checkpoints then return end

	local target = checkpoints:FindFirstChild(tostring(v6.Value + 1))
	if not target then return end

	if (root.Position - target.Position).Magnitude > 5 then
		root.CFrame = target.CFrame + Vector3.new(0, 3, 0)
	end
	if auto2 then
	
	end
end)
end)
