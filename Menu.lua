local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/soctrungkien/scriptroblox/refs/heads/main/Script/GuiLib.lua"))()

       local Window = redzlib:MakeWindow({
         Title = "Hihi Hub",
         SubTitle = by @98ᴏ0ᴏ39 ☑️"
  })

       Window:AddMinimizeButton({
    Button = { Image = "rbxassetid://81249639738070", BackgroundTransparency = 0 },
    Corner = { CornerRadius = UDim.new(35, 1) }
      })
      
------ Tab
     local Tab1o = Window:MakeTab({"Main", "home"})

-------KEYBYPASS
local settingskey = {
    autoRun = false  -- Có thể chỉnh thành true/false để bật/tắt script
}

if settingskey.autoRun then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/soctrungkien/scriptroblox/refs/heads/main/Script/KeyBypass.lua"))()
end
------- ?
Window:SelectTab(Tab1o)
redzlib:SetTheme("Purple")
------- BUTTON
    
    AddButton(Tab1o, {
     Name = "Redz Hub", function(Value)
	  local Settings = {
  JoinTeam = "Pirates"; -- Pirates/Marines
  Translator = true; -- true/false
}

loadstring(game:HttpGet("https://raw.githubusercontent.com/newredz/BloxFruits/refs/heads/main/Source.luau"))(Settings)
  end
  })


Tab1o:AddButton({"Ping/FPS", function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/soctrungkien/scriptroblox/refs/heads/main/Script/Ping_FPS.lua"))()
  end
  })


Tab1o:AddButton({"Fly GUI", function(Value)
loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\40\39\104\116\116\112\115\58\47\47\103\105\115\116\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\109\101\111\122\111\110\101\89\84\47\98\102\48\51\55\100\102\102\57\102\48\97\55\48\48\49\55\51\48\52\100\100\100\54\55\102\100\99\100\51\55\48\47\114\97\119\47\101\49\52\101\55\52\102\52\50\53\98\48\54\48\100\102\53\50\51\51\52\51\99\102\51\48\98\55\56\55\48\55\52\101\98\51\99\53\100\50\47\97\114\99\101\117\115\37\50\53\50\48\120\37\50\53\50\48\102\108\121\37\50\53\50\48\50\37\50\53\50\48\111\98\102\108\117\99\97\116\111\114\39\41\44\116\114\117\101\41\41\40\41\10\10")()
  end
  })


Tab1o:AddButton({"DatTHGV1", function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/LuaCrack/DatThg/refs/heads/main/DatThgV1"))()
  end
  })


  Tab1o:AddButton({"Dex Explorer", function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/soctrungkien/scriptroblox/refs/heads/main/Script/DexExplorerLite.lua"))()
  end
  })
  

  Tab1o:AddButton({"Banana Hub ⟦Fake⟧", function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/soctrungkien/scriptroblox/refs/heads/main/Script/DexExplorerLite.lua"))()
  end
  })


  Tab1o:AddButton({"Banana Hub ⟦Key⟧", function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/soctrungkien/scriptroblox/refs/heads/main/Script/BananaHubKey.lua"))()
  end
  })
    

  Tab1o:AddButton({"Chat Bypass", function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/ChatBypasser-AZY/refs/heads/main/ChatBypasser(New).lua"))()
  end
  })

    Tab1o:AddButton({"Orca", function(Value)
loadstring(
  game:HttpGetAsync("https://raw.githubusercontent.com/richie0866/orca/master/public/latest.lua")
)()
  end
  })


  Tab1o:AddButton({"Universal Aim Bot", function(Value)
loadstring(game:HttpGet("https://scriptblox.com/raw/Universal-Aimbot_179"))()
  end
  })


  
  Tab1o:AddButton({"QuirkyCMD", function(Value)
loadstring(game:HttpGet("https://gist.github.com/someunknowndude/38cecea5be9d75cb743eac8b1eaf6758/raw"))()
  end
  })


    Tab1o:AddButton({"Teleport", function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/soctrungkien/scriptroblox/refs/heads/main/Script/TP.lua"))()
  end
  })


      Tab1o:AddButton({"DarkDoorsKing", function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/DarkDoorsKing/Doors/main/Main"))()
  end
  })


      Tab1o:AddButton({"Redz Hub - Meme Sea", function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/realredz/MemeSea/refs/heads/main/Source.lua"))()
  end
  })


        Tab1o:AddButton({"Quản lí đơn ⟦Fake⟧", function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/soctrungkien/scriptroblox/refs/heads/main/Script/QuanLiDon_Fake.lua"))()
  end
  })


          Tab1o:AddButton({"Vào lại server", function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/soctrungkien/scriptroblox/refs/heads/main/Script/VaoLaiServer.lua"))()
  end
  })


          Tab1o:AddButton({"Server hop ⟦❗❗ĐANG BỊ LỖI CRACK❗❗⟧", function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/soctrungkien/scriptroblox/refs/heads/main/Script/ServerHop.lua"))()
  end
  })


          Tab1o:AddButton({"May mắn 10000%🍀", function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/soctrungkien/scriptroblox/refs/heads/main/Script/Luck.lua"))()
  end
  })


          Tab1o:AddButton({"RIP", function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/CasperFlyModz/discord.gg-rips/main/Loader.lua"))()
  end
  })


          Tab1o:AddButton({"HOHO HUB", function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/acsu123/HOHO_H/main/Loading_UI"))()
  end
  })


          Tab1o:AddButton({"Anh Đẹp Zai Hub", function(Value)
repeat wait() until game:IsLoaded() and game.Players.LocalPlayer loadstring(game:HttpGet("https://raw.githubusercontent.com/AnDepZaiHub/AnDepZaiHubBeta/refs/heads/main/AnDepZaiHubNewUpdated.lua"))()
  end
  })


          Tab1o:AddButton({"AB", function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/soctrungkien/scriptroblox/refs/heads/main/Script/AB.lua"))()
  end
  })


          Tab1o:AddButton({"Kiểm tra bảo mật", function(Value)
if settingskey.autoRun then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/soctrungkien/scriptroblox/refs/heads/main/Script/KeyBypass.lua"))()
end
  end
  })
