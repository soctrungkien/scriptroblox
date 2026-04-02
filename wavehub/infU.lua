repeat wait() until game:IsLoaded()
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local MarketplaceService = game:GetService("MarketplaceService")
local placeId = game.PlaceId

local success, info = pcall(function()
    return MarketplaceService:GetProductInfo(placeId, Enum.InfoType.Asset)
end)

local Window = Rayfield:CreateWindow({
   Name = "infU | " .. info.Name,
   Icon = "infinity",
   LoadingTitle = "Đang mở Menu infU...",
   LoadingSubtitle = "Đang tải dữ liệu...",
   ShowText = "infU",
   Theme = "Theme",
   ToggleUIKeybind = "G",
   DisableRayfieldPrompts = true,
   ConfigurationSaving = {
      Enabled = true,
      FileName = "infU"
   }
})

local TabScriptAny = Window:CreateTab("Chung", "user")
local TabSet = Window:CreateTab("Cài đặt", "settings")
local TabServer = Window:CreateTab("Máy chủ", "server")
local TabInfo = Window:CreateTab("Thông tin", "info")

Rayfield:Notify({
   Title = "infU",
   Content = "🎉 Chào mừng bạn đến với infU",
   Duration = 4,
   Image = "infinity"
})

local function loadsc(url, title, fast)
   Rayfield:Notify({
   	Title = title,
	Content = "Đang tải script",
   	Duration = 3,
	Image = 14595801355
   })
      local ok, err = pcall(function()
         loadstring(game:HttpGet(url))()
      end)

      if ok then
	   Rayfield:Notify({
	   	Title = "Done",
		Content = "Đã tải script thành công",
	   	Duration = 3,
		Image = 14595801355
	   })
      end

      if not ok then
	   Rayfield:Notify({
	   	Title = "ERROR",
		Content = err,
	   	Duration = 3,
		Image = 6646234362
	   })
      end
end

--Script
if game.GameId == 994732206 then
TabScriptAny:CreateButton({
   Name = "Quantum Onyx" .. " for " .. info.Name,
   Callback = function()
		loadsc("https://raw.githubusercontent.com/flazhy/QuantumOnyx/refs/heads/main/QuantumOnyx.lua", "Quantum Onyx", false)
   end
})
end

--Script Chung
TabScriptAny:CreateButton({
   Name = "Infinite Yield FE",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
   end
})
TabScriptAny:CreateButton({
   Name = "SimpleSpyV3",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/SimpleSpyV3/main.lua"))()
   end
})
TabScriptAny:CreateButton({
   Name = "Dex",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/dex.lua"))()
   end
})
TabScriptAny:CreateButton({
   Name = "Motiona FE Animations",
   Callback = function()
notiscript()
loadstring(game:HttpGet("https://raw.githubusercontent.com/BeemTZy/Motiona/refs/heads/main/source.lua"))()
   end
})
TabScriptAny:CreateButton({
   Name = "FE EMOTES",
   Callback = function()
notiscript()
loadstring(game:HttpGet("https://raw.githubusercontent.com/7yd7/Hub/refs/heads/Branch/GUIS/Emotes.lua"))()
   end
})
TabScriptAny:CreateButton({
   Name = "FPS/PING",
   Callback = function()
notiscript()
loadstring(game:HttpGet("https://raw.githubusercontent.com/soctrungkien/scriptroblox/refs/heads/main/Script/Ping_FPS.lua"))()
   end
})
TabScriptAny:CreateButton({
   Name = "FIXLAG",
   Callback = function()
notiscript()

   end
})
