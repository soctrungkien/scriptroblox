repeat wait() until game:IsLoaded()

--print("ty bro đã chạy script ^_^") 

--print([[67]])

local _ENV = (getgenv or getrenv)()
local PlaceId = game.PlaceId

local function Loadstring(httpurl) 
loadstring(game:HttpGet(httpurl, true))(loadername, PlaceId, scriptName) 
end

scripts = {
    [70743305607680] = "abcdef/BuildBlox",  -- BuildBlox
    [127742093697776] = "abcdef/PvB",       -- Plants Vs Brainrots
    [85896571713843] = "abcdef/BubbleGumSimulator", -- BubbleGumSimulator
    [87067157937644] = "abcdef/blocc", --blocc (idk)
    [124398083342642] = "abcdef/rideacartdownaslide", --rideacartdownaslide
    [108180976346281] = "abcdef/crosstheroad", --crosstheroad
    [112555408629538] = "abcdef/lowcortisolobby", --lowcortisolobby
}

if scriptName == "abcdef/Loader" then
    warn("nah bro is loop")
    _ENV.scriptName = nil
    return
end

local scriptName = scriptName or scripts[PlaceId] or "abcdef/Universal"
local url = "https://raw.githubusercontent.com/soctrungkien/scriptroblox/refs/heads/main/" .. scriptName .. ".lua"

--print("Loader " .. scriptName)

task.spawn(function()
local success, result = pcall(function()
    return Loadstring(url)
end)

if not success then
    warn("[ " .. loadername .. " ] Failed to load script:", result)
end
end)
