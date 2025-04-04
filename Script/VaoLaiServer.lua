local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local placeId = game.PlaceId -- ID của trò chơi hiện tại

-- Hàm để thử vào lại server
local function rejoinServer()
    print("Đang thử vào lại server...")
    TeleportService:Teleport(placeId, player)
end

-- Kiểm tra khi người chơi bị ngắt kết nối hoặc muốn vào lại
player.OnTeleport:Connect(function(teleportState)
    if teleportState == Enum.TeleportState.Failed then
        wait(5) -- Đợi 5 giây trước khi thử lại
        rejoinServer() -- Thử vào lại server
    end
end)

-- Gọi hàm để vào lại server ngay lập tức (tùy chọn)
rejoinServer()
