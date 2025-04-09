-- Script di chuyển nhân vật với vòng lặp vô tận chạy độc lập
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")

-- Hàm tạo số ngẫu nhiên từ 1 đến 3
local function getRandomOffset()
    return math.random(1, 3) / 1 -- Chuyển từ 1 đến 3 studs
end

-- Hàm di chuyển và quay về
local function moveLoop()
    while true do
        -- Lưu vị trí ban đầu
        local originalPosition = HumanoidRootPart.Position
        
        -- Di chuyển nhân vật
        local offset = getRandomOffset()
        local newPosition = originalPosition + Vector3.new(offset, 0, 0)
        HumanoidRootPart.CFrame = CFrame.new(newPosition)
        print("Đã di chuyển " .. offset .. " studs")

        -- Quay về vị trí ban đầu
        HumanoidRootPart.CFrame = CFrame.new(originalPosition)
        print("Đã trở về vị trí ban đầu")

        -- Đợi 5 phút (600 giây)
        wait(30)
    end
end

-- Chạy vòng lặp trong luồng riêng
spawn(moveLoop)

print("Script đang chạy độc lập!")
