if loadername == nil then
	game.Players.LocalPlayer:Kick("run loader to use")
	return
end

local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/ThundarZ/Welcome/refs/heads/main/Main/UI/WindUI.lua"))()

local MarketplaceService = game:GetService("MarketplaceService")
local placeId = game.PlaceId

local success, info = pcall(function()
    return MarketplaceService:GetProductInfo(placeId, Enum.InfoType.Asset)
end)

local camera = workspace.CurrentCamera
local screenSize = camera.ViewportSize
local desiredWidth = 580
local desiredHeight = 460
local maxWidth = math.min(desiredWidth, screenSize.X * 0.9)
local maxHeight = math.min(desiredHeight, screenSize.Y * 0.9)

local Window = WindUI:CreateWindow({
    Title = "Wave Hub" .. " ",
    Icon = "waves",
    Author = info.Name,
    Folder = "WaveHub",
    
    Size = UDim2.fromOffset(maxWidth, maxHeight),
    Transparent = true,
    Theme = "Dark",
    Resizable = true,
    SideBarWidth = 200,
    BackgroundImageTransparency = 0.42,
    HideSearchBar = true,
    ScrollBarEnabled = false,
        
    User = {
        Enabled = true,
        Anonymous = false,
        Callback = function()
            print("clicked")
        end,
    }
})

Window:EditOpenButton({
    Title = "Wave Hub",
    Icon = "waves",
    CornerRadius = UDim.new(0,16),
    StrokeThickness = 2,
    Color = ColorSequence.new( -- gradient
        Color3.fromHex("FF0F7B"), 
        Color3.fromHex("F89B29")
    ),
    OnlyMobile = false,
    Enabled = true,
    Draggable = true,
})

Window:SetToggleKey(Enum.KeyCode.G)

local Tab = Window:Tab({
    Title = "Main",
    Icon = "house"
})
local Claim = Window:Tab({
    Title = "Claim",
    Icon = "ticket-slash"
})
local Player = Window:Tab({
    Title = "Player",
    Icon = "ghost"
})
local Auto = Window:Tab({
    Title = "Automation",
    Icon = "workflow"
})
local Server = Window:Tab({
    Title = "Server",
    Icon = "server"
})
local Teleport = Window:Tab({
    Title = "Teleport",
    Icon = "map-pin"
})
local EggsandPets = Window:Tab({
    Title = "Eggs and Pets",
    Icon = "cat"
})
local CS = Window:Tab({
    Title = "Coming Soon",
    Icon = "lock",
    Locked = true
})

Window:SelectTab(1)

local autocode = Auto:Button({
    Title = "Nhập tất cả code",
    Desc = "Nhập full code hiện có",
    Locked = false,
    Callback = function()
        local codes = {
    "obby",
    "milestones",
    "season7",
    "update18",
    "update17",
    "update16",
    "onemorebonus",
    "update15",
    "world3",
    "fishe",
    "update13",
    "update12",
    "update11",
    "update10",
    "update9",
    "update8",
    "update6",
    "update5",
    "update4",
    "sylentlyssorry",
    "update3",
    "update2",
    "Easter",
    "Release",
    "Lucky"
}

local remote = game:GetService("ReplicatedStorage")
    :WaitForChild("Shared")
    :WaitForChild("Framework")
    :WaitForChild("Network")
    :WaitForChild("Remote")
    :WaitForChild("RemoteFunction")

for _, code in ipairs(codes) do
    local args = {
        "RedeemCode",
        code
    }

    local success, result = pcall(function()
        return remote:InvokeServer(unpack(args))
    end)

    if success then
        print("✅ Redeemed code:", code, "| Server Response:", result)
    else
        warn("❌ Failed to redeem code:", code, "| Error:", result)
    end

    task.wait(0.2) -- Đợi một chút giữa các lượt, tránh spam server
end
    end
})

local fly = Player:Button({
    Title = "Bay",
    Desc = "by XNEO",
    Locked = false,
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
    end
})

local iy = Tab:Button({
    Title = "Infinite Yield",
    Desc = "by Edge, Zwolf, and Moon",
    Locked = false,
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
    end
})

if _G._WRDClickTeleport_Initialized ~= true then
    _G._WRDClickTeleport_Initialized = true

    local player = game:GetService("Players").LocalPlayer
    local UserInputService = game:GetService("UserInputService")
    local mouse = player:GetMouse()

    repeat wait() until mouse

    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            if _G.WRDClickTeleport and UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
                  local char = player.Character
                  if char and char:FindFirstChild("HumanoidRootPart") then
                      char:MoveTo(Vector3.new(mouse.Hit.x, mouse.Hit.y, mouse.Hit.z)) 
                  end
              end
          end
      end)
  end
  local clicktp = Tab:Toggle({
      Title = "Click Teleport",
      Desc = "Giữ Ctrl và click chuột trái để dịch chuyển",
      Type = "Checkbox",
      Default = false,
      Callback = function(state)
          _G.WRDClickTeleport = state
      end
  })

local char = game.Players.LocalPlayer.Character
local humanoid = char and char:FindFirstChildOfClass("Humanoid")
   local speed = Player:Slider({
      Title = "Tốc độ",
      Step = 1,
      
      Value = {
          Min = 0,
          Max = 100,
          Default = humanoid.WalkSpeed,
      },
      Callback = function(value)
          if humanoid then
              humanoid.WalkSpeed = value
          end
      end
  })
  
  local Players = game:GetService("Players")
  local LocalPlayer = Players.LocalPlayer
  local touchedParts = {}
  local connections = {}
  local smartNoclipEnabled = false
  local function onTouched(part)
  	if not smartNoclipEnabled then return end
  	if not part:IsA("BasePart") or not part.Anchored or not part.CanCollide then return end
  	local character = LocalPlayer.Character
  	local hrp = character and character:FindFirstChild("HumanoidRootPart")
  	if not hrp then return end
  	if part.Position.Y < (hrp.Position.Y - hrp.Size.Y) then return end
  	if not touchedParts[part] then
  		touchedParts[part] = true
  		part.CanCollide = false
  	end
  end
  local function onTouchEnded(part)
  	if touchedParts[part] then
  		touchedParts[part] = nil
  		part.CanCollide = true
  	end
  end
  local function setup()
  	local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
  	local hrp = char:WaitForChild("HumanoidRootPart")
  	table.insert(connections, hrp.Touched:Connect(onTouched))
  	table.insert(connections, hrp.TouchEnded:Connect(onTouchEnded))
  end
  local function enableSmartNoclip()
  	smartNoclipEnabled = true
  	if LocalPlayer.Character then setup() end
  end
  local function disableSmartNoclip()
  	smartNoclipEnabled = false
  	for part, _ in pairs(touchedParts) do
  		if part and part:IsA("BasePart") then
  			part.CanCollide = true
  		end
  	end
  	touchedParts = {}
  	for _, conn in ipairs(connections) do
  		if conn and conn.Disconnect then
  			conn:Disconnect()
  		end
  	end
  	connections = {}
  end
  LocalPlayer.CharacterAdded:Connect(function()
  	if smartNoclipEnabled then
  		task.wait(1)
  		setup()
  	end
  end)
  local noclip = Player:Toggle({
  	Title = "Noclip",
  	Desc = "Đi xuyên tường",
  	Type = "Checkbox",
  	Default = false,
  	Callback = function(state)
  		if state then
  			enableSmartNoclip()
  		else
  			disableSmartNoclip()
  		end
  	end
  })
  
  local Players = game:GetService("Players")
  local UserInputService = game:GetService("UserInputService")
  local player = Players.LocalPlayer
  local infinJumpEnabled = false
  UserInputService.JumpRequest:Connect(function()
    if infinJumpEnabled then
        local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            task.wait()
            humanoid:ChangeState(Enum.HumanoidStateType.Seated)
        end
    end
  end)
  local infjump = Player:Toggle({
  	Title = "Infinite Jump",
  	Desc = "Nhảy trên không",
  	Type = "Checkbox",
  	Default = false,
  	Callback = function(state)
        infinJumpEnabled = state
  	end
  })
  
  local ReplicatedStorage = game:GetService("ReplicatedStorage")
  local RemoteEvent = ReplicatedStorage:WaitForChild("Shared")
      :WaitForChild("Framework")
      :WaitForChild("Network")
      :WaitForChild("Remote")
      :WaitForChild("RemoteEvent")
  local function createButton(title, args)
      local claim = Claim:Button({
          Title = title,
          Desc = "Nhấn để " .. title,
          Callback = function()
              RemoteEvent:FireServer(unpack(args))
          end
      })
      return button
  end
  createButton("Claim Void Chest", {"ClaimChest", "Void Chest"})
  createButton("Claim Giant Chest", {"ClaimChest", "Giant Chest"})
  createButton("Claim Free Wheel Spin", {"ClaimFreeWheelSpin"})
  createButton("Claim Festival Free Wheel Spin", {"ClaimFestivalFreeWheelSpin"})
  createButton("Claim Rift Gift", {"ClaimRiftGift", "gift-rift"})
  
  local ReplicatedStorage = game:GetService("ReplicatedStorage")
  local RemoteEvent = ReplicatedStorage:WaitForChild("Shared")
      :WaitForChild("Framework")
      :WaitForChild("Network")
      :WaitForChild("Remote")
      :WaitForChild("RemoteEvent")
  local RunService = game:GetService("RunService")
  local connection
  local autoblowsell = Auto:Toggle({
      Title = "Auto Blow & Sell Bubble",
      Desc = "Tự động thổi và bán bong bóng liên tục",
      Type = "Checkbox",
      Default = false,
      Callback = function(state)
          if state then
              connection = RunService.Heartbeat:Connect(function()
                  RemoteEvent:FireServer("BlowBubble")
                  RemoteEvent:FireServer("SellBubble")
              end)
          else
              if connection then
                  connection:Disconnect()
                  connection = nil
              end
          end
      end
  })
  
  local UserInputService = game:GetService("UserInputService")
  local autoFpsSaverEnabled = false
  local originalFpsCap = 240
  local isFocused = true
  local function updateFps()
  	if not autoFpsSaverEnabled then return end
  	if isFocused then
  		if setfpscap then
  			setfpscap(originalFpsCap)
  		end
  	else
  		if setfpscap then
  			setfpscap(60)
  		end
  	end
  end
  local DynamicFPS = Tab:Toggle({
  	Title = "Dynamic FPS",
  	Desc = "Giảm FPS khi mất focus",
      Type = "Checkbox",
  	Default = true,
  	Callback = function(state)
  		autoFpsSaverEnabled = state
  		updateFps()
  	end
  })
  UserInputService.WindowFocused:Connect(function()
  	isFocused = true
  	updateFps()
      DynamicFPS:Unlock()
  end)
  UserInputService.WindowFocusReleased:Connect(function()
      DynamicFPS:Lock()
  	isFocused = false
  	updateFps()
  end)
  DynamicFPS:Set(false)
  DynamicFPS:Set(true)
  
  local pingfps = Tab:Button({
      Title = "Ping/FPS",
      Desc = "Hiện fps và ping",
      Locked = false,
      Callback = function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/soctrungkien/scriptroblox/refs/heads/main/Script/Ping_FPS.lua"))()
      end
  })
  
  local hop = Server:Button({
      Title = "Server hop",
      Desc = "Chuyến sang máy chủ khác",
      Locked = false,
      Callback = function()
  local TeleportService = game:GetService("TeleportService")
  local Players = game:GetService("Players")
  
  local player = Players.LocalPlayer
  local placeId = game.PlaceId
  local jobId = game.JobId
  
  TeleportService:TeleportToPlaceInstance(placeId, jobId, player)
      end
  })

local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local API = "https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100"
local function ListServers(cursor)
    local raw = game:HttpGet(API .. ((cursor and "&cursor="..cursor) or ""))
    return HttpService:JSONDecode(raw)
end
local function RandomServer()
    local nextCursor
    repeat
        local data = ListServers(nextCursor)
        if #data.data > 0 then
            local srv = data.data[math.random(1, #data.data)]
            if srv.playing < srv.maxPlayers and srv.id ~= game.JobId then
                TeleportService:TeleportToPlaceInstance(game.PlaceId, srv.id, Players.LocalPlayer)
                return
            end
        end
        nextCursor = data.nextPageCursor
    until not nextCursor
end
local function SmallestServer()
    local nextCursor
    local smallest
    repeat
        local data = ListServers(nextCursor)
        for _, srv in ipairs(data.data) do
            if srv.playing < srv.maxPlayers and srv.id ~= game.JobId then
                if not smallest or srv.playing < smallest.playing then
                    smallest = srv
                end
            end
        end
        nextCursor = data.nextPageCursor
    until not nextCursor
    if smallest then
        TeleportService:TeleportToPlaceInstance(game.PlaceId, smallest.id, Players.LocalPlayer)
    end
end
  local hoprandom = Server:Button({
      Title = "Random server",
      Desc = "Chuyến sang máy chủ ngẫu nhiên",
      Locked = false,
      Callback = function()
            RandomServer()
      end
  })
  local hopitnhat = Server:Button({
      Title = "Server ít nhất",
      Desc = "Vào server ít nhất",
      Locked = false,
      Callback = function()
            SmallestServer()
      end
  })
  
  local rejoin = Server:Button({
      Title = "Rejoin",
      Desc = "Vào lại máy chủ",
      Locked = false,
      Callback = function()
  local TeleportService = game:GetService("TeleportService")
  local Players = game:GetService("Players")
  
  local player = Players.LocalPlayer
  local placeId = game.PlaceId
  
  TeleportService:TeleportToPlaceInstance(placeId, player)
      end
  })
  
  joinjobida = nil
  local joinjobid = Server:Input({
      Title = "Join JobID",
      Desc = "Vào máy chủ theo JobID",
      Type = "Input",
      Placeholder = "JobID",
      Callback = function(input) 
          joinjobida = input
      end
  })
  local joinjobidb = Server:Button({
      Title = "Vào ngay",
      Desc = "",
      Locked = false,
      Callback = function()
  local TeleportService = game:GetService("TeleportService")
  local Players = game:GetService("Players")
  
  local player = Players.LocalPlayer
  local placeId = game.PlaceId
  
  TeleportService:TeleportToPlaceInstance(placeId, joinjobida, player)
      end
  })
  
  local function btp(title, posStr)
      local button = Teleport:Button({
          Title = title,
          Desc = "Teleport to " .. title,
          Callback = function()
              local player = game:GetService("Players").LocalPlayer
              local char = player.Character or player.CharacterAdded:Wait()
              local x, y, z = string.match(posStr, "([^,]+), ([^,]+), ([^,]+)")
              if x and y and z then
                  local position = Vector3.new(tonumber(x), tonumber(y), tonumber(z))
                  char:MoveTo(position)
              else
                  warn("Lỗi định dạng toạ độ: " .. tostring(posStr))
              end
          end
      })
      return button
  end
  btp("Spawn", "53.0508041, 6.6963253, -98.8041611")
  btp("Floating Island", "-15.8544874, 422.843353, 143.418152")
  btp("Outer Space", "41.5017853, 2664.79126, -6.39852905")
  btp("Twilight", "-77.9364624, 6862.26904, 88.3281555")
  btp("The Void", "15.9753952, 10146.3271, 151.715363")
  btp("Zen", "36.297184, 15972.0498, 41.8721008")
  btp("Spawn2", "9859.81738, 24.1498051, 199.415665")
  btp("Dice Island", "9884.26855, 2907.49609, 199.902283")
  btp("Minecart Forest", "9890.02637, 7681.9292, 212.694992")
  btp("Robot Factory", "9890.62012, 13409.3359, 243.296143")
  btp("Hyperwave Island", "9868.45508, 20086.5781, 224.60611")
  btp("Fisher's Island - Spawn3", "-23663.4004, 7.8403697, 4.42315435")
  btp("Blizzard Hills", "-21498.3711, 13.6800747, -100762.172")
  btp("Poison Jungle", "-19332.5586, 13.7693138, 18962.832")
  btp("Infernite Volcano", "-17226.0273, 10.4870262, -20442.7285")
  btp("Lost Atlantis", "-13991.0713, 9.91697502, -20410.2285")
  btp("Dream Island", "-21817.9, 6.31724, -20524")
  btp("Classic Island", "-41525.7, 6.41706, -20508.7")
  
  local Players = game:GetService("Players")
  local VirtualUser = game:GetService("VirtualUser")
  local AntiAFKEnabled = true
  Players.LocalPlayer.Idled:Connect(function()
      if AntiAFKEnabled then
          VirtualUser:CaptureController()
          VirtualUser:ClickButton2(Vector2.new(0, 0))
      end
  end)
  local AntiAFKToggle = Tab:Toggle({
      Title = "Anti-AFK",
      Desc = "Ngăn bị kick khi AFK",
      Type = "Checkbox",
      Default = true,
      Callback = function(state)
          AntiAFKEnabled = state
      end
  })
  AntiAFKToggle:Set(false)
  AntiAFKToggle:Set(true)
  

local BestPets = EggsandPets:Button({
    Title = "Equip Best Pets",
    Desc = "Trang bị pets tốt nhất",
    Locked = false,
    Callback = function()
local args = {
	"EquipBestPets"
}
game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
    end
})

local AutoPickup = Auto:Toggle({
    Title = "Auto Pickup",
    Desc = "Tự động nhặt coins và gems",
    Type = "Checkbox",
    Default = false,
    Callback = function(state)
	while true do
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local Client = ReplicatedStorage.Client
        local Tutorial = require(Client.Tutorial)
        autoCollectCoinsValue = state
        if autoCollectCoinsValue then
            task.spawn(function()
                while autoCollectCoinsValue do
                    if Tutorial and Tutorial._activePickups then
                        for i, v in pairs(Tutorial._activePickups) do
                            if v and v.Parent then
                                local success, err = pcall(function()

                                end)
                                if not success then
                                    warn("Lỗi khi Destroy pickup:", err)
                                else
                                    Tutorial._activePickups[tostring(i)] = nil
                                    game:GetService("ReplicatedStorage").Remotes.Pickups.CollectPickup:FireServer(i)
                                end
                                task.wait(0.001)
                            end
                        end
                    else
                        warn("Tutorial hoặc _activePickups không tồn tại!")
                    end
                    task.wait(0.001)
                end
            end)
        end
	task.wait(5)
	end
    end
})

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local AntiMod = true
Players.PlayerAdded:Connect(function(player)
    if player.UserId == game.CreatorId and AntiMod == true then
        LocalPlayer:Kick("Admin Joined! (" .. player.Name .. ")")
    end
end)
for _, player in ipairs(Players:GetPlayers()) do
    if player.UserId == game.CreatorId and AntiMod == true then
        LocalPlayer:Kick("Admin Already In Game! (" .. player.Name .. ")")
        break
    end
end

local AntiAd = Tab:Toggle({
    Title = "Anti Admin",
    Desc = "Kick khi admin vào",
    Type = "Checkbox",
    Default = true,
    Callback = function(state) 
        AntiMod = state
    end
})
AntiAd:Set(false)
AntiAd:Set(true)
