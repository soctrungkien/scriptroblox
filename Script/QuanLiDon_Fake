local player = game:GetService("Players").LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Ẩn một phần tên
local function hideName(name)
    local visibleLength = math.max(3, math.floor(#name * 0.5))
    local hiddenPart = string.rep("*", #name - visibleLength)
    return string.sub(name, 1, visibleLength) .. hiddenPart
end

-- Tạo GUI chính
local nameHub = Instance.new("ScreenGui")
nameHub.Name = "NameHub"
nameHub.Parent = playerGui

local mainFrame = Instance.new("Frame")
mainFrame.Parent = nameHub
mainFrame.Size = UDim2.new(0.3, 0, 0.1, 0) -- Nhỏ gọn hơn
mainFrame.Position = UDim2.new(0.5, 0, 0.1, 0) -- Đặt lên cao hơn
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.BackgroundTransparency = 0.2
mainFrame.BorderSizePixel = 0
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
mainFrame.Active = true -- Cho phép kéo
mainFrame.Draggable = true -- Kéo thả được

local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0.15, 0)
uiCorner.Parent = mainFrame

-- Hiển thị tên (ẩn bớt chữ)
local nameLabel = Instance.new("TextLabel")
nameLabel.Parent = mainFrame
nameLabel.Size = UDim2.new(1, 0, 0.5, 0)
nameLabel.Position = UDim2.new(0, 0, 0, 0)
nameLabel.BackgroundTransparency = 1
nameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
nameLabel.TextScaled = true
nameLabel.Font = Enum.Font.GothamBold
nameLabel.Text = "👤 Tên :" .. hideName(player.Name) .. ""

-- Khung hiển thị đơn
local jobFrame = Instance.new("Frame")
jobFrame.Parent = mainFrame
jobFrame.Size = UDim2.new(1, 0, 0.5, 0)
jobFrame.Position = UDim2.new(0, 0, 0.5, 0)
jobFrame.BackgroundTransparency = 1

-- Hiển thị chữ "Đơn:"
local jobTitle = Instance.new("TextLabel")
jobTitle.Parent = jobFrame
jobTitle.Size = UDim2.new(0.3, 0, 1, 0)
jobTitle.Position = UDim2.new(0, 0, 0, 0)
jobTitle.BackgroundTransparency = 1
jobTitle.TextColor3 = Color3.fromRGB(255, 223, 88)
jobTitle.TextScaled = true
jobTitle.Font = Enum.Font.GothamBold
jobTitle.Text = "📌 Đơn :"

-- Ô sửa nội dung đơn
local jobBox = Instance.new("TextBox")
jobBox.Parent = jobFrame
jobBox.Size = UDim2.new(0.7, 0, 1, 0)
jobBox.Position = UDim2.new(0.3, 0, 0, 0)
jobBox.BackgroundTransparency = 1
jobBox.TextColor3 = Color3.fromRGB(255, 255, 255)
jobBox.TextScaled = true
jobBox.Font = Enum.Font.GothamBold
jobBox.Text = ""
jobBox.ClearTextOnFocus = false
jobBox.TextWrapped = true

-- Khi nhấn Enter, cập nhật nội dung nhưng giữ nguyên chữ "Đơn:"
jobBox.FocusLost:Connect(function(enterPressed)
    if enterPressed and jobBox.Text ~= "" then
        jobBox.Text = jobBox.Text -- Cập nhật nội dung
    end
end)
