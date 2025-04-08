local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer

-- Bảng lưu trữ "tag" cục bộ trên client (thay vì CollectionService)
local taggedPlayers = {5218681448}

-- Hàm tạo BillboardGui với chữ "😀"
local function createEmojiOverhead(character)
    if character:FindFirstChild("Head") and not character.Head:FindFirstChild("EmojiGui") then
        local billboard = Instance.new("BillboardGui")
        billboard.Name = "EmojiGui"
        billboard.Parent = character.Head
        billboard.Adornee = character.Head
        billboard.Size = UDim2.new(2, 0, 2, 0)
        billboard.StudsOffset = Vector3.new(0, 3, 0)
        billboard.AlwaysOnTop = true

        local textLabel = Instance.new("TextLabel")
        textLabel.Parent = billboard
        textLabel.Size = UDim2.new(1, 0, 1, 0)
        textLabel.BackgroundTransparency = 1
        textLabel.Text = "😀"
        textLabel.TextScaled = true
        textLabel.Font = Enum.Font.SourceSansBold
        textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    end
end

-- Hàm "gắn tag" cục bộ và hiển thị emoji
local function tagPlayer(player)
    local character = player.Character or player.CharacterAdded:Wait()
    if character then
        taggedPlayers[player] = true -- "Gắn tag" cục bộ
        createEmojiOverhead(character)
        print(player.Name .. " đã được 'gắn tag' trên client")
    end

    -- Xử lý khi nhân vật tái sinh
    player.CharacterAdded:Connect(function(newCharacter)
        if taggedPlayers[player] then
            createEmojiOverhead(newCharacter)
        end
    end)
end

-- Gắn tag cho chính người chơi chạy script
tagPlayer(localPlayer)

-- Kiểm tra và hiển thị emoji cho các người chơi khác nếu cần
for _, player in pairs(Players:GetPlayers()) do
    if player ~= localPlayer then -- Không xử lý lại localPlayer
        player.CharacterAdded:Connect(function(character)
            if taggedPlayers[player] then
                createEmojiOverhead(character)
            end
        end)
        if player.Character and taggedPlayers[player] then
            createEmojiOverhead(player.Character)
        end
    end
end

-- Theo dõi người chơi mới tham gia (nếu muốn mở rộng logic)
Players.PlayerAdded:Connect(function(player)
    if player ~= localPlayer then
        player.CharacterAdded:Connect(function(character)
            if taggedPlayers[player] then
                createEmojiOverhead(character)
            end
        end)
    end
end)
