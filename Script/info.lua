local player = game:GetService("Players").LocalPlayer

local placeId = game.PlaceId
local gameId = game.GameId
local userId = player.UserId
local jobId = game.JobId
local ver = game.PlaceVersion

-- Tạo thông tin
local info = ""
info = info .. "ㅤ\n"
info = info .. "ㅤ\n"
info = info .. "ㅤ────────────────────────────\n"
info = info .. "ㅤ\n"
info = info .. "ㅤ📌 INFO\n"
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
info = info .. "ㅤ🕹️ Version   : " .. ver .. "\n"
info = info .. "ㅤ\n"
info = info .. "ㅤ────────────────────────────"
info = info .. "ㅤ\n"

-- In ra Dev Console
print(info)


