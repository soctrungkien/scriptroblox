repeat wait() until game:IsLoaded()
local PlaceId = game.PlaceId
if PlaceId == 2753915549 or PlaceId == 4442272183 or PlaceId == 7449423635 then
    --chưa làm
elseif PlaceId == 126884695634066 then
    --cũng chưa luôn
else
elseif PlaceId == 85896571713843 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/soctrungkien/scriptroblox/refs/heads/main/wavehub/BubbleGumSimulator.lua"))()
else
    loadstring(game:HttpGet("https://raw.githubusercontent.com/soctrungkien/scriptroblox/refs/heads/main/wavehub/Universal.lua"))()
end
