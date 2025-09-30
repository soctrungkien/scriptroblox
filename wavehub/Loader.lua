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

local _ENV = (getgenv or getrenv or getfenv)()
local BETA_VERSION = BETA_VERSION or _ENV.BETA_VERSION
local PlaceId = game.PlaceId

local scripts = {
    [2753915549] = "Universal", -- Blox Fruits
    [4442272183] = "Universal", --sea 2 
    [7449423635] = "Universal", --sea 3 
    [126884695634066] = "Universal", -- Trồng một khu vườn
    [70743305607680] = "BuildBlox",  -- BuildBlox
    [127742093697776] = "PvB",       -- Plants Vs Brainrots
    [85896571713843] = "BubbleGumSimulator" -- BubbleGumSimulator
    [87067157937644] = "blocc" --blocc (idk)
}

local scriptName = scripts[PlaceId] or "Universal"
local url = "https://raw.githubusercontent.com/soctrungkien/scriptroblox/refs/heads/main/wavehub/" .. scriptName .. ".lua"

local success, result = pcall(function()
    return loadstring(game:HttpGet(url))()
end)

if not success then
    warn("[wavehub/Loader.lua] Failed to load script:", result)
end
