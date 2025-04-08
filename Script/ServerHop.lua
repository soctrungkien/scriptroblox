local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")
local HttpService = game,GetService("HttpService")
local placeId = game.PlaceId
local currentJobId = game.JobId

local function serverHop()
    print("Đang tìm server ngẫu nhiên khác...")

    local success, response = pcall(function()
        local url = "https://games.roblox.com/v1/games/" .. placeId .. "/servers/Public?sortOrder=Asc&limit=100"
        return HttpService:GetAsync(url)
    end)

    if success and response then
        local servers = HttpService:JSONDecode(response)
        if servers and servers.data and #servers.data > 0 then
            local validServers = {}
            for _, server in pairs(servers.data) do
                if server.id ~= currentJobId then
                    table.insert(validServers, server)
                end
            end

            if #validServers > 0 then
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

    print("Không tìm được server, dùng teleport ngẫu nhiên...")
    TeleportService:Teleport(placeId, Players.LocalPlayer)
end

-- Hàm chạy sau khi vào server thành công
local function onServerJoined()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/soctrungkien/scriptroblox/refs/heads/main/Menu.lua"))()
    print("Đã nhảy sang server mới thành công!")
    -- Thêm mã bạn muốn chạy sau khi vào server ở đây
    -- Ví dụ:
    wait(1) -- Đợi 1 giây để server tải xong
    print("Bạn đang ở một server mới, JobId: " .. game.JobId)
    -- Có thể thêm logic như kiểm tra người chơi, gửi thông báo, v.v.
end

-- Thực thi với xử lý lỗi
local success, error = pcall(function()
    serverHop()
end)
if not success then
    warn("Lỗi khi chạy server hop: " .. error)
end

-- Xử lý trạng thái teleport
Players.LocalPlayer.OnTeleport:Connect(function(teleportState)
    if teleportState == Enum.TeleportState.Failed then
        print("Teleport thất bại, thử lại sau 1 giây...")
        wait(1)
        serverHop()
    elseif teleportState == Enum.TeleportState.InGame then
        -- Khi đã vào server thành công
        onServerJoined()
    end
end)
