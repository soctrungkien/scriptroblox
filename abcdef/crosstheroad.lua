if loadername == nil then
	game.Players.LocalPlayer:Kick("run loader to use")
	return
end

--// Services
local Players = game:GetService("Players")
local player = game.Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")

--// Toggle State
local bf = false

--// Target Position
local TARGET_POS = Vector3.new(289.5, 442.5, -98)

--// Remove old UI
if CoreGui:FindFirstChild("WaveHubUI") then
	CoreGui.WaveHubUI:Destroy()
end

--// ScreenGui
local gui = Instance.new("ScreenGui")
gui.Name = "WaveHubUI"
gui.ResetOnSpawn = false
gui.Parent = CoreGui

--// Main Frame
local frame = Instance.new("Frame")
frame.Size = UDim2.fromOffset(200, 120)
frame.Position = UDim2.fromScale(0.05, 0.4)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderSizePixel = 0
frame.Parent = gui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 10)
corner.Parent = frame

--// Title (Drag Handle)
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 35)
title.BackgroundTransparency = 1
title.Text = "Wave Hub"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBold
title.TextSize = 18
title.Parent = frame

--// Toggle Button
local toggle = Instance.new("TextButton")
toggle.Size = UDim2.new(0.85, 0, 0, 40)
toggle.Position = UDim2.new(0.075, 0, 0.45, 0)
toggle.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
toggle.Text = "Auto Win: OFF"
toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
toggle.Font = Enum.Font.Gotham
toggle.TextSize = 14
toggle.Parent = frame

local toggleCorner = Instance.new("UICorner")
toggleCorner.CornerRadius = UDim.new(0, 8)
toggleCorner.Parent = toggle

--// Toggle Logic
toggle.MouseButton1Click:Connect(function()
	bf = not bf
	if bf then
		toggle.Text = "Auto Win: ON"
		toggle.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
	else
		toggle.Text = "Auto Win: OFF"
		toggle.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
	end
end)

--// DRAG LOGIC (PC + MOBILE)
local dragging = false
local dragStart
local startPos

local function beginDrag(input)
	dragging = true
	dragStart = input.Position
	startPos = frame.Position
end

local function endDrag()
	dragging = false
end

-- Mouse + Touch start
title.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1
	or input.UserInputType == Enum.UserInputType.Touch then
		beginDrag(input)
	end
end)

-- Mouse + Touch end
title.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1
	or input.UserInputType == Enum.UserInputType.Touch then
		endDrag()
	end
end)

-- Move (Mouse + Touch)
UserInputService.InputChanged:Connect(function(input)
	if dragging and (
		input.UserInputType == Enum.UserInputType.MouseMovement
		or input.UserInputType == Enum.UserInputType.Touch
	) then
		local delta = input.Position - dragStart
		frame.Position = UDim2.new(
			startPos.X.Scale,
			startPos.X.Offset + delta.X,
			startPos.Y.Scale,
			startPos.Y.Offset + delta.Y
		)
	end
end)

--// MAIN LOOP (FAST)
task.spawn(function()
	while task.wait(3) do -- chậm lại
		if bf and player.Character then
			local hrp = player.Character:FindFirstChild("HumanoidRootPart")

			if hrp then
				firetouchinterest(hrp, workspace.MapBarrier.IMPORTANT.wina, 0)
				firetouchinterest(hrp, workspace.MapBarrier.IMPORTANT.wina, 1)
				task.wait(0.06)
				firetouchinterest(hrp, workspace.MapNormal.IMPORTANT.wina, 0)
				firetouchinterest(hrp, workspace.MapNormal.IMPORTANT.wina, 1)
				task.wait(0.06)
				firetouchinterest(hrp, workspace.MapStatues.IMPORTANT.wina, 0)
				firetouchinterest(hrp, workspace.MapStatues.IMPORTANT.wina, 1)
				task.wait(0.06)
			end
		end
	end
end)
