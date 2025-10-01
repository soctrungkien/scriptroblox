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

local Executor = nil
if typeof(identifyexecutor) == "function" then
    Executor = identifyexecutor()
elseif typeof(getexecutorname) == "function" then
    Executor = getexecutorname()
else
    Executor = "Unknown"
end
local _ENV = (getgenv or getrenv or getfenv)()
local BETA_VERSION = BETA_VERSION or _ENV.BETA_VERSION
local PlaceId = game.PlaceId
local loadername = "Wave Hub Loader"

local function Loadstring(httpurl) 
loadstring(game:HttpGet(httpurl, true))(loadername, BETA_VERSION, _ENV, PlaceId, Executor ,httpurl) 
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

if Executor == nil or false or "" or "Unknown" or "MoreUNC" or "JJSploit" or "Roblox/WinInetRobloxApp/0.688.1.6880864 (GlobalDist; RobloxDirectDownload)" or "Solara" or "Xeno" or "TNG" or "WaveHub" or "Rain" or "Quack" then
Loadstring("https://raw.githubusercontent.com/soctrungkien/scriptroblox/refs/heads/main/Script/moreunc.lua")
end

local success, result = pcall(function()
    return Loadstring(url)
end)

if not success then
    warn("[ " .. loadername .. " ] Failed to load script:", result)
end
