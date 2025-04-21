
-- Phiên bản nâng cao với thêm tùy chỉnh
local StarterGui = game:GetService("StarterGui")

local function showNotification(title, message, duration, icon)
    StarterGui:SetCore("SendNotification", {
        Title = title,
        Text = message,
        Duration = duration or 3,
        Icon = icon or "" -- Có thể thêm asset ID của hình ảnh
    })
end

-- Ví dụ sử dụng
showNotification(
    "ClickTP", 
    "⟦CTRL+Click⟧", 
    3, 
    "rbxassetid://81249639738070" -- Thay bằng ID hình ảnh thực tế nếu muốn
)

--[[
© 2021 WeAreDevs
A distribution of https://wearedevs.net/scripts
Created August 2, 2021

Directions: 
1. Inject this script into any game using a Lua injector like JJSploit. 
2. Press left ctrl + click to where you want to teleport
Re-execute the script to toggle click teleport
]]

--Makes sure this script is only executed once
if _G.WRDClickTeleport == nil then
	_G.WRDClickTeleport = true
	
	local player = game:GetService("Players").LocalPlayer
	local UserInputService = game:GetService("UserInputService")
	 --Wanted to avoid using mouse instance, but UIS^ is very tedious to get mouse hit position
	local mouse = player:GetMouse()

	--Waits until the player's mouse is found
	repeat wait() until mouse
	
	UserInputService.InputBegan:Connect(function(input, gameProcessed)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			--Only click teleport if the toggle is enabled
			if _G.WRDClickTeleport and UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
				player.Character:MoveTo(Vector3.new(mouse.Hit.x, mouse.Hit.y, mouse.Hit.z)) 
			end
		end
	end)
--Just toggle instead of re-executing the script
else
	_G.WRDClickTeleport = not _G.WRDClickTeleport
	--Notify
	if _G.WRDClickTeleport then
		game.StarterGui:SetCore("SendNotification", {Title="WeAreDevs.net"; Text="Click teleport enabled"; Duration=5;})
	else
		game.StarterGui:SetCore("SendNotification", {Title="WeAreDevs.net"; Text="Click teleport disabled"; Duration=5;})
	end
end
