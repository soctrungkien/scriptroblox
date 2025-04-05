-- Tạo GUI
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local GetKeyButton = Instance.new("TextButton")
local KeyInput = Instance.new("TextBox")
local AcceptButton = Instance.new("TextButton")
local CloseButton = Instance.new("TextButton")
local Blur = Instance.new("BlurEffect")
local UICorner = Instance.new("UICorner")
local UIStroke = Instance.new("UIStroke")

-- Cài đặt ScreenGui với bảo mật
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Name = "SecureGUI_" .. math.random(1000, 9999) -- Tên ngẫu nhiên chống bypass

-- Thêm hiệu ứng mờ (Blur) vào màn hình
Blur.Parent = game.Lighting
Blur.Size = 24
Blur.Enabled = true

-- Cài đặt Frame nhỏ gọn với màu tím và viền sáng
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(80, 0, 160) -- Màu tím đậm
Frame.BackgroundTransparency = 0.3 -- Độ trong suốt nhẹ
Frame.Position = UDim2.new(0.5, -75, 0.5, -60) -- Căn giữa, nhỏ hơn
Frame.Size = UDim2.new(0, 150, 0, 120) -- Kích thước nhỏ: 150x120
Frame.ClipsDescendants = true -- Chống tràn nội dung

-- Bo tròn góc cho Frame
UICorner.CornerRadius = UDim.new(0, 10) -- Bo tròn 10px
UICorner.Parent = Frame

-- Viền sáng (UIStroke)
UIStroke.Parent = Frame
UIStroke.Color = Color3.fromRGB(160, 80, 255) -- Màu tím sáng
UIStroke.Thickness = 2 -- Độ dày viền
UIStroke.Transparency = 0.3 -- Độ trong suốt viền

-- Cài đặt nút "Lấy Key 📋" nhỏ hơn
GetKeyButton.Parent = Frame
GetKeyButton.BackgroundColor3 = Color3.fromRGB(100, 0, 200) -- Tím nhạt
GetKeyButton.BackgroundTransparency = 0.2
GetKeyButton.Position = UDim2.new(0.1, 0, 0.1, 0)
GetKeyButton.Size = UDim2.new(0.8, 0, 0.25, 0) -- Tỷ lệ nhỏ gọn
GetKeyButton.Text = "Lấy Key 📋"
GetKeyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
GetKeyButton.TextScaled = true -- Tự động điều chỉnh kích thước chữ
UICorner:Clone().Parent = GetKeyButton
UIStroke:Clone().Parent = GetKeyButton

-- Cài đặt ô nhập Key nhỏ hơn
KeyInput.Parent = Frame
KeyInput.BackgroundColor3 = Color3.fromRGB(100, 0, 200) -- Tím nhạt
KeyInput.BackgroundTransparency = 0.2
KeyInput.Position = UDim2.new(0.1, 0, 0.4, 0)
KeyInput.Size = UDim2.new(0.8, 0, 0.25, 0) -- Tỷ lệ nhỏ gọn
KeyInput.PlaceholderText = "Nhập Key 🔑"
KeyInput.Text = ""
KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyInput.TextScaled = true -- Tự động điều chỉnh kích thước chữ
UICorner:Clone().Parent = KeyInput
UIStroke:Clone().Parent = KeyInput

-- Cài đặt nút "Chấp nhận ✅" nhỏ hơn
AcceptButton.Parent = Frame
AcceptButton.BackgroundColor3 = Color3.fromRGB(100, 0, 200) -- Tím nhạt
AcceptButton.BackgroundTransparency = 0.2
AcceptButton.Position = UDim2.new(0.1, 0, 0.7, 0)
AcceptButton.Size = UDim2.new(0.8, 0, 0.25, 0) -- Tỷ lệ nhỏ gọn
AcceptButton.Text = "Chấp nhận ✅"
AcceptButton.TextColor3 = Color3.fromRGB(255, 255, 255)
AcceptButton.TextScaled = true -- Tự động điều chỉnh kích thước chữ
UICorner:Clone().Parent = AcceptButton
UIStroke:Clone().Parent = AcceptButton

-- Cài đặt nút "Đóng ❌" nhỏ hơn
CloseButton.Parent = Frame
CloseButton.BackgroundColor3 = Color3.fromRGB(100, 0, 200) -- Tím nhạt
CloseButton.BackgroundTransparency = 0.2
CloseButton.Position = UDim2.new(0.8, 0, 0, 0)
CloseButton.Size = UDim2.new(0.15, 0, 0.15, 0) -- Nhỏ gọn hơn
CloseButton.Text = "❌"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextScaled = true -- Tự động điều chỉnh kích thước chữ
UICorner:Clone().Parent = CloseButton
UIStroke:Clone().Parent = CloseButton

-- Bảo mật: Kiểm tra tính toàn vẹn hàm HttpGet
local OriginalHttpGet = game.HttpGet
local function CheckIntegrity()
    if game.HttpGet ~= OriginalHttpGet then
        game.StarterGui:SetCore("SendNotification", {
            Title = "Cảnh báo ⚠️",
            Text = "Phát hiện can thiệp trái phép! GUI sẽ tắt.",
            Duration = 5
        })
        ScreenGui:Destroy()
        Blur:Destroy()
        return false
    end
    return true
end

-- Chức năng nút "Lấy Key 📋"
GetKeyButton.MouseButton1Click:Connect(function()
    if not CheckIntegrity() then return end
    local link = "https://ads.luarmor.net/get_key?for=VHFslhWdrPey" -- Link yêu cầu
    if setClipboard then
        pcall(function()
            setClipboard(link)
            game.StarterGui:SetCore("SendNotification", {
                Title = "Thành công ✅",
                Text = "Đã sao chép link! Dán bằng Ctrl+V 📋",
                Duration = 5
            })
        end)
    else
        game.StarterGui:SetCore("SendNotification", {
            Title = "Clipboard không hỗ trợ ⚠️",
            Text = "Sao chép thủ công: " .. link,
            Duration = 5
        })
    end
end)

-- Chức năng nút "Chấp nhận ✅" (không kiểm tra key)
AcceptButton.MouseButton1Click:Connect(function()
    if not CheckIntegrity() then return end
    local key = KeyInput.Text
    repeat task.wait() until game:IsLoaded() and game.Players.LocalPlayer
    getgenv().Key = "\"" .. key .. "\"" -- Gán key trực tiếp, không kiểm tra
    loadstring(OriginalHttpGet(game, "https://raw.githubusercontent.com/obiiyeuem/vthangsitink/main/BananaHub.lua"))()
    -- Get Key : https://ads.luarmor.net/get_key?for=VHFslhWdrPey
    ScreenGui.Enabled = false
    game.StarterGui:SetCore("SendNotification", {
        Title = "Thành công ✅",
        Text = "Đã chạy script với key! 🔑",
        Duration = 5
    })
end)

-- Chức năng nút "Đóng ❌"
CloseButton.MouseButton1Click:Connect(function()
    if not CheckIntegrity() then return end
    ScreenGui.Enabled = false
    Blur.Enabled = false -- Tắt hiệu ứng mờ khi đóng
end)

-- Chống bypass: Theo dõi thay đổi ScreenGui
ScreenGui.Changed:Connect(function(property)
    if property == "Enabled" and not ScreenGui.Enabled then return end
    if property ~= "Enabled" then
        game.StarterGui:SetCore("SendNotification", {
            Title = "Cảnh báo ⚠️",
            Text = "Phát hiện thay đổi GUI trái phép!",
            Duration = 5
        })
        ScreenGui:Destroy()
        Blur:Destroy()
    end
end)
