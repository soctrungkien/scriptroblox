local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield-gen2'))()

local Theme = {
	TextColor = Color3.fromRGB(240, 240, 240),

	Background = Color3.fromRGB(0, 0, 0),
	Topbar = Color3.fromRGB(34, 34, 34),
	Shadow = Color3.fromRGB(20, 20, 20),

	NotificationBackground = Color3.fromRGB(20, 20, 20),
	NotificationActionsBackground = Color3.fromRGB(230, 230, 230),

	TabBackground = Color3.fromRGB(80, 80, 80),
	TabStroke = Color3.fromRGB(85, 85, 85),
	TabBackgroundSelected = Color3.fromRGB(210, 210, 210),
	TabTextColor = Color3.fromRGB(240, 240, 240),
	SelectedTabTextColor = Color3.fromRGB(50, 50, 50),

	ElementBackground = Color3.fromRGB(35, 35, 35),
	ElementBackgroundHover = Color3.fromRGB(40, 40, 40),
	SecondaryElementBackground = Color3.fromRGB(25, 25, 25),
	ElementStroke = Color3.fromRGB(50, 50, 50),
	SecondaryElementStroke = Color3.fromRGB(40, 40, 40),
			
	SliderBackground = Color3.fromRGB(50, 138, 220),
	SliderProgress = Color3.fromRGB(50, 138, 220),
	SliderStroke = Color3.fromRGB(58, 163, 255),

	ToggleBackground = Color3.fromRGB(30, 30, 30),
	ToggleEnabled = Color3.fromRGB(0, 146, 214),
	ToggleDisabled = Color3.fromRGB(100, 100, 100),
	ToggleEnabledStroke = Color3.fromRGB(0, 170, 255),
	ToggleDisabledStroke = Color3.fromRGB(125, 125, 125),
	ToggleEnabledOuterStroke = Color3.fromRGB(100, 100, 100),
	ToggleDisabledOuterStroke = Color3.fromRGB(65, 65, 65),

	DropdownSelected = Color3.fromRGB(40, 40, 40),
	DropdownUnselected = Color3.fromRGB(30, 30, 30),

	InputBackground = Color3.fromRGB(30, 30, 30),
	InputStroke = Color3.fromRGB(65, 65, 65),
	PlaceholderColor = Color3.fromRGB(178, 178, 178)
}

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

local TabScriptGame = Window:CreateTab(info.Name  or "Script", "play")
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

local function notiscript()
Rayfield:Notify({
   Title = "infU",
   Content = "Đã chạy script",
   Duration = 4,
   Image = "infinity"
})
end

--Script
if game.GameId == 994732206 then
TabScriptGame:CreateButton({
   Name = "Hermanos Hub-PVP",
   Callback = function()
notiscript()
getgenv().script_mode = "PVP"
loadstring(game:HttpGet("https://raw.githubusercontent.com/hermanos-dev/hermanos-hub/refs/heads/main/Loader.lua"))()
   end
})
TabScriptGame:CreateButton({
   Name = "Hermanos Hub-Farm",
   Callback = function()
notiscript()
getgenv().script_mode = "Farm"
loadstring(game:HttpGet("https://raw.githubusercontent.com/hermanos-dev/hermanos-hub/refs/heads/main/Loader.lua"))()
   end
})
TabScriptGame:CreateButton({
   Name = "Banana Hub-Longhihi",
   Callback = function()
notiscript()
loadstring(game:HttpGet("https://raw.githubusercontent.com/longhihilonghihi-hub/main/refs/heads/main/BananaHub.lua"))()
   end
})
TabScriptGame:CreateButton({
   Name = "Maru Hub-Longhihi",
   Callback = function()
notiscript()
loadstring(game:HttpGet("https://raw.githubusercontent.com/longhihilonghihi-hub/MaruHubV1/refs/heads/main/MainV1.Lua"))()
   end
})
TabScriptGame:CreateButton({
   Name = "DatTHGV5",
   Callback = function()
notiscript()
loadstring(game:HttpGet("https://github.com/LuaCrack/DatThg/raw/refs/heads/main/DatThgV5English"))()
   end
})
TabScriptGame:CreateButton({
   Name = "Redz Hub [Beta]",
   Callback = function()
notiscript()
getgenv().BETA_VERSION = true
local Settings = {
    Translator = true;
}
loadstring(game:HttpGet("https://raw.githubusercontent.com/tlredz/Scripts/refs/heads/main/main.luau"))(Settings)
   end
})
TabScriptGame:CreateButton({
   Name = "TuanAnhIOS",
   Callback = function()
notiscript()
loadstring(game:HttpGet("https://raw.githubusercontent.com/AnhTuanDzai-Hub/TuanAnhIOS/refs/heads/main/TuanAnhIOS-Main.Lua"))()
   end
})
TabScriptGame:CreateButton({
   Name = "Gravity Hub",
   Callback = function()
notiscript()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Dev-GravityHub/BloxFruit/refs/heads/main/Main.lua"))()
   end
})
TabScriptGame:CreateButton({
   Name = "Speed Hub",
   Callback = function()
notiscript()
loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua"))()
   end
})
TabScriptGame:CreateButton({
   Name = "Quantum Onyx",
   Callback = function()
notiscript()
loadstring(game:HttpGet("https://raw.githubusercontent.com/flazhy/QuantumOnyx/refs/heads/main/QuantumOnyx.lua"))()
   end
})
TabScriptGame:CreateButton({
   Name = "Leaf Hub",
   Callback = function()
notiscript()
repeat wait() until game:IsLoaded() and game.Players.LocalPlayer 
loadstring(game:HttpGet("https://leaf-zeta.onrender.com/api/script"))()
   end
})
else
local Label = TabScript:CreateLabel("Label Example", 4483362458, Color3.fromRGB(255, 255, 255), false) -- Title, Icon, Color, IgnoreTheme
local Paragraph = TabScript:CreateParagraph({Title = "Paragraph Example", Content = "Paragraph Example"})
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
