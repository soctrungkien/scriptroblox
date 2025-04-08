local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer

local PlaceId = game.PlaceId
local JobId = game.JobId

-- Hàm chạy script sau khi reconnect
local function runAfterReconnect()
    print("Đã vào lại server! Chạy script mong muốn ở đây...")
    -- Thêm mã bạn muốn chạy sau khi reconnect vào đây
    loadstring(game:HttpGet("https://raw.githubusercontent.com/soctrungkien/scriptroblox/refs/heads/main/Script/reconnect.lua"))()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/soctrungkien/scriptroblox/refs/heads/main/Menu.lua"))()
    -- ```
end

-- Hàm reconnect
local function onDisconnect()
    print("Bạn đã bị ngắt kết nối! Đang thử vào lại server...")
    local success, error = pcall(function()
        TeleportService:TeleportToPlaceInstance(PlaceId, JobId, Player)
    end)
    if not success then
        print("Không thể vào lại server cũ, vào server mới sau 5 giây...")
        TeleportService:Teleport(PlaceId, Player) -- Vào server ngẫu nhiên
    end
end

-- Kiểm tra khi bị ngắt kết nối
game:GetService("Players").PlayerRemoving:Connect(function(player)
    if player == Player then
        onDisconnect()
    end
end)

-- Chạy script khi vào game lần đầu
Players.LocalPlayer.CharacterAdded:Connect(function(character)
    print("Nhân vật đã tải, chạy script ban đầu...")
    runAfterReconnect() -- Chạy script mỗi khi nhân vật xuất hiện (bao gồm sau reconnect)
end)

print("Script reconnect và auto-run đã được kích hoạt!")
