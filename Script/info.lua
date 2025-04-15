local player = game:GetService("Players").LocalPlayer

local placeId = game.PlaceId
local gameId = game.GameId
local userId = player.UserId
local jobId = game.JobId

-- Tạo thông tin
local info = ""
info = info .. "ㅤ\n"
info = info .. "ㅤ\n"
info = info .. "ㅤ────────────────────────────\n"
info = info .. "ㅤ\n"
info = info .. "ㅤ📌 THÔNG TIN GAME HIỆN TẠI\n"
info = info .. "ㅤ\n"
info = info .. "ㅤ────────────────────────────\n"
info = info .. "ㅤ\n"
info = info .. "ㅤ🏡 PlaceId   : " .. placeId .. "\n"
info = info .. "ㅤ\n"
info = info .. "ㅤ🎮 GameId    : " .. gameId .. "\n"
info = info .. "ㅤ\n"
info = info .. "ㅤ👤 UserId    : " .. userId .. "\n"
info = info .. "ㅤ\n"
info = info .. "ㅤ️💻 JobId     : " .. jobId .. "\n"
info = info .. "ㅤ\n"
info = info .. "ㅤ────────────────────────────"
info = info .. "ㅤ\n"

-- In ra Dev Console
print(info)


