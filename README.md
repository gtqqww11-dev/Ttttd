-- RAWNW | FINAL EDITION (Close & Minimize)
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game:GetService("CoreGui")

-- 1. رسالة الترحيب (تظهر 3 ثواني)
local WelcomeFrame = Instance.new("Frame")
WelcomeFrame.Size = UDim2.new(0, 300, 0, 100)
WelcomeFrame.Position = UDim2.new(0.5, -150, 0.4, -50)
WelcomeFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
WelcomeFrame.BorderColor3 = Color3.fromRGB(50, 255, 150)
WelcomeFrame.BorderSizePixel = 2
WelcomeFrame.Parent = ScreenGui

local WelcomeText = Instance.new("TextLabel")
WelcomeText.Size = UDim2.new(1, 0, 1, 0)
WelcomeText.Text = "Welcome RAWNW\nجاري تجهيز الواجهة..."
WelcomeText.TextColor3 = Color3.fromRGB(50, 255, 150)
WelcomeText.BackgroundTransparency = 1
WelcomeText.Parent = WelcomeFrame

task.wait(3)
WelcomeFrame:Destroy()

-- 2. الواجهة الرئيسية
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 400, 0, 350)
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -175)
MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.BorderColor3 = Color3.fromRGB(50, 255, 150)
MainFrame.BorderSizePixel = 2
MainFrame.Active = true; MainFrame.Draggable = true; MainFrame.Parent = ScreenGui

-- شريط العنوان العلوي
local TopBar = Instance.new("Frame")
TopBar.Size = UDim2.new(1, 0, 0, 35)
TopBar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
TopBar.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -80, 1, 0)
Title.Position = UDim2.new(0, 10, 0, 0)
Title.Text = "RAWNW MENU"; Title.TextColor3 = Color3.fromRGB(50, 255, 150)
Title.BackgroundTransparency = 1; Title.Parent = TopBar

-- زر الإغلاق (X)
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(1, -35, 0, 2.5)
CloseBtn.Text = "X"; CloseBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.Parent = TopBar
CloseBtn.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)

-- زر التصغير/التكبير (المربع)
local MinBtn = Instance.new("TextButton")
MinBtn.Size = UDim2.new(0, 30, 0, 30)
MinBtn.Position = UDim2.new(1, -70, 0, 2.5)
MinBtn.Text = "□"; MinBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
MinBtn.TextColor3 = Color3.fromRGB(50, 255, 150)
MinBtn.Parent = TopBar

local IsMinimized = false
MinBtn.MouseButton1Click:Connect(function()
    if not IsMinimized then
        MainFrame:TweenSize(UDim2.new(0, 400, 0, 35), "Out", "Quad", 0.3, true)
        IsMinimized = true
    else
        MainFrame:TweenSize(UDim2.new(0, 400, 0, 350), "Out", "Quad", 0.3, true)
        IsMinimized = false
    end
end)

-- محتوى السكربت (Scroll)
local Scroll = Instance.new("ScrollingFrame")
Scroll.Size = UDim2.new(1, -10, 1, -45); Scroll.Position = UDim2.new(0, 5, 0, 40)
Scroll.BackgroundTransparency = 1; Scroll.Parent = MainFrame; Scroll.ClipsDescendants = true
local Layout = Instance.new("UIListLayout")
Layout.Parent = Scroll; Layout.Padding = UDim.new(0, 5)

-- إضافة الأزرار
local function AddBtn(txt, callback)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(1, -10, 0, 40); b.Text = txt; b.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    b.TextColor3 = Color3.fromRGB(255, 255, 255); b.Parent = Scroll
    local act = false
    b.MouseButton1Click:Connect(function()
        act = not act
        b.BackgroundColor3 = act and Color3.fromRGB(50, 255, 150) or Color3.fromRGB(30, 30, 30)
        callback(act)
    end)
end

AddBtn("اختراق الجدران (Noclip)", function(v) _G.Noc = v end)
AddBtn("الأيم بوت", function(v) _G.Aim = v end)

-- تشغيل الميزات في الخلفية
game:GetService("RunService").Stepped:Connect(function()
    pcall(function()
        if _G.Noc then
            for _, p in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                if p:IsA("BasePart") then p.CanCollide = false end
            end
        end
        if game.Players.LocalPlayer.Character then game.Players.LocalPlayer.Character.Humanoid.Health = 100 end
    end)
end)
