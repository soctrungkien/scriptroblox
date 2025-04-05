loadstring(game:HttpGet(("https://raw.githubusercontent.com/soctrungkien/scriptroblox/refs/heads/main/Script/GuiLib.lua")))()

       local Window = MakeWindow({
         Hub = {
         Title = "Script",
         Animation = "Loading..."
         },
        Key = {
        KeySystem = false,
        Title = "Key System",
        Description = "",
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
       Corner = false,
       Stroke = false,
       StrokeColor = Color3.fromRGB(255, 0, 0)
      })
      
------ Tab
     local Tab1o = MakeTab({Name = "Main"})

-------KEYBYPASS
local settingskey = {
    autoRun = false  -- Có thể chỉnh thành true/false để bật/tắt script
}

if settingskey.autoRun then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/soctrungkien/scriptroblox/refs/heads/main/Script/KeyBypass.lua"))()
end
------- BUTTON
    
    AddButton(Tab1o, {
     Name = "Redz Hub",
    Callback = function()
	  local Settings = {
  JoinTeam = "Pirates"; -- Pirates/Marines
  Translator = true; -- true/false
}

loadstring(game:HttpGet("https://raw.githubusercontent.com/newredz/BloxFruits/refs/heads/main/Source.luau"))(Settings)
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
     Name = "Banana Hub ⟦Key⟧",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/soctrungkien/scriptroblox/refs/heads/main/Script/BananaHubKey.lua"))()
  end
  })
    

        AddButton(Tab1o, {
     Name = "Chat Bypass",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/ChatBypasser-AZY/refs/heads/main/ChatBypasser(New).lua"))()
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
     Name = "Redz Hub - Meme Sea",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/realredz/MemeSea/refs/heads/main/Source.lua"))()
  end
  })


              AddButton(Tab1o, {
     Name = "Quản lí đơn ⟦Fake⟧",
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
     Name = "Server hop ⟦❗❗ĐANG BỊ LỖI CRACK❗❗⟧",
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
     Name = "HOHO HUB",
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
