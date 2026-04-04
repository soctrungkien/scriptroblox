repeat wait() until game:IsLoaded()
setfpscap(240)
getgenv().RAYFIELD_ASSET_ID = 10804731440
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local function loadsc(url, title, fast)
   local fileName = "cache_" .. tostring(title):gsub("[^%w_]+", "") .. ".txt"
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
		         run(localData)
		      end)
		
		      task.spawn(function()
		         local onlineData = getOnline()
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
		         writefile(fileName, data)
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
         Title = title .. "ERROR",
         Content = err,
         Duration = 3,
         Image = 6646234362
      })
	end
   end
end
local function loadImageFromURL(url)
    local file = ("cache_img_" .. tostring(url):gsub("[^%w_]+", "") .. ".png")

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
    local premium = "false"
    local success, response =
        pcall(function()
            return game:GetService("Players").LocalPlayer.MembershipType
        end)

    if success then
        if response == Enum.MembershipType.None then
            premium = "false"
        else
            premium = "true"
        end
    else
        premium = "Không thể lấy trạng thái Membership"
    end
    return premium
end
loadsc("https://pastefy.app/bIsOY8bK/raw", "fixlag", true)
loadsc("https://pastefy.app/5taiRzau/raw", "black", true)
local black = game.CoreGui:FindFirstChild("BlackoutOverlay")
    and game.CoreGui.BlackoutOverlay:FindFirstChildOfClass("Frame")
local MarketplaceService = game:GetService("MarketplaceService")
local placeId = game.PlaceId
local success, info = pcall(function()
    return MarketplaceService:GetProductInfo(placeId, Enum.InfoType.Asset)
end)
local AntiAFKEnabled = false
game:GetService("Players").LocalPlayer.Idled:Connect(function()
    if AntiAFKEnabled then
        game:GetService("VirtualUser"):CaptureController()
        game:GetService("VirtualUser"):ClickButton2(Vector2.new(0, 0))
    end
end)
local COREGUI = game:GetService("CoreGui")
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

task.spawn(function()
local Stats = game:GetService("Stats")
local fps = 0
local ping = 0
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
repeat wait() until game:GetService("CoreGui"):FindFirstChildWhichIsA("ScreenGui")
game:GetService("RunService").RenderStepped:Connect(function(dt)
fps = math.floor(1 / dt)
for _, v in pairs(game:GetService("CoreGui"):GetDescendants()) do
    if v.Name == "Rayfield" and v:FindFirstChild("Prompt") then
        v.Prompt.Title.Text = string.format("%d ms | %d", getPing(), fps)
    end
end
end)
end)

local TabInfo = Window:CreateTab("Thông tin", loadImageFromURL(getAvatar(game:GetService("Players").LocalPlayer.UserId)))
local TabScriptAny = Window:CreateTab("Script", loadImageFromURL(getGameIcon(game.GameId)))
local TabSet = Window:CreateTab("Cài đặt", "settings")
local TabServer = Window:CreateTab("Máy chủ", "server")

Rayfield:Notify({
   Title = "infU",
   Content = "🎉 Chào mừng bạn đến với infU",
   Duration = 4,
   Image = "infinity"
})

--Script
if game.GameId == 994732206 then
TabScriptAny:CreateButton({
   Name = "[Auto Farm] Quantum Onyx" .. " for " .. info.Name,
   Callback = function()
		loadsc("https://raw.githubusercontent.com/flazhy/QuantumOnyx/refs/heads/main/QuantumOnyx.lua", "QuantumOnyx", false)
   end
})
TabScriptAny:CreateButton({
   Name = "[Server Hop] Rise Hub" .. " for " .. info.Name,
   Callback = function()
		loadsc("https://rise-evo.xyz/apiv3/ServerFinder.lua", "RiseHop", false)
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

--Setting
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
local BaDRender = TabSet:CreateToggle({
   Name = "🧊 3D Rendering",
   CurrentValue = true,
   Flag = "BaDRender",
   Callback = function(Value)
	RunService:Set3dRenderingEnabled(Value)
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
local BlackToggle = TabSet:CreateToggle({
   Name = "⚫ Màn hình đen",
   CurrentValue = false,
   Flag = "BlackToggle",
   Callback = function(Value)
	black.BackgroundTransparency = Value and 0 or 1
   end,
})
TabSet:CreateButton({
   Name = "🎮 Nhật kí script",
   Callback = function()
	game:GetService("StarterGui"):SetCore("DevConsoleVisible", true)
   end
})
TabSet:CreateButton({
   Name = "🔎 infZoom",
   Callback = function()
	game:GetService("Players").LocalPlayer.CameraMaxZoomDistance = 99999999
   Rayfield:Notify({
      Title = "infZoom",
      Content = "JustInfZoom",
      Duration = 2.5,
	  Image = "zoom-in"
   })
   end
})
TabSet:CreateButton({
   Name = "▶️ Anti Game Pause",
   Callback = function()
    pcall(function() networkPaused:Disconnect() end)
    networkPaused = COREGUI.RobloxGui.ChildAdded:Connect(function(obj)
        if obj.Name == "CoreScripts/NetworkPause" then
            obj:Destroy()
        end
    end)
    COREGUI.RobloxGui["CoreScripts/NetworkPause"]:Destroy()
	Rayfield:Notify({
      Title = "Đã chặn tạm dừng game",
      Content = "Ngăn thông báo Game Pause",
      Duration = 2.5,
	  Image = "play"
    })
	print("[infU] Anti Game Pause")
   end
})
TabSet:CreateButton({
   Name = "🔧 AntiLag",
   Callback = function()
      local success, err = pcall(function()
         FPSBoost_IYCORE()
         FPSBoost_ON()
         ApplyFFlag()
      end)
         if Rayfield then
            Rayfield:Notify({
               Title = "AntiLag",
               Content = "Đã fixlag thành công",
               Duration = 2.5,
               Image = "cog"
            })
         end
         print("[infU] Fixlag OK")
   end
})
TabSet:CreateButton({
   Name = "🗑️ Dọn rác infU",
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
local ipClient = game:HttpGet("https://api.ipify.org")
local iplinkClient = "https://ipinfo.io/" .. ipClient .. "/json"
local ipinfo_jsonClient = game:HttpGet(iplinkClient)
local ipinfo_tableClient = game.HttpService:JSONDecode(ipinfo_jsonClient)
local Player = TabInfo:CreateParagraph({Title = "Người chơi", Content = "🧸 Username: " .. game:GetService("Players").LocalPlayer.Name .. "\n📝 Tên hiển thị: " .. game:GetService("Players").LocalPlayer.DisplayName .. "\n🆔 UserID: " .. game:GetService("Players").LocalPlayer.UserId})
local Acc = TabInfo:CreateParagraph({Title = "Tài khoản", Content = "🗓️ Tuổi tài khoản: " .. game:GetService("Players").LocalPlayer.AccountAge .. " ngày\n💎 Premium: " .. checkPremium() .. "\n📅 Ngày tạo: " .. os.date("%Y-%m-%d", os.time() - (game:GetService("Players").LocalPlayer.AccountAge * 86400))})
local Game = TabInfo:CreateParagraph({Title = "Game", Content = "🏷️ Tên game: " .. info.Name .. "\n🆔 Game ID: " .. game.GameId .. "\n🆔 Place ID: " .. game.PlaceId .. "\n🕹️ Phiên bản Place: " .. game.PlaceVersion})
local Sys = TabInfo:CreateParagraph({Title = "Hệ thống Client", Content = "⚙️ Executor: " .. identifyexecutor() .. "\n👣 Địa chỉ IP: " .. ipinfo_tableClient.ip .. "\n🌆 Quốc gia: " .. ipinfo_tableClient.country .. "\n🪟 GPS: " .. ipinfo_tableClient.loc .. "\n🏙️ Thành phố: " .. ipinfo_tableClient.city .. "\n🏡 Khu vực: " .. ipinfo_tableClient.region .. "🪢 Nhà mạng/Host: " .. ipinfo_tableClient.org})
