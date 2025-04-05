local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local placeId = game.PlaceId
local currentJobId = game.JobId

local function serverHop()
    print("Đang tìm server mới...")
    
    -- Thử lấy danh sách server
    local success, response = pcall(function()
        local url = "https://games.roblox.com/v1/games/" .. placeId .. "/servers/Public?sortOrder=Asc&limit=100"
        return HttpService:GetAsync(url)
    end)
    
    if success and response then
        local servers = HttpService:JSONDecode(response)
        if servers and servers.data then
            for _, server in pairs(servers.data) do
                if server.id ~= currentJobId and server.playing < server.maxPlayers then
                    print("Nhảy sang server: " .. server.id)
                    TeleportService:TeleportToPlaceInstance(placeId, server.id, Players.LocalPlayer)
                    return
                end
            end
            print("Không tìm thấy server phù hợp, teleport ngẫu nhiên...")
        else
            print("Danh sách server trống hoặc lỗi định dạng!")
        end
    else
        print("Lỗi khi lấy danh sách server: " .. tostring(response))
    end
    
    -- Fallback: Teleport ngẫu nhiên nếu thất bại
    TeleportService:Teleport(placeId, Players.LocalPlayer)
end

-- Thực thi với xử lý lỗi
local success, error = pcall(function()
    serverHop()
end)

if not success then
    warn("Lỗi khi chạy server hop: " .. error)
end

-- Xử lý teleport thất bại
Players.LocalPlayer.OnTeleport:Connect(function(teleportState)
    if teleportState == Enum.TeleportState.Failed then
        print("Teleport thất bại, thử lại sau 5 giây...")
        wait(5)
        serverHop()
    end
end)
