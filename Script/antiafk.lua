-- Script di chuyển nhân vật với vòng lặp vô tận chạy độc lập
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")

-- Biến để kiểm soát vòng lặp
local isRunning = false
local loopConnection = nil

-- Hàm tạo số ngẫu nhiên từ 2 đến 7
local function getRandomOffset()
    return math.random(2, 7) / 1 -- Chuyển từ 2 đến 7 studs
end

-- Hàm dừng vòng lặp cũ
local function stopLoop()
    if isRunning and loopConnection then
        loopConnection:Disconnect()
        isRunning = false
        print("Đã dừng vòng lặp cũ")
    end
end

-- Hàm di chuyển và quay về
local function moveLoop()
    isRunning = true
    while isRunning do
        
        -- Lưu CFrame ban đầu (vị trí và hướng)
        local originalCFrame = HumanoidRootPart.CFrame
        
        -- Di chuyển nhân vật
        local offset = getRandomOffset()
        local newPosition = originalCFrame.Position + Vector3.new(offset, 0, 0)
        HumanoidRootPart.CFrame = CFrame.new(newPosition) * originalCFrame.Rotation
        print("Đã di chuyển " .. offset .. " studs")

        -- Quay về vị trí và hướng ban đầu
        HumanoidRootPart.CFrame = originalCFrame
        print("Đã trở về vị trí và hướng ban đầu")

        -- Đợi 5 phút (300 giây)
        wait(300)

    end
end

-- Dừng vòng lặp cũ nếu có
stopLoop()

-- Chạy vòng lặp mới trong luồng riêng
loopConnection = game:GetService("RunService").Heartbeat:Connect(function()
    spawn(moveLoop)
    loopConnection:Disconnect() -- Ngắt kết nối ngay sau khi spawn
end)

print("Script mới đang chạy độc lập!")
