local Player = game.Players.LocalPlayer
local Http = game:GetService("HttpService")
local TPS = game:GetService("TeleportService")
local StatsService = game:GetService("Stats")
local PlaceID = game.PlaceId
local time_to_wait = 1 -- seconds (dùng cho đoạn mã 2 và tổng thể)

-- Đoạn mã 1: Tránh server đã truy cập, lấy tối đa 100 server
local AllIDs = {}
local foundAnything = ""
local actualHour = os.date("!*t").hour
local Deleted = false
local File = pcall(function()
    AllIDs = Http:JSONDecode(readfile("NotSameServers.json"))
end)
if not File then
    table.insert(AllIDs, actualHour)
    writefile("NotSameServers.json", Http:JSONEncode(AllIDs))
end

function TPReturner()
    local Site
    local success, result = pcall(function()
        if foundAnything == "" then
            return Http:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
        else
            return Http:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
        end
    end)
    if not success then
        warn("TPReturner failed: " .. tostring(result))
        return false
    end
    Site = result
    local ID = ""
    if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
        foundAnything = Site.nextPageCursor
    end
    local num = 0
    for i, v in pairs(Site.data) do
        local Possible = true
        ID = tostring(v.id)
        if tonumber(v.maxPlayers) > tonumber(v.playing) then
            for _, Existing in pairs(AllIDs) do
                if num ~= 0 then
                    if ID == tostring(Existing) then
                        Possible = false
                    end
                else
                    if tonumber(actualHour) ~= tonumber(Existing) then
                        local delFile = pcall(function()
                            delfile("NotSameServers.json")
                            AllIDs = {}
                            table.insert(AllIDs, actualHour)
                        end)
                    end
                end
                num = num + 1
            end
            if Possible then
                table.insert(AllIDs, ID)
                local success, errorMessage = pcall(function()
                    writefile("NotSameServers.json", Http:JSONEncode(AllIDs))
                    if Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
                        Player.Character.HumanoidRootPart.Anchored = true
                    end
                    TPS:TeleportToPlaceInstance(PlaceID, ID, Player)
                end)
                if success then
                    wait(4)
                    return true
                else
                    warn("Teleport in TPReturner failed: " .. tostring(errorMessage))
                    return false
                end
            end
        end
    end
    return false
end

function TryTeleport1()
    local success, result = pcall(function()
        TPReturner()
        if foundAnything ~= "" then
            TPReturner()
        end
    end)
    if success and result then
        return true
    else
        warn("Teleport 1 failed: " .. tostring(result))
        return false
    end
end

-- Đoạn mã 2: Chọn ngẫu nhiên từ 10 server ít người chơi
local Api = "https://games.roblox.com/v1/games/"
local _servers = Api .. PlaceID .. "/servers/Public?sortOrder=Asc&limit=10"

function ListServers(cursor)
    local success, result = pcall(function()
        local Raw = game:HttpGet(_servers .. ((cursor and "&cursor=" .. cursor) or ""))
        return Http:JSONDecode(Raw)
    end)
    if success then
        return result
    else
        warn("ListServers failed: " .. tostring(result))
        return nil
    end
end

function TryTeleport2()
    local Servers = ListServers()
    if Servers and Servers.data and #Servers.data > 0 then
        local Server = Servers.data[math.random(1, #Servers.data)]
        local success, errorMessage = pcall(function()
            if Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
                Player.Character.HumanoidRootPart.Anchored = true
            end
            TPS:TeleportToPlaceInstance(PlaceID, Server.id, Player)
        end)
        if success then
            return true
        else
            warn("Teleport 2 failed: " .. tostring(errorMessage))
            return false
        end
    end
    warn("Teleport 2 failed: No servers available")
    return false
end

-- Script mới: Chọn server có ping thấp nhất
function fetchServersData(placeId, limit)
    local url = string.format("https://games.roblox.com/v1/games/%d/servers/Public?limit=%d", placeId, limit)
    local success, response = pcall(function()
        return Http:JSONDecode(game:HttpGet(url))
    end)
    if success and response and response.data then
        return response.data
    end
    warn("fetchServersData failed: " .. tostring(response))
    return nil
end

function TryTeleportNew()
    local serverLimit = 100
    local servers = fetchServersData(PlaceID, serverLimit)
    if not servers then
        return false
    end
    local lowestPingServer = servers[1]
    for _, server in pairs(servers) do
        if server["ping"] and lowestPingServer["ping"] and server["ping"] < lowestPingServer["ping"] then
            lowestPingServer = server
        end
    end
    local commonLoadTime = 5
    task.wait(commonLoadTime)
    local pingThreshold = 100
    local success, pingValue = pcall(function()
        local serverStats = StatsService.Network.ServerStatsItem
        local dataPing = serverStats["Data Ping"]:GetValueString()
        return tonumber(dataPing:match("(%d+)"))
    end)
    if not success or not pingValue then
        warn("Failed to get ping value: " .. tostring(pingValue))
        return false
    end
    if pingValue >= pingThreshold then
        local teleportSuccess, errorMessage = pcall(function()
            if Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
                Player.Character.HumanoidRootPart.Anchored = true
            end
            TPS:TeleportToPlaceInstance(PlaceID, lowestPingServer.id, Player)
        end)
        if teleportSuccess then
            return true
        else
            warn("Teleport new failed: " .. tostring(errorMessage))
            return false
        end
    end
    return false -- Không dịch chuyển nếu ping hiện tại tốt
end

-- Đoạn mã 3: Dịch chuyển ngẫu nhiên không kiểm soát server
function TryTeleport3()
    local success, errorMessage = pcall(function()
        if Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
            Player.Character.HumanoidRootPart.Anchored = true
        end
        TPS:Teleport(PlaceID, Player)
    end)
    if success then
        return true
    else
        warn("Teleport 3 failed: " .. tostring(errorMessage))
        return false
    end
end

-- Vòng lặp chính
while wait(time_to_wait) do
    if not TryTeleport1() then
        warn("Switching to Teleport 2...")
        if not TryTeleport2() then
            warn("Switching to Teleport New...")
            if not TryTeleportNew() then
                warn("Switching to Teleport 3...")
                TryTeleport3()
            end
        end
    end
end
