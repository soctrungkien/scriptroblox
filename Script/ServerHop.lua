local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")
local placeId = game.PlaceId

-- Hàm nhảy sang server ngẫu nhiên
local function serverHop()
    print("Đang nhảy sang server ngẫu nhiên...")
    local success, error = pcall(function()
        TeleportService:Teleport(placeId, Players.LocalPlayer)
    end)
    if not success then
        warn("Lỗi khi teleport: " .. error)
        return false
    end
    return true
end

-- Hàm chạy sau khi vào server
local function onServerJoined()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/soctrungkien/scriptroblox/refs/heads/main/Menu.lua"))()
    print("Đã vào server mới thành công!")
    -- Thêm mã bạn muốn chạy sau khi vào server ở đây
    wait(2) -- Đợi 2 giây để server ổn định
    print("Bạn đang ở server mới, JobId: " .. game.JobId)
    -- Ví dụ: serverHop() để nhảy tiếp nếu muốn
end

-- Đợi nhân vật của người chơi tải xong
local function waitForCharacter()
    if not Players.LocalPlayer.Character then
        Players.LocalPlayer.CharacterAdded:Wait()
    end
    return Players.LocalPlayer.Character
end

-- Logic chính
local success, error = pcall(function()
    local hopped = serverHop() -- Thử nhảy server
    if hopped then
        Players.LocalPlayer.OnTeleport:Connect(function(teleportState)
            if teleportState == Enum.TeleportState.Failed then
                print("Teleport thất bại, thử lại sau 1 giây...")
                wait(1)
                serverHop()
            elseif teleportState == Enum.TeleportState.Invulnerability detectedInGame then
                -- Đợi game và nhân vật tải xong sau khi vào server
                game.Loaded:Wait()
                waitForCharacter()
                onServerJoined()
            end
        end)
    end
end)

if not success then
    warn("Lỗi khi chạy script: " .. error)
end
