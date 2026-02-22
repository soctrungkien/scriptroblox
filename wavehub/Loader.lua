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

local _ENV = (getgenv or getrenv)()
local PlaceId = game.PlaceId

local function Loadstring(httpurl) 
_ENV.loadername = loadername
loadstring(game:HttpGet(httpurl, true))(loadername, PlaceId, scriptName) 
end

if scriptName == nil then
local scripts = {
--  [2753915549] = "wavehub/Universal", -- Blox Fruits
--  [4442272183] = "wavehub/Universal", --sea 2 
--  [7449423635] = "wavehub/Universal", --sea 3 
--  [126884695634066] = "wavehub/Universal", -- Trồng một khu vườn
    [70743305607680] = "wavehub/BuildBlox",  -- BuildBlox
    [127742093697776] = "wavehub/PvB",       -- Plants Vs Brainrots
    [85896571713843] = "wavehub/BubbleGumSimulator", -- BubbleGumSimulator
    [87067157937644] = "wavehub/blocc", --blocc (idk)
    [124398083342642] = "wavehub/rideacartdownaslide", --rideacartdownaslide
}
end

local scriptName = scripts[PlaceId] or "Universal"
local url = "https://raw.githubusercontent.com/soctrungkien/scriptroblox/refs/heads/main/" .. scriptName .. ".lua"

local success, result = pcall(function()
    return Loadstring(url)
end)

if not success then
    warn("[ " .. loadername .. " ] Failed to load script:", result)
end
