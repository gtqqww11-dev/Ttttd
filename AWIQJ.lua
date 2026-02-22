-- AWIQJ SCRIPT PRO | PASSWORD: SSF
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AWIQJ_PRO"
ScreenGui.Parent = game:GetService("CoreGui")

-- 1. نظام كلمة المرور (SSF)
local PassFrame = Instance.new("Frame")
PassFrame.Size = UDim2.new(0, 300, 0, 150)
PassFrame.Position = UDim2.new(0.5, -150, 0.5, -75)
PassFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
PassFrame.BorderSizePixel = 2
PassFrame.BorderColor3 = Color3.fromRGB(50, 255, 150)
PassFrame.Parent = ScreenGui

local PassInput = Instance.new("TextBox")
PassInput.Size = UDim2.new(0, 200, 0, 40)
PassInput.Position = UDim2.new(0.5, -100, 0.3, 0)
PassInput.PlaceholderText = "Enter Password (SSF)"
PassInput.Text = ""
PassInput.TextColor3 = Color3.fromRGB(255, 255, 255)
PassInput.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
PassInput.Parent = PassFrame

local PassBtn = Instance.new("TextButton")
PassBtn.Size = UDim2.new(0, 100, 0, 30)
PassBtn.Position = UDim2.new(0.5, -50, 0.7, 0)
PassBtn.Text = "Check"
PassBtn.BackgroundColor3 = Color3.fromRGB(50, 255, 150)
PassBtn.Parent = PassFrame

-- 2. اللوحة الرئيسية (مخفية حتى إدخال كلمة المرور)
local Main = Instance.new("Frame")
Main.Size = UDim2.new(0, 350, 0, 380)
Main.Position = UDim2.new(0.5, -175, 0.5, -190)
Main.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Main.BorderSizePixel = 2
Main.BorderColor3 = Color3.fromRGB(50, 255, 150)
Main.Visible = false
Main.Active = true; Main.Draggable = true; Main.Parent = ScreenGui

-- حاوية الأزرار (تختفي عند التصغير)
local Content = Instance.new("Frame")
Content.Size = UDim2.new(1, 0, 1, -35)
Content.Position = UDim2.new(0, 0, 0, 35)
Content.BackgroundTransparency = 1
Content.Parent = Main

-- التحقق من كلمة المرور
PassBtn.MouseButton1Click:Connect(function()
    if PassInput.Text == "SSF" then
        PassFrame:Destroy()
        Main.Visible = true
    else
        PassInput.Text = ""
        PassInput.PlaceholderText = "Wrong! Try Again"
    end
end)

-- شريط العنوان العلوي
local Bar = Instance.new("Frame")
Bar.Size = UDim2.new(1, 0, 0, 35)
Bar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Bar.Parent = Main

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -80, 1, 0)
Title.Position = UDim2.new(0, 10, 0, 0)
Title.Text = "AWIQJ MENU"
Title.TextColor3 = Color3.fromRGB(50, 255, 150)
Title.BackgroundTransparency = 1; Title.Parent = Bar

local Min = Instance.new("TextButton")
Min.Size = UDim2.new(0, 30, 0, 30); Min.Position = UDim2.new(1, -70, 0, 2.5)
Min.Text = "□"; Min.Parent = Bar
local Mini = false
Min.MouseButton1Click:Connect(function()
    if not Mini then 
        Main:TweenSize(UDim2.new(0, 350, 0, 35), "Out", "Quad", 0.2)
        Content.Visible = false 
    else 
        Main:TweenSize(UDim2.new(0, 350, 0, 380), "Out", "Quad", 0.2)
        Content.Visible = true 
    end
    Mini = not Mini
end)

-- وظيفة صنع الأزرار
local function AddBtn(txt, y, callback)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(0, 260, 0, 45); b.Position = UDim2.new(0.5, -130, 0, y)
    b.Text = txt; b.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    b.TextColor3 = Color3.fromRGB(255, 255, 255); b.Parent = Content
    local act = false
    b.MouseButton1Click:Connect(function()
        act = not act
        b.BackgroundColor3 = act and Color3.fromRGB(50, 255, 150) or Color3.fromRGB(40, 40, 40)
        b.TextColor3 = act and Color3.fromRGB(0, 0, 0) or Color3.fromRGB(255, 255, 255)
        callback(act)
    end)
end

AddBtn("اختراق الجدران (Noclip)", 20, function(v) _G.Noc = v end)
AddBtn("تفعيل الأيم بوت (Aimbot)", 80, function(v) _G.Aim = v end)
AddBtn("كشف اللاعبين (ESP)", 140, function(v) _G.Esp = v end)

-- 3. عداد السرعة (Speed Slider)
local SpeedLabel = Instance.new("TextLabel")
SpeedLabel.Size = UDim2.new(0, 200, 0, 20); SpeedLabel.Position = UDim2.new(0.5, -100, 0, 210)
SpeedLabel.Text = "Speed Control"; SpeedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedLabel.BackgroundTransparency = 1; SpeedLabel.Parent = Content

local Slider = Instance.new("TextBox")
Slider.Size = UDim2.new(0, 200, 0, 40); Slider.Position = UDim2.new(0.5, -100, 0, 240)
Slider.Text = "16"; Slider.PlaceholderText = "Set Speed (16-100)"
Slider.BackgroundColor3 = Color3.fromRGB(30, 30, 30); Slider.TextColor3 = Color3.fromRGB(50, 255, 150); Slider.Parent = Content

Slider.FocusLost:Connect(function()
    local val = tonumber(Slider.Text) or 16
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = val
end)

-- حلقة النوكليب المستمرة
game:GetService("RunService").Stepped:Connect(function()
    pcall(function()
        if _G.Noc then 
            for _, p in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do 
                if p:IsA("BasePart") then p.CanCollide = false end 
            end 
        end
    end)
end)
