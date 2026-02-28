-- [[ VNX SCRIPT - V29 CIRCLE MINI UPDATE ]] --

local LP = game:GetService("Players").LocalPlayer
local Camera = workspace.CurrentCamera
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")

-- نظام الترحيب
local function ShowWelcome()
    local WelcomeGui = Instance.new("ScreenGui", LP.PlayerGui)
    local Label = Instance.new("TextLabel", WelcomeGui)
    Label.Size = UDim2.new(1, 0, 1, 0)
    Label.BackgroundTransparency = 1
    Label.Text = "منور سكربت 𝑽𝑵𝑿"
    Label.TextColor3 = Color3.fromRGB(163, 73, 164)
    Label.TextSize = 60
    Label.Font = Enum.Font.GothamBold
    task.wait(2)
    WelcomeGui:Destroy()
end
spawn(ShowWelcome)

-- تنظيف النسخ القديمة
if LP.PlayerGui:FindFirstChild("VNX_V29") then LP.PlayerGui.VNX_V29:Destroy() end

local ScreenGui = Instance.new("ScreenGui", LP.PlayerGui)
ScreenGui.Name = "VNX_V29"
ScreenGui.ResetOnSpawn = false

-- واجهة كلمة السر (AAAX)
local LockFrame = Instance.new("Frame", ScreenGui)
LockFrame.Size = UDim2.new(0, 220, 0, 160)
LockFrame.Position = UDim2.new(0.5, -110, 0.5, -80)
LockFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
LockFrame.BorderSizePixel = 2
LockFrame.BorderColor3 = Color3.fromRGB(163, 73, 164)

local PassInput = Instance.new("TextBox", LockFrame)
PassInput.Size = UDim2.new(0.8, 0, 0, 35)
PassInput.Position = UDim2.new(0.1, 0, 0.25, 0)
PassInput.PlaceholderText = "كلمة السر (AAAX)"
PassInput.Text = ""
PassInput.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
PassInput.TextColor3 = Color3.fromRGB(255, 255, 255)

local EnterBtn = Instance.new("TextButton", LockFrame)
EnterBtn.Size = UDim2.new(0.6, 0, 0, 35)
EnterBtn.Position = UDim2.new(0.2, 0, 0.65, 0)
EnterBtn.Text = "دخول"
EnterBtn.BackgroundColor3 = Color3.fromRGB(163, 73, 164)
EnterBtn.TextColor3 = Color3.fromRGB(255, 255, 255)

-- القائمة الرئيسية (مربعة)
local Main = Instance.new("Frame", ScreenGui)
Main.Size = UDim2.new(0, 240, 0, 380)
Main.Position = UDim2.new(0.5, -120, 0.5, -190)
Main.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
Main.BorderSizePixel = 2
Main.BorderColor3 = Color3.fromRGB(163, 73, 164)
Main.Visible = false
Main.Active = true
Main.Draggable = true

EnterBtn.MouseButton1Click:Connect(function()
    if PassInput.Text == "AAAX" then
        LockFrame.Visible = false
        Main.Visible = true
    else
        PassInput.Text = ""
        PassInput.PlaceholderText = "خطأ!"
    end
end)

local Header = Instance.new("Frame", Main)
Header.Size = UDim2.new(1, 0, 0, 35)
Header.BackgroundColor3 = Color3.fromRGB(163, 73, 164)

-- زر الإغلاق X
local Close = Instance.new("TextButton", Header)
Close.Size = UDim2.new(0, 35, 1, 0)
Close.Position = UDim2.new(1, -35, 0, 0)
Close.Text = "X"
Close.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
Close.TextColor3 = Color3.fromRGB(255, 255, 255)
Close.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)

-- زر التصغير (مربع بجانب X)
local MiniBtn = Instance.new("TextButton", Header)
MiniBtn.Size = UDim2.new(0, 25, 0, 25)
MiniBtn.Position = UDim2.new(1, -65, 0.5, -12)
MiniBtn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MiniBtn.Text = ""
MiniBtn.BorderSizePixel = 1
MiniBtn.BorderColor3 = Color3.fromRGB(255, 255, 255)

-- وظيفة التحول لدائرة
MiniBtn.MouseButton1Click:Connect(function()
    Main.Visible = false
    local CircleIcon = Instance.new("TextButton", ScreenGui)
    CircleIcon.Name = "VNX_Icon"
    CircleIcon.Size = UDim2.new(0, 50, 0, 50)
    CircleIcon.Position = Main.Position
    CircleIcon.BackgroundColor3 = Color3.fromRGB(163, 73, 164)
    CircleIcon.Text = "𝑽𝑵𝑿"
    CircleIcon.TextColor3 = Color3.fromRGB(255, 255, 255)
    CircleIcon.Font = Enum.Font.GothamBold
    CircleIcon.Draggable = true
    local Corner = Instance.new("UICorner", CircleIcon)
    Corner.CornerRadius = UDim.new(1, 0)
    
    CircleIcon.MouseButton1Click:Connect(function()
        Main.Position = CircleIcon.Position
        Main.Visible = true
        CircleIcon:Destroy()
    end)
end)

-- عداد السرعة العلوي
local SpeedLabel = Instance.new("TextLabel", Main)
SpeedLabel.Size = UDim2.new(1, 0, 0, 25)
SpeedLabel.Position = UDim2.new(0, 0, 0, 35)
SpeedLabel.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
SpeedLabel.Text = "Current Speed: 0"
SpeedLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
SpeedLabel.Font = Enum.Font.Code

RunService.Heartbeat:Connect(function()
    if LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then
        local vel = LP.Character.HumanoidRootPart.Velocity
        local speed = math.floor(Vector3.new(vel.X, 0, vel.Z).Magnitude)
        SpeedLabel.Text = "Current Speed: " .. tostring(speed)
    end
end)

local Scroll = Instance.new("ScrollingFrame", Main)
Scroll.Size = UDim2.new(1, 0, 1, -70)
Scroll.Position = UDim2.new(0, 0, 0, 65)
Scroll.BackgroundTransparency = 1
Scroll.BorderSizePixel = 0
local Layout = Instance.new("UIListLayout", Scroll)
Layout.Padding = UDim.new(0, 5)
Layout.HorizontalAlignment = Enum.HorizontalAlignment.Center

-- مربع إدخال السرعة
local SpeedBox = Instance.new("TextBox", Scroll)
SpeedBox.Size = UDim2.new(0.9, 0, 0, 35)
SpeedBox.PlaceholderText = "اكتب السرعة هنا.."
SpeedBox.Text = "50"
SpeedBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
SpeedBox.TextColor3 = Color3.fromRGB(255, 255, 0)

local function AddOption(name, cb)
    local b = Instance.new("TextButton", Scroll)
    b.Size = UDim2.new(0.9, 0, 0, 35)
    b.Text = "[ ] " .. name
    b.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    b.TextColor3 = Color3.fromRGB(255, 255, 255)
    b.BorderSizePixel = 1
    local active = false
    b.MouseButton1Click:Connect(function()
        active = not active
        b.Text = active and "[✓] " .. name or "[ ] " .. name
        b.TextColor3 = active and Color3.fromRGB(255, 255, 0) or Color3.fromRGB(255, 255, 255)
        cb(active)
    end)
end

-- الخصائص
AddOption("تفعيل السرعة المخصصة", function(s)
    _G.SpdOn = s
    while _G.SpdOn do
        task.wait()
        if LP.Character and LP.Character:FindFirstChild("Humanoid") then
            LP.Character.Humanoid.WalkSpeed = tonumber(SpeedBox.Text) or 16
        end
    end
    if LP.Character then LP.Character.Humanoid.WalkSpeed = 16 end
end)

AddOption("قفز لانهائي", function(s)
    _G.InfJump = s
    UIS.JumpRequest:Connect(function()
        if _G.InfJump and LP.Character then LP.Character.Humanoid:ChangeState("Jumping") end
    end)
end)

AddOption("ايم بوت (جسد - قريب)", function(s)
    _G.Aimbot = s
    RunService.RenderStepped:Connect(function()
        if _G.Aimbot then
            local target = nil
            local dist = 200
            for _, p in pairs(game.Players:GetPlayers()) do
                if p ~= LP and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                    local pos, on = Camera:WorldToScreenPoint(p.Character.HumanoidRootPart.Position)
                    if on then
                        local m = (Vector2.new(pos.X, pos.Y) - Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)).Magnitude
                        if m < dist then target = p.Character.HumanoidRootPart dist = m end
                    end
                end
            end
            if target then Camera.CFrame = CFrame.lookAt(Camera.CFrame.Position, target.Position) end
        end
    end)
end)

AddOption("كشف لاعبين (أصفر)", function(s)
    _G.ESP = s
    while _G.ESP do
        task.wait(1)
        for _, p in pairs(game.Players:GetPlayers()) do
            if p ~= LP and p.Character and not p.Character:FindFirstChild("VNX_ESP") then
                Instance.new("Highlight", p.Character).FillColor = Color3.new(1, 1, 0)
            end
        end
    end
end)

local Disc = Instance.new("TextButton", Scroll)
Disc.Size = UDim2.new(0.9, 0, 0, 35)
Disc.Text = "🔵 ديسكورد"
Disc.BackgroundColor3 = Color3.fromRGB(0, 80, 200)
Disc.MouseButton1Click:Connect(function() setclipboard("https://discord.gg/gXPJxeVKK") end)
