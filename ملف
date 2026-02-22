local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "RAWNW_FIXED"
ScreenGui.Parent = game:GetService("CoreGui")

-- المتغيرات الأساسية
_G.AimbotOn = false
_G.ESPOn = false
_G.InfJump = true

-- دائرة الأيم بوت الحمراء الثابتة
local FOVCircle = Drawing.new("Circle")
FOVCircle.Thickness = 2
FOVCircle.Radius = 150
FOVCircle.Color = Color3.fromRGB(255, 0, 0)
FOVCircle.Visible = false
FOVCircle.Filled = false
FOVCircle.Position = Vector2.new(workspace.CurrentCamera.ViewportSize.X / 2, workspace.CurrentCamera.ViewportSize.Y / 2)

-- الواجهة الرئيسية
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 450, 0, 300)
MainFrame.Position = UDim2.new(0.5, -225, 0.5, -150)
MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.BorderColor3 = Color3.fromRGB(50, 255, 150)
MainFrame.BorderSizePixel = 2
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

-- القائمة الجانبية للتنقل
local Tabs = Instance.new("Frame")
Tabs.Size = UDim2.new(0, 120, 1, 0)
Tabs.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Tabs.BorderSizePixel = 0
Tabs.Parent = MainFrame

local TabList = Instance.new("UIListLayout", Tabs)
TabList.SortOrder = Enum.SortOrder.LayoutOrder

-- حاوية الصفحات
local Pages = Instance.new("Frame")
Pages.Size = UDim2.new(1, -120, 1, 0)
Pages.Position = UDim2.new(0, 120, 0, 0)
Pages.BackgroundTransparency = 1
Pages.Parent = MainFrame

-- إنشاء الصفحات
local HomePage = Instance.new("Frame")
HomePage.Size = UDim2.new(1, 0, 1, 0)
HomePage.BackgroundTransparency = 1
HomePage.Visible = true
HomePage.Parent = Pages

local CharPage = Instance.new("Frame")
CharPage.Size = UDim2.new(1, 0, 1, 0)
CharPage.BackgroundTransparency = 1
CharPage.Visible = false
CharPage.Parent = Pages

-- أزرار التنقل (الرئيسية فوق اللاعب)
local function CreateTabBtn(text, order, targetPage)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 40)
    btn.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.LayoutOrder = order
    btn.Parent = Tabs
    btn.MouseButton1Click:Connect(function()
        HomePage.Visible = false
        CharPage.Visible = false
        targetPage.Visible = true
    end)
end

CreateTabBtn("الرئيسية", 1, HomePage)
CreateTabBtn("اللاعب", 2, CharPage)

-- وظيفة إضافة الأزرار (Toggle)
local function CreateToggle(parent, text, pos, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 160, 0, 35)
    btn.Position = pos
    btn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Parent = parent
    
    local active = false
    btn.MouseButton1Click:Connect(function()
        active = not active
        btn.BackgroundColor3 = active and Color3.fromRGB(50, 255, 150) or Color3.fromRGB(35, 35, 35)
        btn.TextColor3 = active and Color3.fromRGB(0, 0, 0) or Color3.fromRGB(255, 255, 255)
        callback(active)
    end)
end

-- إضافة الخيارات
CreateToggle(HomePage, "ايم بوت مغناطيسي", UDim2.new(0, 20, 0, 20), function(v) _G.AimbotOn = v; FOVCircle.Visible = v end)
CreateToggle(HomePage, "كشف اللاعبين", UDim2.new(0, 20, 0, 70), function(v) _G.ESPOn = v end)

-- عداد السرعة في صفحة اللاعب
local SpeedInput = Instance.new("TextBox")
SpeedInput.Size = UDim2.new(0, 160, 0, 35)
SpeedInput.Position = UDim2.new(0, 20, 0, 20)
SpeedInput.PlaceholderText = "سرعة المشي هنا..."
SpeedInput.Text = ""
SpeedInput.Parent = CharPage
SpeedInput.FocusLost:Connect(function()
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = tonumber(SpeedInput.Text) or 16
end)

-- نظام البرمجة (الأيم بوت وعدم الموت)
game:GetService("RunService").RenderStepped:Connect(function()
    FOVCircle.Position = Vector2.new(workspace.CurrentCamera.ViewportSize.X / 2, workspace.CurrentCamera.ViewportSize.Y / 2)
    
    -- الخلود (ما يموت)
    pcall(function()
        if game.Players.LocalPlayer.Character then
            game.Players.LocalPlayer.Character.Humanoid.Health = 100
        end
    end)
    
    -- الأيم بوت
    if _G.AimbotOn then
        local target = nil
        local dist = 150
        for _, v in pairs(game.Players:GetPlayers()) do
            if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("Head") then
                local pos, onScreen = workspace.CurrentCamera:WorldToViewportPoint(v.Character.Head.Position)
                if onScreen then
                    local d = (Vector2.new(pos.X, pos.Y) - FOVCircle.Position).Magnitude
                    if d < dist then target = v; dist = d end
                end
            end
        end
        if target then
            workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, target.Character.Head.Position)
        end
    end
end)

-- قفز لانهائي
game:GetService("UserInputService").JumpRequest:Connect(function()
    if _G.InfJump then game.Players.LocalPlayer.Character.Humanoid:ChangeState(3) end
end)
