-- [[ AWIQJ PRO V3.5 | WELCOME MESSAGE & IMPROVED UI ]] --
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AWIQJ_V3_5"
ScreenGui.Parent = game:GetService("CoreGui")

-- 1. واجهة كلمة السر الصغيرة
local PassFrame = Instance.new("Frame")
PassFrame.Size = UDim2.new(0, 200, 0, 100)
PassFrame.Position = UDim2.new(0.5, -100, 0.5, -50)
PassFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PassFrame.BorderSizePixel = 2; PassFrame.Parent = ScreenGui

local PassInput = Instance.new("TextBox")
PassInput.Size = UDim2.new(0, 160, 0, 30); PassInput.Position = UDim2.new(0.5, -80, 0.2, 0)
PassInput.PlaceholderText = "Password"; PassInput.Text = ""; PassInput.Parent = PassFrame

local PassBtn = Instance.new("TextButton")
PassBtn.Size = UDim2.new(0, 80, 0, 30); PassBtn.Position = UDim2.new(0.5, -40, 0.6, 0)
PassBtn.Text = "Login"; PassBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
PassBtn.TextColor3 = Color3.fromRGB(255, 255, 255); PassBtn.Parent = PassFrame

-- 2. واجهة الترحيب (تظهر بعد كلمة السر)
local WelcomeLabel = Instance.new("TextLabel")
WelcomeLabel.Size = UDim2.new(0, 300, 0, 50)
WelcomeLabel.Position = UDim2.new(0.5, -150, 0.5, -25)
WelcomeLabel.BackgroundTransparency = 1
WelcomeLabel.Text = "منور سكربت AWIQJ"
WelcomeLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
WelcomeLabel.TextSize = 30
WelcomeLabel.Font = Enum.Font.SourceSansBold
WelcomeLabel.Visible = false
WelcomeLabel.Parent = ScreenGui

-- 3. القائمة الرئيسية
local Main = Instance.new("Frame")
Main.Size = UDim2.new(0, 330, 0, 420)
Main.Position = UDim2.new(0.5, -165, 0.5, -210)
Main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Main.Visible = false; Main.Active = true; Main.Draggable = true; Main.Parent = ScreenGui

local Bar = Instance.new("Frame")
Bar.Size = UDim2.new(1, 0, 0, 35); Bar.BackgroundColor3 = Color3.fromRGB(240, 240, 240); Bar.Parent = Main

local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 30, 0, 30); CloseBtn.Position = UDim2.new(1, -32, 0, 2.5)
CloseBtn.Text = "×"; CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 50, 50); CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255); CloseBtn.Parent = Bar
CloseBtn.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)

local MiniBtn = Instance.new("TextButton")
MiniBtn.Size = UDim2.new(0, 30, 0, 30); MiniBtn.Position = UDim2.new(1, -65, 0, 2.5)
MiniBtn.Text = "🔲"; MiniBtn.BackgroundColor3 = Color3.fromRGB(200, 200, 200); MiniBtn.Parent = Bar

local RestoreBtn = Instance.new("TextButton")
RestoreBtn.Size = UDim2.new(0, 50, 0, 50); RestoreBtn.Position = UDim2.new(0, 10, 0.5, -25)
RestoreBtn.Text = "AWIQJ"; RestoreBtn.Visible = false; RestoreBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
RestoreBtn.BorderSizePixel = 2; RestoreBtn.Parent = ScreenGui

MiniBtn.MouseButton1Click:Connect(function() Main.Visible = false; RestoreBtn.Visible = true end)
RestoreBtn.MouseButton1Click:Connect(function() Main.Visible = true; RestoreBtn.Visible = false end)

local Content = Instance.new("Frame")
Content.Size = UDim2.new(1, 0, 1, -35); Content.Position = UDim2.new(0, 0, 0, 35); Content.BackgroundTransparency = 1; Content.Parent = Main

-- نظام التحقق والترحيب المحدث
PassBtn.MouseButton1Click:Connect(function()
    if PassInput.Text == "SSF" then
        PassFrame.Visible = false
        WelcomeLabel.Visible = true -- إظهار الترحيب
        task.wait(2) -- الانتظار لمدة ثانيتين
        WelcomeLabel.Visible = false
        Main.Visible = true -- إظهار القائمة الرئيسية
    else
        PassInput.Text = ""; PassInput.PlaceholderText = "Denied"
    end
end)

local function AddBtn(txt, y, callback)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(0, 260, 0, 45); b.Position = UDim2.new(0.5, -130, 0, y)
    b.Text = txt; b.BackgroundColor3 = Color3.fromRGB(245, 245, 245); b.Parent = Content
    local act = false
    b.MouseButton1Click:Connect(function()
        act = not act
        b.BackgroundColor3 = act and Color3.fromRGB(0, 120, 215) or Color3.fromRGB(245, 245, 245)
        b.TextColor3 = act and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(0, 0, 0)
        callback(act)
    end)
end

AddBtn("تفعيل الأيم بوت (قريب فقط)", 20, function(v) _G.Aim = v end)
AddBtn("كشف اللاعبين (ESP RED)", 80, function(v) _G.Esp = v end)
AddBtn("قفز لا نهائي (Inf Jump)", 140, function(v) _G.InfJ = v end)

local Slider = Instance.new("TextBox")
Slider.Size = UDim2.new(0, 200, 0, 40); Slider.Position = UDim2.new(0.5, -100, 0, 210)
Slider.PlaceholderText = "Speed: 16"; Slider.Text = "16"; Slider.Parent = Content
Slider.FocusLost:Connect(function()
    if game.Players.LocalPlayer.Character then game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = tonumber(Slider.Text) or 16 end
end)

-- نظام الأيم بوت والكشف
game:GetService("RunService").RenderStepped:Connect(function()
    if _G.Aim then
        local target = nil
        local maxDist = 250
        for _, p in pairs(game.Players:GetPlayers()) do
            if p ~= game.Players.LocalPlayer and p.Character and p.Character:FindFirstChild("Head") then
                local pos, onScreen = game.Workspace.CurrentCamera:WorldToViewportPoint(p.Character.Head.Position)
                if onScreen then
                    local dist = (Vector2.new(pos.X, pos.Y) - game:GetService("UserInputService"):GetMouseLocation()).Magnitude
                    if dist < maxDist then target = p.Character.Head; maxDist = dist end
                end
            end
        end
        if target then game.Workspace.CurrentCamera.CFrame = CFrame.new(game.Workspace.CurrentCamera.CFrame.Position, target.Position) end
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
