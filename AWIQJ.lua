-- AWIQJ SCRIPT | FINAL EDITION
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AWIQJ_GUI"
ScreenGui.Parent = game:GetService("CoreGui")

-- رسالة ترحيب فخمة
local Welcome = Instance.new("TextLabel")
Welcome.Size = UDim2.new(0, 350, 0, 60)
Welcome.Position = UDim2.new(0.5, -175, 0.4, -30)
Welcome.Text = "منور سكربت AWIQJ"
Welcome.TextSize = 25
Welcome.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Welcome.TextColor3 = Color3.fromRGB(50, 255, 150)
Welcome.BorderSizePixel = 2
Welcome.BorderColor3 = Color3.fromRGB(50, 255, 150)
Welcome.Parent = ScreenGui
task.wait(3)
Welcome:Destroy()

-- اللوحة الرئيسية
local Main = Instance.new("Frame")
Main.Size = UDim2.new(0, 350, 0, 300)
Main.Position = UDim2.new(0.5, -175, 0.5, -150)
Main.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Main.BorderSizePixel = 2
Main.BorderColor3 = Color3.fromRGB(50, 255, 150)
Main.Active = true; Main.Draggable = true; Main.Parent = ScreenGui

-- شريط العنوان العلوي (X و □)
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

local Close = Instance.new("TextButton")
Close.Size = UDim2.new(0, 30, 0, 30); Close.Position = UDim2.new(1, -35, 0, 2.5)
Close.Text = "X"; Close.BackgroundColor3 = Color3.fromRGB(150, 0, 0); Close.Parent = Bar
Close.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)

local Min = Instance.new("TextButton")
Min.Size = UDim2.new(0, 30, 0, 30); Min.Position = UDim2.new(1, -70, 0, 2.5)
Min.Text = "□"; Min.Parent = Bar
local Mini = false
Min.MouseButton1Click:Connect(function()
    if not Mini then Main:TweenSize(UDim2.new(0, 350, 0, 35), "Out", "Quad", 0.2) 
    else Main:TweenSize(UDim2.new(0, 350, 0, 300), "Out", "Quad", 0.2) end
    Mini = not Mini
end)

-- وظيفة صنع الأزرار
local function AddBtn(txt, y, callback)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(0, 260, 0, 45); b.Position = UDim2.new(0.5, -130, 0, y)
    b.Text = txt; b.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    b.TextColor3 = Color3.fromRGB(255, 255, 255); b.Parent = Main
    local act = false
    b.MouseButton1Click:Connect(function()
        act = not act
        b.BackgroundColor3 = act and Color3.fromRGB(50, 255, 150) or Color3.fromRGB(40, 40, 40)
        b.TextColor3 = act and Color3.fromRGB(0, 0, 0) or Color3.fromRGB(255, 255, 255)
        callback(act)
    end)
end

-- قائمة الأزرار
AddBtn("اختراق الجدران (Noclip)", 55, function(v) _G.Noc = v end)
AddBtn("تفعيل الأيم بوت (Aimbot)", 115, function(v) _G.Aim = v end)
AddBtn("كشف اللاعبين (ESP)", 175, function(v) _G.Esp = v end)
AddBtn("زيادة السرعة (Speed)", 235, function(v) 
    if v then game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 100 
    else game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16 end 
end)

-- نظام التشغيل المستمر
game:GetService("RunService").Stepped:Connect(function()
    pcall(function()
        if _G.Noc then 
            for _, p in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do 
                if p:IsA("BasePart") then p.CanCollide = false end 
            end 
        end
    end)
end)
