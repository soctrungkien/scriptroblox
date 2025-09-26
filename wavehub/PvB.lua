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
local firstBrainrot = game:GetService("Workspace").ScriptedMap.Brainrots:GetChildren()[1]
game:GetService("ReplicatedStorage"):WaitForChild("BridgeNet2"):WaitForChild("dataRemoteEvent")
    :FireServer(
    {
        {
            Value = false,
            Setting = "ShowOthers"
        },
        "\020"
    }
    )
game:GetService("Players").LocalPlayer.Character.Humanoid:EquipTool(game:GetService("Players").LocalPlayer:WaitForChild("Backpack"):FindFirstChild("Bat"))
game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = CFrame.new(Vector3.new(firstBrainrot.BrainrotHitbox.Position.X, game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position.Y, firstBrainrot.BrainrotHitbox.Position.Z))
    local args = {
	{
		firstBrainrot.Name
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
