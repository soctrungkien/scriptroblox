local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer

local PlaceId = game.PlaceId
local JobId = game.JobId
local hasDisconnected = false

-- Hàm chạy sau khi reconnect
local function runAfterReconnect()
    if hasDisconnected then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/soctrungkien/scriptroblox/refs/heads/main/Menu.lua"))()
        print("Đã vào lại server thành công! Chạy script mong muốn ở đây...")
        local message = Instance.new("Message")
        message.Text = "Chào mừng quay lại server!"
        message.Parent = workspace
        wait(5)
        message:Destroy()
    end
end

-- Hàm reconnect
local function attemptReconnect()
    hasDisconnected = true
    print("Đang thử vào lại server...")
    local success, error = pcall(function()
        TeleportService:TeleportToPlaceInstance(PlaceId, JobId, Player)
    end)
    if not success then
        warn("Không thể vào server cũ: " .. tostring(error))
        print("Thử vào server mới sau 0.002 giây...")
        wait(0.002)
        local newSuccess, newError = pcall(function()
            TeleportService:Teleport(PlaceId, Player)
        end)
        if not newSuccess then
            warn("Không thể vào server mới: " .. tostring(newError))
        end
    end
end

-- Phát hiện ngắt kết nối
game:GetService("Players").PlayerRemoving:Connect(function(player)
    if player == Player then
        print("Phát hiện bạn rời server!")
        attemptReconnect()
    end
end)

-- Kiểm tra khi nhân vật tải lại
Players.LocalPlayer.CharacterAdded:Connect(function(character)
    runAfterReconnect()
end)

-- Kiểm tra mất kết nối mạng (không hoàn hảo nhưng hữu ích)
game:GetService("RunService").Heartbeat:Connect(function()
    if not game:IsLoaded() or Players.LocalPlayer == nil then
        print("Mất kết nối, đang thử reconnect...")
        attemptReconnect()
    end
end)

print("Script reconnect đã được kích hoạt!")
