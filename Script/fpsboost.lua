
setfpscap(999999999)
for _,v in next,game:GetService("Workspace"):GetDescendants() do
    if v and v:IsA("Model") then
      v.LevelOfDetail = "Disabled"
      v.ModelStreamingMode = "Nonatomic"
    elseif v and (v:IsA("BasePart") and not v:IsA("MeshPart")) then
      v.CastShadow = false
      v.Material = "Plastic"
      v.Reflectance = 0 
      v.MaterialVariant = ""
    elseif v and (v:IsA("Decal") or v:IsA("Texture")) then 
      v.Transparency = 1
    elseif v and v:IsA("MeshPart") then 
      v.CastShadow = false
      v.DoubleSided = false
      v.RenderFidelity = "Performance"
      v.TextureID = 10385902758728957
    elseif v and v:IsA("SpecialMesh") then 
      v.TextureId = 0
    elseif v and v:IsA("ShirtGraphic") then 
      v.Graphic = 0
    elseif v and (v:IsA("Shirt") or v:IsA("Pants")) then 
     v[v.ClassName.."Template"] = 0
    elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") then
     v.Enabled = false   
    elseif v:IsA("Explosion") then
     v.BlastPressure = 1
     v.BlastRadius = 1
    elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
     v.Enabled = false
    elseif v and v:IsA("Beam") then 
     v.Enabled = false
    elseif v and v:IsA("SurfaceAppearance") then
      v:Destroy()
    elseif v and v:IsA("Debris") then 
      v:Destroy()
    elseif v and v:IsA("Attachment") then 
      v.Visible = false
   elseif v and v:IsA("MaterialVariant") then 
    v:Destroy()
      end
    end
   for _,v in next,game:GetService("Lighting"):GetDescendants() do 
     if v and (v:IsA("Sky") or v:IsA("Atmosphere") or v:IsA("BloomEffect") or v:IsA("BlurEffect") or v:IsA("SunRaysEffect") or v:IsA("DepthOfFieldEffect") or v:IsA("Clouds") or v:isA("PostEffect") or v:IsA("ColorCorrectionEffect")) then 
       v:Destroy()
    end
   end
   sethiddenproperty(game:GetService("Lighting"),"Technology",2)
   game:GetService("Lighting").GlobalShadows = 0
   game:GetService("Lighting").FogEnd = 9e9
   game:GetService("Lighting").Brightness = 0
   sethiddenproperty(game:GetService("Workspace"):FindFirstChildOfClass("Terrain"),"Decoration",false)
   game:GetService("Workspace"):FindFirstChildOfClass("Terrain").WaterReflectance = 0 
   game:GetService("Workspace"):FindFirstChildOfClass("Terrain").WaterTransparency = 0.7
   game:GetService("Workspace"):FindFirstChildOfClass("Terrain").WaterWaveSize = 0
   game:GetService("Workspace"):FindFirstChildOfClass("Terrain").WaterWaveSpeed = 0
   game:GetService("Lighting").ChildAdded:Connect(function(addedshit)
     spawn(function()
     v:Destroy()
     end)
   end)
   game:GetService("Workspace").DescendantAdded:Connect(function(addedshit)
     spawn(function()
       if addedshit:IsA("Model") then
      addedshit.LevelOfDetail = "Disabled"
      addedshit.ModelStreamingMode = "Nonatomic"
    elseif (addedshit:IsA("BasePart") and not addedshit:IsA("MeshPart")) then
      addedshit.CastShadow = false
      addedshit.Material = "Plastic"
      addedshit.Reflectance = 0 
      addedshit.MaterialVariant = ""
    elseif (addedshit:IsA("Decal") or addedshit:IsA("Texture")) then 
      addedshit.Transparency = 1
    elseif addedshit:IsA("MeshPart") then 
      addedshit.CastShadow = false
      addedshit.DoubleSided = false
      addedshit.RenderFidelity = "Performance"
      addedshit.TextureID = 10385902758728957
    elseif addedshit:IsA("SpecialMesh") then 
      addedshit.TextureId = 0
    elseif addedshit:IsA("ShirtGraphic") then 
      addedshit.Graphic = 0
    elseif (addedshit:IsA("Shirt") or addedshit:IsA("Pants")) then 
     addedshit[addedshit.ClassName.."Template"] = 0
    elseif addedshit:IsA("Fire") or addedshit:IsA("SpotLight") or addedshit:IsA("Smoke") or addedshit:IsA("Sparkles") then
     addedshit.Enabled = false   
    elseif addedshit:IsA("Explosion") then
     addedshit.BlastPressure = 1
     addedshit.BlastRadius = 1
    elseif addedshit:IsA("ParticleEmitter") or addedshit:IsA("Trail") then
     addedshit.Enabled = false
    elseif addedshit:IsA("Beam") then 
     addedshit.Enabled = false
    elseif addedshit:IsA("SurfaceAppearance") then
      addedshit:Destroy()
    elseif addedshit:IsA("Debris") then 
      addedshit:Destroy()
    elseif addedshit:IsA("Attachment") then 
      addedshit.Visible = false
    elseif addedshit:IsA("MaterialVariant") then 
    addedshit:Destroy()
         end
       end)
     end)

-- Super Max Anti-Lag Script (with Player Character Protection)

-- Services
local debris = game:GetService("Debris")
local lighting = game:GetService("Lighting")
local players = game:GetService("Players")
local runService = game:GetService("RunService")

-- Settings
local maxDebrisTime = 5 -- Max time before debris is removed
local partLimitPerPlayer = 500 -- Max parts per player
local maxParts = 5000 -- Max total parts allowed in workspace
local physicsThrottle = Enum.PhysicsSimulationRate.Fixed240Hz -- Reduce physics complexity

-- Function to check if a part is part of a player's character
local function isPartOfPlayerCharacter(part)
    if part:IsDescendantOf(players) then
        return true
    end
    for _, player in pairs(players:GetPlayers()) do
        if player.Character and part:IsDescendantOf(player.Character) then
            return true
        end
    end
    return false
end

-- Function to clean unanchored parts (but ignore player parts)
local function cleanUpUnanchoredParts()
    while true do
        wait(2)
        for _, part in pairs(workspace:GetDescendants()) do
            if part:IsA("BasePart") and not part.Anchored and not isPartOfPlayerCharacter(part) then
                debris:AddItem(part, maxDebrisTime)
            end
        end
    end
end

-- Function to reduce part count per player (without removing character parts)
local function limitPartCountForPlayers()
    while true do
        wait(5)
        for _, player in pairs(players:GetPlayers()) do
            local totalParts = 0
            if player.Character and player.Character.Parent then
                for _, part in pairs(player.Character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        totalParts = totalParts + 1
                    end
                end
            end
            if totalParts > partLimitPerPlayer then
                -- Do not remove parts of the player's character
                for _, part in pairs(player.Character:GetDescendants()) do
                    if part:IsA("BasePart") and not isPartOfPlayerCharacter(part) then
                        debris:AddItem(part, maxDebrisTime)
                    end
                end
            end
        end
    end
end

-- Function to globally reduce part count in the workspace (excluding player parts)
local function limitGlobalPartCount()
    while true do
        wait(10)
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

-- Optimize Lighting (removes shadows, sets clock to static time to reduce resource usage)
local function optimizeLighting()
    lighting.GlobalShadows = false
    lighting.ClockTime = 12 -- Set to a fixed time (no dynamic lighting)
end

-- Physics Optimization
local function optimizePhysics()
    settings().Physics.PhysicsEnvironmentalThrottle = Enum.EnviromentalPhysicsThrottle.Default
    settings().Physics.AllowSleep = true -- Allow parts to 'sleep' when stationary
    runService.Stepped:Connect(function()
        settings().Physics.PhysicsSimulationRate = physicsThrottle
    end)
end

-- Optimize memory usage by cleaning up unused instances
local function optimizeMemory()
    game:GetService("GarbageCollectorService"):RequestGarbageCollection() -- Force garbage collection
end

-- Main optimization script
local function startOptimization()
    spawn(cleanUpUnanchoredParts)       -- Regularly clean unanchored parts (excluding player parts)
    spawn(limitPartCountForPlayers)     -- Limit part count for each player (without resetting characters)
    spawn(limitGlobalPartCount)         -- Limit the total part count in the workspace (excluding players)
    optimizeLighting()                  -- Optimize lighting settings
    optimizePhysics()                   -- Optimize physics performance
    optimizeMemory()                    -- Optimize memory usage
end

-- Run the optimization
startOptimization()
