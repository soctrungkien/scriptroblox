local menuURL = "https://raw.githubusercontent.com/soctrungkien/scriptroblox/refs/heads/main/Menu.lua"
local targetScript = "https://raw.githubusercontent.com/soctrungkien/scriptroblox/refs/heads/main/Script/VaoLaiServer.lua"

local function checkKeySystem()
    local success, content = pcall(function()
        return game:HttpGet(menuURL)
    end)
    if success then
        return not content:find("KeySystem%s*=%s*true")
    end
    return false
end

if checkKeySystem() then
    loadstring(game:HttpGet(targetScript))()
end
