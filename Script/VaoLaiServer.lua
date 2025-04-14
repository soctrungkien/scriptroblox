local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")

local player = Players.LocalPlayer
local placeId = game.PlaceId
local jobId = game.JobId

TeleportService:TeleportToPlaceInstance(placeId, jobId, player)
