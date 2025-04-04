-- Tạo GUI
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local GetKeyButton = Instance.new("TextButton")
local KeyInput = Instance.new("TextBox")
local AcceptButton = Instance.new("TextButton")
local CloseButton = Instance.new("TextButton")

-- Cài đặt ScreenGui
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Cài đặt Frame
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Frame.Position = UDim2.new(0.5, -100, 0.5, -75)
Frame.Size = UDim2.new(0, 200, 0, 180) -- Tăng chiều cao để chứa nút Close

-- Cài đặt nút GetKey
GetKeyButton.Parent = Frame
GetKeyButton.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
GetKeyButton.Position = UDim2.new(0.1, 0, 0.1, 0)
GetKeyButton.Size = UDim2.new(0.8, 0, 0.2, 0)
GetKeyButton.Text = "Get Key"
GetKeyButton.TextColor3 = Color3.fromRGB(255, 255, 255)

-- Cài đặt ô nhập Key
KeyInput.Parent = Frame
KeyInput.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
KeyInput.Position = UDim2.new(0.1, 0, 0.35, 0)
KeyInput.Size = UDim2.new(0.8, 0, 0.2, 0)
KeyInput.Text = "Enter Key Here"
KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)

-- Cài đặt nút Accept
AcceptButton.Parent = Frame
AcceptButton.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
AcceptButton.Position = UDim2.new(0.1, 0, 0.6, 0)
AcceptButton.Size = UDim2.new(0.8, 0, 0.2, 0)
AcceptButton.Text = "Accept"
AcceptButton.TextColor3 = Color3.fromRGB(255, 255, 255)

-- Cài đặt nút Close
CloseButton.Parent = Frame
CloseButton.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
CloseButton.Position = UDim2.new(0.8, 0, 0, 0) -- Góc trên bên phải
CloseButton.Size = UDim2.new(0.1, 0, 0.1, 0)
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)

-- Chức năng nút GetKey
GetKeyButton.MouseButton1Click:Connect(function()
    local link = "https://ads.luarmor.net/get_key?for=VHFslhWdrPey"
    if setClipboard then
        setClipboard(link)
        game.StarterGui:SetCore("SendNotification", {
            Title = "Success",
            Text = "Link copied to clipboard!",
            Duration = 5
        })
    else
        game.StarterGui:SetCore("SendNotification", {
            Title = "Get Key",
            Text = "Please visit: " .. link,
            Duration = 5
        })
    end
end)

-- Chức năng nút Accept
AcceptButton.MouseButton1Click:Connect(function()
    local key = KeyInput.Text
    if key and key ~= "" and key ~= "Enter Key Here" then
        repeat wait() until game:IsLoaded() and game.Players.LocalPlayer
        getgenv().Key = "\"" .. key .. "\""
        loadstring(game:HttpGet("https://raw.githubusercontent.com/obiiyeuem/vthangsitink/main/BananaHub.lua"))()
        -- Get Key : https://ads.luarmor.net/get_key?for=VHFslhWdrPey
        -- Tắt GUI sau khi chạy script
        ScreenGui.Enabled = false
    else
        game.StarterGui:SetCore("SendNotification", {
            Title = "Error",
            Text = "Please enter a valid key!",
            Duration = 5
        })
    end
end)

-- Chức năng nút Close
CloseButton.MouseButton1Click:Connect(function()
    ScreenGui.Enabled = false
end)
