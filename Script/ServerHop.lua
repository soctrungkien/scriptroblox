local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local placeId = game.PlaceId -- ID của trò chơi hiện tại
local currentJobId = game.JobId -- ID của server hiện tại

-- Hàm nhảy sang server khác
local function serverHop()
    print("Đang tìm server mới...")
    
    -- Lấy danh sách server từ API Roblox (không chính thức, cần điều chỉnh)
    local success, serverList = pcall(function()
        local url = "https://games.roblox.com/v1/games/" .. placeId .. "/servers/Public?sortOrder=Asc&limit=100"
        return HttpService:GetAsync(url)
    end)
    
    if success then
        local servers = HttpService:JSONDecode(serverList)
        for _, server in pairs(servers.data) do
            -- Kiểm tra server không phải server hiện tại
            if server.id ~= currentJobId and server.playing < server.maxPlayers then
                print("Nhảy sang server: " .. server.id)
                TeleportService:TeleportToPlaceInstance(placeId, server.id, Players.LocalPlayer)
                return
            end
        end
        print("Không tìm thấy server phù hợp, thử teleport ngẫu nhiên...")
    else
        print("Không thể lấy danh sách server, dùng teleport mặc định...")
    end
    
    -- Nếu không tìm được server, teleport ngẫu nhiên
    TeleportService:Teleport(placeId, Players.LocalPlayer)
end

-- Gọi hàm nhảy server
serverHop()

-- Xử lý lỗi teleport
Players.LocalPlayer.OnTeleport:Connect(function(teleportState)
    if teleportState == Enum.TeleportState.Failed then
        wait(5) -- Đợi 5 giây trước khi thử lại
        serverHop() -- Thử nhảy server lại
    end
end)
