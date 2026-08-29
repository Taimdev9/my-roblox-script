--[[
    ==================================================================
    TRL ULTIMATE MASTER HUB - ALL-IN-ONE MOBILE EDITION
    Features: Portal Gun Tool, Grappling Hook Tool, Phase Ghost Dash,
              Time Dilation, Double Jump, Changelog Log Dashboard.
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

if CoreGui:FindFirstChild("TRL_MasterHub") then
    CoreGui.TRL_MasterHub:Destroy()
end

local ScreenGui = Instance.new("ScreenGui", CoreGui)
ScreenGui.Name = "TRL_MasterHub"
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.IgnoreGuiInset = true

-- الزر العائم القابل للتحريك
local DragButton = Instance.new("TextButton", ScreenGui)
DragButton.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
DragButton.Position = UDim2.new(0.85, 0, 0.75, 0)
DragButton.Size = UDim2.new(0, 60, 0, 60)
DragButton.Font = Enum.Font.GothamBold
DragButton.Text = "⚡"
DragButton.TextColor3 = Color3.fromRGB(0, 220, 255)
DragButton.TextSize = 28
DragButton.Active = true
DragButton.Draggable = true
Instance.new("UICorner", DragButton).CornerRadius = UDim.new(1, 0)
local ButtonStroke = Instance.new("UIStroke", DragButton)
ButtonStroke.Color = Color3.fromRGB(0, 180, 255)
ButtonStroke.Thickness = 2

-- الواجهة الرئيسية
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 15)
MainFrame.Position = UDim2.new(0.5, -250, 0.5, -160)
MainFrame.Size = UDim2.new(0, 500, 0, 320)
MainFrame.Visible = false
MainFrame.Active = true
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 14)
local MainStroke = Instance.new("UIStroke", MainFrame)
MainStroke.Color = Color3.fromRGB(0, 180, 255)
MainStroke.Thickness = 1.5

local function ToggleUI(show)
    if show then
        MainFrame.Visible = true
        MainFrame.Position = UDim2.new(0.5, -250, 0.6, -160)
        MainFrame.BackgroundTransparency = 1
        TweenService:Create(MainFrame, TweenInfo.new(0.4, Enum.EasingStyle.Back), {Position = UDim2.new(0.5, -250, 0.5, -160), BackgroundTransparency = 0.05}):Play()
    else
        local tw = TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {Position = UDim2.new(0.5, -250, 0.6, -160), BackgroundTransparency = 1})
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

-- شريط العنوان وأزرار التنقل بين الصفحات (الأدوات & سجل التحديثات)
local TopBar = Instance.new("Frame", MainFrame)
TopBar.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
TopBar.Size = UDim2.new(1, 0, 0, 40)
Instance.new("UICorner", TopBar).CornerRadius = UDim.new(0, 14)

local TitleLabel = Instance.new("TextLabel", TopBar)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Position = UDim2.new(0, 15, 0, 0)
TitleLabel.Size = UDim2.new(0, 300, 1, 0)
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.Text = "🌌 TRL MASTER HUB [PRO]"
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

-- نظام التبويبات (Tabs)
local TabsHolder = Instance.new("Frame", MainFrame)
TabsHolder.BackgroundTransparency = 1
TabsHolder.Position = UDim2.new(0, 10, 0, 48)
TabsHolder.Size = UDim2.new(1, -20, 0, 32)

local Tab1Btn = Instance.new("TextButton", TabsHolder)
Tab1Btn.BackgroundColor3 = Color3.fromRGB(0, 140, 200)
Tab1Btn.Size = UDim2.new(0.48, 0, 1, 0)
Tab1Btn.Font = Enum.Font.GothamBold
Tab1Btn.Text = "⚡ Hacks & Tools"
Tab1Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
Tab1Btn.TextSize, Tab1Btn.Name = 12, "Tab1Btn"
Instance.new("UICorner", Tab1Btn).CornerRadius = UDim.new(0, 8)

local Tab2Btn = Instance.new("TextButton", TabsHolder)
Tab2Btn.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
Tab2Btn.Position = UDim2.new(0.52, 0, 0, 0)
Tab2Btn.Size = UDim2.new(0.48, 0, 1, 0)
Tab2Btn.Font = Enum.Font.GothamBold
Tab2Btn.Text = "📜 Changelog History"
Tab2Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
Tab2Btn.TextSize, Tab2Btn.Name = 12, "Tab2Btn"
Instance.new("UICorner", Tab2Btn).CornerRadius = UDim.new(0, 8)

-- محتوى الصفحة الأولى (الأدوات والهاكات)
local HacksPage = Instance.new("ScrollingFrame", MainFrame)
HacksPage.BackgroundTransparency = 1
HacksPage.Position = UDim2.new(0, 10, 0, 90)
HacksPage.Size = UDim2.new(1, -20, 1, -100)
HacksPage.CanvasSize = UDim2.new(0, 0, 0, 360)
HacksPage.ScrollBarThickness = 4
HacksPage.Visible = true

local UIList1 = Instance.new("UIListLayout", HacksPage)
UIList1.SortOrder = Enum.SortOrder.LayoutOrder
UIList1.Padding = UDim.new(0, 8)

-- محتوى الصفحة الثانية (سجل التحديثات التاريخي)
local ChangelogPage = Instance.new("ScrollingFrame", MainFrame)
ChangelogPage.BackgroundTransparency = 1
ChangelogPage.Position = UDim2.new(0, 10, 0, 90)
ChangelogPage.Size = UDim2.new(1, -20, 1, -100)
ChangelogPage.CanvasSize = UDim2.new(0, 0, 0, 450)
ChangelogPage.ScrollBarThickness = 4
ChangelogPage.Visible = false

local UIList2 = Instance.new("UIListLayout", ChangelogPage)
UIList2.SortOrder = Enum.SortOrder.LayoutOrder
UIList2.Padding = UDim.new(0, 8)

Tab1Btn.MouseButton1Click:Connect(function()
    HacksPage.Visible = true
    ChangelogPage.Visible = false
    Tab1Btn.BackgroundColor3 = Color3.fromRGB(0, 140, 200)
    Tab2Btn.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
end)

Tab2Btn.MouseButton1Click:Connect(function()
    HacksPage.Visible = false
    ChangelogPage.Visible = true
    Tab2Btn.BackgroundColor3 = Color3.fromRGB(140, 0, 200)
    Tab1Btn.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
end)

-- وظيفة لإنشاء أزرار الأفعال في الصفحة الأولى
local function createHackBtn(text, color)
    local btn = Instance.new("TextButton", HacksPage)
    btn.BackgroundColor3 = color
    btn.Size = UDim2.new(1, 0, 0, 40)
    btn.Font = Enum.Font.GothamBold
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 12
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8)
    return btn
end

local GivePortalGun = createHackBtn("🔫 Give Quantum Portal Gun (Tool)", Color3.fromRGB(30, 100, 150))
local GiveGrappleBtn = createHackBtn("🧗‍♂️ Give Quantum Grappling Hook (Tool)", Color3.fromRGB(30, 120, 100))
local GhostDashBtn = createHackBtn("👻 Phase Ghost Dash (Through Walls): [OFF]", Color3.fromRGB(50, 50, 70))
local TimeSlowBtn = createHackBtn("⏳ Time Dilation (Slow Motion World): [OFF]", Color3.fromRGB(50, 50, 70))

-- 1. أداة سلاح البوابات اليدوية (Portal Gun Tool)
GivePortalGun.MouseButton1Click:Connect(function()
    if Player.Backpack:FindFirstChild("PortalGun") or (Player.Character and Player.Character:FindFirstChild("PortalGun")) then return end
    local tool = Instance.new("Tool")
    tool.Name = "PortalGun"
    tool.RequiresHandle = true
    tool.TextureId = "rbxassetid://6035111166"
    
    local handle = Instance.new("Part", tool)
    handle.Name = "Handle"
    handle.Size = Vector3.new(0.8, 0.8, 3)
    handle.Color = Color3.fromRGB(0, 180, 255)
    Instance.new("SpecialMesh", handle).MeshType = Enum.MeshType.Cylinder

    local p1, p2 = nil, nil
    tool.Activated:Connect(function()
        local char = Player.Character
        if not char or not char:FindFirstChild("HumanoidRootPart") then return end
        local cam = Workspace.CurrentCamera
        local ray = Ray.new(cam.CFrame.Position, cam.CFrame.LookVector * 1000)
        local hit, pos = Workspace:FindPartOnRay(ray, char)
        if hit then
            if not p1 then
                p1 = Instance.new("Part", Workspace)
                p1.Size = Vector3.new(2, 5, 0.2) p1.Anchored = true p1.CanCollide = false
                p1.Color = Color3.fromRGB(0, 200, 255) p1.CFrame = CFrame.new(pos + Vector3.new(0,2,0))
            elseif not p2 then
                p2 = Instance.new("Part", Workspace)
                p2.Size = Vector3.new(2, 5, 0.2) p2.Anchored = true p2.CanCollide = false
                p2.Color = Color3.fromRGB(255, 150, 0) p2.CFrame = CFrame.new(pos + Vector3.new(0,2,0))
                
                -- التفعيل والقفز عبر البوابات بالزخم
                p1.Touched:Connect(function(hitObj)
                    if hitObj.Parent == char then
                        char.HumanoidRootPart.CFrame = p2.CFrame * CFrame.new(0,0,-3)
                        char.HumanoidRootPart.AssemblyLinearVelocity = char.HumanoidRootPart.AssemblyLinearVelocity * 1.6
                    end
                end)
                p2.Touched:Connect(function(hitObj)
                    if hitObj.Parent == char then
                        char.HumanoidRootPart.CFrame = p1.CFrame * CFrame.new(0,0,-3)
                        char.HumanoidRootPart.AssemblyLinearVelocity = char.HumanoidRootPart.AssemblyLinearVelocity * 1.6
                    end
                end)
            else
                p1:Destroy() p2:Destroy() p1, p2 = nil, nil
            end
        end
    end)
    tool.Parent = Player.Backpack
end)

-- 2. أداة خطاف الجريان (Grappling Hook Tool)
GiveGrappleBtn.MouseButton1Click:Connect(function()
    if Player.Backpack:FindFirstChild("GrappleHook") then return end
    local tool = Instance.new("Tool")
    tool.Name = "GrappleHook"
    tool.RequiresHandle = true
    local handle = Instance.new("Part", tool)
    handle.Name = "Handle" handle.Size = Vector3.new(1,1,2) handle.Color = Color3.fromRGB(0, 255, 128)

    tool.Activated:Connect(function()
        local char = Player.Character
        if not char or not char:FindFirstChild("HumanoidRootPart") then return end
        local cam = Workspace.CurrentCamera
        local ray = Ray.new(cam.CFrame.Position, cam.CFrame.LookVector * 1500)
        local _, pos = Workspace:FindPartOnRay(ray, char)
        if pos then
            local bv = Instance.new("BodyVelocity", char.HumanoidRootPart)
            bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
            bv.Velocity = (pos - char.HumanoidRootPart.Position).Unit * 120
            Camera.FieldOfView = 90
            task.wait(0.4)
            bv:Destroy()
            Camera.FieldOfView = 70
        end
    end)
    tool.Parent = Player.Backpack
end)

-- 3. العبور الطيفي (Ghost Dash)
local ghostActive = false
GhostDashBtn.MouseButton1Click:Connect(function()
    ghostActive = not ghostActive
    GhostDashBtn.Text = ghostActive and "👻 Phase Ghost Dash (Through Walls): [ON]" or "👻 Phase Ghost Dash (Through Walls): [OFF]"
    GhostDashBtn.BackgroundColor3 = ghostActive and Color3.fromRGB(0, 150, 100) or Color3.fromRGB(50, 50, 70)
    
    task.spawn(function()
        while ghostActive and task.wait(0.1) do
            local char = Player.Character
            if char then
                for _, part in ipairs(char:GetDescendants()) do
                    if part:IsA("BasePart") then part.CanCollide = false end
                end
            end
        end
        local char = Player.Character
        if char then
            for _, part in ipairs(char:GetDescendants()) do
                if part:IsA("BasePart") then part.CanCollide = true end
            end
        end
    end)
end)

-- 4. إبطاء الزمن (Time Dilation)
local timeSlowActive = false
TimeSlowBtn.MouseButton1Click:Connect(function()
    timeSlowActive = not timeSlowActive
    TimeSlowBtn.Text = timeSlowActive and "⏳ Time Dilation (Slow Motion World): [ON]" or "⏳ Time Dilation (Slow Motion World): [OFF]"
    TimeSlowBtn.BackgroundColor3 = timeSlowActive and Color3.fromRGB(0, 150, 100) or Color3.fromRGB(50, 50, 70)
    
    if timeSlowActive then
        for _, obj in ipairs(Workspace:GetDescendants()) do
            if obj:IsA("BasePart") and obj.Parent ~= Player.Character then
                obj.AssemblyLinearVelocity = obj.AssemblyLinearVelocity * 0.3
            end
        end
    end
end)

-- تعبئة صفحة سجل التحديثات (Changelog History) بالترتيب التاريخي لكل ما بنيناه
local function addLogItem(version, title, desc, color)
    local frame = Instance.new("Frame", ChangelogPage)
    frame.BackgroundColor3 = Color3.fromRGB(18, 20, 30)
    frame.Size = UDim2.new(1, 0, 0, 85)
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)
    local stroke = Instance.new("UIStroke", frame)
    stroke.Color = color stroke.Thickness = 1
    
    local vLabel = Instance.new("TextLabel", frame)
    vLabel.BackgroundTransparency = 1 vLabel.Position = UDim2.new(0, 10, 0, 6)
    vLabel.Size = UDim2.new(0, 100, 0, 20) vLabel.Font = Enum.Font.GothamBold
    vLabel.Text = version vLabel.TextColor3 = color vLabel.TextSize = 11
    vLabel.TextXAlignment = Enum.TextXAlignment.Left
    
    local tLabel = Instance.new("TextLabel", frame)
    tLabel.BackgroundTransparency = 1 tLabel.Position = UDim2.new(0, 10, 0, 26)
    tLabel.Size = UDim2.new(1, -20, 0, 20) tLabel.Font = Enum.Font.GothamBold
    tLabel.Text = title tLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    tLabel.TextSize = 12 tLabel.TextXAlignment = Enum.TextXAlignment.Left
    
    local dLabel = Instance.new("TextLabel", frame)
    dLabel.BackgroundTransparency = 1 dLabel.Position = UDim2.new(0, 10, 0, 48)
    dLabel.Size = UDim2.new(1, -20, 0, 30) dLabel.Font = Enum.Font.Gotham
    dLabel.Text = desc dLabel.TextColor3 = Color3.fromRGB(170, 170, 190)
    dLabel.TextSize = 10 dLabel.TextXAlignment = Enum.TextXAlignment.Left
    dLabel.TextWrapped = true
end

addLogItem("v1.0 (Initial)", "GitHub Raw Setup & Basic Connect", "ربط ملف script.lua عبر جيت هاب وتشغيله لأول مرة في دلتا باستخدام loadstring.", Color3.fromRGB(100, 100, 100))
addLogItem("v1.2 (UI Edition)", "Mobile Floating GUI Hub", "تصميم واجهة الهاتف مع الزر العائم القابل للسحب والإخفاء الذكي.", Color3.fromRGB(0, 160, 255))
addLogItem("v1.5 (Physics Update)", "Quantum Portal Gun System", "إضافة مسدس البوابات الفيزيائي المعتمد على الزخم والانتقال المكاني الفوري.", Color3.fromRGB(255, 170, 0))
addLogItem("v2.0 (Ultimate PRO)", "Grappling Hook, Ghost & Time Dilation", "دمج أدوات اليد (Tools)، التخفي الطيفي لاختراق الحوارص، والتحكم بالزمن.", Color3.fromRGB(0, 255, 128))

print("TRL Master Hub Loaded Successfully!")
