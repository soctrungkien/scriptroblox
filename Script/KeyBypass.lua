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
    game.Players.LocalPlayer:Kick("Lỗi bảo mật. Tự động vào lại sau 3s nếu có thể.")
    wait(3)
    loadstring(game:HttpGet(targetScript))()
    print("recheck") -- Thông báo khi hoàn tất
else
    print("Bạn rất liêm") -- Thông báo khi không chạy
end
