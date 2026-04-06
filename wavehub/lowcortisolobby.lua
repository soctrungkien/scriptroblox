if loadername == nil then
	game.Players.LocalPlayer:Kick("run loader to use")
	return
end

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")

local player = Players.LocalPlayer
local v6 = player:WaitForChild("leaderstats"):WaitForChild("Stage")

-- trạng thái
local auto1 = false
local auto2 = false

-- UI Drawing
local ui = {}
ui.Frame = Drawing.new("Square")
ui.Frame.Size = Vector2.new(200,130)
ui.Frame.Position = Vector2.new(300,200)
ui.Frame.Color = Color3.fromRGB(30,30,30)
ui.Frame.Filled = true

ui.Title = Drawing.new("Text")
ui.Title.Text = "Wave Hub"
ui.Title.Size = 18
ui.Title.Position = ui.Frame.Position + Vector2.new(10,5)
ui.Title.Color = Color3.new(1,1,1)

local function createToggle(name, yOffset, callback)
	local t = {}

	t.Box = Drawing.new("Square")
	t.Box.Size = Vector2.new(12,12)
	t.Box.Position = ui.Frame.Position + Vector2.new(10, yOffset)
	t.Box.Color = Color3.fromRGB(80,80,80)
	t.Box.Filled = true

	t.Label = Drawing.new("Text")
	t.Label.Text = name
	t.Label.Size = 14
	t.Label.Position = ui.Frame.Position + Vector2.new(30, yOffset-2)
	t.Label.Color = Color3.new(1,1,1)

	t.Value = false

	function t:Toggle()
		self.Value = not self.Value
		t.Box.Color = self.Value and Color3.fromRGB(0,170,255) or Color3.fromRGB(80,80,80)
		callback(self.Value)
	end

	return t
end

local toggle1 = createToggle("Auto Stage", 40, function(v)
	auto1 = v
end)

local toggle2 = createToggle("Auto2", 70, function(v)
	auto2 = v
end)

-- drag UI
local dragging = false
local dragOffset = Vector2.new()

UIS.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		local mouse = UIS:GetMouseLocation()
		if mouse.X > ui.Frame.Position.X and mouse.X < ui.Frame.Position.X + ui.Frame.Size.X
		and mouse.Y > ui.Frame.Position.Y and mouse.Y < ui.Frame.Position.Y + 25 then
			dragging = true
			dragOffset = mouse - ui.Frame.Position
		end

		-- click toggle
		local function checkClick(t)
			if mouse.X > t.Box.Position.X and mouse.X < t.Box.Position.X + t.Box.Size.X
			and mouse.Y > t.Box.Position.Y and mouse.Y < t.Box.Position.Y + t.Box.Size.Y then
				t:Toggle()
			end
		end

		checkClick(toggle1)
		checkClick(toggle2)
	end
end)

UIS.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = false
	end
end)

UIS.InputChanged:Connect(function(input)
	if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
		local mouse = UIS:GetMouseLocation()
		ui.Frame.Position = mouse - dragOffset

		ui.Title.Position = ui.Frame.Position + Vector2.new(10,5)

		toggle1.Box.Position = ui.Frame.Position + Vector2.new(10,40)
		toggle1.Label.Position = ui.Frame.Position + Vector2.new(30,38)

		toggle2.Box.Position = ui.Frame.Position + Vector2.new(10,70)
		toggle2.Label.Position = ui.Frame.Position + Vector2.new(30,68)
	end
end)

-- logic cũ của mày
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
end)
