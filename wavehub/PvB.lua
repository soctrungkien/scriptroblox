if loadername == nil then
	game.Players.LocalPlayer:Kick("run loader to use")
	return
end

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local VirtualUser = game:GetService("VirtualUser")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
local Backpack = LocalPlayer:WaitForChild("Backpack")
local camera = workspace.CurrentCamera
local screenSize = camera.ViewportSize
local desiredWidth = 200
local desiredHeight = 130
local maxWidth = math.min(desiredWidth, screenSize.X * 0.9)
local maxHeight = math.min(desiredHeight, screenSize.Y * 0.9)
local ReGui = loadstring(game:HttpGet('https://raw.githubusercontent.com/depthso/Dear-ReGui/refs/heads/main/ReGui.lua'))()
local Window = ReGui:Window({
	Title = "Wave Hub",
	Size = UDim2.fromOffset(maxWidth, maxHeight)
})
local shop = {
    seedList = {
        "Cactus Seed",
        "Strawberry Seed",
        "Pumpkin Seed",
        "Sunflower Seed",
        "Dragon Seed",
        "Eggplant Seed",
        "Watermelon Seed",
        "Cocotank Seed",
        "Carnivorous Plant Seed",
        "Mr Carrot Seed",
        "Tomatrio Seed",
        "Shroombino Seed"
    },
    gearList = {
        "Water Bucket",
        "Frost Grenade",
        "Banana Gun",
        "Frost Blower",
        "Carrot Launcher"
    }
}
local autodanh = false
local autoban = false
Window:Checkbox({
	Value = false,
	Label = "Auto bán",
	Callback = function(self, Value: boolean)
		autoban = Value
	end
})
Window:Checkbox({
	Value = false,
	Label = "Auto đánh",
	Callback = function(self, Value: boolean)
		autodanh = Value
	end
})
task.spawn(function()
while true do
if autodanh then
local firstBrainrot = game:GetService("Workspace").ScriptedMap.Brainrots:GetChildren()[1]
if firstBrainrot then
local BrainrotsCache = {}
local function UpdateBrainrotsCache()
    local ok, folder = pcall(function()
        return Workspace:WaitForChild("ScriptedMap"):WaitForChild("Brainrots")
    end)
    if not ok or not folder then return end
    BrainrotsCache = {}
    for _, b in ipairs(folder:GetChildren()) do
        if b:FindFirstChild("BrainrotHitbox") then
            table.insert(BrainrotsCache, b)
        end
    end
end
local function GetNearestBrainrot()
    local nearest = nil
    local minDist = math.huge
    for _, b in ipairs(BrainrotsCache) do
        local hitbox = b:FindFirstChild("BrainrotHitbox")
        if hitbox then
            local dist = (HumanoidRootPart.Position - hitbox.Position).Magnitude
            if dist < minDist then
                minDist = dist
                nearest = b
            end
        end
    end
    return nearest
end
local function InstantWarpToBrainrot(brainrot)
    local hitbox = brainrot and brainrot:FindFirstChild("BrainrotHitbox")
    if hitbox then
        local offset = Vector3.new(0, 1, 3)
        HumanoidRootPart.CFrame = CFrame.new(hitbox.Position + offset, hitbox.Position)
    end
end
local firstBrainrot = GetNearestBrainrot() --game:GetService("Workspace").ScriptedMap.Brainrots:GetChildren()[1]
                    UpdateBrainrotsCache()
--[[game:GetService("ReplicatedStorage"):WaitForChild("BridgeNet2"):WaitForChild("dataRemoteEvent")
    :FireServer(
    {
        {
            Value = false,
            Setting = "ShowOthers"
        },
        "\020"
    }
    )
game:GetService("Players").LocalPlayer.Character.Humanoid:EquipTool(game:GetService("Players").LocalPlayer:WaitForChild("Backpack"):FindFirstChild("Basic Bat"))
game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = CFrame.new(Vector3.new(firstBrainrot.BrainrotHitbox.Position.X, game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position.Y, firstBrainrot.BrainrotHitbox.Position.Z))]]--
InstantWarpToBrainrot(firstBrainrot)
local args = {
	{
		firstBrainrot
	}
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("AttacksServer"):WaitForChild("WeaponAttack"):FireServer(unpack(args))
end
end
task.wait(0.06)
end
end)
task.spawn(function()
while true do
if autoban then
local ReplicatedStorage_upvr = game:GetService("ReplicatedStorage")
ReplicatedStorage_upvr.Remotes:WaitForChild("EquipBest"):Fire()
task.wait(1)
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("ItemSell"):FireServer()
end
task.wait(5)
end
end)
