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
local bf = false
Window:Checkbox({
	Value = false,
	Label = "Free Blocc",
	Callback = function(self, Value: boolean)
		bf = Value
	end
})
task.spawn(function()
while true do
if bf then
workspace:WaitForChild("FreePad"):WaitForChild("F2PSpawnRequest"):FireServer()
end
task.wait(0.06)
end
end)
