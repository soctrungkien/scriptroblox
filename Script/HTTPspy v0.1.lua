-- @lightgray2 • HttpSpy v0.1
-- @98o0o39 • Edit
local RevenueGG = loadstring(game:HttpGet("https://raw.githubusercontent.com/LR7n2p/-/refs/heads/main/RevenueGG.txt"))() -- My notification
local NotificationLibrary = loadstring(game:HttpGet("https://pastebin.com/raw/wiPVTwLB"))() -- Notification

RevenueGG:Notification({
Text = "HTTPspy executed!",  Duration = 1, 
Color = Color3.fromRGB(85, 170, 255) })

local az = tick()
local ba = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local bb = loadstring(game:HttpGet("https://pastebin.com/raw/wiPVTwLB"))()

local bc = {"Dark", "Darker", "Light", "Aqua", "Amethyst", "Rose"}
local bd = bc[math.random(1, #bc)]

local be = ba:CreateWindow({
    Title = "            (  H    T    T    P .   s   p   y  )",
    SubTitle = "                 Vᴇʀsɪᴏɴ ₀.₀.₁",
    TabWidth = 100,
    Size = UDim2.fromOffset(466, 219),
    Acrylic = false,
    Theme = bd,
    MinimizeKey = Enum.KeyCode.C
}) task.spawn(function() pcall(function() delfolder("FluentSettings") end) end)

local bf = {
    bg = be:AddTab({ Title = "L0GS", Icon = "square" }),
}

local bh = function()
    return os.date("%Y/%B/%d %I:%M %p")
end
 --clipboard
local bi = function(bj)
    setclipboard(bj)
end

local bk = function(bl, bm, bn)
    bf.bg:AddButton({
        Title = bl,
        Description = bh(),
        Callback = function()
            bi(bm)
            bb:SendNotification("Success", bn .. " copied: " .. bm, 5)
        end
    })
end
local bo
bo = hookfunction(game.HttpGet, function(self, bp, ...)
    bk(bp, bp, "HTTP Request")
    return bo(self, bp, ...)
end)
local bq
bq = hookfunction(game.HttpPost, function(self, br, ...)
    bk(br, br, "HTTP Request")
    return bq(self, br, ...)
end)
if syn and syn.request then
    local bs
    bs = hookfunction(syn.request, function(bt)
        bk(bt.Url, bt.Url, "HTTPRequest")
        return bs(bt)
    end)
elseif request then
    local bu
    bu = hookfunction(request, function(bv)
        bk(bv.Url, bv.Url, "HTTPRequest")
        return bu(bv)
    end)
else
    RevenueGG:Notification({
        Text = "Exploit not supported", Duration = 15,
        Color = Color3.fromRGB(85, 170, 255)
    })
end
local bw
bw = hookfunction(loadstring, function(bx, ...)
    bk("loadstring execution", bx, "Executed Script")
    return bw(bx, ...)
end)
local by
by = hookfunction(require, function(bz)
    local ca = tostring(bz) or "Unknown Module"
    bk("require execution", ca, "Executed Script")
    return by(bz)
end)
local cb
cb = hookfunction(print, function(...)
    local cc = {...}
    local cd = "print("

    for ce, cf in ipairs(cc) do
        cd = cd .. (type(cf) == "string" and '"' .. cf .. '"' or tostring(cf))
        if ce < #cc then
            cd = cd .. ", "
        end
    end
    cd = cd .. ")"
    bk("print execution", cd, "Executed Script")
    return cb(...)
end)

local cg
cg = hookfunction(debug.getinfo, function(ch, ci)
    local cj = cg(ch, ci)
    if cj and cj.source then
        bk("Script Execution", cj.source, "Executed Script")
    end
    return cj
end)

local ck = be:AddTab({ Title = "", Icon = "plus" })
ck:AddButton({
Title = "                                                                          Rejoin",
Description = "                                                                                In case",
Callback = function() game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer) end })

ck:AddParagraph({
    Title = "                                            INFORMATION [?]",
    Content = "                            Author: @lightgray2"
})
ck:AddParagraph({
    Title = "                                UI Library by",
    Content = "                                         FLUENT"
})

ck:AddButton({
    Title = "                                                                          OG HTTPSpy",
    Description = "                                                                                Original Script",
    Callback = function()
        setclipboard('loadstring(game:HttpGet("https://raw.githubusercontent.com/Blocky69/boblus-scriptz/refs/heads/main/UO-HttpSpy"))()')
        RevenueGG:Notification({
            Text = "Notice: This bugs!",
            Duration = 3
        })
    end
})

local cl = game:GetService("Players")
local cm = game:GetService("UserInputService")
local cn = cl.LocalPlayer
local co = cn:WaitForChild("PlayerGui")
local cp = co:FindFirstChild("LightGray2")
if cp then
    cp:Destroy()
end

local cq = Instance.new("ScreenGui")
cq.Name = "LightGray2"
cq.Parent = co

local cr = Instance.new("TextButton")
cr.Name = "DraggableButton"
cr.Size = UDim2.new(0, 138, 0, 50)
cr.Position = UDim2.new(0.5, -69, 0.2, 0)
cr.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
cr.BackgroundTransparency = 0.85
cr.Text = "T0GGLE"
cr.TextColor3 = Color3.fromRGB(0, 0, 0)
cr.Font = Enum.Font.Arcade
cr.TextSize = 20
cr.Parent = cq

local cs = Instance.new("UICorner", cr)
cs.CornerRadius = UDim.new(1, 0)

local ct = Instance.new("UIGradient")
ct.Parent = cr
ct.Color = ColorSequence.new(Color3.fromRGB(255, 255, 255), Color3.fromRGB(255, 255, 255))
ct.Rotation = 45

local cu = false
local cv, cw

cr.InputBegan:Connect(function(cx)
    if cx.UserInputType == Enum.UserInputType.MouseButton1 or cx.UserInputType == Enum.UserInputType.Touch then
        cu = true
        cv = cx.Position
        cw = Vector2.new(cr.AbsolutePosition.X, cr.AbsolutePosition.Y)
    end
end)

cm.InputChanged:Connect(function(cy)
    if cu and (cy.UserInputType == Enum.UserInputType.MouseMovement or cy.UserInputType == Enum.UserInputType.Touch) then
        local cz = cy.Position - cv
        cr.Position = UDim2.new(0, cw.X + cz.X, 0, cw.Y + cz.Y)
    end
end)

cm.InputEnded:Connect(function(da)
    if da.UserInputType == Enum.UserInputType.MouseButton1 or da.UserInputType == Enum.UserInputType.Touch then
        cu = false
    end
end)

cr.MouseButton1Click:Connect(function()
    local db = game:GetService("VirtualInputManager")
    db:SendKeyEvent(true, Enum.KeyCode.C, false, game)
    task.wait()
    db:SendKeyEvent(false, Enum.KeyCode.C, false, game)
end)

RevenueGG:Notification({
    Text = "HTTPspy script loaded in" .. string.format("%.1f", tick() - az) .. " seconds",
    Duration = 2,
    Color = Color3.fromRGB(255, 0, 0)
})
task.wait(0.3) print("Test")
