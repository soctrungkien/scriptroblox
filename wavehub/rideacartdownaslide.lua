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
    Author = "Universal - " .. info.Name,
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
local Player = Window:Tab({
    Title = "Player",
    Icon = "ghost"
})
local Server = Window:Tab({
    Title = "Server",
    Icon = "server"
})

local xe = Window:Tab({
    Title = "Cart",
    Icon = "shopping-cart",
})

Window:SelectTab(1)

local fly = Player:Button({
    Title = "Bay",
    Desc = "by XNEO",
    Locked = false,
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
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

noclipfasttoggle = false
game:GetService("RunService").Stepped:Connect(function()
    if noclipfasttoggle then
        local char = LocalPlayer.Character
        if char then
            for _, v in pairs(char:GetDescendants()) do
                if v:IsA("BasePart") and v.CanCollide then
                    v.CanCollide = false
                end
            end
        end
    end
end)
  local fastnoclip = Player:Toggle({
  	Title = "[⚡] Noclip",
  	Desc = "[FastNoClip]",
  	Type = "Checkbox",
  	Default = false,
  	Callback = function(state)
        noclipfasttoggle = state
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
  
    local gui = game.Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("PlaytimeRewardsGui")
    local RemotePlaytime = game:GetService("ReplicatedStorage"):WaitForChild("PlaytimeRewards")
    local totalRewards = 6

    for i = 1, totalRewards do
        local rewardFrame = gui.PlaytimeFrame.Frame:FindFirstChild("RewardFrame" .. i)
        if rewardFrame then
            local claimButton = rewardFrame:WaitForChild("ClaimButton")
                if claimButton.Text == "Claim" then
                    RemotePlaytime:FireServer(tostring(i))
                    claimButton.Text = "WaveHub ✅"
                end
            claimButton:GetPropertyChangedSignal("Text"):Connect(function()
                if claimButton.Text == "Claim" then
                    RemotePlaytime:FireServer(tostring(i))
                    claimButton.Text = "WaveHub"
                end
            end)
        end
    end
  
local uia = false
local ishowspeed = false
local lat = false
task.spawn(function()
while true do
if uia then
game:GetService("ReplicatedStorage"):WaitForChild("Turn"):FireServer()
end
if ishowspeed then
game:GetService("ReplicatedStorage"):WaitForChild("Forward"):FireServer(norm)
end
if lat then
game:GetService("ReplicatedStorage"):WaitForChild("Flip"):FireServer()
end
task.wait(0.06)
end
end)

  local uia = xe:Toggle({
      Title = "UUUUIAUUIAUUUUUUIAAUUUUUUUIAUUUIAUUUUUUIAAAUUUUUUUUUIAUUUUUUIAUUUUUUUIAUUUIAUUUUUUIAAAUUUUUUIAUUUUUUUUUUIAAUUUUUUUIAUUUIAUUUUUUIAAAUUUUIAUUIAUUUUUUIAAUUUUUUUIAUUUIAUUUUUUIAAAUUUUIAUUUIAUUUUUUIAAUUUUUUUIAUUUIAUUUUUUIAAAUUUUUUIAUUUUUUUUUUIAAUUUUUUUIAUUUIAUUUUUUIAAAUUUUUUIAUUUUUUUUUUIAAUU",
      Type = "Checkbox",
      Default = false,
      Callback = function(state)
uia = state
      end
  })
  
  local stop = xe:Toggle({
      Title = "Stop",
      Type = "Checkbox",
      Default = false,
      Callback = function(state)
        if state then
game:GetService("ReplicatedStorage"):WaitForChild("Brake"):FireServer(norm)
        else
game:GetService("ReplicatedStorage"):WaitForChild("StopBrake"):FireServer()
        end
      end
  })
  
  local latlai = xe:Toggle({
      Title = "ko ai tắm 2 lần trên 1 dòng sông", 
      Type = "Checkbox",
      Default = false,
      Callback = function(state)
lat = state
      end
  })
  
  local bantho = xe:Toggle({
      Title = "tốc độ i show bàn thờ", 
      Type = "Checkbox",
      Default = false,
      Callback = function(state)
ishowspeed = state
      end
  })
