-- Supprimer l'ancien GUI s'il existe
local player = game:GetService("Players").LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local oldGui = playerGui:FindFirstChild("AutoDungeonUI")
if oldGui then oldGui:Destroy() end

-- Création de l'interface
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "AutoDungeonUI"
screenGui.Parent = playerGui
screenGui.ResetOnSpawn = false

-- Frame principale
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 300, 0, 200)
mainFrame.Position = UDim2.new(0.05, 0, 0.2, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = screenGui

-- Titre
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -40, 0, 30)
title.Position = UDim2.new(0, 10, 0, 5)
title.BackgroundTransparency = 1
title.Text = "Auto Dungeon"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.SourceSansBold
title.TextSize = 20
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = mainFrame

-- Bouton réduire (le petit carré)
local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(0, 25, 0, 25)
toggleButton.Position = UDim2.new(1, -30, 0, 5)
toggleButton.Text = "🔳"
toggleButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.Font = Enum.Font.SourceSans
toggleButton.TextSize = 20
toggleButton.Parent = mainFrame

-- Contenu du GUI (cadre interne)
local contentFrame = Instance.new("Frame")
contentFrame.Size = UDim2.new(1, -20, 1, -50)
contentFrame.Position = UDim2.new(0, 10, 0, 40)
contentFrame.BackgroundTransparency = 1
contentFrame.Name = "ContentFrame"
contentFrame.Parent = mainFrame

-- Bouton "Lancer Donjon"
local startButton = Instance.new("TextButton")
startButton.Size = UDim2.new(1, 0, 0, 40)
startButton.Position = UDim2.new(0, 0, 0, 0)
startButton.Text = "Lancer Donjon"
startButton.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
startButton.TextColor3 = Color3.fromRGB(255, 255, 255)
startButton.Font = Enum.Font.SourceSansBold
startButton.TextSize = 18
startButton.Parent = contentFrame

-- Toggle réduction
local isMinimized = false
toggleButton.MouseButton1Click:Connect(function()
	isMinimized = not isMinimized
	contentFrame.Visible = not isMinimized
	if isMinimized then
		mainFrame.Size = UDim2.new(0, 100, 0, 40)
		toggleButton.Position = UDim2.new(1, -30, 0, 5)
		title.Visible = false
	else
		mainFrame.Size = UDim2.new(0, 300, 0, 200)
		toggleButton.Position = UDim2.new(1, -30, 0, 5)
		title.Visible = true
	end
end)

-- Placeholder pour "Lancer Donjon"
startButton.MouseButton1Click:Connect(function()
	print("Tentative de lancement du donjon...")
	-- Ici on mettra les clics automatisés pour créer et lancer le donjon
end)
