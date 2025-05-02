--[[luau
--Copy vào chỗ nhập script hack
loadstring(game:HttpGet("https://pastefy.app/Tz3VReH1/raw"))()
--]]
print("𝙳𝚛𝚊𝚐𝚘𝚗 𝙷𝚞𝚋 𝚋𝚢 @𝟿𝟾𝚘0𝚘𝟹𝟿 ☑️")
-------GUILIB
local Fluent = loadstring(game:HttpGet("https://raw.githubusercontent.com/soctrungkien/scriptroblox/refs/heads/main/Script/GuiLib2.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/soctrungkien/scriptroblox/refs/heads/main/Script/im.lua"))()
-------ANTIAFK
loadstring(game:HttpGet("https://raw.githubusercontent.com/soctrungkien/scriptroblox/refs/heads/main/Script/antiafk.lua"))()
------MAIN

       local Window = Fluent:CreateWindow{
        Title = "Dragon Hub " .. Fluent.Version,
        SubTitle = "by @98ᴏ0ᴏ39",
        TabWidth = 160,
        Size = UDim2.new(0, 500, 0, 300),
        UseAcrylic = true,
        Transparency = true,
        Acrylic = true, -- The blur may be detectable, setting this to false disables blur entirely
        Theme = "Dark",
        MinimizeKey = Enum.KeyCode.K, -- Phím để thu nhỏ cửa sổ
        MinimizeKeybind = Enum.KeyCode.K -- Phím tắt để thu nhỏ
      }
      


------MinButtonToggle
local MinButtonToggle = loadstring(game:HttpGet("https://raw.githubusercontent.com/soctrungkien/scriptroblox/refs/heads/main/Script/MinButtonToggleFix.lua"))()
local button = MinButtonToggle.Create()
if button then
    button.Image = "rbxassetid://81249639738070"
    button.Activated:Connect(function()
            local success, err = pcall(function()
                Window:Minimize()
            end)
        end)
end

------ Tab
local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "home" }),
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


if placeId == 116495829188952 or placeId == 70876832253163 then
                Tabs.Main:AddButton({
     Title = "Tbao Hub", --DeadRails
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/thaibao/refs/heads/main/TbaoHubDeadRails"))()
  end
  })
end

                Tabs.Main:AddButton({
     Title = "MinXoV ※ Menu 132",
    Callback = function()
local placeId = game.PlaceId
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
     Title = "Antilag",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/soctrungkien/scriptroblox/refs/heads/main/Script/fpsboost.lua",true))()
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


if placeId == 116495829188952 or placeId == 70876832253163 then
                Tabs.Main:AddButton({
     Title = "Auto Bond",--DeadRails
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/thiennrb7/Script/refs/heads/main/autobond"))()
  end
  })
end


                Tabs.Main:AddButton({
     Title = "Rift",
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


                Tabs.Main:AddButton({
     Title = "Zinner Hub",
    Callback = function()
getgenv().Team = "Pirates"
loadstring(game:HttpGet('https://raw.githubusercontent.com/HoangNguyenk8/Scripts/refs/heads/main/Loader.lua'))()
  end
  })


                Tabs.Main:AddButton({
     Title = "Maru Hub ⟦Fake⟧",
    Callback = function()
getgenv().Team = "Pirates"
loadstring(game:HttpGet("https://raw.githubusercontent.com/LuaCrack/KimP/refs/heads/main/MaruHub"))()
  end
  })


                Tabs.Main:AddButton({
     Title = "Tsuo Hub ⟦Free⟧",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Tsuo7/TsuoHub/main/Tsuoscripts"))()
  end
  })


                Tabs.Main:AddButton({
     Title = "Troll Menu",
    Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/FWwdST5Y"))()
  end
  })


                Tabs.Main:AddButton({
     Title = "Rubu Hub",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/LuaCrack/RubuRoblox/refs/heads/main/RuBuRzVn"))()
  end
  })


                Tabs.Main:AddButton({
     Title = "Ro-Hub",
    Callback = function()
_G.settings = {
    autoLoadConfig = true, -- self explanatory
    joinTeam = "Pirates" -- "Pirates" or "Marines"
}

loadstring(game:HttpGet("https://raw.githubusercontent.com/RO-HUB-CODEX/RO-HUB/refs/heads/main/bloxfruits.lua"))()
  end
  })


                Tabs.Main:AddButton({
     Title = "Annie hub",
    Callback = function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/1st-Mars/Annie/main/1st.lua'))()
  end
  })


                Tabs.Main:AddButton({
     Title = "POROXO",
    Callback = function()
print("byvn.net/y77i")
loadstring(game:HttpGet"https://raw.githubusercontent.com/sinnx32/bloxfruit/main/proxo")()
  end
  })


                Tabs.Main:AddButton({
     Title = "Monster Hub",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/giahuy2511-coder/MonsterHub/refs/heads/main/MonsterHub"))()
  end
  })


                Tabs.Main:AddButton({
     Title = "HTTPspy",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/soctrungkien/scriptroblox/refs/heads/main/Script/HTTPspy%20v0.1.lua"))()
  end
  })


                Tabs.Main:AddButton({
     Title = "NO-LAG HUB",
    Callback = function()
loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/NoLag-id/No-Lag-HUB/refs/heads/main/Loader/LoaderV1.lua"))()
  end
  })


                Tabs.Main:AddButton({
     Title = "vertex",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/vertex-peak/vertex/refs/heads/main/loadstring"))()
  end
  })


                Tabs.Main:AddButton({
     Title = "Unlock Workspace",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/soctrungkien/scriptroblox/refs/heads/main/Script/Unlock%20Workspace%20Baseparts.lua"))()
  end
  })


                Tabs.Main:AddButton({
     Title = "MoreUNC",
    Callback = function()
local MoreUNC = loadstring(game:HttpGet("https://raw.githubusercontent.com/soctrungkien/scriptroblox/refs/heads/main/Script/MoreUNC.lua"))()
  end
  })


                Tabs.Main:AddButton({
     Title = "Teleport",
    Callback = function()
local MoreUNC = loadstring(game:HttpGet("https://raw.githubusercontent.com/soctrungkien/scriptroblox/refs/heads/main/Script/TP.lua"))()
  end
  })
