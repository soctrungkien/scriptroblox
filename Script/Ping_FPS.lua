local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Stats = game:GetService("Stats")
local StarterGui = game:GetService("StarterGui")

local player = Players.LocalPlayer

-- 🔔 Thông báo mở bảng
pcall(function()
	StarterGui:SetCore("SendNotification", {
		Title = "LocalScript",
		Text = "Đã mở bảng",
		Duration = 3,
	})
end)

-- 🖼️ Tạo GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "MinimalStats"
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 250, 0, 100)
mainFrame.Position = UDim2.new(0, 20, 0, 20)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.BackgroundTransparency = 0.2
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = screenGui

local statsLabel = Instance.new("TextLabel")
statsLabel.Size = UDim2.new(1, -10, 0, 60) -- Giảm chiều cao để chừa chỗ cho nút
statsLabel.Position = UDim2.new(0, 5, 0, 10)
statsLabel.BackgroundTransparency = 1
statsLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
statsLabel.Font = Enum.Font.Code
statsLabel.TextXAlignment = Enum.TextXAlignment.Left
statsLabel.TextYAlignment = Enum.TextYAlignment.Top
statsLabel.TextSize = 16
statsLabel.TextWrapped = true
statsLabel.Text = "Đang tải Ping/FPS..."
statsLabel.Parent = mainFrame

-- Nút Tắt
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 60, 0, 20)
closeButton.Position = UDim2.new(1, -70, 1, -30) -- Đặt ở góc dưới bên phải
closeButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.Font = Enum.Font.Code
closeButton.TextSize = 14
closeButton.Text = "Tắt"
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -35, 0, 5)
closeButton.Text = "❌"
closeButton.TextColor3 = Color3.new(1, 0.2, 0.2)
closeButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
closeButton.BorderSizePixel = 0
closeButton.Parent = mainFrame

-- ⏱️ FPS đếm
local fps = 0
local frameCounter = 0
local lastTick = tick()

RunService.RenderStepped:Connect(function()
	frameCounter += 1
	local now = tick()
	if now - lastTick >= 1 then
		fps = frameCounter
		frameCounter = 0
		lastTick = now
	end
end)

-- 🧠 Lấy ping an toàn
local function safeGetPing()
	local stat = Stats.Network.ServerStatsItem["Data Ping"]
	if stat and stat.GetValue then
		local ok, value = pcall(function()
			return stat:GetValue()
		end)
		if ok and typeof(value) == "number" then
			return math.floor(value)
		end
	end
	return 0
end

-- 🔁 Cập nhật GUI
local updateConn
updateConn = RunService.RenderStepped:Connect(function()
	if not statsLabel or not statsLabel.Parent then return end
	local ping = safeGetPing()
	statsLabel.Text = string.format(" Ping: %d ms\n FPS: %d", ping, fps)
end)

-- Xử lý nút Tắt
closeButton.MouseButton1Click:Connect(function()
	if screenGui and screenGui.Parent then
		screenGui:Destroy()
	end
	if updateConn then
		updateConn:Disconnect()
	end
end)

-- ⏳ Tự động ẩn sau 3 giây (vẫn giữ để tùy chọn)
task.delay(3, function()
	if screenGui and screenGui.Parent then
		print(fix1)
	end
	if updateConn then
		print(fix2)
	end
end)
