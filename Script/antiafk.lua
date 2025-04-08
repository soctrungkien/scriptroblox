-- Script di chuyển nhân vật với vòng lặp vô tận
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")

-- Vòng lặp vô tận
while true do

    -- Hàm tạo số ngẫu nhiên từ 0.02 đến 0.07
        local function getRandomOffset()
        return math.random(2, 7) / 100 -- Chuyển từ 0.02 đến 0.07 studs
    end

    -- Hàm tạo số ngẫu nhiên từ 0.001 đến 0.005
    local function randomtime()
        return math.random(1, 5) / 1000 -- Chuyển từ 0.001 đến 0.005 studs
    end
    
    -- Lưu vị trí ban đầu
    local originalPosition = HumanoidRootPart.Position
    
    -- Di chuyển nhân vật
    local offset = getRandomOffset()
    local newPosition = originalPosition + Vector3.new(offset, 0, 0) -- Di chuyển theo trục X
    HumanoidRootPart.CFrame = CFrame.new(newPosition)
    print("Đã di chuyển " .. offset .. " studs")

    local wrt = randomtime()
    wait(wrt)
    
        -- Quay về vị trí ban đầu
    HumanoidRootPart.CFrame = CFrame.new(originalPosition)
    print("Đã trở về vị trí ban đầu")

    -- Đợi 10 phút (600 giây)
    wait(600)

end
