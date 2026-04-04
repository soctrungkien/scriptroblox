repeat wait() until game:IsLoaded()
local function loadsc(url, title, fast)
   local fileName = "cache_" .. tostring(title):gsub("%W+", "") .. ".txt"
	print("[infU] Đang tải " .. title)
	if Rayfield then
   Rayfield:Notify({
      Title = title,
      Content = "Đang tải script",
      Duration = 3,
      Image = 14595801355
   })
	end
   local function run(code)
      local f = loadstring(code)
      if f then
         return f()
      end
   end

   local function getOnline()
      return game:HttpGet(url)
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
	   end
	end)

   if ok then
	print("[infU] Đã tải thành công " .. title)
	if Rayfield then
      Rayfield:Notify({
         Title = "Done",
         Content = "Đã tải script " .. title .. " thành công",
         Duration = 3,
         Image = 14595801355
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
loadsc("https://pastefy.app/bIsOY8bK/raw", "fixlag", true)
loadsc("https://pastefy.app/5taiRzau/raw", "black", true)
getgenv().RAYFIELD_ASSET_ID = 10804731440
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
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
   LoadingTitle = "「゘」Đang mở Menu infU...",
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

local TabScriptAny = Window:CreateTab("Chung", "user")
local TabSet = Window:CreateTab("Cài đặt", "settings")
local TabServer = Window:CreateTab("Máy chủ", "server")
local TabInfo = Window:CreateTab("Thông tin", "info")

Rayfield:Notify({
   Title = "infU",
   Content = "🎉 Chào mừng bạn đến với infU",
   Duration = 4,
   Image = "infinity"
})

--Script
if game.GameId == 994732206 then
TabScriptAny:CreateButton({
   Name = "Quantum Onyx" .. " for " .. info.Name,
   Callback = function()
		loadsc("https://raw.githubusercontent.com/flazhy/QuantumOnyx/refs/heads/main/QuantumOnyx.lua", "QuantumOnyx", false)
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
   Name = "FPS/PING Popup",
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
loadsc("https://raw.githubusercontent.com/retpirato/Roblox-Scripts/refs/heads/master/Click%20TP%20Tool.lua", "tptool", true)
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

--Setting
local AntiAFK = TabSet:CreateToggle({
   Name = "🕹️ AntiAFK",
   CurrentValue = false,
   Flag = "AntiAFK",
   Callback = function(Value)
	AntiAFKEnabled = Value
   end,
})
TabSet:CreateButton({
   Name = "🎮 Console",
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
      Duration = 2.5
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
      Duration = 2.5
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
    Rayfield:Notify({
      Title = "AntiLag",
      Content = "Đã fixlag thành công",
      Duration = 2.5
    })
	print("[infU] Fixlag")
   end
})
TabSet:CreateButton({
   Name = "🗑️ Dọn rác infU",
   Callback = function()
local folder = "" -- để trống = thư mục workspace executor

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
        local name = file:match("[^/\\]+$") -- lấy tên file

        if name and name:sub(1, 6) == "cache_" then
            pcall(function()
                delfile(file)
                count += 1
            end)
        end
    end

    print("[infU] Đã xoá", count, "file cache")
   Rayfield:Notify({
      Title = "[infU sẽ mở lâu hơn vào lần sau] Hoàn thành",
      Content = "Đã xoá thành công " .. count .. " file rác",
      Duration = 2.5
   })
end

clearCache()
   end
})
