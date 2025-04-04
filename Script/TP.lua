local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "TeleportGUI"
gui.Parent = player.PlayerGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, 200)
frame.Position = UDim2.new(0.5, -100, 0.5, -100)
frame.BackgroundColor3 = Color3.new(0, 0, 0)
frame.Parent = gui

local player1Button = Instance.new("TextButton")
player1Button.Size = UDim2.new(0, 150, 0, 30)
player1Button.Position = UDim2.new(0, 25, 0, 20)
player1Button.Text = "Chọn Người chơi 1"
player1Button.Parent = frame

local player1Dropdown = Instance.new("Frame")
player1Dropdown.Size = UDim2.new(0, 150, 0, 0)
player1Dropdown.Position = UDim2.new(0, 25, 0, 50)
player1Dropdown.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
player1Dropdown.Visible = false
player1Dropdown.Parent = frame

local player2Button = Instance.new("TextButton")
player2Button.Size = UDim2.new(0, 150, 0, 30)
player2Button.Position = UDim2.new(0, 25, 0, 80)
player2Button.Text = "Chọn Người chơi 2"
player2Button.Parent = frame

local player2Dropdown = Instance.new("Frame")
player2Dropdown.Size = UDim2.new(0, 150, 0, 0)
player2Dropdown.Position = UDim2.new(0, 25, 0, 110)
player2Dropdown.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
player2Dropdown.Visible = false
player2Dropdown.Parent = frame

local function updatePlayerList(dropdown, button)
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
            option.Parent = dropdown
            option.MouseButton1Click:Connect(function()
                button.Text = "Đã chọn: " .. otherPlayer.Name
                dropdown.Visible = false
            end)
        end
    end
    dropdown.Size = UDim2.new(0, 150, 0, #dropdown:GetChildren() * 30)
end

player1Button.MouseButton1Click:Connect(function()
    player1Dropdown.Visible = not player1Dropdown.Visible
    updatePlayerList(player1Dropdown, player1Button)
end)

player2Button.MouseButton1Click:Connect(function()
    player2Dropdown.Visible = not player2Dropdown.Visible
    updatePlayerList(player2Dropdown, player2Button)
end)

local teleportButton = Instance.new("TextButton")
teleportButton.Size = UDim2.new(0, 150, 0, 30)
teleportButton.Position = UDim2.new(0, 25, 0, 140)
teleportButton.Text = "Dịch chuyển Người chơi 1"
teleportButton.Parent = frame

teleportButton.MouseButton1Click:Connect(function()
    local players = game.Players:GetPlayers()
    local player1Char, player2Char
    
    if #players >= 2 then
        player1Char = players[1].Character
        player2Char = players[2].Character
        
        if player1Char and player2Char and player1Char:FindFirstChild("HumanoidRootPart") and player2Char:FindFirstChild("HumanoidRootPart") then
            player1Char.HumanoidRootPart.CFrame = player2Char.HumanoidRootPart.CFrame
        end
    end
end)
