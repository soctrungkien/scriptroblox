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
    Author = info.Name,
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

local Block = Window:Tab({
    Title = "Block",
    Icon = "cuboid"
})

local RemoteEvent = Window:Tab({
    Title = "RemoteEvent",
    Icon = "package"
})

local CS = Window:Tab({
    Title = "Coming Soon",
    Icon = "lock",
    Locked = true
})

Window:SelectTab(1)

local fly = Player:Button({
    Title = "FLYUI",
    Desc = "like Fly ui XNEO",
    Locked = false,
    Callback = function()
			local main = Instance.new("ScreenGui")
			local Frame = Instance.new("Frame")
			local up = Instance.new("TextButton")
			local down = Instance.new("TextButton")
			local onof = Instance.new("TextButton")
			local TextLabel = Instance.new("TextLabel")
			local plus = Instance.new("TextButton")
			local speed = Instance.new("TextLabel")
			local mine = Instance.new("TextButton")
			local closebutton = Instance.new("TextButton")
			local mini = Instance.new("TextButton")
			local mini2 = Instance.new("TextButton")

			main.Name = "main"
			main.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
			main.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
			main.ResetOnSpawn = false

			Frame.Parent = main
			Frame.BackgroundColor3 = Color3.fromRGB(163, 255, 137)
			Frame.BorderColor3 = Color3.fromRGB(103, 221, 213)
			Frame.Position = UDim2.new(0.100320168, 0, 0.379746825, 0)
			Frame.Size = UDim2.new(0, 190, 0, 57)

			up.Name = "up"
			up.Parent = Frame
			up.BackgroundColor3 = Color3.fromRGB(79, 255, 152)
			up.Size = UDim2.new(0, 44, 0, 28)
			up.Font = Enum.Font.SourceSans
			up.Text = "UP"
			up.TextColor3 = Color3.fromRGB(0, 0, 0)
			up.TextSize = 14.000

			down.Name = "down"
			down.Parent = Frame
			down.BackgroundColor3 = Color3.fromRGB(215, 255, 121)
			down.Position = UDim2.new(0, 0, 0.491228074, 0)
			down.Size = UDim2.new(0, 44, 0, 28)
			down.Font = Enum.Font.SourceSans
			down.Text = "DOWN"
			down.TextColor3 = Color3.fromRGB(0, 0, 0)
			down.TextSize = 14.000

			onof.Name = "onof"
			onof.Parent = Frame
			onof.BackgroundColor3 = Color3.fromRGB(255, 249, 74)
			onof.Position = UDim2.new(0.702823281, 0, 0.491228074, 0)
			onof.Size = UDim2.new(0, 56, 0, 28)
			onof.Font = Enum.Font.SourceSans
			onof.Text = "fly"
			onof.TextColor3 = Color3.fromRGB(0, 0, 0)
			onof.TextSize = 14.000

			TextLabel.Parent = Frame
			TextLabel.BackgroundColor3 = Color3.fromRGB(242, 60, 255)
			TextLabel.Position = UDim2.new(0.469327301, 0, 0, 0)
			TextLabel.Size = UDim2.new(0, 100, 0, 28)
			TextLabel.Font = Enum.Font.SourceSans
			TextLabel.Text = "Draggable"
			TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
			TextLabel.TextScaled = true
			TextLabel.TextSize = 14.000
			TextLabel.TextWrapped = true

			plus.Name = "plus"
			plus.Parent = Frame
			plus.BackgroundColor3 = Color3.fromRGB(133, 145, 255)
			plus.Position = UDim2.new(0.231578946, 0, 0, 0)
			plus.Size = UDim2.new(0, 45, 0, 28)
			plus.Font = Enum.Font.SourceSans
			plus.Text = "+"
			plus.TextColor3 = Color3.fromRGB(0, 0, 0)
			plus.TextScaled = true
			plus.TextSize = 14.000
			plus.TextWrapped = true

			speed.Name = "speed"
			speed.Parent = Frame
			speed.BackgroundColor3 = Color3.fromRGB(255, 85, 0)
			speed.Position = UDim2.new(0.468421042, 0, 0.491228074, 0)
			speed.Size = UDim2.new(0, 44, 0, 28)
			speed.Font = Enum.Font.SourceSans
			speed.Text = "1"
			speed.TextColor3 = Color3.fromRGB(0, 0, 0)
			speed.TextScaled = true
			speed.TextSize = 14.000
			speed.TextWrapped = true

			mine.Name = "mine"
			mine.Parent = Frame
			mine.BackgroundColor3 = Color3.fromRGB(123, 255, 247)
			mine.Position = UDim2.new(0.231578946, 0, 0.491228074, 0)
			mine.Size = UDim2.new(0, 45, 0, 29)
			mine.Font = Enum.Font.SourceSans
			mine.Text = "-"
			mine.TextColor3 = Color3.fromRGB(0, 0, 0)
			mine.TextScaled = true
			mine.TextSize = 14.000
			mine.TextWrapped = true

			closebutton.Name = "Close"
			closebutton.Parent = main.Frame
			closebutton.BackgroundColor3 = Color3.fromRGB(225, 25, 0)
			closebutton.Font = "SourceSans"
			closebutton.Size = UDim2.new(0, 45, 0, 28)
			closebutton.Text = "X"
			closebutton.TextSize = 30
			closebutton.Position =  UDim2.new(0, 0, -1, 27)

			mini.Name = "minimize"
			mini.Parent = main.Frame
			mini.BackgroundColor3 = Color3.fromRGB(192, 150, 230)
			mini.Font = "SourceSans"
			mini.Size = UDim2.new(0, 45, 0, 28)
			mini.Text = "-"
			mini.TextSize = 40
			mini.Position = UDim2.new(0, 44, -1, 27)

			mini2.Name = "minimize2"
			mini2.Parent = main.Frame
			mini2.BackgroundColor3 = Color3.fromRGB(192, 150, 230)
			mini2.Font = "SourceSans"
			mini2.Size = UDim2.new(0, 45, 0, 28)
			mini2.Text = "+"
			mini2.TextSize = 40
			mini2.Position = UDim2.new(0, 44, -1, 57)
			mini2.Visible = false

			speeds = 1

			local speaker = game:GetService("Players").LocalPlayer

			local chr = game.Players.LocalPlayer.Character
			local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")

			nowe = false

			Frame.Active = true -- main = gui
			Frame.Draggable = true

			onof.MouseButton1Down:connect(function()

				if nowe == true then
					nowe = false

					speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing,true)
					speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown,true)
					speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying,true)
					speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall,true)
					speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp,true)
					speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping,true)
					speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed,true)
					speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics,true)
					speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding,true)
					speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll,true)
					speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running,true)
					speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics,true)
					speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated,true)
					speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics,true)
					speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming,true)
					speaker.Character.Humanoid:ChangeState(Enum.HumanoidStateType.RunningNoPhysics)
				else 
					nowe = true



					for i = 1, speeds do
						spawn(function()

							local hb = game:GetService("RunService").Heartbeat	


							tpwalking = true
							local chr = game.Players.LocalPlayer.Character
							local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
							while tpwalking and hb:Wait() and chr and hum and hum.Parent do
								if hum.MoveDirection.Magnitude > 0 then
									chr:TranslateBy(hum.MoveDirection)
								end
							end

						end)
					end
					game.Players.LocalPlayer.Character.Animate.Disabled = true
					local Char = game.Players.LocalPlayer.Character
					local Hum = Char:FindFirstChildOfClass("Humanoid") or Char:FindFirstChildOfClass("AnimationController")

					for i,v in next, Hum:GetPlayingAnimationTracks() do
						v:AdjustSpeed(0)
					end
					speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing,false)
					speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown,false)
					speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying,false)
					speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall,false)
					speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp,false)
					speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping,false)
					speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed,false)
					speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics,false)
					speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding,false)
					speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll,false)
					speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running,false)
					speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics,false)
					speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated,false)
					speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics,false)
					speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming,false)
					speaker.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Swimming)
				end




				if game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").RigType == Enum.HumanoidRigType.R6 then



					local plr = game.Players.LocalPlayer
					local torso = plr.Character.Torso
					local flying = true
					local deb = true
					local ctrl = {f = 0, b = 0, l = 0, r = 0}
					local lastctrl = {f = 0, b = 0, l = 0, r = 0}
					local maxspeed = 50
					local speed = 0


					local bg = Instance.new("BodyGyro", torso)
					bg.P = 9e4
					bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
					bg.cframe = torso.CFrame
					local bv = Instance.new("BodyVelocity", torso)
					bv.velocity = Vector3.new(0,0.1,0)
					bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
					if nowe == true then
						plr.Character.Humanoid.PlatformStand = true
					end
					while nowe == true or game:GetService("Players").LocalPlayer.Character.Humanoid.Health == 0 do
						game:GetService("RunService").RenderStepped:Wait()

						if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
							speed = speed+.5+(speed/maxspeed)
							if speed > maxspeed then
								speed = maxspeed
							end
						elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
							speed = speed-1
							if speed < 0 then
								speed = 0
							end
						end
						if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
							bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
							lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
						elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
							bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
						else
							bv.velocity = Vector3.new(0,0,0)
						end
						--	game.Players.LocalPlayer.Character.Animate.Disabled = true
						bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0)
					end
					ctrl = {f = 0, b = 0, l = 0, r = 0}
					lastctrl = {f = 0, b = 0, l = 0, r = 0}
					speed = 0
					bg:Destroy()
					bv:Destroy()
					plr.Character.Humanoid.PlatformStand = false
					game.Players.LocalPlayer.Character.Animate.Disabled = false
					tpwalking = false




				else
					local plr = game.Players.LocalPlayer
					local UpperTorso = plr.Character.UpperTorso
					local flying = true
					local deb = true
					local ctrl = {f = 0, b = 0, l = 0, r = 0}
					local lastctrl = {f = 0, b = 0, l = 0, r = 0}
					local maxspeed = 50
					local speed = 0


					local bg = Instance.new("BodyGyro", UpperTorso)
					bg.P = 9e4
					bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
					bg.cframe = UpperTorso.CFrame
					local bv = Instance.new("BodyVelocity", UpperTorso)
					bv.velocity = Vector3.new(0,0.1,0)
					bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
					if nowe == true then
						plr.Character.Humanoid.PlatformStand = true
					end
					while nowe == true or game:GetService("Players").LocalPlayer.Character.Humanoid.Health == 0 do
						wait()

						if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
							speed = speed+.5+(speed/maxspeed)
							if speed > maxspeed then
								speed = maxspeed
							end
						elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
							speed = speed-1
							if speed < 0 then
								speed = 0
							end
						end
						if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
							bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
							lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
						elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
							bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
						else
							bv.velocity = Vector3.new(0,0,0)
						end

						bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0)
					end
					ctrl = {f = 0, b = 0, l = 0, r = 0}
					lastctrl = {f = 0, b = 0, l = 0, r = 0}
					speed = 0
					bg:Destroy()
					bv:Destroy()
					plr.Character.Humanoid.PlatformStand = false
					game.Players.LocalPlayer.Character.Animate.Disabled = false
					tpwalking = false



				end





			end)

			local tis

			up.MouseButton1Down:connect(function()
				tis = up.MouseEnter:connect(function()
					while tis do
						wait()
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,1,0)
					end
				end)
			end)

			up.MouseLeave:connect(function()
				if tis then
					tis:Disconnect()
					tis = nil
				end
			end)

			local dis

			down.MouseButton1Down:connect(function()
				dis = down.MouseEnter:connect(function()
					while dis do
						wait()
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,-1,0)
					end
				end)
			end)

			down.MouseLeave:connect(function()
				if dis then
					dis:Disconnect()
					dis = nil
				end
			end)


			game:GetService("Players").LocalPlayer.CharacterAdded:Connect(function(char)
				wait(0.7)
				game.Players.LocalPlayer.Character.Humanoid.PlatformStand = false
				game.Players.LocalPlayer.Character.Animate.Disabled = false

			end)


			plus.MouseButton1Down:connect(function()
				speeds = speeds + 1
				speed.Text = speeds
				if nowe == true then


					tpwalking = false
					for i = 1, speeds do
						spawn(function()

							local hb = game:GetService("RunService").Heartbeat	


							tpwalking = true
							local chr = game.Players.LocalPlayer.Character
							local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
							while tpwalking and hb:Wait() and chr and hum and hum.Parent do
								if hum.MoveDirection.Magnitude > 0 then
									chr:TranslateBy(hum.MoveDirection)
								end
							end

						end)
					end
				end
			end)
			mine.MouseButton1Down:connect(function()
				if speeds == 1 then
					speed.Text = 'cannot be less than 1'
					wait(1)
					speed.Text = speeds
				else
					speeds = speeds - 1
					speed.Text = speeds
					if nowe == true then
						tpwalking = false
						for i = 1, speeds do
							spawn(function()

								local hb = game:GetService("RunService").Heartbeat	


								tpwalking = true
								local chr = game.Players.LocalPlayer.Character
								local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
								while tpwalking and hb:Wait() and chr and hum and hum.Parent do
									if hum.MoveDirection.Magnitude > 0 then
										chr:TranslateBy(hum.MoveDirection)
									end
								end

							end)
						end
					end
				end
			end)

			closebutton.MouseButton1Click:Connect(function()
				main:Destroy()
			end)

			mini.MouseButton1Click:Connect(function()
				up.Visible = false
				down.Visible = false
				onof.Visible = false
				plus.Visible = false
				speed.Visible = false
				mine.Visible = false
				mini.Visible = false
				mini2.Visible = true
				main.Frame.BackgroundTransparency = 1
				closebutton.Position =  UDim2.new(0, 0, -1, 57)
			end)

			mini2.MouseButton1Click:Connect(function()
				up.Visible = true
				down.Visible = true
				onof.Visible = true
				plus.Visible = true
				speed.Visible = true
				mine.Visible = true
				mini.Visible = true
				mini2.Visible = false
				main.Frame.BackgroundTransparency = 0 
				closebutton.Position =  UDim2.new(0, 0, -1, 27)
			end)
    end
})

local iy = Tab:Button({
    Title = "Infinite Yield",
    Desc = "by Edge, Zwolf, and Moon",
    Locked = false,
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
    end
})

if _G._WRDClickTeleport_Initialized ~= true then
    _G._WRDClickTeleport_Initialized = true

    local player = game:GetService("Players").LocalPlayer
    local UserInputService = game:GetService("UserInputService")
    local mouse = player:GetMouse()

    repeat wait() until mouse

    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            if _G.WRDClickTeleport and UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
                  local char = player.Character
                  if char and char:FindFirstChild("HumanoidRootPart") then
                      char:MoveTo(Vector3.new(mouse.Hit.x, mouse.Hit.y, mouse.Hit.z)) 
                  end
              end
          end
      end)
  end
  local clicktp = Tab:Toggle({
      Title = "Click Teleport",
      Desc = "Giữ Ctrl và click chuột trái để dịch chuyển",
      Type = "Checkbox",
      Default = false,
      Callback = function(state)
          _G.WRDClickTeleport = state
      end
  })

local char = game.Players.LocalPlayer.Character
local humanoid = char and char:FindFirstChildOfClass("Humanoid")
   local speed = Player:Slider({
      Title = "Tốc độ",
      Step = 1,
      
      Value = {
          Min = 0,
          Max = 100,
          Default = humanoid.WalkSpeed,
      },
      Callback = function(value)
          if humanoid then
              humanoid.WalkSpeed = value
          end
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
  	Desc = "[FastNoClip] ⚠️ Có khả năng sung đột với ClickTP",
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
  
  local UserInputService = game:GetService("UserInputService")
  local autoFpsSaverEnabled = false
  local originalFpsCap = 240
  local isFocused = true
  local function updateFps()
  	if not autoFpsSaverEnabled then return end
  	if isFocused then
  		if setfpscap then
  			setfpscap(originalFpsCap)
  		end
  	else
  		if setfpscap then
  			setfpscap(60)
  		end
  	end
  end
  local DynamicFPS = Tab:Toggle({
  	Title = "Dynamic FPS",
  	Desc = "Giảm FPS khi mất focus",
      Type = "Checkbox",
  	Default = true,
  	Callback = function(state)
  		autoFpsSaverEnabled = state
  		updateFps()
  	end
  })
  UserInputService.WindowFocused:Connect(function()
  	isFocused = true
  	updateFps()
      DynamicFPS:Unlock()
  end)
  UserInputService.WindowFocusReleased:Connect(function()
      DynamicFPS:Lock()
  	isFocused = false
  	updateFps()
  end)
  DynamicFPS:Set(false)
  DynamicFPS:Set(true)
  
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

local player = game.Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RemoteEvents = ReplicatedStorage:WaitForChild("RemoteEvents")
local placeEvent = RemoteEvents:WaitForChild("PlaceBlock")
local RunService = game:GetService("RunService")
local scaffold = false
local function scaffoldStep()
	if not scaffold then return end
	local char = player.Character
	if not char or not char:FindFirstChild("HumanoidRootPart") then return end
	local hrp = char.HumanoidRootPart
	local pos = hrp.Position - Vector3.new(0, hrp.Size.Y/2 + 1, 0)
	local region = Region3.new(
		pos - Vector3.new(1, 1, 1),
		pos + Vector3.new(1, 1, 1)
	)
	local parts = workspace:FindPartsInRegion3(region, nil, math.huge)
	local hasBlock = false
	for _, p in ipairs(parts) do
		if p.Name == "Block" then
			hasBlock = true
			break
		end
	end
	if not hasBlock then
		placeEvent:FireServer(pos)
	end
end
RunService.Heartbeat:Connect(scaffoldStep)
RunService.RenderStepped:Connect(scaffoldStep)
  local scaffoldt = Block:Toggle({
      Title = "Scaffold",
      Desc = "Tạo sàn dưới chân",
      Type = "Checkbox",
      Default = false,
      Callback = function(state)
          scaffold = state
      end
  })

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local removeEvent = game.ReplicatedStorage:WaitForChild("RemoteEvents"):WaitForChild("RemoveBlock")
local cab = false
local function getRandomBlock()
    local candidates = {}
    for _, obj in ipairs(workspace:GetChildren()) do
        if obj:IsA("BasePart") and obj.Name == "Block" then
            table.insert(candidates, obj)
        end
    end
    if #candidates > 0 then
        return candidates[math.random(1, #candidates)]
    end
end
local function teleportAndRemove()
    local block = getRandomBlock()
    if block and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        local hrp = player.Character.HumanoidRootPart
        hrp.CFrame = block.CFrame + Vector3.new(0, 5, 0)
        removeEvent:FireServer(block)
    end
end
task.spawn(function()
    while true do
        task.wait(0.1)
        if cab then
            teleportAndRemove()
        end
    end
end)
  local cabt = Block:Toggle({
      Title = "Clear all block",
      Desc = "Xóa hết block",
      Type = "Checkbox",
      Default = false,
      Callback = function(state)
          cab = state
      end
  })

  local datblockttt = Block:Button({
      Title = "SafeZone place",
      Desc = "Đặt block trong safezone",
      Locked = false,
      Callback = function()
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = Players.LocalPlayer
local function giveBox()
	local item = ReplicatedStorage:FindFirstChild("📦")
	if item then
		local clone = item:Clone()
		clone.Parent = player.Backpack
	end
end
      end
  })
