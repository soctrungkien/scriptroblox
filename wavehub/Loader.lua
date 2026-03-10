repeat wait() until game:IsLoaded()

print([[67]])

local _ENV = (getgenv or getrenv)()
local PlaceId = game.PlaceId

local function Loadstring(httpurl) 
_ENV.loadername = loadername
loadstring(game:HttpGet(httpurl, true))(loadername, PlaceId, scriptName) 
end

if scriptName == nil then
scripts = {
    [70743305607680] = "wavehub/BuildBlox",  -- BuildBlox
    [127742093697776] = "wavehub/PvB",       -- Plants Vs Brainrots
    [85896571713843] = "wavehub/BubbleGumSimulator", -- BubbleGumSimulator
    [87067157937644] = "wavehub/blocc", --blocc (idk)
    [124398083342642] = "wavehub/rideacartdownaslide", --rideacartdownaslide
}
end

local scriptName = scripts[PlaceId] or "wavehub/Universal"
local url = "https://raw.githubusercontent.com/soctrungkien/scriptroblox/refs/heads/main/" .. scriptName .. ".lua"

_ENV.scriptName = nil

local success, result = pcall(function()
    return Loadstring(url)
end)

if not success then
    warn("[ " .. loadername .. " ] Failed to load script:", result)
end
