-- AWIQJ SCRIPT WHITE PRO | PASSWORD: SSF
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AWIQJ_WHITE_GUI"
ScreenGui.Parent = game:GetService("CoreGui")

local Main = Instance.new("Frame")
Main.Size = UDim2.new(0, 350, 0, 400)
Main.Position = UDim2.new(0.5, -175, 0.5, -200)
Main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Main.BorderSizePixel = 2
Main.BorderColor3 = Color3.fromRGB(200, 200, 200)
Main.Active = true; Main.Draggable = true; Main.Parent = ScreenGui

local Bar = Instance.new("Frame")
Bar.Size = UDim2.new(1, 0, 0, 40)
Bar.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
Bar.Parent = Main

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(0.4, 0, 1, 0)
Title.Position = UDim2.new(0, 10, 0, 0)
Title.Text = "AWIQJ MENU"
Title.TextColor3 = Color3.fromRGB(0, 0, 0)
Title.BackgroundTransparency = 1; Title.Parent = Bar

local PassInput = Instance.new("TextBox")
PassInput.Size = UDim2.new(0, 100, 0, 25)
PassInput.Position = UDim2.new(1, -145, 0, 7.5)
PassInput.PlaceholderText = "Password"
PassInput.Text = ""
PassInput.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PassInput.TextColor3 = Color3.fromRGB(0, 0, 0)
PassInput.BorderSizePixel = 1; PassInput.Parent = Bar

local PassBtn = Instance.new("TextButton")
PassBtn.Size = UDim2.new(0, 35, 0, 25)
PassBtn.Position = UDim2.new(1, -40, 0, 7.5)
PassBtn.Text = "OK"
PassBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
PassBtn.TextColor3 = Color3.fromRGB(255, 255, 255); PassBtn.Parent = Bar

local Content = Instance.new("Frame")
Content.Size = UDim2.new(1, 0, 1, -40)
Content.Position = UDim2.new(0, 0, 0, 40)
Content.BackgroundTransparency = 1
Content.Visible = false; Content.Parent = Main

PassBtn.MouseButton1Click:Connect(function()
    if PassInput.Text == "SSF" then
        PassInput.Visible = false; PassBtn.Visible = false
        Content.Visible = true
    end
end)

local function AddBtn(txt, y, callback)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(0, 280, 0, 45); b.Position = UDim2.new(0.5, -140, 0, y)
    b.Text = txt; b.BackgroundColor3 = Color3.fromRGB(245, 245, 245)
    b.TextColor3 = Color3.fromRGB(0, 0, 0); b.Parent = Content
    local act = false
    b.MouseButton1Click:Connect(function()
        act = not act
        b.BackgroundColor3 = act and Color3.fromRGB(0, 120, 215) or Color3.fromRGB(245, 245, 245)
        b.TextColor3 = act and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(0, 0, 0)
        callback(act)
    end)
end

AddBtn("اختراق الجدران (Noclip)", 20, function(v) _G.Noc = v end)
AddBtn("كشف اللاعبين (ESP)", 80, function(v) _G.Esp = v end)

game:GetService("RunService").Stepped:Connect(function()
    if _G.Noc and game.Players.LocalPlayer.Character then 
        for _, p in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do 
            if p:IsA("BasePart") then p.CanCollide = false end 
        end 
    end
end)
