if loadername == nil then
	game.Players.LocalPlayer:Kick("run loader to use")
	return
end

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local lp = Players.LocalPlayer

-- SETTINGS
local TELE_DISTANCE = 10
local SPIN_TOLERANCE = 0.01
local SPAWN_GRACE_TIME = 0.01 -- prevents false trigger on spawn

local function setup(char)
	local hrp = char:WaitForChild("HumanoidRootPart")
	local hum = char:WaitForChild("Humanoid")

	-- Reset safe state ON SPAWN
	local lastSafePos = hrp.Position
	local lastSafeYaw = hrp.Orientation.Y
	local spawnTime = tick()

	-- Save safe position when grounded
	RunService.Heartbeat:Connect(function()
		if hum.FloorMaterial ~= Enum.Material.Air then
			lastSafePos = hrp.Position
			lastSafeYaw = hrp.Orientation.Y
		end
	end)

	-- Anti Tele + No Spin
	hrp:GetPropertyChangedSignal("CFrame"):Connect(function()
		-- Grace period after spawn
		if tick() - spawnTime < SPAWN_GRACE_TIME then
			lastSafePos = hrp.Position
			lastSafeYaw = hrp.Orientation.Y
			return
		end

		local pos = hrp.Position

		-- Horizontal teleport check
		local horizontalDelta = Vector3.new(
			pos.X - lastSafePos.X,
			0,
			pos.Z - lastSafePos.Z
		)

		if horizontalDelta.Magnitude > TELE_DISTANCE then
			hrp.CFrame = CFrame.new(
				lastSafePos.X,
				pos.Y, -- keep natural Y
				lastSafePos.Z
			) * CFrame.Angles(0, math.rad(lastSafeYaw), 0)
			return
		end

		-- No Spin
		local yawDiff = math.abs(hrp.Orientation.Y - lastSafeYaw)
		if yawDiff > SPIN_TOLERANCE then
			hrp.CFrame = CFrame.new(pos) * CFrame.Angles(
				0,
				math.rad(lastSafeYaw),
				0
			)
		end
	end)
end

-- Apply now & on respawn
if lp.Character then
	setup(lp.Character)
end
lp.CharacterAdded:Connect(setup)

--// Services
local Players = game:GetService("Players")
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
toggle.Text = "Free Blocc: OFF"
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
		toggle.Text = "Free Blocc: ON"
		toggle.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
	else
		toggle.Text = "Free Blocc: OFF"
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
	while task.wait(0.06) do
		if bf then
			for _, v in ipairs(workspace:GetChildren()) do
				if v.Name == "FreePad" and v:IsA("Part") then
					if (v.Position - TARGET_POS).Magnitude < 1 then
						local ev = v:FindFirstChild("F2PSpawnRequest")
						if ev then
							ev:FireServer()
						end
						break
					end
				end
			end
		end
	end
end)
