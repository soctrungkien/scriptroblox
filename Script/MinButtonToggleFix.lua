--[[luau
    
local MinButtonToggle = loadstring(game:HttpGet("https://raw.githubusercontent.com/soctrungkien/scriptroblox/refs/heads/main/Script/MinButtonToggleFix.lua"))(Fluent, Window)
local button = MinButtonToggle.Create()
if button then
    button.Image = "rbxassetid://81249639738070"
end

local CoreGui = game:GetService("CoreGui")
local function RemoveGui()
    local OpenUI = game:GetService("CoreGui"):FindFirstChild("OpenUI")
        OpenUI:Destroy()
end

RemoveGui()

]]--

-- Script 2: Script hoàn chỉnh tạo nút kéo thả
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

return function(Fluent, Window)
-- Hàm làm nút có thể kéo thả, hỗ trợ chuột và cảm ứng
local function MakeDrag(button)
    local dragging = false
    local dragStart = nil
    local startPos = nil

    button.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = button.Position
        end
    end)

    button.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - dragStart
            local newPos = UDim2.new(
                startPos.X.Scale,
                startPos.X.Offset + delta.X,
                startPos.Y.Scale,
                startPos.Y.Offset + delta.Y
            )
            button.Position = newPos
        end
    end)

    return button
end

-- Tạo ScreenGui mới có tên OpenUI
local OpenUI = game:GetService("CoreGui"):FindFirstChild("OpenUI") or Instance.new("ScreenGui")
OpenUI.Name = "OpenUI"
OpenUI.Parent = game:GetService("CoreGui") -- Sử dụng CoreGui như yêu cầu

-- Xóa các ImageButton cũ trong OpenUI
for _, child in ipairs(OpenUI:GetChildren()) do
    if child:IsA("ImageButton") then
        child:Destroy()
    end
end

-- Tạo ImageButton mới
local Button = Instance.new("ImageButton")
Button.Parent = OpenUI
Button.Size = UDim2.fromOffset(40, 40)
Button.Position = UDim2.fromScale(0.15, 0.15)
Button.BackgroundTransparency = 0.1
Button.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Button.AutoButtonColor = false -- Tắt hiệu ứng đổi màu khi nhấp

-- Thêm ảnh vào nút (mặc định, sẽ được Script 1 ghi đè)
Button.Image = "rbxassetid://118074316147407" -- Để trống vì Script 1 sẽ đặt
Button.ImageTransparency = 0

-- Thêm bo góc (UICorner)
local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0, 4)
Corner.Parent = Button

-- Làm nút có thể kéo thả
MakeDrag(Button)

-- Thêm sự kiện nhấp để chạy Window:Minimize()
Button.Activated:Connect(function()
    if Window and Window.Minimize then
        Window:Minimize()
    else
        warn("Window or Window:Minimize is not defined!")
    end
end)

-- Hàm xóa OpenUI và tất cả nội dung
local function DestroyGui()
    if OpenUI then
        OpenUI:Destroy()
        OpenUI = nil -- Đặt lại biến để tránh tham chiếu
    end
end

-- Trả về các hàm để sử dụng với loadstring
return {
    Create = function()
        return Button -- Trả về nút để sử dụng nếu cần
    end,
    Destroy = DestroyGui -- Trả về hàm xóa
}
