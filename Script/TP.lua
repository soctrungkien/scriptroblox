local placeId = game. PlaceId
if placeId == 2753915549 or placeId == 4442272183 or placeId == 7449423635 or placeId == 116495829188952 or placeId == 70876832253163 or placeId == 85896571713843 then
game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "Dragon Hub", 
	Text = "Game ko hỗ trợ", 
	Duration = 5,
	Icon = "rbxassetid://81249639738070"
})
  end

local player = game.Players.LocalPlayer
local guiService = game:GetService("GuiService")
local userInputService = game:GetService("UserInputService")
local tweenService = game:GetService("TweenService")

-- Tạo ScreenGui trong CoreGui
local gui = Instance.new("ScreenGui")
gui.Name = "TeleportGUI"
gui.Parent = game.CoreGui -- Sử dụng CoreGui để tích hợp với hệ thống UI Roblox
gui.ResetOnSpawn = false -- Không reset khi người chơi tái sinh

-- Frame chính
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, 220)
frame.Position = UDim2.new(0.5, -100, 0.5, -110)
frame.BackgroundColor3 = Color3.fromRGB(147, 112, 219)
frame.BackgroundTransparency = 0.5
frame.Parent = gui

local frameCorner = Instance.new("UICorner")
frameCorner.CornerRadius = UDim.new(0, 10)
frameCorner.Parent = frame

-- Nút chọn người chơi
local selectButton = Instance.new("TextButton")
selectButton.Size = UDim2.new(0, 150, 0, 30)
selectButton.Position = UDim2.new(0, 25, 0, 20)
selectButton.Text = "Chọn Người chơi"
selectButton.BackgroundColor3 = Color3.fromRGB(147, 112, 219)
selectButton.BackgroundTransparency = 0.3
selectButton.TextColor3 = Color3.new(1, 1, 1)
selectButton.Parent = frame

local selectButtonCorner = Instance.new("UICorner")
selectButtonCorner.CornerRadius = UDim.new(0, 8)
selectButtonCorner.Parent = selectButton

-- Dropdown với ScrollingFrame (bên phải, điều chỉnh động)
local dropdown = Instance.new("ScrollingFrame")
dropdown.Size = UDim2.new(0, 150, 0, 350) -- Chiều cao mặc định
dropdown.Position = UDim2.new(0, 215, 0, 20) -- Sang bên phải của selectButton
dropdown.BackgroundColor3 = Color3.fromRGB(147, 112, 219)
dropdown.BackgroundTransparency = 01.
dropdown.BorderSizePixel = 0
dropdown.CanvasSize = UDim2.new(0, 0, 0, 0)
dropdown.ScrollBarThickness = 6
dropdown.Visible = false
dropdown.Parent = frame

local dropdownCorner = Instance.new("UICorner")
dropdownCorner.CornerRadius = UDim.new(0, 8)
dropdownCorner.Parent = dropdown

local listLayout = Instance.new("UIListLayout")
listLayout.SortOrder = Enum.SortOrder.LayoutOrder
listLayout.Parent = dropdown

-- Hàm cập nhật danh sách người chơi và điều chỉnh dropdown
local selectedPlayer
local function updatePlayerList()
    for _, child in pairs(dropdown:GetChildren()) do
        if child:IsA("TextButton") then
            child:Destroy()
        end
    end
    
    local playerCount = 0
    for _, otherPlayer in pairs(game.Players:GetPlayers()) do
        if otherPlayer ~= player then
            local option = Instance.new("TextButton")
            option.Size = UDim2.new(1, -6, 0, 30)
            option.Text = otherPlayer.Name
            option.BackgroundColor3 = Color3.fromRGB(147, 112, 219)
            option.BackgroundTransparency = 0.3
            option.TextColor3 = Color3.new(1, 1, 1)
            option.Font = Enum.Font.SourceSans
            option.Parent = dropdown
            local optionCorner = Instance.new("UICorner")
            optionCorner.CornerRadius = UDim.new(0, 8)
            optionCorner.Parent = option
            option.MouseButton1Click:Connect(function()
                selectButton.Text = "Đã chọn: " .. otherPlayer.Name
                selectedPlayer = otherPlayer
                dropdown.Visible = false
            end)
            playerCount = playerCount + 1
        end
    end
    
    -- Điều chỉnh kích thước và vị trí dropdown
    local screenSize = guiService:GetScreenSize()
    local maxDropdownHeight = math.min(playerCount * 30, screenSize.Y - 100) -- Giới hạn chiều cao
    dropdown.CanvasSize = UDim2.new(0, 0, 0, playerCount * 30)
    dropdown.Size = UDim2.new(0, 150, 0, math.min(100, maxDropdownHeight))
    
    -- Kiểm tra để dropdown không ra ngoài màn hình
    local frameAbsPos = frame.AbsolutePosition
    local dropdownX = frameAbsPos.X + 175
    if dropdownX + 150 > screenSize.X then
        dropdown.Position = UDim2.new(0, -150, 0, 20) -- Chuyển sang bên trái nếu vượt mép phải
    else
        dropdown.Position = UDim2.new(0, 175, 0, 20) -- Giữ bên phải nếu đủ chỗ
    end
end

selectButton.MouseButton1Click:Connect(function()
    dropdown.Visible = not dropdown.Visible
    updatePlayerList()
end)

-- Nút bay từ từ (tốc độ 60 studs/giây)
local flyButton = Instance.new("TextButton")
flyButton.Size = UDim2.new(0, 150, 0, 30)
flyButton.Position = UDim2.new(0, 25, 0, 80)
flyButton.Text = "Bay từ từ"
flyButton.BackgroundColor3 = Color3.fromRGB(147, 112, 219)
flyButton.BackgroundTransparency = 0.3
flyButton.TextColor3 = Color3.new(1, 1, 1)
flyButton.Parent = frame

local flyButtonCorner = Instance.new("UICorner")
flyButtonCorner.CornerRadius = UDim.new(0, 8)
flyButtonCorner.Parent = flyButton

flyButton.MouseButton1Click:Connect(function()
    if selectedPlayer then
        local playerChar = player.Character
        local targetChar = selectedPlayer.Character
        
        if playerChar and targetChar and playerChar:FindFirstChild("HumanoidRootPart") and targetChar:FindFirstChild("HumanoidRootPart") then
            local startPos = playerChar.HumanoidRootPart.Position
            local endPos = targetChar.HumanoidRootPart.Position
            local distance = (endPos - startPos).Magnitude
            local speed = 600
            local time = distance / speed
            
            local tweenInfo = TweenInfo.new(
                time,
                Enum.EasingStyle.Linear,
                Enum.EasingDirection.Out,
                0,
                false,
                0
            )
            local tween = tweenService:Create(
                playerChar.HumanoidRootPart,
                tweenInfo,
                {CFrame = targetChar.HumanoidRootPart.CFrame}
            )
            tween:Play()
        else
            warn("Không thể bay: Một trong hai người chơi không có HumanoidRootPart!")
        end
    else
        warn("Vui lòng chọn một người chơi!")
    end
end)

-- Nút dịch chuyển
local teleportButton = Instance.new("TextButton")
teleportButton.Size = UDim2.new(0, 150, 0, 30)
teleportButton.Position = UDim2.new(0, 25, 0, 120)
teleportButton.Text = "Dịch chuyển"
teleportButton.BackgroundColor3 = Color3.fromRGB(147, 112, 219)
teleportButton.BackgroundTransparency = 0.3
teleportButton.TextColor3 = Color3.new(1, 1, 1)
teleportButton.Parent = frame

local teleportButtonCorner = Instance.new("UICorner")
teleportButtonCorner.CornerRadius = UDim.new(0, 8)
teleportButtonCorner.Parent = teleportButton

teleportButton.MouseButton1Click:Connect(function()
    if selectedPlayer then
        local playerChar = player.Character
        local targetChar = selectedPlayer.Character
        
        if playerChar and targetChar and playerChar:FindFirstChild("HumanoidRootPart") and targetChar:FindFirstChild("HumanoidRootPart") then
            playerChar.HumanoidRootPart.CFrame = targetChar.HumanoidRootPart.CFrame
        else
            warn("Không thể dịch chuyển: Một trong hai người chơi không có HumanoidRootPart!")
        end
    else
        warn("Vui lòng chọn một người chơi!")
    end
end)

-- Nút tới gần và bay từ từ (tốc độ 60 studs/giây)
local approachFlyButton = Instance.new("TextButton")
approachFlyButton.Size = UDim2.new(0, 150, 0, 30)
approachFlyButton.Position = UDim2.new(0, 25, 0, 160)
approachFlyButton.Text = "Tới gần và bay từ từ"
approachFlyButton.BackgroundColor3 = Color3.fromRGB(147, 112, 219)
approachFlyButton.BackgroundTransparency = 0.3
approachFlyButton.TextColor3 = Color3.new(1, 1, 1)
approachFlyButton.Parent = frame

local approachFlyButtonCorner = Instance.new("UICorner")
approachFlyButtonCorner.CornerRadius = UDim.new(0, 8)
approachFlyButtonCorner.Parent = approachFlyButton

approachFlyButton.MouseButton1Click:Connect(function()
    if selectedPlayer then
        local playerChar = player.Character
        local targetChar = selectedPlayer.Character
        
        if playerChar and targetChar and playerChar:FindFirstChild("HumanoidRootPart") and targetChar:FindFirstChild("HumanoidRootPart") then
            local targetPos = targetChar.HumanoidRootPart.Position
            local distance = math.random(40, 100)
            local angle = math.random() * 2 * math.pi
            local offset = Vector3.new(math.cos(angle) * distance, 0, math.sin(angle) * distance)
            local approachPos = targetPos + offset
            
            playerChar.HumanoidRootPart.CFrame = CFrame.new(approachPos, targetPos)
            
            local newDistance = (targetPos - approachPos).Magnitude
            local speed = 600
            local time = newDistance / speed
            
            local tweenInfo = TweenInfo.new(
                time,
                Enum.EasingStyle.Linear,
                Enum.EasingDirection.Out,
                0,
                false,
                0
            )
            local tween = tweenService:Create(
                playerChar.HumanoidRootPart,
                tweenInfo,
                {CFrame = targetChar.HumanoidRootPart.CFrame}
            )
            tween:Play()
        else
            warn("Không thể thực hiện: Một trong hai người chơi không có HumanoidRootPart!")
        end
    else
        warn("Vui lòng chọn một người chơi!")
    end
end)

-- Nút tắt bằng emoji
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -30, 0, 0)
closeButton.Text = "❌"
closeButton.BackgroundColor3 = Color3.fromRGB(147, 112, 219)
closeButton.BackgroundTransparency = 1.
closeButton.TextColor3 = Color3.new(1, 1, 1)
closeButton.Font = Enum.Font.Arimo
closeButton.Parent = frame

local closeButtonCorner = Instance.new("UICorner")
closeButtonCorner.CornerRadius = UDim.new(0, 8)
closeButtonCorner.Parent = closeButton

closeButton.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

-- Thêm tính năng kéo cho Frame
local dragging
local dragInput
local dragStart
local startPos

frame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = frame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

frame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

userInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        frame.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end
end)
