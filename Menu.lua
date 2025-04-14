-------GUILIB
loadstring(game:HttpGet(("https://raw.githubusercontent.com/soctrungkien/scriptroblox/refs/heads/main/Script/GuiLib.lua")))()
-------ANTIAFK
loadstring(game:HttpGet("https://raw.githubusercontent.com/soctrungkien/scriptroblox/refs/heads/main/Script/antiafk.lua"))()
------MAIN
       local Window = MakeWindow({
         Hub = {
         Title = "Dragon Hub by @98ᴏ0ᴏ39",
         Animation = "Loading..."
         },
        Key = {
        KeySystem = false,
        Title = "Key System",
        Description = "Key is 1234",
        KeyLink = "",
        Keys = {"1234"},
        Notifi = {
        Notifications = true,
        CorrectKey = "Running the Script...",
       Incorrectkey = "The key is incorrect",
       CopyKeyLink = "Copied to Clipboard"
      }
    }
  })

       MinimizeButton({
       Image = "rbxassetid://81249639738070",
       Size = {50, 50},
       Color = Color3.fromRGB(10, 10, 10),
       Corner = true,
       Stroke = false,
       StrokeColor = Color3.fromRGB(255, 0, 0)
      })
      
------ Tab
     local Tab1o = MakeTab({Name = "Main"})


------- BUTTON
    
    AddButton(Tab1o, {
     Name = "Redz Hub",
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
  end
  })


      AddButton(Tab1o, {
     Name = "Ping/FPS",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/soctrungkien/scriptroblox/refs/heads/main/Script/Ping_FPS.lua"))()
  end
  })


      AddButton(Tab1o, {
     Name = "Fly GUI",
    Callback = function()
loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\40\39\104\116\116\112\115\58\47\47\103\105\115\116\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\109\101\111\122\111\110\101\89\84\47\98\102\48\51\55\100\102\102\57\102\48\97\55\48\48\49\55\51\48\52\100\100\100\54\55\102\100\99\100\51\55\48\47\114\97\119\47\101\49\52\101\55\52\102\52\50\53\98\48\54\48\100\102\53\50\51\51\52\51\99\102\51\48\98\55\56\55\48\55\52\101\98\51\99\53\100\50\47\97\114\99\101\117\115\37\50\53\50\48\120\37\50\53\50\48\102\108\121\37\50\53\50\48\50\37\50\53\50\48\111\98\102\108\117\99\97\116\111\114\39\41\44\116\114\117\101\41\41\40\41\10\10")()
  end
  })


      AddButton(Tab1o, {
     Name = "DatTHGV1",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/LuaCrack/DatThg/refs/heads/main/DatThgV1"))()
  end
  })


        AddButton(Tab1o, {
     Name = "Dex Explorer",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/soctrungkien/scriptroblox/refs/heads/main/Script/DexExplorerLite.lua"))()
  end
  })
  

        AddButton(Tab1o, {
     Name = "Banana Hub ⟦Fake⟧",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/soctrungkien/scriptroblox/refs/heads/main/Script/DexExplorerLite.lua"))()
  end
  })

    
          AddButton(Tab1o, {
     Name = "Orca",
    Callback = function()
loadstring(
  game:HttpGetAsync("https://raw.githubusercontent.com/richie0866/orca/master/public/latest.lua")
)()
  end
  })


        AddButton(Tab1o, {
     Name = "Universal Aim Bot",
    Callback = function()
loadstring(game:HttpGet("https://scriptblox.com/raw/Universal-Aimbot_179"))()
  end
  })


  
        AddButton(Tab1o, {
     Name = "QuirkyCMD",
    Callback = function()
loadstring(game:HttpGet("https://gist.github.com/someunknowndude/38cecea5be9d75cb743eac8b1eaf6758/raw"))()
  end
  })


          AddButton(Tab1o, {
     Name = "Teleport",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/soctrungkien/scriptroblox/refs/heads/main/Script/TP.lua"))()
  end
  })


            AddButton(Tab1o, {
     Name = "DarkDoorsKing",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/DarkDoorsKing/Doors/main/Main"))()
  end
  })


              AddButton(Tab1o, {
     Name = "Quản lí đơn ⟦ChatGPT⟧",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/soctrungkien/scriptroblox/refs/heads/main/Script/QuanLiDon_Fake.lua"))()
  end
  })


                AddButton(Tab1o, {
     Name = "Vào lại server",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/soctrungkien/scriptroblox/refs/heads/main/Script/VaoLaiServer.lua"))()
  end
  })


                AddButton(Tab1o, {
     Name = "Server hop",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/soctrungkien/scriptroblox/refs/heads/main/Script/ServerHop.lua"))()
  end
  })


                AddButton(Tab1o, {
     Name = "May mắn 10000%🍀",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/soctrungkien/scriptroblox/refs/heads/main/Script/Luck.lua"))()
  end
  })


                AddButton(Tab1o, {
     Name = "RIP",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/CasperFlyModz/discord.gg-rips/main/Loader.lua"))()
  end
  })


                AddButton(Tab1o, {
     Name = "HOHO HUB ⟦Key⟧",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/acsu123/HOHO_H/main/Loading_UI"))()
  end
  })


                AddButton(Tab1o, {
     Name = "Anh Đẹp Zai Hub",
    Callback = function()
repeat wait() until game:IsLoaded() and game.Players.LocalPlayer loadstring(game:HttpGet("https://raw.githubusercontent.com/AnDepZaiHub/AnDepZaiHubBeta/refs/heads/main/AnDepZaiHubNewUpdated.lua"))()
  end
  })


                AddButton(Tab1o, {
     Name = "ezESP",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/soctrungkien/scriptroblox/refs/heads/main/Script/AB.lua"))()
  end
  })


                AddButton(Tab1o, {
     Name = "Tbao Hub - Dead Rails",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/thaibao/refs/heads/main/TbaoHubDeadRails"))()
  end
  })


                AddButton(Tab1o, {
     Name = "MinXoV ※ Menu 132",
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
  end
  })


                AddButton(Tab1o, {
     Name = "BTools",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/soctrungkien/scriptroblox/refs/heads/main/Script/BTools.lua"))()
  end
  })


                AddButton(Tab1o, {
     Name = "Ez Hub",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/soctrungkien/scriptroblox/refs/heads/main/Script/Ez%20Hub.lua"))()
  end
  })


                AddButton(Tab1o, {
     Name = "Ko tên ESP",
    Callback = function()
pcall(function() loadstring(game:HttpGet('https://raw.githubusercontent.com/soctrungkien/scriptroblox/refs/heads/main/Script/UnnamedESP.lua'))() end)
  end
  })


                AddButton(Tab1o, {
     Name = "FPSBoost",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/soctrungkien/scriptroblox/refs/heads/main/Script/fpsboost.lua"))()
  end
  })


                AddButton(Tab1o, {
     Name = "ClickTP ⟦CTRL+Click⟧",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/soctrungkien/scriptroblox/refs/heads/main/Script/Click%20Teleport.lua"))()
  end
  })



                AddButton(Tab1o, {
     Name = "VapeV4",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/NewMainScript.lua", true))()
  end
  })



                AddButton(Tab1o, {
     Name = "All Script ⟦TBoyRoblox⟧",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/TBoyRoblox727/TBoyRobloxYTB/refs/heads/main/AllScriptBF.txt"))()
  end
  })



                AddButton(Tab1o, {
     Name = "Vxeze Hub",
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


                AddButton(Tab1o, {
     Name = "Chú Roblox Hub",
    Callback = function()
local Settings = {
JoinTeam = "Pirates"; -- Pirates/Marines
Translator = true; -- true/false
}

loadstring(game:HttpGet("https://raw.githubusercontent.com/giahuy2511-coder/scripts/refs/heads/main/ChuRobloxHub"))(Settings)
  end
  })


                AddButton(Tab1o, {
     Name = "Relz Hub ⟦Key⟧",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/farghii/relzhub/refs/heads/main/v2.bloxfruits.lua"))()
  end
  })


                AddButton(Tab1o, {
     Name = "c00lgui Reborn Rc7 bởi v3rx",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/soctrungkien/scriptroblox/refs/heads/main/Script/C00lGui%20for%20Rc7(2).luau"))()
  end
  })


                AddButton(Tab1o, {
     Name = "Universal Sorry Gui",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/soctrungkien/scriptroblox/refs/heads/main/Script/UniversalSorryGui-w40R3.lua"))()
  end
  })


                AddButton(Tab1o, {
     Name = "FRUITS FINDER by ALCHEMY",
    Callback = function()
-- Put it in [auto-exec]
fruits_finder = true;
loadstring(game:HttpGet("https://scripts.alchemyhub.xyz"))()
  end
  })


                AddButton(Tab1o, {
     Name = "INFINITE YIELD",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
  end
  })


                AddButton(Tab1o, {
     Name = "Dark Dex",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Cynacol/Dark-Dex-V3/refs/heads/main/Dark%20Dex%20V3.txt"))()
  end
  })
