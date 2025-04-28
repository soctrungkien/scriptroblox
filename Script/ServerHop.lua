local Player = game.Players.LocalPlayer
local Http = game:GetService("HttpService")
local TPS = game:GetService("TeleportService")
local Api = "https://games.roblox.com/v1/games/"

local _place = game.PlaceId
local _servers = Api .. _place .. "/servers/Public?sortOrder=Asc&limit=10"
local time_to_wait = 1 -- seconds

-- Hàm lấy danh sách server
function ListServers(cursor)
    local success, result = pcall(function()
        local Raw = game:HttpGet(_servers .. ((cursor and "&cursor=" .. cursor) or ""))
        return Http:JSONDecode(Raw)
    end)
    if success then
        return result
    else
        warn("Failed to fetch servers: " .. tostring(result))
        return nil
    end
end

-- Hàm dịch chuyển bằng đoạn mã cũ
function TryTeleportToLowPlayerServer()
    local Servers = ListServers()
    if Servers and Servers.data and #Servers.data > 0 then
        local Server = Servers.data[math.random(1, #Servers.data)]
        if Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
            Player.Character.HumanoidRootPart.Anchored = true
        end
        local success, errorMessage = pcall(function()
            TPS:TeleportToPlaceInstance(_place, Server.id, Player)
        end)
        return success, errorMessage
    end
    return false, "No servers available"
end

-- Hàm dịch chuyển bằng đoạn mã mới (dự phòng)
function FallbackTeleport()
    if Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
        Player.Character.HumanoidRootPart.Anchored = true
    end
    local success, errorMessage = pcall(function()
        TPS:Teleport(_place, Player)
    end)
    if not success then
        warn("Fallback teleport failed: " .. tostring(errorMessage))
    end
end

-- Vòng lặp chính
while wait(time_to_wait) do
    local success, errorMessage = TryTeleportToLowPlayerServer()
    if not success then
        warn("Original teleport failed: " .. tostring(errorMessage))
        warn("Switching to fallback teleport...")
        FallbackTeleport()
    end
end
