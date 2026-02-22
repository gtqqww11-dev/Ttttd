-- [[ AWIQJ PROTECTED VERSION | SSF ]] --
-- نظام حماية وتشفير بسيط لمنع العبث بالسكربت
if not _G.Protected then
    _G.Protected = true
else
    return
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AWIQJ_SECURE"
ScreenGui.Parent = game:GetService("CoreGui")

-- 1. واجهة كلمة السر الصغيرة
local PassFrame = Instance.new("Frame")
PassFrame.Size = UDim2.new(0, 200, 0, 100)
PassFrame.Position = UDim2.new(0.5, -100, 0.5, -50)
PassFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PassFrame.BorderSizePixel = 2
PassFrame.Parent = ScreenGui

local PassInput = Instance.new("TextBox")
PassInput.Size = UDim2.new(0, 160, 0, 30)
PassInput.Position = UDim2.new(0.5, -80, 0.2, 0)
PassInput.PlaceholderText = "Password"
PassInput.Text = ""
PassInput.Parent = PassFrame

local PassBtn = Instance.new("TextButton")
PassBtn.Size = UDim2.new(0, 80, 0, 30)
PassBtn.Position = UDim2.new(0.5, -40, 0.6, 0)
PassBtn.Text = "Login"
PassBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
PassBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
PassBtn.Parent = PassFrame

-- 2. القائمة الرئيسية (بدون اختراق جدران)
local Main = Instance.new("Frame")
Main.Size = UDim2.new(0, 330, 0, 420)
Main.Position = UDim2.new(0.5, -165, 0.5, -210)
Main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Main.Visible = false
Main.Active = true; Main.Draggable = true; Main.Parent = ScreenGui

local Bar = Instance.new("Frame")
Bar.Size = UDim2.new(1, 0, 0, 35)
Bar.BackgroundColor3 = Color3.fromRGB(240, 240, 240); Bar.Parent = Main

local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 30, 0, 30); CloseBtn.Position = UDim2.new(1, -32, 0, 2.5)
CloseBtn.Text = "×"; CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255); CloseBtn.Parent = Bar
CloseBtn.MouseButton1Click:Connect(function() ScreenGui:Destroy(); _G.Protected = nil end)

local Content = Instance.new("Frame")
Content.Size = UDim2.new(1, 0, 1, -35); Content.Position = UDim2.new(0, 0, 0, 35)
Content.BackgroundTransparency = 1; Content.Parent = Main

PassBtn.MouseButton1Click:Connect(function()
    if PassInput.Text == "SSF" then
        PassFrame:Destroy(); Main.Visible = true
    else
        PassInput.Text = ""; PassInput.PlaceholderText = "Denied"
    end
end)

-- وظيفة صنع الأزرار
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

-- الأزرار المطلوبة
AddBtn("تفعيل الأيم بوت (Silent Aim)", 20, function(v) _G.Aim = v end)
AddBtn("كشف اللاعبين (ESP Master)", 80, function(v) _G.Esp = v end)
AddBtn("قفز لا نهائي (Inf Jump)", 140, function(v) _G.InfJ = v end)

-- عداد السرعة المحسن
local Slider = Instance.new("TextBox")
Slider.Size = UDim2.new(0, 200, 0, 40); Slider.Position = UDim2.new(0.5, -100, 0, 210)
Slider.PlaceholderText = "Speed: 16"; Slider.Text = "16"; Slider.Parent = Content
Slider.FocusLost:Connect(function()
    if game.Players.LocalPlayer.Character then
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = tonumber(Slider.Text) or 16
    end
end)

-- نظام الأيم بوت والكشف (إصلاح شامل)
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

RunService.RenderStepped:Connect(function()
    if _G.Esp then
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                if not player.Character:FindFirstChild("AWIQJ_ESP") then
                    local highlight = Instance.new("Highlight")
                    highlight.Name = "AWIQJ_ESP"
                    highlight.FillColor = Color3.fromRGB(255, 0, 0)
                    highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                    highlight.Parent = player.Character
                end
            end
        end
    else
        for _, player in pairs(Players:GetPlayers()) do
            if player.Character and player.Character:FindFirstChild("AWIQJ_ESP") then
                player.Character.AWIQJ_ESP:Destroy()
            end
        end
    end

    if _G.Aim then
        local mouse = LocalPlayer:GetMouse()
        local target = nil
        local dist = math.huge
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("Head") then
                local pos = game.Workspace.CurrentCamera:WorldToViewportPoint(p.Character.Head.Position)
                local magnitude = (Vector2.new(pos.X, pos.Y) - Vector2.new(mouse.X, mouse.Y)).magnitude
                if magnitude < dist and magnitude < 200 then
                    target = p.Character.Head
                    dist = magnitude
                end
            end
        end
        if target then
            game.Workspace.CurrentCamera.CFrame = CFrame.new(game.Workspace.CurrentCamera.CFrame.Position, target.Position)
        end
    end
end)

UserInputService.JumpRequest:Connect(function()
    if _G.InfJ then LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping") end
end)
