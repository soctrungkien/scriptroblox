repeat wait() until game:IsLoaded()

print([[
 ___       __   ________  ___      ___ _______   ___  ___  ___  ___  ________     
|\  \     |\  \|\   __  \|\  \    /  /|\  ___ \ |\  \|\  \|\  \|\  \|\   __  \    
\ \  \    \ \  \ \  \|\  \ \  \  /  / | \   __/|\ \  \\\  \ \  \\\  \ \  \|\ /_   
 \ \  \  __\ \  \ \   __  \ \  \/  / / \ \  \_|/_\ \   __  \ \  \\\  \ \   __  \  
  \ \  \|\__\_\  \ \  \ \  \ \    / /   \ \  \_|\ \ \  \ \  \ \  \\\  \ \  \|\  \ 
   \ \____________\ \__\ \__\ \__/ /     \ \_______\ \__\ \__\ \_______\ \_______\
    \|____________|\|__|\|__|\|__|/       \|_______|\|__|\|__|\|_______|\|_______|
]])

local Executor = identifyexecutor() or getexecutorname()
local _ENV = (getgenv or getrenv or getfenv)()
local BETA_VERSION = BETA_VERSION or _ENV.BETA_VERSION
local PlaceId = game.PlaceId
local loadername = "Wave Hub Loader"

local function Loadstring(httpurl)
    local ok, content = pcall(game.HttpGet, game, httpurl, true)
    if not ok then
        warn("[ " .. loadername .. " ] HttpGet failed:", content)
        return false, content
    end
    if not content or content == "" then
        warn("[ " .. loadername .. " ] Empty response)
        return false, "empty response"
    end

    local fn, loadErr = loadstring(content)
    if not fn then
        warn("[ " .. loadername .. " ] loadstring error:", loadErr)
        return false, loadErr
    end

    local success, runErr = pcall(fn, loadername, BETA_VERSION, _ENV, PlaceId, Executor, httpUrl)
    if not success then
        warn("[ " .. loadername .. " ] Script runtime error:", runErr)
        return false, runErr
    end

    return true, nil
end

local scripts = {
    [2753915549] = "Universal", -- Blox Fruits
    [4442272183] = "Universal", --sea 2 
    [7449423635] = "Universal", --sea 3 
    [126884695634066] = "Universal", -- Trồng một khu vườn
    [70743305607680] = "BuildBlox",  -- BuildBlox
    [127742093697776] = "PvB",       -- Plants Vs Brainrots
    [85896571713843] = "BubbleGumSimulator", -- BubbleGumSimulator
    [87067157937644] = "blocc", --blocc (idk)
}

local scriptName = scripts[PlaceId] or "Universal"
local url = "https://raw.githubusercontent.com/soctrungkien/scriptroblox/refs/heads/main/wavehub/" .. scriptName .. ".lua"

if Executor == nil or false or "" or "Unknown" or "MoreUNC" or "JJSploit" or "Roblox/WinInetRobloxApp/0.688.1.6880864 (GlobalDist; RobloxDirectDownload)" or "Solara" or "Xeno" or "TNG" or "WaveHub" or "Rain" or "Quack"
Loadstring("https://raw.githubusercontent.com/soctrungkien/scriptroblox/refs/heads/main/Script/moreunc.lua")
end

local success, result = pcall(function()
    return Loadstring(url)
end)

if not success then
    warn("[ " .. loadername .. " ] Failed to load script:", result)
end
