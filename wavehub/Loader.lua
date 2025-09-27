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
    [2753915549] = "Universal.lua", -- Blox Fruits
    [4442272183] = "Universal.lua", --sea 2 
    [7449423635] = "Universal.lua", --sea 3 
    [126884695634066] = "Universal.lua", -- Trồng một khu vườn
    [70743305607680] = "BuildBlox.lua",  -- BuildBlox
    [127742093697776] = "PvB.lua",       -- Plants Vs Brainrots
    [85896571713843] = "BubbleGumSimulator.lua" -- BubbleGumSimulator
}

local scriptName = scripts[PlaceId] or "Universal.lua"
local url = "https://raw.githubusercontent.com/soctrungkien/scriptroblox/refs/heads/main/wavehub/" .. scriptName 

local success, result = pcall(function()
    return loadstring(game:HttpGet(url))()
end)

if not success then
    warn("[wavehub/Loader.lua] Failed to load script:", result)
end
