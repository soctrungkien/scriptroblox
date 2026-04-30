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

local Players = game:GetService("Players")
local lp = Players.LocalPlayer
local char = lp.Character or lp.CharacterAdded:Wait()

local function touchPart(part)
    if not part:IsA("BasePart") then return end
    
    for _, v in ipairs(part:GetChildren()) do
        if v:IsA("TouchTransmitter") then
            firetouchinterest(char:FindFirstChild("HumanoidRootPart"), part, 0)
            firetouchinterest(char:FindFirstChild("HumanoidRootPart"), part, 1)
        end
    end
end

local sign = workspace:WaitForChild("WelcomeSign"):WaitForChild("Sign")
local clickDetector = workspace:WaitForChild("RockFall"):WaitForChild("ClickBrick"):WaitForChild("ClickDetector")

local r1
local r2
local r3

task.spawn(function()
game:GetService("RunService").Heartbeat:Connect(function()
	char = lp.Character or lp.CharacterAdded:Wait()
	if r1 then
		if char then
		    for _, part in ipairs(workspace.Stairs:GetChildren()) do
		        touchPart(part)
		    end
		end
	end
if r2 then
	if char and lp.Character and lp.Character:FindFirstChild("HumanoidRootPart") then
		local root = lp.Character.HumanoidRootPart
		
		root.CFrame = sign.CFrame
		root.Velocity = Vector3.new(5000, 5000, 5000)
		root.RotVelocity = Vector3.new(5000, 5000, 5000)
	end
else
	if lp.Character and lp.Character:FindFirstChild("HumanoidRootPart") then
		local root = lp.Character.HumanoidRootPart
		
		-- reset lực thôi
		root.Velocity = Vector3.new(0, 0, 0)
		root.RotVelocity = Vector3.new(0, 0, 0)
	end
				end
	if r3 then
		fireclickdetector(clickDetector)
	end
end)
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
    Description = "Cày điểm cầu thang",
    DefaultValue = false,
    Callback = function(Value)
        r1 = Value
    end,
})

Main:New("Toggle")({
    Title = "Fling biển chào",
    Description = "Làm cho biển chào bay",
    DefaultValue = false,
    Callback = function(Value)
        r2 = Value
    end,
})

Main:New("Toggle")({
    Title = "Auto thả đá",
    Description = "Thả 3 cục đá từ trên xuống (tốn 50 sao mỗi hòn)",
    DefaultValue = false,
    Callback = function(Value)
        r3 = Value
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

