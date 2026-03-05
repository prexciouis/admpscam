-- // Itzia GUI Script

local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local TopBar = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local Subtitle = Instance.new("TextLabel")
local CloseBtn = Instance.new("TextButton")
local Divider = Instance.new("Frame")
local ScrollFrame = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")

-- Decorations
local Flower1 = Instance.new("TextLabel")
local Flower2 = Instance.new("TextLabel")

-- Buttons
local BypassBtn = Instance.new("TextButton")
local AutoTradeBtn = Instance.new("TextButton")
local AutoTradeLabel = Instance.new("TextLabel")
local FarmBtn = Instance.new("TextButton")
local FarmLabel = Instance.new("TextLabel")
local SpeedBtn = Instance.new("TextButton")
local SpeedLabel = Instance.new("TextLabel")
local AntiAFKBtn = Instance.new("TextButton")
local AntiAFKLabel = Instance.new("TextLabel")

-- Loading Screen
local LoadingFrame = Instance.new("Frame")
local LoadingTitle = Instance.new("TextLabel")
local LoadingBar = Instance.new("Frame")
local LoadingFill = Instance.new("Frame")
local LoadingText = Instance.new("TextLabel")
local LoadingFlower = Instance.new("TextLabel")

-- UICorners
local function addCorner(obj, radius)
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, radius or 12)
    c.Parent = obj
end

local function addStroke(obj, color, thickness)
    local s = Instance.new("UIStroke")
    s.Color = color or Color3.fromRGB(255, 182, 213)
    s.Thickness = thickness or 1.5
    s.Parent = obj
end

-- // Setup ScreenGui
ScreenGui.Name = "ItziaGUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- // LOADING SCREEN
LoadingFrame.Name = "LoadingFrame"
LoadingFrame.Size = UDim2.new(0, 300, 0, 200)
LoadingFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
LoadingFrame.BackgroundColor3 = Color3.fromRGB(255, 240, 248)
LoadingFrame.BorderSizePixel = 0
LoadingFrame.Parent = ScreenGui
addCorner(LoadingFrame, 20)
addStroke(LoadingFrame, Color3.fromRGB(255, 182, 213), 2)

LoadingFlower.Text = "🌸✨🌸"
LoadingFlower.Size = UDim2.new(1, 0, 0, 40)
LoadingFlower.Position = UDim2.new(0, 0, 0, 15)
LoadingFlower.BackgroundTransparency = 1
LoadingFlower.TextColor3 = Color3.fromRGB(255, 105, 180)
LoadingFlower.TextScaled = true
LoadingFlower.Font = Enum.Font.GothamBold
LoadingFlower.Parent = LoadingFrame

LoadingTitle.Text = "itzia"
LoadingTitle.Size = UDim2.new(1, 0, 0, 45)
LoadingTitle.Position = UDim2.new(0, 0, 0, 55)
LoadingTitle.BackgroundTransparency = 1
LoadingTitle.TextColor3 = Color3.fromRGB(219, 112, 147)
LoadingTitle.TextScaled = true
LoadingTitle.Font = Enum.Font.GothamBold
LoadingTitle.Parent = LoadingFrame

LoadingText.Text = "loading cute stuff..."
LoadingText.Size = UDim2.new(1, 0, 0, 25)
LoadingText.Position = UDim2.new(0, 0, 0, 103)
LoadingText.BackgroundTransparency = 1
LoadingText.TextColor3 = Color3.fromRGB(200, 120, 160)
LoadingText.TextScaled = true
LoadingText.Font = Enum.Font.Gotham
LoadingText.Parent = LoadingFrame

LoadingBar.Size = UDim2.new(0, 240, 0, 14)
LoadingBar.Position = UDim2.new(0.5, -120, 0, 140)
LoadingBar.BackgroundColor3 = Color3.fromRGB(255, 214, 232)
LoadingBar.BorderSizePixel = 0
LoadingBar.Parent = LoadingFrame
addCorner(LoadingBar, 8)

LoadingFill.Size = UDim2.new(0, 0, 1, 0)
LoadingFill.BackgroundColor3 = Color3.fromRGB(255, 105, 180)
LoadingFill.BorderSizePixel = 0
LoadingFill.Parent = LoadingBar
addCorner(LoadingFill, 8)

-- // Animate loading bar
local function playLoading()
    local tween = game:GetService("TweenService"):Create(
        LoadingFill,
        TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {Size = UDim2.new(1, 0, 1, 0)}
    )
    tween:Play()
    tween.Completed:Connect(function()
        wait(0.3)
        LoadingFrame.Visible = false
        MainFrame.Visible = true
    end)
end

-- // MAIN FRAME
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 310, 0, 380)
MainFrame.Position = UDim2.new(0.5, -155, 0.5, -190)
MainFrame.BackgroundColor3 = Color3.fromRGB(255, 240, 248)
MainFrame.BorderSizePixel = 0
MainFrame.Visible = false
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui
addCorner(MainFrame, 18)
addStroke(MainFrame, Color3.fromRGB(255, 182, 213), 2)

-- // Drop shadow effect (fake)
local Shadow = Instance.new("ImageLabel")
Shadow.Size = UDim2.new(1, 30, 1, 30)
Shadow.Position = UDim2.new(0, -15, 0, -10)
Shadow.BackgroundTransparency = 1
Shadow.Image = "rbxassetid://1316045217"
Shadow.ImageColor3 = Color3.fromRGB(255, 150, 190)
Shadow.ImageTransparency = 0.7
Shadow.ScaleType = Enum.ScaleType.Slice
Shadow.SliceCenter = Rect.new(10, 10, 118, 118)
Shadow.ZIndex = 0
Shadow.Parent = MainFrame

-- // TOP BAR
TopBar.Size = UDim2.new(1, 0, 0, 65)
TopBar.BackgroundColor3 = Color3.fromRGB(255, 182, 213)
TopBar.BorderSizePixel = 0
TopBar.Parent = MainFrame
addCorner(TopBar, 18)

-- Fix bottom corners of topbar
local TopBarFix = Instance.new("Frame")
TopBarFix.Size = UDim2.new(1, 0, 0.5, 0)
TopBarFix.Position = UDim2.new(0, 0, 0.5, 0)
TopBarFix.BackgroundColor3 = Color3.fromRGB(255, 182, 213)
TopBarFix.BorderSizePixel = 0
TopBarFix.Parent = TopBar

Flower1.Text = "🌸"
Flower1.Size = UDim2.new(0, 30, 0, 30)
Flower1.Position = UDim2.new(0, 8, 0.5, -15)
Flower1.BackgroundTransparency = 1
Flower1.TextScaled = true
Flower1.Parent = TopBar

Flower2.Text = "🌸"
Flower2.Size = UDim2.new(0, 30, 0, 30)
Flower2.Position = UDim2.new(1, -45, 0.5, -15)
Flower2.BackgroundTransparency = 1
Flower2.TextScaled = true
Flower2.Parent = TopBar

Title.Text = "itzia"
Title.Size = UDim2.new(1, -80, 0, 32)
Title.Position = UDim2.new(0, 40, 0, 6)
Title.BackgroundTransparency = 1
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextScaled = true
Title.Font = Enum.Font.GothamBold
Title.Parent = TopBar

Subtitle.Text = "by shxdrag ✨"
Subtitle.Size = UDim2.new(1, -80, 0, 20)
Subtitle.Position = UDim2.new(0, 40, 0, 38)
Subtitle.BackgroundTransparency = 1
Subtitle.TextColor3 = Color3.fromRGB(255, 240, 248)
Subtitle.TextScaled = true
Subtitle.Font = Enum.Font.Gotham
Subtitle.Parent = TopBar

-- // CLOSE BUTTON
CloseBtn.Text = "✕"
CloseBtn.Size = UDim2.new(0, 28, 0, 28)
CloseBtn.Position = UDim2.new(1, -36, 0, 6)
CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.TextColor3 = Color3.fromRGB(255, 105, 180)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextScaled = true
CloseBtn.BorderSizePixel = 0
CloseBtn.ZIndex = 5
CloseBtn.Parent = TopBar
addCorner(CloseBtn, 8)

CloseBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
end)

-- // DIVIDER
Divider.Size = UDim2.new(0.85, 0, 0, 2)
Divider.Position = UDim2.new(0.075, 0, 0, 73)
Divider.BackgroundColor3 = Color3.fromRGB(255, 214, 232)
Divider.BorderSizePixel = 0
Divider.Parent = MainFrame

-- // SCROLL FRAME
ScrollFrame.Size = UDim2.new(1, -20, 1, -90)
ScrollFrame.Position = UDim2.new(0, 10, 0, 80)
ScrollFrame.BackgroundTransparency = 1
ScrollFrame.BorderSizePixel = 0
ScrollFrame.ScrollBarThickness = 4
ScrollFrame.ScrollBarImageColor3 = Color3.fromRGB(255, 182, 213)
ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, 280)
ScrollFrame.Parent = MainFrame

UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 10)
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.Parent = ScrollFrame

-- // Helper: make a toggle row
local function makeToggle(parent, labelText, order)
    local Row = Instance.new("Frame")
    Row.Size = UDim2.new(0, 265, 0, 48)
    Row.BackgroundColor3 = Color3.fromRGB(255, 228, 240)
    Row.BorderSizePixel = 0
    Row.LayoutOrder = order
    Row.Parent = parent
    addCorner(Row, 12)
    addStroke(Row, Color3.fromRGB(255, 182, 213), 1.2)

    local Lbl = Instance.new("TextLabel")
    Lbl.Text = labelText
    Lbl.Size = UDim2.new(0.62, 0, 1, 0)
    Lbl.Position = UDim2.new(0, 12, 0, 0)
    Lbl.BackgroundTransparency = 1
    Lbl.TextColor3 = Color3.fromRGB(180, 80, 120)
    Lbl.TextScaled = true
    Lbl.Font = Enum.Font.GothamBold
    Lbl.TextXAlignment = Enum.TextXAlignment.Left
    Lbl.Parent = Row

    local ToggleTrack = Instance.new("Frame")
    ToggleTrack.Size = UDim2.new(0, 52, 0, 26)
    ToggleTrack.Position = UDim2.new(1, -62, 0.5, -13)
    ToggleTrack.BackgroundColor3 = Color3.fromRGB(220, 180, 200)
    ToggleTrack.BorderSizePixel = 0
    ToggleTrack.Parent = Row
    addCorner(ToggleTrack, 13)

    local ToggleKnob = Instance.new("Frame")
    ToggleKnob.Size = UDim2.new(0, 20, 0, 20)
    ToggleKnob.Position = UDim2.new(0, 3, 0.5, -10)
    ToggleKnob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ToggleKnob.BorderSizePixel = 0
    ToggleKnob.Parent = ToggleTrack
    addCorner(ToggleKnob, 10)

    local toggled = false
    local ts = game:GetService("TweenService")

    ToggleTrack.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            toggled = not toggled
            if toggled then
                ts:Create(ToggleTrack, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(255, 105, 180)}):Play()
                ts:Create(ToggleKnob, TweenInfo.new(0.2), {Position = UDim2.new(0, 29, 0.5, -10)}):Play()
            else
                ts:Create(ToggleTrack, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(220, 180, 200)}):Play()
                ts:Create(ToggleKnob, TweenInfo.new(0.2), {Position = UDim2.new(0, 3, 0.5, -10)}):Play()
            end
        end
    end)

    return Row, toggled
end

-- // Helper: make a regular button
local function makeButton(parent, btnText, color, order)
    local Btn = Instance.new("TextButton")
    Btn.Text = btnText
    Btn.Size = UDim2.new(0, 265, 0, 44)
    Btn.BackgroundColor3 = color or Color3.fromRGB(255, 182, 213)
    Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    Btn.Font = Enum.Font.GothamBold
    Btn.TextScaled = true
    Btn.BorderSizePixel = 0
    Btn.LayoutOrder = order
    Btn.Parent = parent
    addCorner(Btn, 12)
    addStroke(Btn, Color3.fromRGB(255, 255, 255), 1)

    -- Hover effect
    local ts = game:GetService("TweenService")
    Btn.MouseEnter:Connect(function()
        ts:Create(Btn, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(255, 130, 190)}):Play()
    end)
    Btn.MouseLeave:Connect(function()
        ts:Create(Btn, TweenInfo.new(0.15), {BackgroundColor3 = color or Color3.fromRGB(255, 182, 213)}):Play()
    end)

    return Btn
end

-- // Add padding at top of list
local Pad = Instance.new("Frame")
Pad.Size = UDim2.new(0, 265, 0, 2)
Pad.BackgroundTransparency = 1
Pad.LayoutOrder = 0
Pad.Parent = ScrollFrame

-- // BYPASS BUTTON
local bypass = makeButton(ScrollFrame, "🔓  bypass", Color3.fromRGB(219, 112, 147), 1)
bypass.MouseButton1Click:Connect(function()
    bypass.Text = "✨ bypassed!"
    wait(1.5)
    bypass.Text = "🔓  bypass"
end)

-- // TOGGLES
makeToggle(ScrollFrame, "🌸  auto trade", 2)
makeToggle(ScrollFrame, "🍓  auto farm", 3)
makeToggle(ScrollFrame, "⚡  speed hack", 4)
makeToggle(ScrollFrame, "💤  anti-afk", 5)

-- // ESP BUTTON
local esp = makeButton(ScrollFrame, "👁️  esp toggle", Color3.fromRGB(204, 102, 153), 6)
local espOn = false
esp.MouseButton1Click:Connect(function()
    espOn = not espOn
    esp.Text = espOn and "👁️  esp: on ✨" or "👁️  esp toggle"
end)

-- // Bottom padding
local Pad2 = Instance.new("Frame")
Pad2.Size = UDim2.new(0, 265, 0, 6)
Pad2.BackgroundTransparency = 1
Pad2.LayoutOrder = 10
Pad2.Parent = ScrollFrame

-- // Play loading then show GUI
playLoading()