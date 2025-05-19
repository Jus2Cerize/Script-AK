-- ⚠️ Si tu modifies le script, ne touche pas à la section [UI] pour garder l’interface !

-- ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
-- ▶ UI : Interface utilisateur
-- ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))

local frame = Instance.new("Frame", gui)
frame.Position = UDim2.new(0.2, 0, 0.2, 0)
frame.Size = UDim2.new(0, 250, 0, 180)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.Name = "MainUI"
frame.Active = true
frame.Draggable = true

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 30)
title.Text = "Auto Dungeon"
title.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.SourceSansBold
title.TextSize = 18

local toggle = Instance.new("TextButton", frame)
toggle.Size = UDim2.new(0, 20, 0, 20)
toggle.Position = UDim2.new(1, -25, 0, 5)
toggle.Text = "-"
toggle.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
toggle.Font = Enum.Font.SourceSans
toggle.TextSize = 14

local content = Instance.new("Frame", frame)
content.Position = UDim2.new(0, 0, 0, 30)
content.Size = UDim2.new(1, 0, 1, -30)
content.BackgroundTransparency = 1

local difficultyLabel = Instance.new("TextLabel", content)
difficultyLabel.Size = UDim2.new(0, 200, 0, 20)
difficultyLabel.Position = UDim2.new(0, 10, 0, 10)
difficultyLabel.Text = "Difficulté :"
difficultyLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
difficultyLabel.BackgroundTransparency = 1

local dropdown = Instance.new("TextButton", content)
dropdown.Size = UDim2.new(0, 200, 0, 30)
dropdown.Position = UDim2.new(0, 10, 0, 35)
dropdown.Text = "Easy"
dropdown.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
dropdown.TextColor3 = Color3.fromRGB(255, 255, 255)
dropdown.Font = Enum.Font.SourceSansBold
dropdown.TextSize = 16

local startButton = Instance.new("TextButton", content)
startButton.Size = UDim2.new(0, 200, 0, 40)
startButton.Position = UDim2.new(0, 10, 0, 75)
startButton.Text = "Lancer Donjon"
startButton.BackgroundColor3 = Color3.fromRGB(0, 180, 0)
startButton.TextColor3 = Color3.fromRGB(255, 255, 255)
startButton.Font = Enum.Font.SourceSansBold
startButton.TextSize = 18

local message = Instance.new("TextLabel", content)
message.Size = UDim2.new(1, -20, 0, 30)
message.Position = UDim2.new(0, 10, 1, -35)
message.Text = ""
message.TextColor3 = Color3.fromRGB(255, 0, 0)
message.BackgroundTransparency = 1
message.TextScaled = true
message.Visible = false

-- Collapse/reopen behavior
local collapsed = false
toggle.MouseButton1Click:Connect(function()
    collapsed = not collapsed
    content.Visible = not collapsed
    toggle.Text = collapsed and "+" or "-"
end)

-- ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
-- ▶ AutoDungeon : Lancement automatique toutes les 30s
-- ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
local function tryLaunchDungeon()
    local slot = player.PlayerGui._CENTER.DungeonList.Content:FindFirstChild("Slot")
    if not slot or not slot.Visible then
        message.Text = "Impossible de créer pour le moment"
        message.Visible = true
        return
    end
    message.Visible = false

    slot:Activate()
    task.wait(0.3)

    local map = player.PlayerGui._CENTER.Dungeon.Content.Maps.Scroll:FindFirstChild("RuinedPrison")
    if map then map:Activate() end
    task.wait(0.3)

    local diff = dropdown.Text or "Easy"
    local diffButton = player.PlayerGui._CENTER.Dungeon.Content.Config.Diffs:FindFirstChild(diff)
    if diffButton then diffButton:Activate() end
    task.wait(0.3)

    local start = player.PlayerGui._CENTER.Dungeon.Content:FindFirstChild("Start")
    if start then start:Activate() end
end

startButton.MouseButton1Click:Connect(function()
    tryLaunchDungeon()
end)

-- Auto relance toutes les 30s
task.spawn(function()
    while true do
        task.wait(30)
        tryLaunchDungeon()
    end
end)
