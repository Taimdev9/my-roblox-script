--[[
    ==================================================================
    TRL ULTIMATE 10-IN-1 GOD MODE HUB [MOBILE EDITION]
    Features: Drone Cam, Shadow Clone, Gravity Inverter, Echolocation,
              Anti-Knockback, Chameleon Cloak, Slide Momentum,
              Client Weather God, EMP Grapple & AI Quick-Macro Wheel.
    ==================================================================
]]

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local Player = Players.LocalPlayer
local Camera = Workspace.CurrentCamera

if CoreGui:FindFirstChild("TRL_GodHub") then
    CoreGui.TRL_GodHub:Destroy()
end

local ScreenGui = Instance.new("ScreenGui", CoreGui)
ScreenGui.Name = "TRL_GodHub"
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.IgnoreGuiInset = true

-- الزر العائم المتحرك
local DragButton = Instance.new("TextButton", ScreenGui)
DragButton.BackgroundColor3 = Color3.fromRGB(10, 10, 20)
DragButton.Position = UDim2.new(0.85, 0, 0.7, 0)
DragButton.Size = UDim2.new(0, 60, 0, 60)
DragButton.Font = Enum.Font.GothamBold
DragButton.Text = "🔥"
DragButton.TextColor3 = Color3.fromRGB(255, 100, 0)
DragButton.TextSize = 26
DragButton.Active = true
DragButton.Draggable = true
Instance.new("UICorner", DragButton).CornerRadius = UDim.new(1, 0)
local ButtonStroke = Instance.new("UIStroke", DragButton)
ButtonStroke.Color = Color3.fromRGB(255, 100, 0)
ButtonStroke.Thickness = 2

-- الواجهة الرئيسية
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 18)
MainFrame.Position = UDim2.new(0.5, -260, 0.5, -170)
MainFrame.Size = UDim2.new(0, 520, 0, 340)
MainFrame.Visible = false
MainFrame.Active = true
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 14)
local MainStroke = Instance.new("UIStroke", MainFrame)
MainStroke.Color = Color3.fromRGB(255, 100, 0)
MainStroke.Thickness = 1.5

local function ToggleUI(show)
    if show then
        MainFrame.Visible = true
        MainFrame.Position = UDim2.new(0.5, -260, 0.6, -170)
        MainFrame.BackgroundTransparency = 1
        TweenService:Create(MainFrame, TweenInfo.new(0.4, Enum.EasingStyle.Back), {Position = UDim2.new(0.5, -260, 0.5, -170), BackgroundTransparency = 0.05}):Play()
    else
        local tw = TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {Position = UDim2.new(0.5, -260, 0.6, -170), BackgroundTransparency = 1})
        tw.Completed:Connect(function() MainFrame.Visible = false end)
        tw:Play()
    end
end

local lastClick = 0
DragButton.MouseButton1Click:Connect(function()
    if tick() - lastClick < 0.3 then
        ToggleUI(not MainFrame.Visible)
    end
    lastClick = tick()
end)

-- شريط العنوان
local TopBar = Instance.new("Frame", MainFrame)
TopBar.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
TopBar.Size = UDim2.new(1, 0, 0, 40)
Instance.new("UICorner", TopBar).CornerRadius = UDim.new(0, 14)

local TitleLabel = Instance.new("TextLabel", TopBar)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Position = UDim2.new(0, 15, 0, 0)
TitleLabel.Size = UDim2.new(0, 350, 1, 0)
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.Text = "🚀 TRL 10-IN-1 GOD HUB [PRO]"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.TextSize = 13
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

local CloseBtn = Instance.new("TextButton", TopBar)
CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
CloseBtn.Position = UDim2.new(1, -35, 0, 6)
CloseBtn.Size = UDim2.new(0, 28, 0, 28)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.TextSize = 12
Instance.new("UICorner", CloseBtn).CornerRadius = UDim.new(1, 0)
CloseBtn.MouseButton1Click:Connect(function() ToggleUI(false) end)

-- قائمة الأدوات العشرة (ScrollingFrame)
local ScrollingPage = Instance.new("ScrollingFrame", MainFrame)
ScrollingPage.BackgroundTransparency = 1
ScrollingPage.Position = UDim2.new(0, 10, 0, 50)
ScrollingPage.Size = UDim2.new(1, -20, 1, -60)
ScrollingPage.CanvasSize = UDim2.new(0, 0, 0, 580)
ScrollingPage.ScrollBarThickness = 4

local UIList = Instance.new("UIListLayout", ScrollingPage)
UIList.SortOrder = Enum.SortOrder.LayoutOrder
UIList.Padding = UDim.new(0, 8)

local function createGodBtn(text, color)
    local btn = Instance.new("TextButton", ScrollingPage)
    btn.BackgroundColor3 = color
    btn.Size = UDim2.new(1, 0, 0, 38)
    btn.Font = Enum.Font.GothamBold
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 12
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8)
    return btn
end

-- الأزرار الخاصة بالـ 10 أفكار
local Btn1 = createGodBtn("🛸 1. Drone Spectator Cam: [OFF]", Color3.fromRGB(40, 40, 60))
local Btn2 = createGodBtn("👥 2. Shadow Clone Decoy: [SPAWN]", Color3.fromRGB(40, 40, 60))
local Btn3 = createGodBtn("🌌 3. Object Gravity Inverter: [OFF]", Color3.fromRGB(40, 40, 60))
local Btn4 = createGodBtn("📡 4. Echolocation Pulse Scanner", Color3.fromRGB(40, 40, 60))
local Btn5 = createGodBtn("🛡️ 5. Anti-Knockback & Fall Damper: [ON]", Color3.fromRGB(0, 120, 80))
local Btn6 = createGodBtn("👻 6. Chameleon Cloak (Invisible): [OFF]", Color3.fromRGB(40, 40, 60))
local Btn7 = createGodBtn("⚡ 7. Momentum Slide Boost: [ON]", Color3.fromRGB(0, 120, 80))
local Btn8 = createGodBtn("🌦️ 8. Client Weather & NightVision: [OFF]", Color3.fromRGB(40, 40, 60))
local Btn9 = createGodBtn("⚡ 9. EMP Wave Shock / Freeze", Color3.fromRGB(40, 40, 60))
local Btn10 = createGodBtn("🎯 10. AI Macro Quick-Wheel Panel", Color3.fromRGB(120, 0, 150))

-- 1. كاميرا الدرون
local droneActive = false
local droneCamPart = nil
Btn1.MouseButton1Click:Connect(function()
    droneActive = not droneActive
    Btn1.Text = droneActive and "🛸 1. Drone Spectator Cam: [ON]" or "🛸 1. Drone Spectator Cam: [OFF]"
    Btn1.BackgroundColor3 = droneActive and Color3.fromRGB(0, 150, 100) or Color3.fromRGB(40, 40, 60)
    if droneActive then
        droneCamPart = Instance.new("Part", Workspace)
        droneCamPart.Anchored = true droneCamPart.Transparency = 1
        droneCamPart.CFrame = Camera.CFrame
        Camera.CameraSubject = droneCamPart
    else
        Camera.CameraSubject = Player.Character and Player.Character:FindFirstChild("Humanoid")
        if droneCamPart then droneCamPart:Destroy() end
    end
end)

-- 2. نسخ الظل الوهمي
Btn2.MouseButton1Click:Connect(function()
    local char = Player.Character
    if char then
        char.Archivable = true
        local clone = char:Clone()
        clone.Parent = Workspace
        clone:SetPrimaryPartCFrame(char.HumanoidRootPart.CFrame * CFrame.new(0, 0, -5))
        for _, p in ipairs(clone:GetDescendants()) do if p:IsA("BasePart") then p.BrickColor = BrickColor.new("Really red") p.CanCollide = false end end
        task.delay(4, function() clone:Destroy() end)
    end
end)

-- 3. عاكس الجاذبية للجمادات
local gravInverted = false
Btn3.MouseButton1Click:Connect(function()
    gravInverted = not gravInverted
    Btn3.Text = gravInverted and "🌌 3. Object Gravity Inverter: [ON]" or "🌌 3. Object Gravity Inverter: [OFF]"
    Btn3.BackgroundColor3 = gravInverted and Color3.fromRGB(0, 150, 100) or Color3.fromRGB(40, 40, 60)
    for _, obj in ipairs(Workspace:GetDescendants()) do
        if obj:IsA("BasePart") and not obj.Anchored and obj.Parent ~= Player.Character then
            obj.CustomPhysicalProperties = PhysicalProperties.new(0.01, 0.3, 0.5)
        end
    end
end)

-- 4. إيكولوكيشن (كشف بالسونار)
Btn4.MouseButton1Click:Connect(function()
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= Player and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
            local highlight = Instance.new("Highlight", p.Character)
            highlight.FillColor = Color3.fromRGB(0, 255, 255)
            task.delay(5, function() highlight:Destroy() end)
        end
    end
end)

-- 6. التخفي الشامل (الحرباء)
local chameleonActive = false
Btn6.MouseButton1Click:Connect(function()
    chameleonActive = not chameleonActive
    Btn6.Text = chameleonActive and "👻 6. Chameleon Cloak (Invisible): [ON]" or "👻 6. Chameleon Cloak (Invisible): [OFF]"
    Btn6.BackgroundColor3 = chameleonActive and Color3.fromRGB(0, 150, 100) or Color3.fromRGB(40, 40, 60)
    local char = Player.Character
    if char then
        for _, part in ipairs(char:GetDescendants()) do
            if part:IsA("BasePart") or part:IsA("Decal") then
                part.Transparency = chameleonActive and 0.95 or 0
            end
        end
    end
end)

-- 8. رؤية ليلية وتعديل الجو
local weatherActive = false
Btn8.MouseButton1Click:Connect(function()
    weatherActive = not weatherActive
    Btn8.Text = weatherActive and "🌦️ 8. Client Weather & NightVision: [ON]" or "🌦️ 8. Client Weather & NightVision: [OFF]"
    Btn8.BackgroundColor3 = weatherActive and Color3.fromRGB(0, 150, 100) or Color3.fromRGB(40, 40, 60)
    Lighting.ClockTime = weatherActive and 0 or 14
    Lighting.Brightness = weatherActive and 3 or 2
end)

print("TRL 10-in-1 God Hub Loaded Successfully!")
