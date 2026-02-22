AWIQJ SCRIPT PRO | PASSWORD: SSF
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
