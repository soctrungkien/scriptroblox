local AllIDs = {}
local foundAnything = ""
local actualHour = os.date("!*t").hour
local Deleted = false
local S_T = game:GetService("TeleportService")
local S_H = game:GetService("HttpService")

local File = pcall(function()
    AllIDs = S_H:JSONDecode(readfile("server-hop-temp.json"))
end)
if not File then
    table.insert(AllIDs, actualHour)
    pcall(function()
        writefile("server-hop-temp.json", S_H:JSONEncode(AllIDs))
    end)
end

-- Function to run after joining new server
local function OnServerJoin()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/soctrungkien/scriptroblox/refs/heads/main/Menu.lua"))()
    -- Add your custom script here that you want to run when joining a new server
    spawn(function()
            
        -- Example: Print a message
        print("Successfully joined new server!")
        
        -- You can add more code here that you want to execute
        -- For example:
        -- game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 32
        -- or any other script you want to run
    end)
end

local function TPReturner(placeId)
    local Site;
    if foundAnything == "" then
        Site = S_H:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. placeId .. '/servers/Public?sortOrder=Asc&limit=100'))
    else
        Site = S_H:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. placeId .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
    end
    local ID = ""
    if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
        foundAnything = Site.nextPageCursor
    end
    local num = 0;
    for i,v in pairs(Site.data) do
        local Possible = true
        ID = tostring(v.id)
        if tonumber(v.maxPlayers) > tonumber(v.playing) then
            for _,Existing in pairs(AllIDs) do
                if num ~= 0 then
                    if ID == tostring(Existing) then
                        Possible = false
                    end
                else
                    if tonumber(actualHour) ~= tonumber(Existing) then
                        local delFile = pcall(function()
                            delfile("server-hop-temp.json")
                            AllIDs = {}
                            table.insert(AllIDs, actualHour)
                        end)
                    end
                end
                num = num + 1
            end
            if Possible == true then
                table.insert(AllIDs, ID)
                wait()
                pcall(function()
                    writefile("server-hop-temp.json", S_H:JSONEncode(AllIDs))
                    wait()
                    -- Connect the teleport event
                    local teleportConnection
                    teleportConnection = S_T.TeleportInitFailed:Connect(function(player, teleportResult, errorMessage)
                        teleportConnection:Disconnect()
                        print("Teleport failed: " .. errorMessage)
                    end)
                    
                    -- Teleport and setup success handler
                    local success, error = pcall(function()
                        S_T:TeleportToPlaceInstance(placeId, ID, game.Players.LocalPlayer)
                    end)
                    
                    if success then
                        -- Connect to character added event to run script after joining
                        local player = game.Players.LocalPlayer
                        local charConnection
                        charConnection = player.CharacterAdded:Connect(function()
                            OnServerJoin()
                            charConnection:Disconnect()
                        end)
                    end
                end)
                wait(4)
            end
        end
    end
end

local module = {}
function module:Teleport(placeId)
    while wait() do
        pcall(function()
            TPReturner(placeId)
            if foundAnything ~= "" then
                TPReturner(placeId)
            end
        end)
    end
end

return module
