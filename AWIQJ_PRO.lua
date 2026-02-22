-- AWIQJ PRO SCRIPT | PASSWORD: SSF
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AWIQJ_FINAL"
ScreenGui.Parent = game:GetService("CoreGui")

-- 1. واجهة كلمة السر (تم تصغيرها كما طلبت)
local PassFrame = Instance.new("Frame")
PassFrame.Size = UDim2.new(0, 220, 0, 110) -- حجم صغير ومناسب
PassFrame.Position = UDim2.new(0.5, -110, 0.5, -55)
PassFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PassFrame.BorderSizePixel = 2
PassFrame.BorderColor3 = Color3.fromRGB(200, 200, 200)
PassFrame.Parent = ScreenGui

local PassInput = Instance.new("TextBox")
PassInput.Size = UDim2.new(0, 160, 0, 30)
PassInput.Position = UDim2.new(0.5, -80, 0.25, 0)
PassInput.PlaceholderText = "Password (SSF)"
PassInput.Text = ""
PassInput.BackgroundColor3 = Color3.fromRGB(245, 245, 245)
PassInput.Parent = PassFrame

local PassBtn = Instance.new("TextButton")
PassBtn.Size = UDim2.new(0, 80, 0, 30)
PassBtn.Position = UDim2.new(0.5, -40, 0.65, 0)
PassBtn.Text = "Login"
PassBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
PassBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
PassBtn.Parent = PassFrame

-- 2. اللوحة الرئيسية (تظهر بعد كلمة السر)
local Main = Instance.new("Frame")
Main.Size = UDim2.new(0, 350, 0, 480)
Main.Position = UDim2.new(0.5, -175, 0.5, -240)
Main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Main.Visible = false
Main.Active = true; Main.Draggable = true; Main.Parent = ScreenGui

local Bar = Instance.new("Frame")
Bar.Size = UDim2.new(1, 0, 0, 40)
Bar.BackgroundColor3 = Color3.fromRGB(240, 240, 240); Bar.Parent = Main

local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 30, 0, 30); CloseBtn.Position = UDim2.new(1, -35, 0, 5)
CloseBtn.Text = "×"; CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 80, 80)
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255); CloseBtn.Parent = Bar
CloseBtn.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)

local Content = Instance.new("Frame")
Content.Size = UDim2.new(1, 0, 1, -40); Content.Position = UDim2.new(0, 0, 0, 40)
Content.BackgroundTransparency = 1; Content.Parent = Main

PassBtn.MouseButton1Click:Connect(function()
    if PassInput.Text == "SSF" then
        PassFrame:Destroy()
        Main.Visible = true
    else
        PassInput.Text = ""; PassInput.PlaceholderText = "Wrong!"
    end
end)

-- وظيفة صنع الأزرار
local function AddBtn(txt, y, callback)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(0, 280, 0, 40); b.Position = UDim2.new(0.5, -140, 0, y)
    b.Text = txt; b.BackgroundColor3 = Color3.fromRGB(245, 245, 245); b.Parent = Content
    local act = false
    b.MouseButton1Click:Connect(function()
        act = not act
        b.BackgroundColor3 = act and Color3.fromRGB(0, 120, 215) or Color3.fromRGB(245, 245, 245)
        b.TextColor3 = act and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(0, 0, 0)
        callback(act)
    end)
end

AddBtn("اختراق الجدران (Noclip)", 10, function(v) _G.Noc = v end)
AddBtn("قفز لا نهائي (Inf Jump)", 60, function(v) _G.InfJ = v end)
AddBtn("تفعيل الأيم بوت (Aimbot)", 110, function(v) _G.Aim = v end)
AddBtn("كشف اللاعبين (ESP) أحمر", 160, function(v) _G.Esp = v end)

-- عداد السرعة
local Slider = Instance.new("TextBox")
Slider.Size = UDim2.new(0, 200, 0, 35); Slider.Position = UDim2.new(0.5, -100, 0, 220)
Slider.Text = "16"; Slider.PlaceholderText = "Set Speed"; Slider.Parent = Content
Slider.FocusLost:Connect(function()
    if game.Players.LocalPlayer.Character then
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = tonumber(Slider.Text) or 16
    end
end)

-- البرمجة الخلفية
game:GetService("RunService").Stepped:Connect(function()
    if _G.Noc and game.Players.LocalPlayer.Character then
        for _, p in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
            if p:IsA("BasePart") then p.CanCollide = false end
        end
    end
    if _G.Esp then
        for _, p in pairs(game.Players:GetPlayers()) do
            if p ~= game.Players.LocalPlayer and p.Character and not p.Character:FindFirstChild("Highlight") then
                local h = Instance.new("Highlight", p.Character)
                h.FillColor = Color3.fromRGB(255, 0, 0)
            end
        end
    end
end)

game:GetService("UserInputService").JumpRequest:Connect(function()
    if _G.InfJ then game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping") end
end)
