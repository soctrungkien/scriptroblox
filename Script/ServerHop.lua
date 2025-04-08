local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local placeId = game.PlaceId -- ID của trò chơi
local currentJobId = game.JobId -- ID của server hiện tại

local function serverHop()
    print("Đang tìm server ngẫu nhiên khác...")

    -- Lấy danh sách server từ API Roblox
    local success, response = pcall(function()
        local url = "https://games.roblox.com/v1/games/" .. placeId .. "/servers/Public?sortOrder=Asc&limit=100"
        return HttpService:GetAsync(url)
    end)

    if success and response then
        local servers = HttpService:JSONDecode(response)
        if servers and servers.data and #servers.data > 0 then
            -- Lọc danh sách server để loại trừ server hiện tại
            local validServers = {}
            for _, server in pairs(servers.data) do
                if server.id ~= currentJobId then
                    table.insert(validServers, server)
                end
            end

            -- Nếu có server khác để nhảy
            if #validServers > 0 then
                -- Chọn ngẫu nhiên một server từ danh sách
                local randomIndex = math.random(1, #validServers)
                local targetServer = validServers[randomIndex]
                print("Nhảy sang server: " .. targetServer.id)
                TeleportService:TeleportToPlaceInstance(placeId, targetServer.id, Players.LocalPlayer)
                return
            else
                print("Không tìm thấy server nào khác!")
            end
        else
            print("Danh sách server trống hoặc lỗi định dạng!")
        end
    else
        print("Lỗi khi lấy danh sách server: " .. tostring(response))
    end

    -- Fallback: Teleport ngẫu nhiên nếu không lấy được danh sách
    print("Không tìm được server, dùng teleport ngẫu nhiên (có thể trùng)...")
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
        print("Teleport thất bại, thử lại sau 1 giây...")
        wait(1)
        serverHop()
    end
end)
