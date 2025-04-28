--// Cache

local getgenv, getnamecallmethod, hookmetamethod, hookfunction, newcclosure, checkcaller, lower, gsub, match = getgenv, getnamecallmethod, hookmetamethod, hookfunction, newcclosure, checkcaller, string.lower, string.gsub, string.match
local getrawmetatable, setreadonly = getrawmetatable, setreadonly or fullaccess or make_writeable

--// Loaded check

if getgenv().Combined_AntiKick then
    return
end

--// Variables

local cloneref = cloneref or function(...) 
    return ...
end

local clonefunction = clonefunction or function(...)
    return ...
end

local Players, LocalPlayer, StarterGui = cloneref(game:GetService("Players")), cloneref(game:GetService("Players").LocalPlayer), cloneref(game:GetService("StarterGui"))

local SetCore = clonefunction(StarterGui.SetCore)
local FindFirstChild = clonefunction(game.FindFirstChild)

local CompareInstances = (CompareInstances and function(Instance1, Instance2)
        if typeof(Instance1) == "Instance" and typeof(Instance2) == "Instance" then
            return CompareInstances(Instance1, Instance2)
        end
    end)
or
function(Instance1, Instance2)
    return (typeof(Instance1) == "Instance" and typeof(Instance2) == "Instance")
end

local CanCastToSTDString = function(...)
    return pcall(FindFirstChild, game, ...)
end

--// Format arguments for remote spying

local function formatargs(getArgs, v)
    if #getArgs == 0 then 
        return "" 
    end
    
    local collectArgs = {}
    for k, v in next, getArgs do
        local argument = ""
        if type(v) == "string" then
            argument = "\"" .. v .. "\""
        elseif type(v) == "table" then
            argument = "{" .. formatargs(v, true) .. "}"
        else
            argument = tostring(v)
        end
        if v and type(k) ~= "number" then
            table.insert(collectArgs, k .. "=" .. argument)
        else
            table.insert(collectArgs, argument)
        end
    end
    return table.concat(collectArgs, ", ")
end

--// Global Variables

getgenv().Combined_AntiKick = {
    Enabled = true, -- Set to false to disable Anti-Kick and Remote Blocking.
    SendNotifications = true, -- Set to true to get Roblox UI notifications.
    CheckCaller = true, -- Set to true to disable kicking by other user-executed scripts.
    AntiRemotes = false, -- Set to true to block all non-whitelisted remotes.
    SpyingRemotes = false, -- Set to true to log remote calls.
    BlockedRemotes = {}, -- List of remote names to block (e.g., {"RemoteName1", "RemoteName2"}).
    WhitelistedRemotes = { -- Remotes allowed to bypass blocking.
        "CharacterSoundEvent",
        "SayMessageRequest",
        "AddCharacterLoadedEvent",
        "RemoveCharacterEvent",
        "DefaultServerSoundEvent"
    }
}

--// Main

local kicknum = 0

-- Additional Kick Hook
local kickHook = nil
kickHook = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
    if tostring(getnamecallmethod()) == "Kick" and getgenv().Combined_AntiKick.Enabled then
        kicknum = kicknum + 1
        if getgenv().Combined_AntiKick.SendNotifications then
            SetCore(StarterGui, "SendNotification", {
                Title = "Combined Anti-Kick",
                Text = "Blocked kick attempt " .. kicknum .. " (via kickHook)",
                Icon = "rbxassetid://6238540373",
                Duration = 2
            })
        end
        warn("Blocked client-kick attempt " .. kicknum .. " (via kickHook)")
        return wait(9e9) -- Delay indefinitely to block the kick
    end
    return kickHook(self, ...)
end))

-- Hook __namecall via getrawmetatable
if getrawmetatable then
    local game_meta = getrawmetatable(game)
    local game_namecall = game_meta.__namecall
    pcall(setreadonly, game_meta, false)
    
    game_meta.__namecall = function(out, ...)
        local args = {...}
        local Method = args[#args]
        args[#args] = nil
        
        if getgenv().Combined_AntiKick.Enabled then
            -- Block Kick
            if Method == "Kick" and CompareInstances(out, LocalPlayer) and ((getgenv().Combined_AntiKick.CheckCaller and not checkcaller()) or true) then
                kicknum = kicknum + 1
                if getgenv().Combined_AntiKick.SendNotifications then
                    SetCore(StarterGui, "SendNotification", {
                        Title = "Combined Anti-Kick",
                        Text = "Blocked client-kick attempt " .. kicknum,
                        Icon = "rbxassetid://6238540373",
                        Duration = 2
                    })
                end
                warn("Blocked client-kick attempt " .. kicknum)
                return
            end
            
            -- Block or Spy Remotes
            if (Method == "FireServer" or Method == "InvokeServer") and out.Parent ~= game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents then
                if getgenv().Combined_AntiKick.AntiRemotes then
                    if not table.find(getgenv().Combined_AntiKick.WhitelistedRemotes, out.Name) then
                        if getgenv().Combined_AntiKick.SendNotifications then
                            SetCore(StarterGui, "SendNotification", {
                                Title = "Combined Anti-Kick",
                                Text = "Blocked remote: " .. out.Name,
                                Icon = "rbxassetid://6238540373",
                                Duration = 2
                            })
                        end
                        warn("Blocked remote: " .. out.Name .. " // Method: " .. Method)
                        return
                    end
                elseif #getgenv().Combined_AntiKick.BlockedRemotes > 0 then
                    if table.find(getgenv().Combined_AntiKick.BlockedRemotes, out.Name) then
                        if getgenv().Combined_AntiKick.SendNotifications then
                            SetCore(StarterGui, "SendNotification", {
                                Title = "Combined Anti-Kick",
                                Text = "Blocked remote: " .. out.Name,
                                Icon = "rbxassetid://6238540373",
                                Duration = 2
                            })
                        end
                        warn("Blocked remote: " .. out.Name .. " // Method: " .. Method)
                        return
                    end
                end
                
                if getgenv().Combined_AntiKick.SpyingRemotes and not table.find(getgenv().Combined_AntiKick.WhitelistedRemotes, out.Name) then
                    local arguments = {}
                    for i = 1, #args do
                        arguments[i] = args[i]
                    end
                    local getScript = getfenv(2).script or "??? (Not Found) ???"
                    warn("<> <> <> A " .. out.ClassName .. " has been fired! How to fire:\ngame." .. out:GetFullName() .. ":" .. Method .. "(" .. formatargs(arguments) .. ")\n\nFired from script: " .. tostring(getScript:GetFullName()))
                end
            end
        end
        
        return game_namecall(out, ...)
    end
end

-- Hook __namecall via hookmetamethod
local OldNamecall; OldNamecall = hookmetamethod(game, "__namecall", newcclosure(function(...)
    local self, message = ...
    local method = getnamecallmethod()
    
    if getgenv().Combined_AntiKick.Enabled and ((getgenv().Combined_AntiKick.CheckCaller and not checkcaller()) or true) and CompareInstances(self, LocalPlayer) and gsub(method, "^%l", string.upper) == "Kick" then
        if CanCastToSTDString(message) then
            kicknum = kicknum + 1
            if getgenv().Combined_AntiKick.SendNotifications then
                SetCore(StarterGui, "SendNotification", {
                    Title = "Combined Anti-Kick",
                    Text = "Successfully intercepted kick attempt " .. kicknum,
                    Icon = "rbxassetid://6238540373",
                    Duration = 2
                })
            end
            warn("Blocked client-kick attempt " .. kicknum)
            return
        end
    end
    
    return OldNamecall(...)
end))

-- Hook Player:Kick
local OldFunction; OldFunction = hookfunction(LocalPlayer.Kick, function(...)
    local self, Message = ...
    
    if getgenv().Combined_AntiKick.Enabled and ((getgenv().Combined_AntiKick.CheckCaller and not checkcaller()) or true) and CompareInstances(self, LocalPlayer) then
        if CanCastToSTDString(Message) then
            kicknum = kicknum + 1
            if getgenv().Combined_AntiKick.SendNotifications then
                SetCore(StarterGui, "SendNotification", {
                    Title = "Combined Anti-Kick",
                    Text = "Successfully intercepted kick attempt " .. kicknum,
                    Icon = "rbxassetid://6238540373",
                    Duration = 2
                })
            end
            warn("Blocked client-kick attempt " .. kicknum)
            return
        end
    end
end)

-- Initialization Notification
if getgenv().Combined_AntiKick.SendNotifications then
    StarterGui:SetCore("SendNotification", {
        Title = "Combined Anti-Kick",
        Text = "Anti-Kick and Remote Protection loaded with enhanced kick hook!",
        Icon = "rbxassetid://6238537240",
        Duration = 3
    })
end
