print("𝙳𝚛𝚊𝚐𝚘𝚗 𝙷𝚞𝚋 𝚋𝚢 @𝟿𝟾𝚘0𝚘𝟹𝟿 ☑️")
game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "Dragon Hub", 
	Text = "đã khởi động", 
	Duration = 5,
	Icon = "rbxassetid://81249639738070"
})
-------GUILIB
local Fluent = loadstring(game:HttpGet("https://raw.githubusercontent.com/discoart/FluentPlus/refs/heads/main/Beta.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/soctrungkien/scriptroblox/refs/heads/main/Script/im.lua"))()
-------ANTIAFK
loadstring(game:HttpGet("https://raw.githubusercontent.com/soctrungkien/scriptroblox/refs/heads/main/Script/antiafk.lua"))()
------MAIN

       local Window = Fluent:CreateWindow{
        Title = "Dragon Hub " .. Fluent.Version,
        SubTitle = "by @98ᴏ0ᴏ39",
        TabWidth = 160,
        Size = UDim2.new(0, 580, 0, 460),
        UseAcrylic = true,
        Transparency = true,
        Acrylic = true, -- The blur may be detectable, setting this to false disables blur entirely
        Theme = "Dark",
        MinimizeKey = Enum.KeyCode.K, -- Phím để thu nhỏ cửa sổ
        MinimizeKeybind = Enum.KeyCode.K -- Phím tắt để thu nhỏ
      }
      
--- FLUENT PLUS SETTINGS ---
local Show_Button = false -- Shows the button for toggle fluent ui manually. If "false", works only on mobile, if "true", works everytime.
local Button_Icon = "rbxassetid://81249639738070" -- Icon of the button for toggle fluent ui
----------------------------

------
-- Giả định script này chạy trong một LocalScript bên trong StarterPlayerScripts
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

-- Hàm làm nút có thể kéo thả
local function MakeDrag(button)
    local dragging = false
    local dragStart = nil
    local startPos = nil

    button.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = button.Position
        end
    end)

    button.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - dragStart
            local newPos = UDim2.new(
                startPos.X.Scale,
                startPos.X.Offset + delta.X,
                startPos.Y.Scale,
                startPos.Y.Offset + delta.Y
            )
            button.Position = newPos
        end
    end)

    return button
end

-- Tạo hoặc tìm ScreenGui
local GUI = game:GetService("CoreGui"):FindFirstChild("CustomButtonGui") or Instance.new("ScreenGui")
GUI.Name = "CustomButtonGui"
GUI.Parent = game:GetService("CoreGui") -- Sử dụng CoreGui như yêu cầu

-- Xóa các ImageButton cũ trong ScreenGui
for _, child in ipairs(GUI:GetChildren()) do
    if child:IsA("ImageButton") then
        child:Destroy()
    end
end

-- Tạo ImageButton mới
local Button = Instance.new("ImageButton")
Button.Parent = GUI
Button.Size = UDim2.fromOffset(35, 35)
Button.Position = UDim2.fromScale(0.15, 0.15)
Button.BackgroundTransparency = 0
Button.BackgroundColor3 = Color3.fromRGB(128, 128, 128) -- Màu xám
Button.AutoButtonColor = false -- Tắt hiệu ứng đổi màu khi nhấp

-- Thêm ảnh vào nút
Button.Image = "rbxassetid://81249639738070" -- Asset ID bạn cung cấp
Button.ImageTransparency = 0

-- Thêm bo góc (UICorner) với cấu hình yêu cầu
local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(15, 1) -- Bo góc theo yêu cầu
Corner.Parent = Button

-- Làm nút có thể kéo thả
MakeDrag(Button)

-- Thêm sự kiện nhấp để chạy Window:Minimize()
Button.Activated:Connect(function()
    if Window and Window.Minimize then
        Window:Minimize()
    else
        warn("Window or Window:Minimize is not defined!")
    end
end)

------ Tab
local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "house" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

local Options = Fluent.Options

-------
-- Addons:
-- SaveManager (Allows you to have a configuration system)
-- InterfaceManager (Allows you to have a interface managment system)

-- Hand the library over to our managers
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

-- Ignore keys that are used by ThemeManager.
-- (we dont want configs to save themes, do we?)
SaveManager:IgnoreThemeSettings()

-- You can add indexes of elements the save manager should ignore
SaveManager:SetIgnoreIndexes({})

-- use case for doing it this way:
-- a script hub could have themes in a global folder
-- and game configs in a separate folder per game
InterfaceManager:SetFolder("DragonHub")
SaveManager:SetFolder("DragonHub/game")

InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)


Window:SelectTab(1)

-- You can use the SaveManager:LoadAutoloadConfig() to load a config
-- which has been marked to be one that auto loads!
SaveManager:LoadAutoloadConfig()

------- BUTTON
    
    Tabs.Main:AddButton({
     Title = "Redz Hub",
    Callback = function()
local placeId = game. PlaceId
if placeId == 2753915549 or placeId == 4442272183 or placeId == 7449423635 then
--Blox Fruits
	  local Settings = {
  JoinTeam = "Pirates"; -- Pirates/Marines
  Translator = true; -- true/false
}

loadstring(game:HttpGet("https://raw.githubusercontent.com/newredz/BloxFruits/refs/heads/main/Source.luau"))(Settings)
elseif placeId == 10260193230 then
--Mini Sea
loadstring(game:HttpGet("https://raw.githubusercontent.com/realredz/MemeSea/refs/heads/main/Source.lua"))()
  end
  end
  })


      Tabs.Main:AddButton({
     Title = "Ping/FPS",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/soctrungkien/scriptroblox/refs/heads/main/Script/Ping_FPS.lua"))()
  end
  })


      Tabs.Main:AddButton({
     Title = "Fly GUI",
    Callback = function()
loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\40\39\104\116\116\112\115\58\47\47\103\105\115\116\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\109\101\111\122\111\110\101\89\84\47\98\102\48\51\55\100\102\102\57\102\48\97\55\48\48\49\55\51\48\52\100\100\100\54\55\102\100\99\100\51\55\48\47\114\97\119\47\101\49\52\101\55\52\102\52\50\53\98\48\54\48\100\102\53\50\51\51\52\51\99\102\51\48\98\55\56\55\48\55\52\101\98\51\99\53\100\50\47\97\114\99\101\117\115\37\50\53\50\48\120\37\50\53\50\48\102\108\121\37\50\53\50\48\50\37\50\53\50\48\111\98\102\108\117\99\97\116\111\114\39\41\44\116\114\117\101\41\41\40\41\10\10")()
  end
  })


      Tabs.Main:AddButton({
     Title = "DatTHGV1",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/LuaCrack/DatThg/refs/heads/main/DatThgV1"))()
  end
  })


        Tabs.Main:AddButton({
     Title = "Dex Explorer",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/soctrungkien/scriptroblox/refs/heads/main/Script/DexExplorerLite.lua"))()
  end
  })
  

        Tabs.Main:AddButton({
     Title = "Banana Hub ⟦Fake⟧",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/kimprobloxdz/Banana-Free/refs/heads/main/Protected_5609200582002947.lua.txt"))()
  end
  })

    
          Tabs.Main:AddButton({
     Title = "Orca",
    Callback = function()
loadstring(
  game:HttpGetAsync("https://raw.githubusercontent.com/richie0866/orca/master/public/latest.lua")
)()
  end
  })


        Tabs.Main:AddButton({
     Title = "Universal Aim Bot",
    Callback = function()
loadstring(game:HttpGet("https://scriptblox.com/raw/Universal-Aimbot_179"))()
  end
  })


  
        Tabs.Main:AddButton({
     Title = "QuirkyCMD",
    Callback = function()
loadstring(game:HttpGet("https://gist.github.com/someunknowndude/38cecea5be9d75cb743eac8b1eaf6758/raw"))()
  end
  })


          Tabs.Main:AddButton({
     Title = "Teleport",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/soctrungkien/scriptroblox/refs/heads/main/Script/TP.lua"))()
  end
  })


            Tabs.Main:AddButton({
     Title = "DarkDoorsKing",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/DarkDoorsKing/Doors/main/Main"))()
  end
  })


              Tabs.Main:AddButton({
     Title = "Quản lí đơn ⟦ChatGPT⟧",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/soctrungkien/scriptroblox/refs/heads/main/Script/QuanLiDon_Fake.lua"))()
  end
  })


                Tabs.Main:AddButton({
     Title = "Vào lại server",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/soctrungkien/scriptroblox/refs/heads/main/Script/VaoLaiServer.lua"))()
  end
  })


                Tabs.Main:AddButton({
     Title = "Server hop",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/soctrungkien/scriptroblox/refs/heads/main/Script/ServerHop.lua"))()
  end
  })


                Tabs.Main:AddButton({
     Title = "May mắn 10000%🍀",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/soctrungkien/scriptroblox/refs/heads/main/Script/Luck.lua"))()
  end
  })


                Tabs.Main:AddButton({
     Title = "RIP",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/CasperFlyModz/discord.gg-rips/main/Loader.lua"))()
  end
  })


                Tabs.Main:AddButton({
     Title = "HOHO HUB ⟦Key⟧",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/acsu123/HOHO_H/main/Loading_UI"))()
  end
  })


                Tabs.Main:AddButton({
     Title = "Anh Đẹp Zai Hub",
    Callback = function()
repeat wait() until game:IsLoaded() and game.Players.LocalPlayer loadstring(game:HttpGet("https://raw.githubusercontent.com/AnDepZaiHub/AnDepZaiHubBeta/refs/heads/main/AnDepZaiHubNewUpdated.lua"))()
  end
  })


                Tabs.Main:AddButton({
     Title = "ezESP",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/soctrungkien/scriptroblox/refs/heads/main/Script/AB.lua"))()
  end
  })


                Tabs.Main:AddButton({
     Title = "Tbao Hub - Dead Rails",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/thaibao/refs/heads/main/TbaoHubDeadRails"))()
  end
  })


                Tabs.Main:AddButton({
     Title = "MinXoV ※ Menu 132",
    Callback = function()
local placeId = game. PlaceId
if placeId == 2753915549 or placeId == 4442272183 or placeId == 7449423635 then
--Blox Fruits
getgenv().Team = "Pirates"
loadstring(game:HttpGet("https://raw.githubusercontent.com/LuaCrack/Min/refs/heads/main/MinXoV"))()
elseif placeId == 116495829188952 or placeId == 70876832253163 then
--DeadRails
loadstring(game:HttpGet("https://raw.githubusercontent.com/LuaCrack/Min/refs/heads/main/MinDeadRails"))()
end
  end
  })


                Tabs.Main:AddButton({
     Title = "BTools",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/soctrungkien/scriptroblox/refs/heads/main/Script/BTools.lua"))()
  end
  })


                Tabs.Main:AddButton({
     Title = "Ez Hub",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/soctrungkien/scriptroblox/refs/heads/main/Script/Ez%20Hub.lua"))()
  end
  })


                Tabs.Main:AddButton({
     Title = "Ko tên ESP",
    Callback = function()
pcall(function() loadstring(game:HttpGet('https://raw.githubusercontent.com/soctrungkien/scriptroblox/refs/heads/main/Script/UnTitledESP.lua'))() end)
  end
  })


                Tabs.Main:AddButton({
     Title = "FPSBoost",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/soctrungkien/scriptroblox/refs/heads/main/Script/fpsboost.lua"))()
  end
  })


                Tabs.Main:AddButton({
     Title = "ClickTP ⟦CTRL+Click⟧",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/soctrungkien/scriptroblox/refs/heads/main/Script/Click%20Teleport.lua"))()
  end
  })



                Tabs.Main:AddButton({
     Title = "VapeV4",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/NewMainScript.lua", true))()
  end
  })



                Tabs.Main:AddButton({
     Title = "All Script ⟦TBoyRoblox⟧",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/TBoyRoblox727/TBoyRobloxYTB/refs/heads/main/AllScriptBF.txt"))()
  end
  })



                Tabs.Main:AddButton({
     Title = "Vxeze Hub",
    Callback = function()
local placeId = game. PlaceId
if placeId == 2753915549 or placeId == 4442272183 or placeId == 7449423635 then
--Blox Fruits
getgenv().Team = "Pirates"
loadstring(game:HttpGet("https://raw.githubusercontent.com/Dex-Bear/Vxezehub/refs/heads/main/Skidlamcho.txt"))()
elseif placeId == 116495829188952 or placeId == 70876832253163 then
--DeadRails
loadstring(game:HttpGet("https://raw.githubusercontent.com/Dex-Bear/Vxezehub/refs/heads/main/VxezeHubDeadRails"))()
end
  end
  })


                Tabs.Main:AddButton({
     Title = "Chú Roblox Hub",
    Callback = function()
local Settings = {
JoinTeam = "Pirates"; -- Pirates/Marines
Translator = true; -- true/false
}

loadstring(game:HttpGet("https://raw.githubusercontent.com/giahuy2511-coder/scripts/refs/heads/main/ChuRobloxHub"))(Settings)
  end
  })


                Tabs.Main:AddButton({
     Title = "Relz Hub ⟦Key⟧",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/farghii/relzhub/refs/heads/main/v2.bloxfruits.lua"))()
  end
  })


                Tabs.Main:AddButton({
     Title = "c00lgui Reborn Rc7 bởi v3rx",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/soctrungkien/scriptroblox/refs/heads/main/Script/C00lGui%20for%20Rc7(2).lua"))()
  end
  })


                Tabs.Main:AddButton({
     Title = "Universal Sorry Gui",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/soctrungkien/scriptroblox/refs/heads/main/Script/UniversalSorryGui-w40R3.lua"))()
  end
  })


                Tabs.Main:AddButton({
     Title = "FRUITS FINDER by ALCHEMY",
    Callback = function()
-- Put it in [auto-exec]
fruits_finder = true;
loadstring(game:HttpGet("https://scripts.alchemyhub.xyz"))()
  end
  })


                Tabs.Main:AddButton({
     Title = "INFINITE YIELD",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
  end
  })


                Tabs.Main:AddButton({
     Title = "Dark Dex",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Cynacol/Dark-Dex-V3/refs/heads/main/Dark%20Dex%20V3.txt"))()
  end
  })


                Tabs.Main:AddButton({
     Title = "PShade Ultimate",
    Callback = function()

loadstring(game:HttpGet('https://raw.githubusercontent.com/randomstring0/pshade-ultimate/refs/heads/main/src/cd.lua'))()
--PShade Ultimate web : https://randomstring0.github.io/pshade.github.io/
            
  end
  })


                Tabs.Main:AddButton({
     Title = "Chat bypass ⟦Rủi đo cao - Key⟧",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Synergy-Networks/products/main/BetterBypasser/loader.lua",true))()
  end
  })


                Tabs.Main:AddButton({
     Title = "WA Universal ESP",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/wa0101/Roblox-ESP/refs/heads/main/esp.lua",true))()
  end
  })


                Tabs.Main:AddButton({
     Title = "SimpleSpy",
    Callback = function()
loadstring(game:HttpGet("https://github.com/exxtremestuffs/SimpleSpySource/raw/master/SimpleSpy.lua"))()
  end
  })


                Tabs.Main:AddButton({
     Title = "F3X Tool",
    Callback = function()
loadstring(game:GetObjects("rbxassetid://6695644299")[1].Source)()
  end
  })


                Tabs.Main:AddButton({
     Title = "Auto Bond - Dead Rails",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/thiennrb7/Script/refs/heads/main/autobond"))()
  end
  })


                Tabs.Main:AddButton({
     Title = "Rift - Dead Rails",
    Callback = function()
loadstring(game:HttpGet("https://github.com/Synergy-Networks/products/raw/main/Rift/loader.lua"))()
  end
  })


                Tabs.Main:AddButton({
     Title = "Dex",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/soctrungkien/scriptroblox/refs/heads/main/Script/Dex%20V5%20(1).lua"))()
  end
  })


                Tabs.Main:AddButton({
     Title = "Hiện thông tin",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/soctrungkien/scriptroblox/refs/heads/main/Script/info.lua"))()
  end
  })


                Tabs.Main:AddButton({
     Title = "UNC Test",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/soctrungkien/scriptroblox/refs/heads/main/Script/unc%20test.lua"))()
  end
  })


                Tabs.Main:AddButton({
     Title = "Speed Hub X ⟦Ads⟧",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua", true))()
  end
  })


                Tabs.Main:AddButton({
     Title = "Lấy PlaceID",
    Callback = function()
print(game.PlaceId)
setclipboard(game.PlaceId)
  end
  })


                Tabs.Main:AddButton({
     Title = "Rin Hub ⟦Rủi đo cao - Ads⟧",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/RinHubv4/RealRin/refs/heads/main/rinv4",true))()
  end
  })


                Tabs.Main:AddButton({
     Title = "Quartyz",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/xQuartyx/QuartyzScript/main/Loader.lua", true))()
  end
  })


                Tabs.Main:AddButton({
     Title = "🔥 Example Script Hub | Game 🔫 by 1_F0 - 🔫 Gun Simulator 💥",
    Callback = function()
game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "🔥 Example Script Hub | Game 🔫 by 1_F0 - 🔫 Gun Simulator 💥", 
	Text = "Key is: 12345678", 
	Duration = 10,
	Icon = "rbxassetid://13047715178"
})
loadstring(game:HttpGet("https://raw.githubusercontent.com/soctrungkien/scriptroblox/refs/heads/main/Script/%F0%9F%94%A5%20Example%20Script%20Hub%20%7C%20Game%20%F0%9F%94%AB%20by%201_F0%20-%20%F0%9F%94%AB%20Gun%20Simulator%20%F0%9F%92%A5.lua"))()
  end
  })
