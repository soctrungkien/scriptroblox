print("[infU] Loading")
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "infU",
    Text = "Loading",
    Duration = 1
})
repeat wait() until game:IsLoaded()
local identity = getthreadidentity()
pcall(function()
local getinfo = getinfo or debug.getinfo
local DEBUG = true
local Hooked = {}
local Detected, Kill
setthreadidentity(2)
for i, v in getgc(true) do
    if typeof(v) == "table" then
        local DetectFunc = rawget(v, "Detected")
        local KillFunc = rawget(v, "Kill")
        if typeof(DetectFunc) == "function" and not Detected then
            Detected = DetectFunc
            local Old; Old = hookfunction(Detected, function(Action, Info, NoCrash)
                if Action ~= "_" then
                    if DEBUG then
                        warn(`Adonis AntiCheat flagged\nMethod: {Action}\nInfo: {Info}`)
                    end
                end
                return true
            end)
            table.insert(Hooked, Detected)
        end
        if rawget(v, "Variables") and rawget(v, "Process") and typeof(KillFunc) == "function" and not Kill then
            Kill = KillFunc
            local Old; Old = hookfunction(Kill, function(Info)
                if DEBUG then
                    warn(`Adonis AntiCheat tried to kill (fallback): {Info}`)
                end
            end)
            table.insert(Hooked, Kill)
        end
    end
end
local Old; Old = hookfunction(getrenv().debug.info, newcclosure(function(...)
    local LevelOrFunc, Info = ...

    if Detected and LevelOrFunc == Detected then
        if DEBUG then
            warn(`Adonis AntiCheat sanity check detected and broken`)
        end

        return coroutine.yield(coroutine.running())
    end
    
    return Old(...)
end))
end)
setthreadidentity(9)
setthreadidentity(7)
setthreadidentity(9)
setthreadidentity(10)
setthreadidentity(identity)
local old_identifyexecutor = identifyexecutor
if not _G.hooknameexec then
_G.hooknameexec = true
getgenv().identifyexecutor = function()
    if old_identifyexecutor then
        local name, version = old_identifyexecutor()
        return "[infU] " .. tostring(name),"[infU] " .. version
    else
        return "[infU] Unknown", "[infU] Unknown"
    end
end
end
setfpscap(999999)
setfpscap(240)
getgenv().RAYFIELD_ASSET_ID = 10804731440
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
if not Rayfield then
	print("[infU] Rayfield no load")
	game:GetService("StarterGui"):SetCore("SendNotification", {
	    Title = "infU",
	    Text = "Rayfield trong quá trình tải đã bị lỗi",
	    Duration = 1
	})
end
local b = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
function b64_encode(data)
    local encoded = ((data:gsub('.', function(x)
        local r, bits = '', x:byte()
        for i = 8, 1, -1 do
            r = r .. (bits % 2^i - bits % 2^(i-1) > 0 and '1' or '0')
        end
        return r
    end)..'0000'):gsub('%d%d%d?%d?%d?%d?', function(x)
        if #x < 6 then return '' end
        local c = 0
        for i = 1, 6 do
            c = c + (x:sub(i,i) == '1' and 2^(6-i) or 0)
        end
        return b:sub(c+1, c+1)
    end)..({ '', '==', '=' })[#data%3+1])

    return encoded:gsub("=", "")
end

function b64_decode(data)
    local pad = #data % 4
    if pad > 0 then
        data = data .. string.rep("=", 4 - pad)
    end

    data = data:gsub('[^'..b..'=]', '')

    return (data:gsub('.', function(x)
        if x == '=' then return '' end
        local r, f = '', (b:find(x) - 1)
        for i = 6, 1, -1 do
            r = r .. (f % 2^i - f % 2^(i-1) > 0 and '1' or '0')
        end
        return r
    end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x)
        if #x ~= 8 then return '' end
        local c = 0
        for i = 1, 8 do
            c = c + (x:sub(i,i) == '1' and 2^(8-i) or 0)
        end
        return string.char(c)
    end))
end
function xor(data, key)
    local result = {}
    for i = 1, #data do
        local k = key:byte((i - 1) % #key + 1)
        local d = data:byte(i)
        result[i] = string.char(bit32.bxor(d, k))
    end
    return table.concat(result)
end
local function loadsc(url, title, fast)
   local fileName = "cache_" .. b64_encode(xor(tostring(title):gsub("[^%w_]+", ""), url)):gsub("[^%w_]+", "") .. ".txt"
	print("[infU] Đang tải " .. title)
	if Rayfield then
   Rayfield:Notify({
      Title = title,
      Content = "Đang tải script",
      Duration = 3,
      Image = "code"
   })
	end
   local function run(code)
      local f = loadstring(code)
      if f then
         return f()
      end
   end

	local function getOnline()
	    while true do
	        local success, result = pcall(function()
	            return game:HttpGet(url)
	        end)
	
	        if success and result then
	            return result
	        end
	
	        warn("[infU] Lỗi lấy file ".. title .. ", đang retry...")
	        task.wait(0.2)
	    end
	end

	local ok, err = pcall(function()
		if isfile(fileName) then
		   local localData = readfile(fileName)
		
		   if fast then
		      task.spawn(function()
		         run(xor(b64_decode(localData), url))
		      end)
		
		      task.spawn(function()
		         local onlineData = b64_encode(xor(getOnline(), url))
		         if onlineData and onlineData ~= localData then
		            writefile(fileName, onlineData)
		         end
		      end)
		   else
		      local onlineData = getOnline()
		      run(onlineData)
		   end
		
		else
		   local data = getOnline()
		   run(data)
		
		   if fast then
		      pcall(function()
		         writefile(fileName, b64_encode(xor(data, url)))
		      end)
		   end
		end
	end)

   if ok then
	print("[infU] Đã tải thành công " .. title)
	if Rayfield then
      Rayfield:Notify({
         Title = "Done",
         Content = "Đã tải script " .. title .. " thành công",
         Duration = 3,
         Image = "check"
      })
	end
   else
	print("[infU] " .. title .. "Lỗi: " .. err)
	if Rayfield then
      Rayfield:Notify({
         Title = title .. " ERROR",
         Content = err,
         Duration = 3,
         Image = 6646234362
      })
	end
   end
end
local function loadImageFromURL(url)
    local file = ("cache_img_" .. b64_encode(xor(tostring(url):gsub("[^%w_]+", ""), "S0VZX2t1NWktbGYwNC00Y291")):gsub("[^%w_]+", "") .. ".png")

    if not isfile(file) then
        local success, data = pcall(function()
            return game:HttpGet(url)
        end)

        if success and data then
            writefile(file, data)
            print("[infU] [OK] Đã tải: ", file)
        else
            warn("[infU] [FAIL] Không tải được: ", url)
            return nil
        end
    else
        print("[infU] [CACHE] Đã có sẵn: ", file)
		task.spawn(function()
			local success, data = pcall(function()
	            return game:HttpGet(url)
	        end)
	
	        if success and data then
	            writefile(file, data)
	            print("[infU] [OK] Đã tải: ", file)
	        else
	            warn("[infU] [FAIL] Không tải được: ", url)
	            return nil
	        end
		end)
    end

    if getcustomasset then
        return getcustomasset(file)
    elseif getsynasset then
        return getsynasset(file)
    else
        warn("[infU] Executor không hỗ trợ asset local ")
        return nil
    end
end
local function getAvatar(id)
    local data = game:HttpGet("https://thumbnails.roblox.com/v1/users/avatar-headshot?userIds="
        .. id .. "&size=420x420&format=Png&isCircular=false")

    local json = game:GetService("HttpService"):JSONDecode(data)
	print("[infU] " .. data)
    return json.data[1].imageUrl
end
local function getGameIcon(id)
    local data = game:HttpGet("https://thumbnails.roblox.com/v1/games/icons?universeIds="
        .. id .. "&size=512x512&format=Png&isCircular=false")

    local json = game:GetService("HttpService"):JSONDecode(data)
	print("[infU] " .. data)
    return json.data[1].imageUrl
end
local function checkPremium()
    local premium = "Không rõ"
    local success, response =
        pcall(function()
            return game:GetService("Players").LocalPlayer.MembershipType
        end)

    if success then
        if response == Enum.MembershipType.None then
            premium = "Không"
        else
            premium = "Có"
        end
    else
        premium = "Không thể lấy trạng thái Membership"
    end
    return premium
end
local Services = {}
local serviceCache = {}
setmetatable(Services, {
    __index = function(self, name)
        if serviceCache[name] then return serviceCache[name] end
        
        local success, service = pcall(function()
            return cloneref(game:GetService(name))
        end)
        
        if success and service then
            serviceCache[name] = service
            return service
        else
            warn("[infU] Service fail: " .. tostring(name))
            local realService = game:GetService(name) 
            serviceCache[name] = realService
            return realService
        end
    end
})
getgenv().loadername = ""
getrenv().loadername = ""
getgenv().AntiKickScriptCore = true
local AntiKickScriptCore
TeleportService = Services.TeleportService
local TeleportService = TeleportService
local Players = Services.Players
local LocalPlayer = Players.LocalPlayer
local old
local isnamecallhook = false
local function hookantikick()
pcall(function()
isnamecallhook = true
old = hookmetamethod(game, "__namecall", function(self, ...)
    local method = getnamecallmethod()

    if getgenv().AntiKickScriptCore and self == LocalPlayer then
        if method == "Kick" then
			print("\n[infU] ===== KICK DETECTED =====")
	        print("[infU] Target:", self)
            return warn("[infU] [ANTI-KICK]")
        end
    end

    return old(self, ...)
end)
end)
end
local COREGUI = Services.CoreGui
local screenGuiblack = Instance.new("ScreenGui")
screenGuiblack.Name = "BlackoutOverlay"
screenGuiblack.ResetOnSpawn = false
screenGuiblack.IgnoreGuiInset = true
screenGuiblack.DisplayOrder = 999999
screenGuiblack.Parent = COREGUI
local black = Instance.new("Frame")
black.Size = UDim2.new(100, 0, 100, 0)
black.Position = UDim2.new(0, 0, 0, 0)
black.BackgroundColor3 = Color3.new(0, 0, 0)
black.BackgroundTransparency = 1
black.ZIndex = 999999
black.Parent = screenGuiblack
repeat wait() until COREGUI:FindFirstChildWhichIsA("ScreenGui")
for _, v in pairs(COREGUI:GetDescendants()) do
    if v.Name == "Rayfield" then
        v.DisplayOrder = 99999999
    end
end
local MarketplaceService = Services.MarketplaceService
local placeId = game.PlaceId
local success, info = pcall(function()
    return MarketplaceService:GetProductInfo(placeId, Enum.InfoType.Asset)
end)
local AntiAFKEnabled = false
Services.Players.LocalPlayer.Idled:Connect(function()
    if AntiAFKEnabled then
        Services.VirtualUser:CaptureController()
        Services.VirtualUser:ClickButton2(Vector2.new(0, 0))
    end
end)
loadsc("https://pastefy.app/bIsOY8bK/raw", "FixlagModule", true)
local Window = Rayfield:CreateWindow({
   Name = "「infU」| " .. info.Name,
   Icon = "infinity",
   LoadingTitle = "「\u{E002}」Đang mở Menu infU...",
   LoadingSubtitle = "Đang tải dữ liệu...",
   ToggleUIKeybind = "G",
   DisableRayfieldPrompts = true,
   ConfigurationSaving = {
      Enabled = false,
      FileName = "infU"
   }
})

local updatefpspingtime = 100
local fps = 0
local ping = 0
local Stats = Services.Stats
local function getPing()
	local network = Stats:FindFirstChild("Network")
	if not network then return 0 end
	local serverStats = network:FindFirstChild("ServerStatsItem")
	if not serverStats then return 0 end
	local dataPing = serverStats:FindFirstChild("Data Ping")
	if not dataPing then return 0 end
	local ok, value = pcall(function()
		return dataPing:GetValue()
	end)
	if ok and typeof(value) == "number" then
		return math.floor(value)
	end
	return 0
end
task.spawn(function()
local lastUpdate = tick()
repeat wait() until COREGUI:FindFirstChildWhichIsA("ScreenGui")
Services.RunService.RenderStepped:Connect(function(dt)
fps = math.floor(1 / dt)
if tick() - lastUpdate >= updatefpspingtime / 1000 then
lastUpdate = tick()
for _, v in pairs(COREGUI:GetDescendants()) do
    if v.Name == "Rayfield" and v:FindFirstChild("Prompt") then
        v.Prompt.Title.Text = string.format("%d ms | %d FPS", getPing(), fps)
    end
end
end
end)
end)
local lowerName = Services.Players.LocalPlayer.Name:lower()
local lowerDisplayName = Services.Players.LocalPlayer.DisplayName:lower()
local originalTextValues = {}
local cachedText = {}
local randomUsername = "infU_" .. math.random(100, 3999)
local function storeOriginalText(element)
	originalTextValues[element] = element.Text
end
local function undoAnonymousChanges()
	for element, originalText in pairs(originalTextValues) do
		element.Text = originalText
	end
end
local anonmode = false
for _, instance in next, game:GetDescendants() do
	if instance:IsA("TextLabel") or instance:IsA("TextButton") then
		if not table.find(cachedText, instance) then
			table.insert(cachedText, instance)
		end
	end
end
task.spawn(function()
	Services.RunService.RenderStepped:Connect(function()
		if anonmode then
			for _, text in ipairs(cachedText) do
				local lowerText = string.lower(text.Text)
				if string.find(lowerText, lowerName, 1, true) or string.find(lowerText, lowerDisplayName, 1, true) then
					storeOriginalText(text)
					local newText = string.gsub(string.gsub(lowerText, lowerName, randomUsername), lowerDisplayName, randomUsername)
					text.Text = string.gsub(newText, "^%l", string.upper)
				end
			end
		else
			undoAnonymousChanges()
		end
	end)
end)
game.DescendantAdded:Connect(function(instance)
	if instance:IsA("TextLabel") or instance:IsA("TextButton") then
		if not table.find(cachedText, instance) then
			table.insert(cachedText, instance)
		end
	end
end)
getgenv().bridge_Notify = function(Title, Content, Duration, Image)
    Rayfield:Notify({
        Title = Title,
        Content = Content,
        Duration = Duration,
        Image = Image
    })
end
local infinJumpEnabled = false
Services.UserInputService.JumpRequest:Connect(function()
local Players = Services.Players
local UserInputService = Services.UserInputService
local player = Players.LocalPlayer
  if infinJumpEnabled then
      local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
      if humanoid then
          humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
          task.wait()
          humanoid:ChangeState(Enum.HumanoidStateType.Seated)
      end
  end
end)
local noclipfasttoggle = false
task.spawn(function()
Services.RunService.Stepped:Connect(function()
    if noclipfasttoggle then
        local player = Services.Players.LocalPlayer
        local char = player.Character
        if char then
            for _, v in pairs(char:GetDescendants()) do
                if v:IsA("BasePart") then
                    v.CanCollide = false
                end
            end
        end
    end
end)
end)
local WRDClickTeleport = false
task.spawn(function()
    local player = Services.Players.LocalPlayer
    local UserInputService = Services.UserInputService
    local mouse = player:GetMouse()

    repeat wait() until mouse

    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            if WRDClickTeleport and UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
                  local char = player.Character
                  if char and char:FindFirstChild("HumanoidRootPart") then
                      char:MoveTo(Vector3.new(mouse.Hit.x, mouse.Hit.y + 3, mouse.Hit.z)) 
                  end
              end
          end
      end)
end)
local clicktotouch = false
Services.Players.LocalPlayer:GetMouse().Button1Down:Connect(function()
	if clicktotouch and Services.UserInputService:IsKeyDown(Enum.KeyCode.LeftAlt) then
	    local target = Services.Players.LocalPlayer:GetMouse().Target
	    if target and target:IsA("BasePart") then
	        local char = Services.Players.LocalPlayer.Character or Services.Players.LocalPlayer.CharacterAdded:Wait()
	        local hrp = char:WaitForChild("HumanoidRootPart")
	
	        firetouchinterest(hrp, target, 0)
	        task.wait(0.05)
	        firetouchinterest(hrp, target, 1)
	    end
	end
end)
Services.StarterPlayer.EnableMouseLockOption = true
game.Players.LocalPlayer:SetAttribute("CanRespawn", true)

local TabInfo = Window:CreateTab("Thông tin", loadImageFromURL(getAvatar(Services.Players.LocalPlayer.UserId)))
local TabScriptAny = Window:CreateTab("Script", loadImageFromURL(getGameIcon(game.GameId)))
local TabSet = Window:CreateTab("Cài đặt", "settings")
local TabServer = Window:CreateTab("Máy chủ", "server")

--Script
if game.GameId == 994732206 then
TabScriptAny:CreateButton({
   Name = "[Auto Farm] Quantum Onyx" .. " for " .. info.Name,
   Callback = function()
		loadsc("https://raw.githubusercontent.com/flazhy/QuantumOnyx/refs/heads/main/QuantumOnyx.lua", "QuantumOnyx", false)
   end
})
TabScriptAny:CreateButton({
   Name = "[PVP] Hermanos Hub" .. " for " .. info.Name,
   Callback = function()
		loadsc("https://raw.githubusercontent.com/hermanos-dev/hermanos-hub/refs/heads/main/Loader.lua", "HermanosHub", false)
   end
})
TabScriptAny:CreateButton({
   Name = "[Auto Nhặt Rương] LongHihiAutoChest" .. " for " .. info.Name,
   Callback = function()
		loadsc("https://raw.githubusercontent.com/longhihilonghihi-hub/Auto-Chest/refs/heads/main/MainV1.Luau", "LongHihiAutoChest", false)
   end
})
elseif game.PlaceId == 10260193230 then
TabScriptAny:CreateButton({
   Name = "[Auto Farm] Redz Hub" .. " for " .. info.Name,
   Callback = function()
		loadsc("https://raw.githubusercontent.com/tlredz/Scripts/refs/heads/main/main.luau", "Redz", false)
   end
})
elseif game.PlaceId == 70743305607680 then
TabScriptAny:CreateButton({
   Name = "Wave Hub" .. " for " .. info.Name,
   Callback = function()
		loadsc("https://raw.githubusercontent.com/soctrungkien/scriptroblox/refs/heads/main/abcdef/BuildBlox.lua", "WaveHubBB", false)
   end
})
elseif game.PlaceId == 85896571713843 then
TabScriptAny:CreateButton({
   Name = "Wave Hub" .. " for " .. info.Name,
   Callback = function()
		loadsc("https://raw.githubusercontent.com/soctrungkien/scriptroblox/refs/heads/main/abcdef/BubbleGumSimulator.lua", "WaveHubBGS", false)
   end
})
elseif game.PlaceId == 87067157937644 then
TabScriptAny:CreateButton({
   Name = "Wave Hub" .. " for " .. info.Name,
   Callback = function()
		loadsc("https://raw.githubusercontent.com/soctrungkien/scriptroblox/refs/heads/main/abcdef/blocc.lua", "WaveHubblocc", false)
   end
})
elseif game.PlaceId == 108180976346281 then
TabScriptAny:CreateButton({
   Name = "Wave Hub" .. " for " .. info.Name,
   Callback = function()
		loadsc("https://raw.githubusercontent.com/soctrungkien/scriptroblox/refs/heads/main/abcdef/crosstheroad.lua", "WaveHubctr", false)
   end
})
elseif game.PlaceId == 112555408629538 then
TabScriptAny:CreateButton({
   Name = "Wave Hub" .. " for " .. info.Name,
   Callback = function()
		loadsc("https://raw.githubusercontent.com/soctrungkien/scriptroblox/refs/heads/main/abcdef/lowcortisolobby.lua", "WaveHublcl", false)
   end
})
elseif game.PlaceId == 103854444055060 then
TabScriptAny:CreateButton({
   Name = "Script auto kill, esp" .. " for " .. info.Name,
   Callback = function()
		loadsc("https://raw.githubusercontent.com/waidaito/Silent-Assassin-/refs/heads/main/satthuthamlangbanvn.lua", "satthuthamlangbanvn", false)
   end
})
elseif game.PlaceId == 114640202062357 then
TabScriptAny:CreateButton({
   Name = "Sulfur Hub" .. " for " .. info.Name,
   Callback = function()
		loadsc("https://api.luarmor.net/files/v4/loaders/abb6f778df552245e3e937c9e79b01d4.lua", "SulfurHub", false)
   end
})
elseif game.PlaceId == 124473577469410 then
TabScriptAny:CreateButton({
   Name = "SFG Hub" .. " for " .. info.Name,
   Callback = function()
		loadsc("https://gist.githubusercontent.com/ScriptsForDays/bfb7bfcb45832f7fcd81e50b9c149190/raw/829bdb8e30d8a060a61878eedf19e2f644e49e24/SFG-OP-BLAB-v1.0.35", "SFGHub", false)
   end
})
end

--Script Chung
TabScriptAny:CreateButton({
   Name = "Infinite Yield",
   Callback = function()
loadsc("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source", "iy", true)
   end
})
TabScriptAny:CreateButton({
   Name = "SimpleSpy",
   Callback = function()
loadsc("https://raw.githubusercontent.com/infyiff/backup/main/SimpleSpyV3/main.lua", "rspy", true)
   end
})
TabScriptAny:CreateButton({
   Name = "Dex",
   Callback = function()
loadsc("https://raw.githubusercontent.com/infyiff/backup/main/dex.lua", "dex", true)
   end
})
TabScriptAny:CreateButton({
   Name = "Motiona FE Animations",
   Callback = function()
loadsc("https://raw.githubusercontent.com/BeemTZy/Motiona/refs/heads/main/source.lua", "animation", true)
   end
})
TabScriptAny:CreateButton({
   Name = "FE EMOTES",
   Callback = function()
loadsc("https://raw.githubusercontent.com/7yd7/Hub/refs/heads/Branch/GUIS/Emotes.lua", "emotes", true)
   end
})
TabScriptAny:CreateButton({
   Name = "FPS/PING Window",
   Callback = function()
loadsc("https://raw.githubusercontent.com/soctrungkien/scriptroblox/refs/heads/main/Script/Ping_FPS.lua", "fpsping", true)
   end
})
TabScriptAny:CreateButton({
   Name = "FLY",
   Callback = function()
loadsc("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt", "fly", true)
   end
})
TabScriptAny:CreateButton({
   Name = "Tp Tool",
   Callback = function()
loadsc("https://pastefy.app/hkdcsUJe/raw", "infu_tp_tool", true)
   end
})
TabScriptAny:CreateButton({
   Name = "Click to touch Tool",
   Callback = function()
loadsc("https://pastefy.app/EJ18alOo/raw", "clicktotouchtool", true)
   end
})
TabScriptAny:CreateButton({
   Name = "F3X",
   Callback = function()
loadsc("https://raw.githubusercontent.com/infyiff/backup/refs/heads/main/f3x.lua", "f3x", true)
   end
})
TabScriptAny:CreateButton({
   Name = "Con sóc và cái lọ",
   Callback = function()
loadsc("https://pastefy.app/U6g6GPiR/raw", "lo", true)
   end
})
TabScriptAny:CreateButton({
   Name = "ShiftlockMobile",
   Callback = function()
loadsc("https://pastefy.app/88nd9iSy/raw", "ShiftlockMobile", true)
   end
})
TabScriptAny:CreateButton({
   Name = "Spin GUI",
   Callback = function()
loadsc("https://pastefy.app/QvVfsI02/raw", "spin", true)
   end
})
TabScriptAny:CreateButton({
   Name = "PShade",
   Callback = function()
loadsc("https://raw.githubusercontent.com/randomstring0/pshade-ultimate/refs/heads/main/src/back.json", "pshade", true)
   end
})
TabScriptAny:CreateButton({
   Name = "Octo~Spy",
   Callback = function()
loadsc("https://raw.githubusercontent.com/InfernusScripts/Octo-Spy/refs/heads/main/Main.lua", "octospy", true)
   end
})
TabScriptAny:CreateButton({
   Name = "Ketamine",
   Callback = function()
loadsc("https://raw.githubusercontent.com/InfernusScripts/Ketamine/refs/heads/main/Ketamine.lua", "ketamine", true)
   end
})
TabScriptAny:CreateButton({
   Name = "K1LAS1K-UltimateFlingGUI",
   Callback = function()
loadsc("https://raw.githubusercontent.com/K1LAS1K/Ultimate-Fling-GUI/main/flingscript.lua", "K1LAS1K-UltimateFlingGUI", true)
   end
})
TabScriptAny:CreateButton({
   Name = "Animation logger",
   Callback = function()
loadsc("https://pastefy.app/HZNALPbO/raw", "anilog", true)
   end
})
TabScriptAny:CreateButton({
   Name = "VirtualKeyboard",
   Callback = function()
loadsc("https://raw.githubusercontent.com/ltseverydayyou/uuuuuuu/refs/heads/main/VirtualKeyboard.lua", "VirtualKeyboard", true)
   end
})
TabScriptAny:CreateButton({
   Name = "Teleport to player",
   Callback = function()
loadsc("https://raw.githubusercontent.com/soctrungkien/scriptroblox/refs/heads/main/Script/TP.lua", "plytpgui", true)
   end
})
TabScriptAny:CreateButton({
   Name = "Dragon Hub",
   Callback = function()
loadsc("https://raw.githubusercontent.com/soctrungkien/scriptroblox/refs/heads/main/Menu.lua", "dragonhub", true)
   end
})
TabScriptAny:CreateButton({
   Name = "Wave Hub Universal",
   Callback = function()
		loadsc("https://raw.githubusercontent.com/soctrungkien/scriptroblox/refs/heads/main/abcdef/Universal.lua", "WaveHubUniversal", true)
   end
})
TabScriptAny:CreateButton({
   Name = "Edge's Audio Logger",
   Callback = function()
		loadsc("https://raw.githubusercontent.com/EdgeIY/audiologger/refs/heads/main/source", "audiologger", true)
   end
})
TabScriptAny:CreateButton({
   Name = "Aimbot",
   Callback = function()
		loadsc("https://raw.githubusercontent.com/Exunys/AirHub/main/AirHub.lua", "aimbot", true)
   end
})
TabScriptAny:CreateButton({
   Name = "Sirius",
   Callback = function()
		loadsc("https://sirius.menu/sirius", "Sirius", true)
   end
})
TabScriptAny:CreateButton({
   Name = "Place Finder",
   Callback = function()
		loadsc("https://pastefy.app/caPvwBGb/raw", "placefinder", true)
   end
})
TabScriptAny:CreateButton({
   Name = "Simple Shader",
   Callback = function()
		loadsc("https://raw.githubusercontent.com/p0e1/1/refs/heads/main/SimpleShader.lua", "SimpleShader", true)
   end
})
TabScriptAny:CreateButton({
   Name = "Auto Piano",
   Callback = function()
		loadsc("https://gist.githubusercontent.com/vukhanhtoan2907-lab/705658996e60d919a22cdc5dc0ce90d9/raw/gistfile1.txt", "AutoPiano", true)
   end
})
TabScriptAny:CreateButton({
   Name = "Auto Di chuyển",
   Callback = function()
		loadsc("https://gist.githubusercontent.com/vukhanhtoan2907-lab/f62c00375072d144835c0976e944d29f/raw/gistfile1.txt", "AutoDiChuyen", true)
   end
})
TabScriptAny:CreateButton({
   Name = "Script đá ng chơi",
   Callback = function()
		loadsc("https://raw.githubusercontent.com/platinww/CrustyMain/refs/heads/main/universal/DropKick.lua", "ScriptDropKick", true)
   end
})
TabScriptAny:CreateButton({
   Name = "Chạy trên tường",
   Callback = function()
		loadsc("https://raw.githubusercontent.com/infyiff/backup/main/wallwalker.lua", "wallwalk", true)
   end
})
TabScriptAny:CreateButton({
   Name = "Executor (by dnezero)",
   Callback = function()
		loadsc("https://raw.githubusercontent.com/infyiff/backup/refs/heads/main/executor.lua", "executor", true)
   end
})
TabScriptAny:CreateButton({
   Name = "GodMode",
   Callback = function()
		loadsc("https://pastefy.app/OVyrDaSW/raw", "GodMode", true)
   end
})
TabScriptAny:CreateButton({
   Name = "Gom người chơi",
   Callback = function()
		loadsc("https://pastefy.app/N7pg66LZ/raw", "BringPlayer", true)
   end
})
TabScriptAny:CreateButton({
   Name = "Wisl Universal",
   Callback = function()
		loadsc("https://raw.githubusercontent.com/WislUniversal/script/refs/heads/main/Universal.lua", "WislUniversal", true)
   end
})
TabScriptAny:CreateButton({
   Name = "Wisl Universal Aimbot",
   Callback = function()
		loadsc("https://raw.githubusercontent.com/WislUniversal/script/refs/heads/main/UniversalAimbot.lua", "WislUniversalAimbot", true)
   end
})
TabScriptAny:CreateButton({
   Name = "UNC Test",
   Callback = function()
		loadsc("https://raw.githubusercontent.com/ltseverydayyou/uuuuuuu/refs/heads/main/UNC%20test", "UNCTest", true)
   end
})
TabScriptAny:CreateButton({
   Name = "Vứt hết đồ trong túi đồ",
   Callback = function()
		loadsc("https://pastefy.app/pNlepHPp/raw", "dropallitem", true)
   end
})
TabScriptAny:CreateButton({
   Name = "Hitbox",
   Callback = function()
		loadsc("https://pastefy.app/tWY411OP/raw?part=2.lua", "hitbox", true)
   end
})
TabScriptAny:CreateButton({
   Name = "Tốc độ",
   Callback = function()
		loadsc("https://pastefy.app/tWY411OP/raw?part=1.lua", "speed", true)
   end
})
TabScriptAny:CreateButton({
   Name = "Fake Lag",
   Callback = function()
		loadsc("https://raw.githubusercontent.com/Biem6ondo/FAKELAG/refs/heads/main/Fakelag", "FAKELAG", true)
   end
})
TabScriptAny:CreateButton({
   Name = "Free cam",
   Callback = function()
		loadsc("https://pastefy.app/mzHiFNDi/raw", "FreeCam", true)
   end
})
TabScriptAny:CreateButton({
   Name = "Sức nhảy",
   Callback = function()
		loadsc("https://pastefy.app/KPI6Sfld/raw", "JumpPowerChanger", true)
   end
})
TabScriptAny:CreateButton({
   Name = "Instant Proximity Prompts",
   Callback = function()
		loadsc("https://pastefy.app/a6xGAx3Z/raw", "InstantProximityPrompts", true)
   end
})
TabScriptAny:CreateButton({
   Name = "Cầm tất cả đồ trong balo",
   Callback = function()
		loadsc("https://pastefy.app/25Lxeh1G/raw", "Equipalltool", true)
   end
})
TabScriptAny:CreateButton({
   Name = "Chạm vào tất cả part",
   Callback = function()
		loadsc("https://pastefy.app/2jUtPDuo/raw", "TouchAllPartUI", true)
   end
})

--Setting
local Theme = TabSet:CreateDropdown({
   Name = "🏞️ Chọn giao diện",
   Options = {
        "Default",
        "AmberGlow",
        "Amethyst",
        "Bloom",
        "DarkBlue",
        "Green",
        "Light",
        "Ocean",
        "Serenity"
    },
   CurrentOption = {"Default"},
   MultipleOptions = false,
   Flag = "Theme",
   Callback = function(Options)
	Window.ModifyTheme(Options[1])
   end,
})
local FPSCap = TabSet:CreateSlider({
   Name = "🖥️ Giới hạn FPS",
   Range = {10, 240},
   Increment = 1,
   CurrentValue = 240,
   Flag = "FPSCap",
   Callback = function(Value)
	setfpscap(Value)
   end,
})
local updatefpspingtimems = TabSet:CreateSlider({
   Name = "📺 Delay cập nhập Ping và FPS",
   Range = {1, 1000},
   Increment = 1,
   CurrentValue = 100,
   Flag = "updatefpspingtimems",
   Callback = function(Value)
	updatefpspingtime = Value
   end,
})
local volume = TabSet:CreateSlider({
   Name = "🔊 Âm lượng",
   Range = {1, 10},
   Increment = 1,
   CurrentValue = 10,
   Flag = "volume",
   Callback = function(Value)
	UserSettings():GetService("UserGameSettings").MasterVolume = Value / 10
   end,
})
local AntiAFK = TabSet:CreateToggle({
   Name = "🕹️ AntiAFK",
   CurrentValue = false,
   Flag = "AntiAFK",
   Callback = function(Value)
	AntiAFKEnabled = Value
   end,
})
local AntiKickClient = TabSet:CreateToggle({
   Name = "🔥 Chặn kick từ script khác (hook namecall)",
   CurrentValue = false,
   Flag = "AntiKickClient",
   Callback = function(Value)
	if not isnamecallhook then
		hookantikick()
	end
	getgenv().AntiKickScriptCore = Value
   end,
})
local BlackToggle = TabSet:CreateToggle({
   Name = "⚫ Màn hình đen",
   CurrentValue = false,
   Flag = "BlackToggle",
   Callback = function(Value)
	black.BackgroundTransparency = Value and 0 or 1
	Services.RunService:Set3dRenderingEnabled(not Value)
   end,
})
local AntiGamePause = TabSet:CreateToggle({
   Name = "▶️ Chặn tự động dừng game",
   CurrentValue = false,
   Flag = "AntiGamePause",
   Callback = function(Value)
	pcall(function()
	if Value then
	    pcall(function() networkPaused:Disconnect() end)
	    networkPaused = COREGUI.RobloxGui.ChildAdded:Connect(function(obj)
	        if obj.Name == "CoreScripts/NetworkPause" then
	            obj:Destroy()
	        end
	    end)
	    COREGUI.RobloxGui["CoreScripts/NetworkPause"]:Destroy()
	else
	    networkPaused:Disconnect()
   	end
	end)
   end,
})
local anonmodetoggle = TabSet:CreateToggle({
   Name = "🧌 Ẩn tên người chơi khỏi UI",
   CurrentValue = false,
   Flag = "anonmodetoggle",
   Callback = function(Value)
	anonmode = Value
   end,
})
local ClickTeleport = TabSet:CreateToggle({
   Name = "🫪 Control click tp",
   CurrentValue = false,
   Flag = "ClickTeleport",
   Callback = function(Value)
	WRDClickTeleport = Value
   end,
})
local infinJum = TabSet:CreateToggle({
   Name = "💃 Nhảy trên không",
   CurrentValue = false,
   Flag = "infinJum",
   Callback = function(Value)
	infinJumpEnabled = Value
   end,
})
local noclipfas = TabSet:CreateToggle({
   Name = "🍃 Đi xuyên tường",
   CurrentValue = false,
   Flag = "noclipfas",
   Callback = function(Value)
	noclipfasttoggle = Value
   end,
})
local clicktotouchm = TabSet:CreateToggle({
   Name = "🐭 Click + alt = chạm",
   CurrentValue = false,
   Flag = "clicktotouchm",
   Callback = function(Value)
	clicktotouch = Value
   end,
})
TabSet:CreateButton({
   Name = "☠️ Respawn",
   Callback = function()
       local char = game.Players.LocalPlayer.Character
       if not char then return end
       
       local hum = char:FindFirstChildWhichIsA("Humanoid")
       if hum then
           hum.Health = 0
       end
   end
})
TabSet:CreateButton({
   Name = "🎮 Nhật kí script",
   Callback = function()
	Services.StarterGui:SetCore("DevConsoleVisible", true)
   end
})
TabSet:CreateButton({
   Name = "🌫️ Toàn màn hình",
   Callback = function()
	return Services.GuiService:ToggleFullscreen()
   end
})
TabSet:CreateButton({
   Name = "🩻 Thoát game",
   Callback = function()
	game:Shutdown()
   end
})
TabSet:CreateButton({
   Name = "📟 Bong bóng chat màu đen",
   Callback = function()
		local TextChatService = Services.TextChatService
		
		local BCC = TextChatService:FindFirstChildOfClass("BubbleChatConfiguration")
		local CWC = TextChatService:FindFirstChildOfClass("ChatWindowConfiguration")
		local CIBC = TextChatService:FindFirstChildOfClass("ChatInputBarConfiguration")
		
		if BCC then
		    BCC.Enabled = true
		    BCC.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		    BCC.BackgroundTransparency = 0.3
		    BCC.TailVisible = true
		    BCC.TextColor3 = Color3.fromRGB(255, 255, 255)
		end
		
		if CWC then
		    CWC.Enabled = true
		    CWC.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		    CWC.BackgroundTransparency = 0.3
		    CWC.TextColor3 = Color3.fromRGB(255, 255, 255)
		    CWC.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
		    CWC.TextStrokeTransparency = 0.5
		end
		
		if CIBC then
		    CIBC.Enabled = true
		    CIBC.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		    CIBC.BackgroundTransparency = 0.5
		    CIBC.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
		    CIBC.TextColor3 = Color3.fromRGB(255, 255, 255)
		    CIBC.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
		    CIBC.TextStrokeTransparency = 0.5
		end
		Rayfield:Notify({
           Title = "infU",
           Content = "Bong bóng chat màu đen",
           Duration = 2.5,
    	   Image = "message-circle"
        })
   end
})
TabSet:CreateButton({
   Name = "🔎 Zoom vô hạn",
   Callback = function()
	Services.Players.LocalPlayer.CameraMaxZoomDistance = 99999999
   Rayfield:Notify({
      Title = "infZoom",
      Content = "JustInfZoom",
      Duration = 2.5,
	  Image = "zoom-in"
   })
   end
})
TabSet:CreateButton({
   Name = "🔧 Fixlag",
   Callback = function()
      pcall(function()
         FPSBoost_IYCORE()
         FPSBoost_ON()
         ApplyFFlag()
      end)
         if Rayfield then
            Rayfield:Notify({
               Title = "Fixlag",
               Content = "Đã fixlag thành công",
               Duration = 2.5,
               Image = 137920786996005
            })
         end
         print("[infU] Fixlag OK")
   end
})
TabSet:CreateButton({
   Name = "🌬️ FPSBoost UI",
   Callback = function()
		FPSBoost_UI()
	Rayfield:Notify({
      Title = "FPSBOOST",
      Content = "Đã mở FPSBoost_UI",
      Duration = 2.5,
	  Image = 137920786996005
   })
   end
})
TabSet:CreateButton({
   Name = "🗑️ Dọn cache infU",
   Callback = function()
local folder = ""

local function clearCache()
    if not listfiles or not delfile then
        warn("[infU] Executor của m không hỗ trợ listfiles hoặc delfile")
   Rayfield:Notify({
      Title = "error",
      Content = "Executor ko hỗ trợ xoá file rác infU",
      Duration = 2.5
   })
        return
    end

   Rayfield:Notify({
      Title = "infU 🗑️",
      Content = "Bắt đầu xoá cache của infU",
      Duration = 2.5
   })
	
    local files = listfiles(folder)
    local count = 0

    for _, file in ipairs(files) do
        local name = file:match("[^/\\]+$")

        if name and name:sub(1, 6) == "cache_" then
            pcall(function()
                delfile(file)
                count += 1
            end)
        end
    end

    print("[infU] Đã xoá", count, "file cache")
   Rayfield:Notify({
      Title = "[infU] sẽ mở lâu hơn vào lần sau] Hoàn thành",
      Content = "Đã xoá thành công " .. count .. " file rác",
      Duration = 2.5
   })
end

clearCache()
   end
})

--Thông Tin
task.spawn(function()
local ipinfo_tableClient = {
    ip = "N/A",
    country = "N/A",
    loc = "N/A",
    city = "N/A",
    region = "N/A",
    org = "N/A"
}
pcall(function()
    local ipClient = game:HttpGet("https://api.ipify.org")
    local iplinkClient = "https://ipinfo.io/" .. ipClient .. "/json"
    local ipinfo_jsonClient = game:HttpGet(iplinkClient)
    ipinfo_tableClient = Services.HttpService:JSONDecode(ipinfo_jsonClient)
end)
local health
local maxHealth
local position
local Player = TabInfo:CreateParagraph({Title = "Người chơi", Content = "🧸 Username: " .. Services.Players.LocalPlayer.Name .. "\n📝 Tên hiển thị: " .. Services.Players.LocalPlayer.DisplayName .. "\n🆔 UserID: " .. Services.Players.LocalPlayer.UserId})
local Acc = TabInfo:CreateParagraph({Title = "Tài khoản", Content = "🗓️ Tuổi tài khoản: " .. Services.Players.LocalPlayer.AccountAge .. " ngày\n💎 Premium: " .. checkPremium() .. "\n📅 Ngày tạo: " .. os.date("%Y-%m-%d", os.time() - (Services.Players.LocalPlayer.AccountAge * 86400))})
local Game = TabInfo:CreateParagraph({Title = "Game", Content = "🏷️ Tên game: " .. info.Name .. "\n🆔 Game ID: " .. game.GameId .. "\n🆔 Place ID: " .. game.PlaceId .. "\n🕹️ Phiên bản Place: " .. game.PlaceVersion .. "\n🪧 JobId" .. tostring(game.JobId)})
local Sys = TabInfo:CreateParagraph({Title = "Hệ thống Client", Content = "⚙️ Executor: " .. identifyexecutor() .. "\n👣 Địa chỉ IP: " .. ipinfo_tableClient.ip .. "\n🌆 Quốc gia: " .. ipinfo_tableClient.country .. "\n🪟 GPS: " .. ipinfo_tableClient.loc .. "\n🏙️ Thành phố: " .. ipinfo_tableClient.city .. "\n🏡 Khu vực: " .. ipinfo_tableClient.region .. "\n🪢 Nhà mạng/Host: " .. ipinfo_tableClient.org})
local live = TabInfo:CreateParagraph({Title = "Thông tin khác", Content = "Không rõ"})
TabInfo:CreateButton({
   Name = "Copy PlaceId",
   Callback = function()
		print("[infU] Đã copy: " .. game.PlaceId)
		setclipboard(game.PlaceId)
	   Rayfield:Notify({
	      Title = game.PlaceId,
	      Content = "Đã copy thành công",
	      Duration = 2.5,
		  Image = "clipboard"
	   })
   end
})
TabInfo:CreateButton({
   Name = "Copy GameId",
   Callback = function()
		print("[infU] Đã copy: " .. game.GameId)
		setclipboard(game.GameId)
	   Rayfield:Notify({
	      Title = game.GameId,
	      Content = "Đã copy thành công",
	      Duration = 2.5,
		  Image = "clipboard"
	   })
   end
})
TabInfo:CreateButton({
   Name = "Copy JobId",
   Callback = function()
		print("[infU] Đã copy: " .. game.JobId)
		setclipboard(game.JobId)
	   Rayfield:Notify({
	      Title = game.JobId,
	      Content = "Đã copy thành công",
	      Duration = 2.5,
		  Image = "clipboard"
	   })
   end
})
TabInfo:CreateButton({
   Name = "Copy UserId",
   Callback = function()
		print("[infU] Đã copy: " .. Services.Players.LocalPlayer.UserId)
		setclipboard(Services.Players.LocalPlayer.UserId)
	   Rayfield:Notify({
	      Title = Services.Players.LocalPlayer.UserId,
	      Content = "Đã copy thành công",
	      Duration = 2.5,
		  Image = "clipboard"
	   })
   end
})
TabInfo:CreateButton({
   Name = "Copy IP",
   Callback = function()
		print("[infU] Đã copy: " .. ipinfo_tableClient.ip)
		setclipboard(ipinfo_tableClient.ip)
	   Rayfield:Notify({
	      Title = ipinfo_tableClient.ip,
	      Content = "Đã copy thành công",
	      Duration = 2.5,
		  Image = "clipboard"
	   })
   end
})
TabInfo:CreateButton({
   Name = "Copy vị trí người chơi",
   Callback = function()
		print("[infU] Đã copy: " .. tostring(position))
		setclipboard(tostring(position))
	   Rayfield:Notify({
	      Title = tostring(position),
	      Content = "Đã copy thành công",
	      Duration = 2.5,
		  Image = "clipboard"
	   })
   end
})
task.spawn(function()
while true do
health =
    Services.Players.LocalPlayer.Character and Services.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and Services.Players.LocalPlayer.Character.Humanoid.Health or "Không rõ"
maxHealth =
    Services.Players.LocalPlayer.Character and Services.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and Services.Players.LocalPlayer.Character.Humanoid.MaxHealth or "Không rõ"
position =
    Services.Players.LocalPlayer.Character and Services.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and
    Services.Players.LocalPlayer.Character.HumanoidRootPart.Position or "Không rõ"
live:Set({Title = "Thông tin khác", Content = "❤️ Máu: " .. health .. "/" .. maxHealth .. "\n👥 Người chơi: " .. #Services.Players:GetPlayers() .. " / " .. Services.Players.MaxPlayers .. "\n🕒 Giờ server: " .. os.date("%H:%M:%S") .. "\n📺 Độ phân giải: " .. math.floor(workspace.CurrentCamera.ViewportSize.X) .. "x" .. math.floor(workspace.CurrentCamera.ViewportSize.Y) .. "\n🔍 RAM sử dụng: " .. Services.Stats:GetTotalMemoryUsageMb() .. "\n📍Vị trí nhân vật" .. tostring(position) .. "\n📶 Ping: " .. getPing() .. "\n📺 FPS: " .. fps})
task.wait(updatefpspingtime / 1000)
end
end)
end)

--Server
local function notinoserver()
	warn("[infU] Không có server")
		Rayfield:Notify({
	      Title = "infU",
	      Content = "Không tìm đc server",
	      Duration = 2.5,
		  Image = "x"
	   })
end
TabServer:CreateButton({
   Name = "Vào lại server",
   Callback = function()
		print("[infU] Đang vào lại server: " .. game.JobId)
	   Rayfield:Notify({
	      Title = "Đang vào server:",
	      Content = game.JobId,
	      Duration = 2.5,
		  Image = "server"
	   })
		game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, Services.Players.LocalPlayer)
   end
})
TabServer:CreateButton({
   Name = "Server Hop (theo cài đặt game)",
   Callback = function()
		print("[infU] Vào server theo game")
	   Rayfield:Notify({
	      Title = "infU",
	      Content = "Đang vào server theo cài đặt game",
	      Duration = 2.5,
		  Image = "server"
	   })
		game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, Services.Players.LocalPlayer)
   end
})
TabServer:CreateButton({
   Name = "Server random",
   Callback = function()
		print("[infU] Đang tìm server")
	   Rayfield:Notify({
	      Title = "infU",
	      Content = "Đang tìm server",
	      Duration = 2.5,
		  Image = 120793987758737
	   })
      local HttpService = Services.HttpService
      local TeleportService = Services.TeleportService
      local Players = Services.Players

      local PlaceId = game.PlaceId
      local JobId = game.JobId

      local function getServers(cursor)
         local url = "https://games.roblox.com/v1/games/"..PlaceId.."/servers/Public?sortOrder=Asc&limit=100"
         if cursor then
            url = url .. "&cursor=" .. cursor
         end
         return HttpService:JSONDecode(game:HttpGet(url))
      end

      local servers = {}
      local cursor = nil

      for i = 1, 5 do
         local data = getServers(cursor)
         if data and data.data then
            for _, s in pairs(data.data) do
               if s.playing < s.maxPlayers and s.id ~= JobId then
                  table.insert(servers, s)
               end
            end
         end
         cursor = data.nextPageCursor
         if not cursor then break end
      end

      if #servers == 0 then return notinoserver() end

      local target = servers[math.random(1, #servers)]

      print("[infU] Join random:", target.playing)
	   Rayfield:Notify({
	      Title = "Đang vào server:",
	      Content = target.id,
	      Duration = 2.5,
		  Image = "server"
	   })
      TeleportService:TeleportToPlaceInstance(PlaceId, target.id, Players.LocalPlayer)
   end
})
TabServer:CreateButton({
   Name = "Server ít người",
   Callback = function()
		print("[infU] Đang tìm server")
	   Rayfield:Notify({
	      Title = "infU",
	      Content = "Đang tìm server",
	      Duration = 2.5,
		  Image = 120793987758737
	   })
      local HttpService = Services.HttpService
      local TeleportService = Services.TeleportService
      local Players = Services.Players

      local PlaceId = game.PlaceId
      local JobId = game.JobId

      local function getServers(cursor)
         local url = "https://games.roblox.com/v1/games/"..PlaceId.."/servers/Public?sortOrder=Asc&limit=100"
         if cursor then
            url = url .. "&cursor=" .. cursor
         end
         return HttpService:JSONDecode(game:HttpGet(url))
      end

      local servers = {}
      local cursor = nil

      for i = 1, 5 do
         local data = getServers(cursor)
         if data and data.data then
            for _, s in pairs(data.data) do
               if s.playing < s.maxPlayers and s.id ~= JobId then
                  table.insert(servers, s)
               end
            end
         end
         cursor = data.nextPageCursor
         if not cursor then break end
      end

      if #servers == 0 then return notinoserver() end

      table.sort(servers, function(a, b)
         return a.playing < b.playing
      end)

      local target = servers[1] -- ít nhất

      print("[infU] Join ít người:", target.playing)
	   Rayfield:Notify({
	      Title = "Đang vào server:",
	      Content = target.id,
	      Duration = 2.5,
		  Image = "server"
	   })
      TeleportService:TeleportToPlaceInstance(PlaceId, target.id, Players.LocalPlayer)
   end
})
TabServer:CreateButton({
   Name = "JobId: " .. game.JobId,
   Callback = function()
		print("[infU] JobId: " .. game.JobId)
		setclipboard(game.JobId)
	   Rayfield:Notify({
	      Title = game.JobId,
	      Content = "Đã copy thành công",
	      Duration = 2.5,
		  Image = "clipboard"
	   })
   end
})
local JoinJobId = TabServer:CreateInput({
   Name = "Vào server bằng JobId",
   CurrentValue = "",
   PlaceholderText = "Dán JobId vào đây",
   RemoveTextAfterFocusLost = false,
   Flag = "JoinJobId",
   Callback = function(Text)
		print("[infU] JobId join: " .. Text)
	   Rayfield:Notify({
	      Title = "Đang vào server:",
	      Content = Text,
	      Duration = 2.5,
		  Image = "server"
	   })
		game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, Text, Services.Players.LocalPlayer)
   end,
})
TabServer:CreateButton({
   Name = "Lấy script vào server",
   Callback = function()
		local scriptjoinserver = "game:GetService('TeleportService'):TeleportToPlaceInstance(" .. game.PlaceId .. ", '" .. game.JobId .. "', game.Players.LocalPlayer)"
		print("[infU] Script join server")
		print(scriptjoinserver)
		setclipboard(scriptjoinserver)
	   Rayfield:Notify({
	      Title = scriptjoinserver,
	      Content = "Đã copy script vào server thành công",
	      Duration = 2.5,
		  Image = "clipboard"
	   })
   end
})

--Noti Load
Rayfield:Notify({
   Title = "infU",
   Content = "🎉 Chào mừng bạn đến với infU",
   Duration = 4,
   Image = "infinity"
})
print("[infU] Đã tải toàn bộ script")
