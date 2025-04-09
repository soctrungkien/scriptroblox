local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local placeId = game.PlaceId

-- Hàm chạy sau khi vào server
local function onServerJoined()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/soctrungkien/scriptroblox/refs/heads/main/Menu.lua"))()
    print("Đã vào server thành công!")
    -- Thêm mã bạn muốn chạy sau khi vào server ở đây
    wait(2) -- Đợi 2 giây để đảm bảo server ổn định
    print("Chào mừng bạn đến với server!")
    -- Ví dụ: Tự động rejoin lại server khác nếu cần
    -- TeleportService:Teleport(placeId, player)
end

-- Đợi nhân vật của người chơi tải xong
local function waitForCharacter()
    if not player.Character then
        player.CharacterAdded:Wait()
    end
    return player.Character
end

-- Chờ game tải xong và nhân vật xuất hiện, rồi chạy script
game.Loaded:Wait() -- Đợi game tải hoàn tất
waitForCharacter() -- Đợi nhân vật xuất hiện
onServerJoined() -- Chạy script sau khi vào server

-- Xử lý teleport (nếu cần rejoin sau này)
player.OnTeleport:Connect(function(teleportState)
    if teleportState == Enum.TeleportState.Failed then
        wait(0.002)
        TeleportService:Teleport(placeId, player)
    end
end)
