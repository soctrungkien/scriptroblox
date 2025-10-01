if loadername == nil then
	print("Run a Loader.lua")
	return loadstring(game:HttpGet("https://raw.githubusercontent.com/soctrungkien/scriptroblox/refs/heads/main/wavehub/Loader.lua"))()
end

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
local pos = Vector3.new(113, 62, -271.5)
for _, v in ipairs(workspace:GetChildren()) do
    if v.Name == "FreePad" and v:IsA("Part") then
        if v and v.Position == pos then
            local ev = v:FindFirstChild("F2PSpawnRequest")
            if ev then ev:FireServer() end
            break
        end
    end
end
end
task.wait(0.06)
end
end)
