if loadername == nil then
	game.Players.LocalPlayer:Kick("run loader to use")
	return
end

local IconsV2 = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Footagesus/Icons/main/Main-v2.lua"))()
local Modal = loadstring(game:HttpGet("https://github.com/lxte/Modal/releases/latest/download/main.lua"))()

local MarketplaceService = game:GetService("MarketplaceService")
local placeId = game.PlaceId

local success, info = pcall(function()
    return MarketplaceService:GetProductInfo(placeId, Enum.InfoType.Asset)
end)

local Window = Modal:CreateWindow({
    Title = "Wave Hub",
    SubTitle = info.Name,
    Size = UDim2.fromOffset(400, 400),
    MinimumSize = Vector2.new(250, 200),
    Transparency = 0,
    Icon = IconsV2.GetIcon("waves"),
})

local Main = Window:AddTab("Main")

Main:New("Title")({
    Title = "Main",
})

Main:New("Toggle")({
    Title = "Auto cày điểm",
    Description = Cày điểm cầu thang",
    DefaultValue = false,
    Callback = function(Value)
        
    end,
})

local Settings = Window:AddTab("Settings")

Settings:New("Title")({
    Title = "Themes"
})

Settings:New("Dropdown")({
    Title = "Theme",
    Description = "Default theme options",
    Options = { "Light", "Dark", "Midnight", "Rose", "Emerald" },
    Callback = function(Theme)
        Window:SetTheme(Theme)
    end,
})

Window:SetTab("Main")
Window:SetTheme("Rose")
