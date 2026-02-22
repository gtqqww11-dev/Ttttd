-- RAWNW FIX VERSION
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "RAWNW_GUI"
ScreenGui.Parent = game:GetService("CoreGui")

-- رسالة الترحيب
local Welcome = Instance.new("TextLabel")
Welcome.Size = UDim2.new(0, 300, 0, 50)
Welcome.Position = UDim2.new(0.5, -150, 0.4, -25)
Welcome.Text = "Welcome RAWNW"
Welcome.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Welcome.TextColor3 = Color3.fromRGB(50, 255, 150)
Welcome.BorderSizePixel = 2
Welcome.Parent = ScreenGui
task.wait(2)
Welcome:Destroy()

-- اللوحة الرئيسية
local Main = Instance.new("Frame")
Main.Size = UDim2.new(0, 350, 0, 250)
Main.Position = UDim2.new(0.5, -175, 0.5, -125)
Main.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Main.BorderSizePixel = 2
Main.BorderColor3 = Color3.fromRGB(50, 255, 150)
Main.Active = true
Main.Draggable = true
Main.Parent = ScreenGui

-- شريط الأدوات (X و المربع)
local Bar = Instance.new("Frame")
Bar.Size = UDim2.new(1, 0, 0, 30)
Bar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Bar.Parent = Main

local Close = Instance.new("TextButton")
Close.Size = UDim2.new(0, 30, 0, 30)
Close.Position = UDim2.new(1, -30, 0, 0)
Close.Text = "X"
Close.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
Close.Parent = Bar
Close.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)

local Min = Instance.new("TextButton")
Min.Size = UDim2.new(0, 30, 0, 30)
Min.Position = UDim2.new(1, -65, 0, 0)
Min.Text = "□"
Min.Parent = Bar
local Mini = false
Min.MouseButton1Click:Connect(function()
    if not Mini then
        Main:TweenSize(UDim2.new(0, 350, 0, 30), "Out", "Quad", 0.2)
    else
        Main:TweenSize(UDim2.new(0, 350, 0, 250), "Out", "Quad", 0.2)
    end
    Mini = not Mini
end)

-- زر اختراق الجدران (Noclip)
local NocBtn = Instance.new("TextButton")
NocBtn.Size = UDim2.new(0, 200, 0, 40)
NocBtn.Position = UDim2.new(0.5, -100, 0.5, -20)
NocBtn.Text = "تفعيل اختراق الجدران"
NocBtn.Parent = Main
local NocOn = false
NocBtn.MouseButton1Click:Connect(function()
    NocOn = not NocOn
    NocBtn.BackgroundColor3 = NocOn and Color3.fromRGB(50, 255, 150) or Color3.fromRGB(200, 200, 200)
end)

-- تشغيل الـ Noclip و الخلود
game:GetService("RunService").Stepped:Connect(function()
    pcall(function()
        if NocOn then
            for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                if v:IsA("BasePart") then v.CanCollide = false end
            end
        end
        game.Players.LocalPlayer.Character.Humanoid.Health = 100
    end)
end)

