local targetUserIds = {
    [5219564843] = true
}

local Notify = "Bạn đã bị ban vĩnh viễn "

if targetUserIds[game:GetService("Players").LocalPlayer.UserId] then
    game:GetService("Players").LocalPlayer:Kick(Notify)
end
