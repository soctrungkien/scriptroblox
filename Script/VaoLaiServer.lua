local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local placeId = game.PlaceId

-- Hàm để thử vào lại server
local function rejoinServer()
    print("Đang thử vào lại server...")
    TeleportService:Teleport(placeId, player)
end

-- Hàm chạy sau khi vào server thành công
local function onServerJoined()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/soctrungkien/scriptroblox/refs/heads/main/Menu.lua"))()
    print("Đã vào server thành công!")
    -- Thêm mã bạn muốn chạy sau khi vào server ở đây
    -- Ví dụ:
    wait(1) -- Đợi 1 giây để server tải xong
    print("Chào mừng bạn đến với server!")
    -- Có thể thêm logic khác như kiểm tra UI, gửi thông báo, v.v.
end

-- Xử lý trạng thái teleport
player.OnTeleport:Connect(function(teleportState)
    if teleportState == Enum.TeleportState.Failed then
        wait(1) -- Đợi 1 giây trước khi thử lại
        rejoinServer() -- Thử vào lại server
    elseif teleportState == Enum.TeleportState.InGame then
        -- Khi đã vào server thành công
        onServerJoined()
    end
end)

-- Gọi hàm để vào lại server ngay lập tức
rejoinServer()
