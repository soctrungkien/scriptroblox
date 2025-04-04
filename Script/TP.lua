local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "TeleportGUI"
gui.Parent = player.PlayerGui

-- Frame chính với phong cách mờ, tím, bo tròn
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, 200)
frame.Position = UDim2.new(0.5, -100, 0.5, -100)
frame.BackgroundColor3 = Color3.fromRGB(147, 112, 219) -- Màu tím nhạt
frame.BackgroundTransparency = 0.5 -- Độ mờ
frame.Parent = gui

local frameCorner = Instance.new("UICorner")
frameCorner.CornerRadius = UDim.new(0, 10) -- Bo tròn 10px
frameCorner.Parent = frame

-- Nút chọn người chơi 1
local player1Button = Instance.new("TextButton")
player1Button.Size = UDim2.new(0, 150, 0, 30)
player1Button.Position = UDim2.new(0, 25, 0, 20)
player1Button.Text = "Chọn Người chơi 1"
player1Button.BackgroundColor3 = Color3.fromRGB(147, 112, 219)
player1Button.BackgroundTransparency = 0.3
player1Button.TextColor3 = Color3.new(1, 1, 1) -- Chữ trắng
player1Button.Parent = frame

local player1ButtonCorner = Instance.new("UICorner")
player1ButtonCorner.CornerRadius = UDim.new(0, 8)
player1ButtonCorner.Parent = player1Button

local player1Dropdown = Instance.new("Frame")
player1Dropdown.Size = UDim2.new(0, 150, 0, 0)
player1Dropdown.Position = UDim2.new(0, 25, 0, 50)
player1Dropdown.BackgroundColor3 = Color3.fromRGB(147, 112, 219)
player1Dropdown.BackgroundTransparency = 0.5
player1Dropdown.Visible = false
player1Dropdown.Parent = frame

local player1DropdownCorner = Instance.new("UICorner")
player1DropdownCorner.CornerRadius = UDim.new(0, 8)
player1DropdownCorner.Parent = player1Dropdown

-- Nút chọn người chơi 2
local player2Button = Instance.new("TextButton")
player2Button.Size = UDim2.new(0, 150, 0, 30)
player2Button.Position = UDim2.new(0, 25, 0, 80)
player2Button.Text = "Chọn Người chơi 2"
player2Button.BackgroundColor3 = Color3.fromRGB(147, 112, 219)
player2Button.BackgroundTransparency = 0.3
player2Button.TextColor3 = Color3.new(1, 1, 1)
player2Button.Parent = frame

local player2ButtonCorner = Instance.new("UICorner")
player2ButtonCorner.CornerRadius = UDim.new(0, 8)
player2ButtonCorner.Parent = player2Button

local player2Dropdown = Instance.new("Frame")
player2Dropdown.Size = UDim2.new(0, 150, 0, 0)
player2Dropdown.Position = UDim2.new(0, 25, 0, 110)
player2Dropdown.BackgroundColor3 = Color3.fromRGB(147, 112, 219)
player2Dropdown.BackgroundTransparency = 0.5
player2Dropdown.Visible = false
player2Dropdown.Parent = frame

local player2DropdownCorner = Instance.new("UICorner")
player2DropdownCorner.CornerRadius = UDim.new(0, 8)
player2DropdownCorner.Parent = player2Dropdown

-- Hàm cập nhật danh sách người chơi
local selectedPlayer1, selectedPlayer2
local function updatePlayerList(dropdown, button, playerVar)
    for _, child in pairs(dropdown:GetChildren()) do
        if child:IsA("TextButton") then
            child:Destroy()
        end
    end
    
    for _, otherPlayer in pairs(game.Players:GetPlayers()) do
        if otherPlayer ~= player then
            local option = Instance.new("TextButton")
            option.Size = UDim2.new(1, 0, 0, 30)
            option.Text = otherPlayer.Name
            option.BackgroundColor3 = Color3.fromRGB(147, 112, 219)
            option.BackgroundTransparency = 0.3
            option.TextColor3 = Color3.new(1, 1, 1)
            option.Parent = dropdown
            local optionCorner = Instance.new("UICorner")
            optionCorner.CornerRadius = UDim.new(0, 8)
            optionCorner.Parent = option
            option.MouseButton1Click:Connect(function()
                button.Text = "Đã chọn: " .. otherPlayer.Name
                if playerVar == "player1" then
                    selectedPlayer1 = otherPlayer
                else
                    selectedPlayer2 = otherPlayer
                end
                dropdown.Visible = false
            end)
        end
    end
    dropdown.Size = UDim2.new(0, 150, 0, #dropdown:GetChildren() * 30)
end

player1Button.MouseButton1Click:Connect(function()
    player1Dropdown.Visible = not player1Dropdown.Visible
    updatePlayerList(player1Dropdown, player1Button, "player1")
end)

player2Button.MouseButton1Click:Connect(function()
    player2Dropdown.Visible = not player2Dropdown.Visible
    updatePlayerList(player2Dropdown, player2Button, "player2")
end)

-- Nút dịch chuyển
local teleportButton = Instance.new("TextButton")
teleportButton.Size = UDim2.new(0, 150, 0, 30)
teleportButton.Position = UDim2.new(0, 25, 0, 140)
teleportButton.Text = "Dịch chuyển Người chơi 1"
teleportButton.BackgroundColor3 = Color3.fromRGB(147, 112, 219)
teleportButton.BackgroundTransparency = 0.3
teleportButton.TextColor3 = Color3.new(1, 1, 1)
teleportButton.Parent = frame

local teleportButtonCorner = Instance.new("UICorner")
teleportButtonCorner.CornerRadius = UDim.new(0, 8)
teleportButtonCorner.Parent = teleportButton

teleportButton.MouseButton1Click:Connect(function()
    if selectedPlayer1 and selectedPlayer2 then
        local player1Char = selectedPlayer1.Character
        local player2Char = selectedPlayer2.Character
        
        if player1Char and player2Char and player1Char:FindFirstChild("HumanoidRootPart") and player2Char:FindFirstChild("HumanoidRootPart") then
            player1Char.HumanoidRootPart.CFrame = player2Char.HumanoidRootPart.CFrame
        else
            warn("Không thể dịch chuyển: Người chơi không có HumanoidRootPart!")
        end
    else
        warn("Vui lòng chọn cả hai người chơi!")
    end
end)

-- Nút tắt bằng emoji
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -35, 0, 5)
closeButton.Text = "❌"
closeButton.BackgroundColor3 = Color3.fromRGB(147, 112, 219)
closeButton.BackgroundTransparency = 0.3
closeButton.TextColor3 = Color3.new(1, 1, 1)
closeButton.Parent = frame

local closeButtonCorner = Instance.new("UICorner")
closeButtonCorner.CornerRadius = UDim.new(0, 8)
closeButtonCorner.Parent = closeButton

closeButton.MouseButton1Click:Connect(function()
    gui:Destroy() -- Xóa GUI khi nhấp
end)
