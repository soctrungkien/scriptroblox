local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

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

task.spawn(function()
	while true do
		task.wait(math.random(180, 600))
		RayfieldLibrary:Notify({
			Title = "infU Script",
			Content = "Nếu bn thấy script hay thì cho 1 like nhé^^",
			Duration = 7,
			Image = 4370033185,
		})
	end
end)

local TabExec = Window:CreateTab("Chạy script", "play")
local TabAI = Window:CreateTab("AI", "bot")
local TabScript = Window:CreateTab("Chung", "file-question-mark")
local TabMusic = Window:CreateTab("Âm nhạc", "disc-3")
local TabFixLag = Window:CreateTab("Tối ưu hoá", "wrench")
local TabSet = Window:CreateTab("Cài đặt", "settings")
local TabServer = Window:CreateTab("Máy chủ", "server")
local TabInfo = Window:CreateTab("Thông tin", "info")

Rayfield:Notify({
   Title = "infU",
   Content = "🎉 Chào mừng bạn đến với infU",
   Duration = 4
})
