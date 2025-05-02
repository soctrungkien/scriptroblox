-- Services
local debris = game:GetService("Debris")
local lighting = game:GetService("Lighting")
local players = game:GetService("Players")
local runService = game:GetService("RunService")
local workspace = game:GetService("Workspace")

-- Settings
local maxDebrisTime = 5
local partLimitPerPlayer = 500
local maxParts = 5000
local physicsThrottle = Enum.PhysicsSimulationRate.Fixed120Hz

-- Cache player characters
local characterCache = {}
players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        characterCache[player] = character
    end)
end)
players.PlayerRemoving:Connect(function(player)
    characterCache[player] = nil
end)

-- Function to check if a part is part of a player's character
local function isPartOfPlayerCharacter(part)
    for _, character in pairs(characterCache) do
        if character and part:IsDescendantOf(character) then
            return true
        end
    end
    return false
end

-- Graphics Optimization
setfpscap(999999999)
for _, v in pairs(workspace:GetDescendants()) do
    if v:IsA("Model") then
        v.LevelOfDetail = "Disabled"
        v.ModelStreamingMode = "Nonatomic"
    elseif v:IsA("BasePart") and not v:IsA("MeshPart") then
        v.CastShadow = false
        v.Material = "Plastic"
        v.Reflectance = 0
        v.MaterialVariant = ""
    elseif v:IsA("Decal") or v:IsA("Texture") then
        v.Transparency = 1
    elseif v:IsA("MeshPart") then
        v.CastShadow = false
        v.DoubleSided = false
        pcall(function()
            v.RenderFidelity = "Performance"
        end)
        v.TextureID = "rbxassetid://10385902758728957"
    elseif v:IsA("SpecialMesh") then
        v.TextureId = ""
    elseif v:IsA("ShirtGraphic") then
        v.Graphic = ""
    elseif v:IsA("Shirt") or v:IsA("Pants") then
        v[v.ClassName .. "Template"] = ""
    elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") then
        v.Enabled = false
    elseif v:IsA("Explosion") then
        v.BlastPressure = 1
        v.BlastRadius = 1
    elseif v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Beam") then
        v.Enabled = false
    elseif v:IsA("SurfaceAppearance") or v:IsA("Debris") or v:IsA("MaterialVariant") then
        v:Destroy()
    elseif v:IsA("Attachment") then
        v.Visible = false
    end
end

for _, v in pairs(lighting:GetDescendants()) do
    if v:IsA("Sky") or v:IsA("Atmosphere") or v:IsA("BloomEffect") or v:IsA("BlurEffect") or
       v:IsA("SunRaysEffect") or v:IsA("DepthOfFieldEffect") or v:IsA("Clouds") or
       v:IsA("PostEffect") or v:IsA("ColorCorrectionEffect") then
        v:Destroy()
    end
end

lighting.Technology = Enum.Technology.Compatibility
lighting.GlobalShadows = false
lighting.FogEnd = 9e9
lighting.Brightness = 0
lighting.ClockTime = 12

local terrain = workspace:FindFirstChildOfClass("Terrain")
if terrain then
    terrain.WaterReflectance = 0
    terrain.WaterTransparency = 0.7
    terrain.WaterWaveSize = 0
    terrain.WaterWaveSpeed = 0
end

lighting.ChildAdded:Connect(function(added)
    task.spawn(function()
        if added:IsA("Sky") or added:IsA("Atmosphere") or added:IsA("PostEffect") then
            added:Destroy()
        end
    end)
end)

workspace.DescendantAdded:Connect(function(added)
    task.spawn(function()
        if added:IsA("Model") then
            added.LevelOfDetail = "Disabled"
            added.ModelStreamingMode = "Nonatomic"
        elseif added:IsA("BasePart") and not added:IsA("MeshPart") then
            added.CastShadow = false
            added.Material = "Plastic"
            added.Reflectance = 0
            added.MaterialVariant = ""
        elseif added:IsA("Decal") or added:IsA("Texture") then
            added.Transparency = 1
        elseif added:IsA("MeshPart") then
            added.CastShadow = false
            added.DoubleSided = false
            pcall(function()
                added.RenderFidelity = "Performance"
            end)
            added.TextureID = "rbxassetid://10385902758728957"
        elseif added:IsA("SpecialMesh") then
            added.TextureId = ""
        elseif added:IsA("ShirtGraphic") then
            added.Graphic = ""
        elseif added:IsA("Shirt") or added:IsA("Pants") then
            added[added.ClassName .. "Template"] = ""
        elseif added:IsA("Fire") or added:IsA("SpotLight") or added:IsA("Smoke") or added:IsA("Sparkles") then
            added.Enabled = false
        elseif added:IsA("Explosion") then
            added.BlastPressure = 1
            added.BlastRadius = 1
        elseif added:IsA("ParticleEmitter") or added:IsA("Trail") or added:IsA("Beam") then
            added.Enabled = false
        elseif added:IsA("SurfaceAppearance") or added:IsA("Debris") or added:IsA("MaterialVariant") then
            added:Destroy()
        elseif added:IsA("Attachment") then
            added.Visible = false
        end
    end)
end)

-- Anti-Lag Functions
local function cleanUpUnanchoredParts()
    while true do
        task.wait(2)
        for _, part in pairs(workspace:GetDescendants()) do
            if part:IsA("BasePart") and not part.Anchored and not isPartOfPlayerCharacter(part) then
                debris:AddItem(part, maxDebrisTime)
            end
        end
    end
end

local function limitPartCountForPlayers()
    while true do
        task.wait(5)
        for _, player in pairs(players:GetPlayers()) do
            local totalParts = 0
            if player.Character then
                for _, part in pairs(player.Character:GetDescendants()) do
                    if part:IsA("BasePart") and not isPartOfPlayerCharacter(part) then
                        totalParts = totalParts + 1
                    end
                end
                if totalParts > partLimitPerPlayer then
                    for _, part in pairs(player.Character:GetDescendants()) do
                        if part:IsA("BasePart") and not isPartOfPlayerCharacter(part) then
                            debris:AddItem(part, maxDebrisTime)
                        end
                    end
                end
            end
        end
    end
end

local function limitGlobalPartCount()
    while true do
        task.wait(10)
        local totalParts = 0
        for _, part in pairs(workspace:GetDescendants()) do
            if part:IsA("BasePart") and not isPartOfPlayerCharacter(part) then
                totalParts = totalParts + 1
            end
        end
        if totalParts > maxParts then
            for _, part in pairs(workspace:GetDescendants()) do
                if part:IsA("BasePart") and not part.Anchored and not isPartOfPlayerCharacter(part) then
                    debris:AddItem(part, maxDebrisTime)
                end
            end
        end
    end
end

local function optimizePhysics()
    settings().Physics.PhysicsEnvironmentalThrottle = Enum.EnviromentalPhysicsThrottle.Default
    settings().Physics.AllowSleep = true
    runService.Stepped:Connect(function()
        settings().Physics.PhysicsSimulationRate = physicsThrottle
    end)
end

-- Start Optimization
task.spawn(cleanUpUnanchoredParts)
task.spawn(limitPartCountForPlayers)
task.spawn(limitGlobalPartCount)
optimizePhysics()
