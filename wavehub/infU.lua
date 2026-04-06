print("[infU] Loading")
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "infU",
    Text = "Loading",
    Duration = 1
})
repeat wait() until game:IsLoaded()
setfpscap(240)
getgenv().RAYFIELD_ASSET_ID = 10804731440
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
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
   local fileName = "cache_" .. b64_encode(xor(tostring(title):gsub("[^%w_]+", ""), url)) .. ".txt"
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
    local file = ("cache_img_" .. b64_encode(xor(tostring(url):gsub("[^%w_]+", ""), "S0VZX2t1NWktbGYwNC00Y291")) .. ".png")

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
loadsc("https://pastefy.app/z0ZyOjK3/raw", "tptool", true)
   end
})
TabScriptAny:CreateButton({
   Name = "F3X",
   Callback = function()
loadsc("https://raw.githubusercontent.com/Windows81/Personal-Roblox-Client-Scripts/refs/heads/main/f3x.lua", "f3x", true)
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
	Window.ModifyTheme(Options)
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
local AntiAFK = TabSet:CreateToggle({
   Name = "🕹️ AntiAFK",
   CurrentValue = false,
   Flag = "AntiAFK",
   Callback = function(Value)
	AntiAFKEnabled = Value
   end,
})
local AntiKickClient = TabSet:CreateToggle({
   Name = "🔥 Chặn kick từ script khác",
   CurrentValue = false,
   Flag = "AntiKickClient",
   Callback = function(Value)
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
TabSet:CreateButton({
   Name = "🎮 Nhật kí script",
   Callback = function()
	Services.StarterGui:SetCore("DevConsoleVisible", true)
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
               Image = loadImageFromURL("https://ibb.co/nNFHLDwT")
            })
         end
         print("[infU] Fixlag OK")
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
Services.RunService.RenderStepped:Connect(function()
health =
    Services.Players.LocalPlayer.Character and Services.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and Services.Players.LocalPlayer.Character.Humanoid.Health or "Không rõ"
maxHealth =
    Services.Players.LocalPlayer.Character and Services.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and Services.Players.LocalPlayer.Character.Humanoid.MaxHealth or "Không rõ"
position =
    Services.Players.LocalPlayer.Character and Services.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and
    Services.Players.LocalPlayer.Character.HumanoidRootPart.Position or "Không rõ"
live:Set({Title = "Thông tin khác", Content = "❤️ Máu: " .. health .. "/" .. maxHealth .. "\n👥 Người chơi: " .. #Services.Players:GetPlayers() .. " / " .. Services.Players.MaxPlayers .. "\n🕒 Giờ server: " .. os.date("%H:%M:%S") .. "\n📺 Độ phân giải: " .. math.floor(workspace.CurrentCamera.ViewportSize.X) .. "x" .. math.floor(workspace.CurrentCamera.ViewportSize.Y) .. "\n🔍 RAM sử dụng: " .. Services.Stats:GetTotalMemoryUsageMb() .. "\n📍Vị trí nhân vật" .. tostring(position) .. "\n📶 Ping: " .. getPing() .. "\n📺 FPS: " .. fps})
task.wait(0.1)
end)
end)
end)

--Server
TabServer:CreateButton({
   Name = "Vào lại server",
   Callback = function()
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
	   Rayfield:Notify({
	      Title = "infU",
	      Content = "Đang tìm server",
	      Duration = 2.5,
		  Image = loadImageFromURL("https://ibb.co/fYLYf3ZN")
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

      if #servers == 0 then return warn("[infU] Không có server") end

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
	   Rayfield:Notify({
	      Title = "infU",
	      Content = "Đang tìm server",
	      Duration = 2.5,
		  Image = loadImageFromURL("https://ibb.co/fYLYf3ZN")
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

      if #servers == 0 then return warn("[infU] Không có server") end

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
