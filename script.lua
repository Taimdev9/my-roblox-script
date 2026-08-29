--[[
    ==================================================================
    TRL ULTIMATE DASHBOARD HUB [BILINGUAL: EN/AR + 24H KEY SYSTEM]
    ==================================================================
]]

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local TweenService = game:GetService("TweenService")
local Player = Players.LocalPlayer
local Camera = Workspace.CurrentCamera

if CoreGui:FindFirstChild("TRL_KeySystemUI") then CoreGui.TRL_KeySystemUI:Destroy() end
if CoreGui:FindFirstChild("TRL_UltimateDashboard") then CoreGui.TRL_UltimateDashboard:Destroy() end

-- =================================================================
-- واجهة إدخال المفتاح (Key System GUI)
-- =================================================================
local KeyGui = Instance.new("ScreenGui", CoreGui)
KeyGui.Name = "TRL_KeySystemUI"
KeyGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
KeyGui.IgnoreGuiInset = true

local KeyFrame = Instance.new("Frame", KeyGui)
KeyFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 15)
KeyFrame.Position = UDim2.new(0.5, -175, 0.5, -115)
KeyFrame.Size = UDim2.new(0, 350, 0, 230)
KeyFrame.Active = true
Instance.new("UICorner", KeyFrame).CornerRadius = UDim.new(0, 14)
local KeyStroke = Instance.new("UIStroke", KeyFrame)
KeyStroke.Color = Color3.fromRGB(255, 170, 0)
KeyStroke.Thickness = 1.5

local KeyTitle = Instance.new("TextLabel", KeyFrame)
KeyTitle.BackgroundTransparency = 1
KeyTitle.Position = UDim2.new(0, 0, 0, 15)
KeyTitle.Size = UDim2.new(1, 0, 0, 30)
KeyTitle.Font = Enum.Font.GothamBold
KeyTitle.Text = "🔐 TRL HUB - 24H SECURED KEY"
KeyTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyTitle.TextSize = 14

local KeyDesc = Instance.new("TextLabel", KeyFrame)
KeyDesc.BackgroundTransparency = 1
KeyDesc.Position = UDim2.new(0, 20, 0, 45)
KeyDesc.Size = UDim2.new(1, -40, 0, 40)
KeyDesc.Font = Enum.Font.Gotham
KeyDesc.Text = "Paste the key from website (Valid for 24 hours):"
KeyDesc.TextColor3 = Color3.fromRGB(180, 180, 180)
KeyDesc.TextSize = 11
KeyDesc.TextWrapped = true

local TextBox = Instance.new("TextBox", KeyFrame)
TextBox.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
TextBox.Position = UDim2.new(0.1, 0, 0, 95)
TextBox.Size = UDim2.new(0.8, 0, 0, 40)
TextBox.Font = Enum.Font.Gotham
TextBox.PlaceholderText = "Paste key here..."
TextBox.Text = ""
TextBox.TextColor3 = Color3.fromRGB(0, 255, 200)
TextBox.PlaceholderColor3 = Color3.fromRGB(100, 100, 100)
TextBox.TextSize = 11
Instance.new("UICorner", TextBox).CornerRadius = UDim.new(0, 8)
local BoxStroke = Instance.new("UIStroke", TextBox)
BoxStroke.Color = Color3.fromRGB(255, 170, 0)
BoxStroke.Thickness = 1

local SubmitBtn = Instance.new("TextButton", KeyFrame)
SubmitBtn.BackgroundColor3 = Color3.fromRGB(255, 170, 0)
SubmitBtn.Position = UDim2.new(0.1, 0, 0, 155)
SubmitBtn.Size = UDim2.new(0.8, 0, 0, 40)
SubmitBtn.Font = Enum.Font.GothamBold
SubmitBtn.Text = "Verify & Enter 🚀"
SubmitBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
SubmitBtn.TextSize = 13
Instance.new("UICorner", SubmitBtn).CornerRadius = UDim.new(0, 8)

-- =================================================================
-- دالة تشغيل الداشبورد الأساسية (ثنائية اللغة)
-- =================================================================
local function LaunchMainHub()
    KeyGui:Destroy()

    local ScreenGui = Instance.new("ScreenGui", CoreGui)
    ScreenGui.Name = "TRL_UltimateDashboard"
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.IgnoreGuiInset = true

    local DragButton = Instance.new("TextButton", ScreenGui)
    DragButton.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
    DragButton.Position = UDim2.new(0.85, 0, 0.65, 0)
    DragButton.Size = UDim2.new(0, 60, 0, 60)
    DragButton.Font = Enum.Font.GothamBold
    DragButton.Text = "⚡"
    DragButton.TextColor3 = Color3.fromRGB(255, 200, 0)
    DragButton.TextSize = 28
    DragButton.Active = true
    DragButton.Draggable = true
    Instance.new("UICorner", DragButton).CornerRadius = UDim.new(1, 0)
    local ButtonStroke = Instance.new("UIStroke", DragButton)
    ButtonStroke.Color = Color3.fromRGB(255, 170, 0)
    ButtonStroke.Thickness = 2

    local MainFrame = Instance.new("Frame", ScreenGui)
    MainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 15)
    MainFrame.Position = UDim2.new(0.5, -230, 0.5, -160)
    MainFrame.Size = UDim2.new(0, 460, 0, 320)
    MainFrame.Visible = false
    MainFrame.Active = true
    Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 14)
    local MainStroke = Instance.new("UIStroke", MainFrame)
    MainStroke.Color = Color3.fromRGB(255, 170, 0)
    MainStroke.Thickness = 1.5

    local function ToggleUI(show)
        if show then
            MainFrame.Visible = true
            MainFrame.Position = UDim2.new(0.5, -230, 0.6, -160)
            MainFrame.BackgroundTransparency = 1
            TweenService:Create(MainFrame, TweenInfo.new(0.4, Enum.EasingStyle.Back), {Position = UDim2.new(0.5, -230, 0.5, -160), BackgroundTransparency = 0.05}):Play()
        else
            local tw = TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {Position = UDim2.new(0.5, -230, 0.6, -160), BackgroundTransparency = 1})
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

    local TopBar = Instance.new("Frame", MainFrame)
    TopBar.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
    TopBar.Size = UDim2.new(1, 0, 0, 40)
    Instance.new("UICorner", TopBar).CornerRadius = UDim.new(0, 14)

    local TitleLabel = Instance.new("TextLabel", TopBar)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Position = UDim2.new(0, 15, 0, 0)
    TitleLabel.Size = UDim2.new(0, 250, 1, 0)
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.Text = "🔥 TRL SECURED DASHBOARD"
    TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleLabel.TextSize = 12
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

    -- زر تبديل اللغة داخل الداشبورد
    local LangToggleBtn = Instance.new("TextButton", TopBar)
    LangToggleBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
    LangToggleBtn.Position = UDim2.new(1, -75, 0, 6)
    LangToggleBtn.Size = UDim2.new(0, 35, 0, 28)
    LangToggleBtn.Font = Enum.Font.GothamBold
    LangToggleBtn.Text = "AR"
    LangToggleBtn.TextColor3 = Color3.fromRGB(255, 200, 0)
    LangToggleBtn.TextSize = 11
    Instance.new("UICorner", LangToggleBtn).CornerRadius = UDim.new(0, 6)

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

    local TabBar = Instance.new("Frame", MainFrame)
    TabBar.BackgroundTransparency = 1
    TabBar.Position = UDim2.new(0, 15, 0, 48)
    TabBar.Size = UDim2.new(1, -30, 0, 32)

    local Tab1Btn = Instance.new("TextButton", TabBar)
    Tab1Btn.BackgroundColor3 = Color3.fromRGB(255, 140, 0)
    Tab1Btn.Size = UDim2.new(0.48, 0, 1, 0)
    Tab1Btn.Font = Enum.Font.GothamBold
    Tab1Btn.Text = "⚙️ Main (Page 1)"
    Tab1Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    Tab1Btn.TextSize = 11
    Instance.new("UICorner", Tab1Btn).CornerRadius = UDim.new(0, 6)

    local Tab2Btn = Instance.new("TextButton", TabBar)
    Tab2Btn.BackgroundColor3 = Color3.fromRGB(35, 35, 50)
    Tab2Btn.Position = UDim2.new(0.52, 0, 0, 0)
    Tab2Btn.Size = UDim2.new(0.48, 0, 1, 0)
    Tab2Btn.Font = Enum.Font.GothamBold
    Tab2Btn.Text = "✨ God Tools (Page 2)"
    Tab2Btn.TextColor3 = Color3.fromRGB(200, 200, 200)
    Tab2Btn.TextSize = 11
    Instance.new("UICorner", Tab2Btn).CornerRadius = UDim.new(0, 6)

    local Page1 = Instance.new("ScrollingFrame", MainFrame)
    Page1.BackgroundTransparency = 1
    Page1.Position = UDim2.new(0, 15, 0, 88)
    Page1.Size = UDim2.new(1, -30, 1, -100)
    Page1.CanvasSize = UDim2.new(0, 0, 0, 220)
    Page1.ScrollBarThickness = 3
    local UIList1 = Instance.new("UIListLayout", Page1)
    UIList1.SortOrder = Enum.SortOrder.LayoutOrder
    UIList1.Padding = UDim.new(0, 8)

    local Page2 = Instance.new("ScrollingFrame", MainFrame)
    Page2.BackgroundTransparency = 1
    Page2.Position = UDim2.new(0, 15, 0, 88)
    Page2.Size = UDim2.new(1, -30, 1, -100)
    Page2.CanvasSize = UDim2.new(0, 0, 0, 220)
    Page2.ScrollBarThickness = 3
    Page2.Visible = false
    local UIList2 = Instance.new("UIListLayout", Page2)
    UIList2.SortOrder = Enum.SortOrder.LayoutOrder
    UIList2.Padding = UDim.new(0, 8)

    Tab1Btn.MouseButton1Click:Connect(function()
        Page1.Visible = true
        Page2.Visible = false
        Tab1Btn.BackgroundColor3 = Color3.fromRGB(255, 140, 0)
        Tab1Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        Tab2Btn.BackgroundColor3 = Color3.fromRGB(35, 35, 50)
        Tab2Btn.TextColor3 = Color3.fromRGB(200, 200, 200)
    end)

    Tab2Btn.MouseButton1Click:Connect(function()
        Page1.Visible = false
        Page2.Visible = true
        Tab2Btn.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
        Tab2Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        Tab1Btn.BackgroundColor3 = Color3.fromRGB(35, 35, 50)
        Tab1Btn.TextColor3 = Color3.fromRGB(200, 200, 200)
    end)

    local function createButton(parent, text, color)
        local btn = Instance.new("TextButton", parent)
        btn.BackgroundColor3 = color
        btn.Size = UDim2.new(1, 0, 0, 42)
        btn.Font = Enum.Font.GothamBold
        btn.Text = text
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        btn.TextSize = 12
        Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8)
        return btn
    end

    -- النصوص باللغتين
    local currentLang = "en"
    local localizedTexts = {
        en = {
            tab1 = "⚙️ Main (Page 1)",
            tab2 = "✨ God Tools (Page 2)",
            b1_off = "🛸 1. Drone Spectator Cam: [OFF]",
            b1_on = "🛸 1. Drone Spectator Cam: [ON]",
            b2 = "👥 2. Shadow Clone Decoy: [SPAWN]",
            b3 = "📡 3. Echolocation Pulse Scanner",
            b4 = "🚀 4. Kinetic Super-Dash (Forward Burst)",
            n1 = "🧲 1. Auto-Loot Magnet (Pull Items)",
            n2 = "🔄 2. Control Reverser (Troll Players)",
            n3 = "👻 3. Radar Ghost Mode (Hide Name)",
            n4_off = "🧊 4. Air-Step Platform: [OFF]",
            n4_on = "🧊 4. Air-Step Platform: [ON]"
        },
        ar = {
            tab1 = "⚙️ الأساسية (الصفحة 1)",
            tab2 = "✨ الأدوات الخارقة (الصفحة 2)",
            b1_off = "🛸 1. كاميرا الدرون: [معطل]",
            b1_on = "🛸 1. كاميرا الدرون: [مفعل]",
            b2 = "👥 2. إنشاء نسخة وهمية (Clone)",
            b3 = "📡 3. رادار كشف اللاعبين (Pulse)",
            b4 = "🚀 4. اندفاع خارق للأمام (Super-Dash)",
            n1 = "🧲 1. مغناطيس جمع الأغراض (Auto-Loot)",
            n2 = "🔄 2. انعكاس التحكم (Troll)",
            n3 = "👻 3. وضع الشبح المخفي (Hide Name)",
            n4_off = "🧊 4. منصة المشي في الهواء: [معطل]",
            n4_on = "🧊 4. منصة المشي في الهواء: [مفعل]"
        }
    }

    local Btn1 = createButton(Page1, localizedTexts.en.b1_off, Color3.fromRGB(40, 40, 60))
    local Btn2 = createButton(Page1, localizedTexts.en.b2, Color3.fromRGB(40, 40, 60))
    local Btn3 = createButton(Page1, localizedTexts.en.b3, Color3.fromRGB(40, 40, 60))
    local Btn4 = createButton(Page1, localizedTexts.en.b4, Color3.fromRGB(0, 120, 180))

    local BtnNew1 = createButton(Page2, localizedTexts.en.n1, Color3.fromRGB(150, 80, 0))
    local BtnNew2 = createButton(Page2, localizedTexts.en.n2, Color3.fromRGB(120, 40, 120))
    local BtnNew3 = createButton(Page2, localizedTexts.en.n3, Color3.fromRGB(40, 100, 120))
    local BtnNew4 = createButton(Page2, localizedTexts.en.n4_off, Color3.fromRGB(0, 130, 80))

    -- تبديل النصوص داخل الداشبورد
    LangToggleBtn.MouseButton1Click:Connect(function()
        currentLang = currentLang == "en" and "ar" or "en"
        LangToggleBtn.Text = currentLang == "en" and "AR" | "EN"
        LangToggleBtn.Text = currentLang == "en" and "AR" or "EN"
        
        Tab1Btn.Text = localizedTexts[currentLang].tab1
        Tab2Btn.Text = localizedTexts[currentLang].tab2
        Btn2.Text = localizedTexts[currentLang].b2
        Btn3.Text = localizedTexts[currentLang].b3
        Btn4.Text = localizedTexts[currentLang].b4
        BtnNew1.Text = localizedTexts[currentLang].n1
        BtnNew2.Text = localizedTexts[currentLang].n2
        BtnNew3.Text = localizedTexts[currentLang].n3
    end)

    -- الوظائف البرمجية للأزرار
    local droneActive, droneCamPart = false, nil
    Btn1.MouseButton1Click:Connect(function()
        droneActive = not droneActive
        Btn1.Text = droneActive and localizedTexts[currentLang].b1_on or localizedTexts[currentLang].b1_off
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

    Btn3.MouseButton1Click:Connect(function()
        for _, p in ipairs(Players:GetPlayers()) do
            if p ~= Player and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                local highlight = Instance.new("Highlight", p.Character)
                highlight.FillColor = Color3.fromRGB(0, 255, 255)
                task.delay(5, function() highlight:Destroy() end)
            end
        end
    end)

    Btn4.MouseButton1Click:Connect(function()
        local char = Player.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            local bv = Instance.new("BodyVelocity", char.HumanoidRootPart)
            bv.MaxForce = Vector3.new(math.huge, 0, math.huge)
            bv.Velocity = Camera.CFrame.LookVector * 100
            task.wait(0.25)
            bv:Destroy()
        end
    end)

    BtnNew1.MouseButton1Click:Connect(function()
        for _, obj in ipairs(Workspace:GetDescendants()) do
            if obj:IsA("BasePart") and not obj.Anchored and Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
                obj.CFrame = Player.Character.HumanoidRootPart.CFrame
            end
        end
    end)

    BtnNew2.MouseButton1Click:Connect(function()
        for _, p in ipairs(Players:GetPlayers()) do
            if p ~= Player and p.Character and p.Character:FindFirstChild("Humanoid") then
                p.Character.Humanoid.WalkSpeed = -16
                task.delay(3, function() if p.Character and p.Character:FindFirstChild("Humanoid") then p.Character.Humanoid.WalkSpeed = 16 end end)
            end
        end
    end)

    BtnNew3.MouseButton1Click:Connect(function()
        local char = Player.Character
        if char and char:FindFirstChild("Head") then
            local tag = char.Head:FindFirstChildOfClass("BillboardGui")
            if tag then tag.Enabled = not tag.Enabled end
        end
    end)

    local airStepActive = false
    local currentPlatform = nil
    BtnNew4.MouseButton1Click:Connect(function()
        airStepActive = not airStepActive
        BtnNew4.Text = airStepActive and localizedTexts[currentLang].n4_on or localizedTexts[currentLang].n4_off
        BtnNew4.BackgroundColor3 = airStepActive and Color3.fromRGB(0, 200, 100) or Color3.fromRGB(0, 130, 80)
        
        if airStepActive then
            local char = Player.Character
            if char and char:FindFirstChild("HumanoidRootPart") then
                currentPlatform = Instance.new("Part", Workspace)
                currentPlatform.Size = Vector3.new(4, 1, 4)
                currentPlatform.Anchored = true
                currentPlatform.Transparency = 0.5
                currentPlatform.BrickColor = BrickColor.new("Cyan")
                currentPlatform.CFrame = char.HumanoidRootPart.CFrame - Vector3.new(0, 3.5, 0)
            end
        else
            if currentPlatform then currentPlatform:Destroy() currentPlatform = nil end
        end
    end)
end

-- =================================================================
-- التحقق من المفتاح وصلاحية الـ 24 ساعة
-- =================================================================
SubmitBtn.MouseButton1Click:Connect(function()
    local userKey = TextBox.Text
    
    if string.sub(userKey, 1, 8) == "TRL-PRO-" then
        local parts = {}
        for part in string.gmatch(userKey, "[^-]+") do
            table.insert(parts, part)
        end
        
        local keyTimestamp = tonumber(parts[3])
        if keyTimestamp then
            local diffHours = (os.time() * 1000 - keyTimestamp) / (1000 * 60 * 60)
            if diffHours >= 0 and diffHours <= 24 then
                SubmitBtn.Text = "Verified Successfully! ✅"
                SubmitBtn.BackgroundColor3 = Color3.fromRGB(0, 255, 100)
                task.wait(0.8)
                LaunchMainHub()
                return
            end
        end
    end
    
    SubmitBtn.Text = "Invalid or Expired Key! ❌"
    SubmitBtn.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
    task.wait(1.5)
    SubmitBtn.Text = "Verify & Enter 🚀"
    SubmitBtn.BackgroundColor3 = Color3.fromRGB(255, 170, 0)
end)
