local Players = game:GetService("Players")
local player = Players.LocalPlayer

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "CodeUnlockGUI"
screenGui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 340, 0, 160)
frame.Position = UDim2.new(0.5, -170, 0.5, -80)
frame.BackgroundColor3 = Color3.fromRGB(18,18,18)
frame.BorderSizePixel = 0
frame.AnchorPoint = Vector2.new(0.5,0.5)
frame.Parent = screenGui
frame.ClipsDescendants = true

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1,0,0,44)
title.Position = UDim2.new(0,0,0,0)
title.BackgroundTransparency = 1
title.Text = "Enter Code"
title.Font = Enum.Font.GothamBold
title.TextSize = 24
title.TextColor3 = Color3.fromRGB(255,255,255)
title.Parent = frame

local inputBox = Instance.new("TextBox")
inputBox.Size = UDim2.new(0.84,0,0,44)
inputBox.Position = UDim2.new(0.08,0,0,50)
inputBox.PlaceholderText = "Code..."
inputBox.ClearTextOnFocus = false
inputBox.Font = Enum.Font.Gotham
inputBox.TextSize = 20
inputBox.TextColor3 = Color3.fromRGB(255,255,255)
inputBox.BackgroundColor3 = Color3.fromRGB(32,32,32)
inputBox.BorderSizePixel = 0
inputBox.Parent = frame

local submitBtn = Instance.new("TextButton")
submitBtn.Size = UDim2.new(0.44,0,0,38)
submitBtn.Position = UDim2.new(0.08,0,0,106)
submitBtn.BackgroundColor3 = Color3.fromRGB(72,137,255)
submitBtn.TextColor3 = Color3.fromRGB(255,255,255)
submitBtn.Font = Enum.Font.GothamBold
submitBtn.TextSize = 18
submitBtn.Text = "Submit"
submitBtn.BorderSizePixel = 0
submitBtn.Parent = frame
submitBtn.AutoButtonColor = true

local cancelBtn = Instance.new("TextButton")
cancelBtn.Size = UDim2.new(0.44,0,0,38)
cancelBtn.Position = UDim2.new(0.48,0,0,106)
cancelBtn.BackgroundColor3 = Color3.fromRGB(50,50,50)
cancelBtn.TextColor3 = Color3.fromRGB(255,255,255)
cancelBtn.Font = Enum.Font.Gotham
cancelBtn.TextSize = 18
cancelBtn.Text = "Close"
cancelBtn.BorderSizePixel = 0
cancelBtn.Parent = frame
cancelBtn.AutoButtonColor = true

local resultLabel = Instance.new("TextLabel")
resultLabel.Size = UDim2.new(1,0,0,22)
resultLabel.Position = UDim2.new(0,0,1,6)
resultLabel.BackgroundTransparency = 1
resultLabel.Text = ""
resultLabel.Font = Enum.Font.Gotham
resultLabel.TextSize = 16
resultLabel.TextColor3 = Color3.fromRGB(0,255,0)
resultLabel.Parent = frame

local function shake(gui)
	local original = gui.Position
	for i = 1,6 do
		local offset = (i%2==0) and 6 or -6
		gui.Position = UDim2.new(original.X.Scale, original.X.Offset + offset, original.Y.Scale, original.Y.Offset)
		wait(0.02)
	end
	gui.Position = original
end

submitBtn.MouseButton1Click:Connect(function()
	if inputBox.Text == "123" then
		resultLabel.TextColor3 = Color3.fromRGB(0,255,0)
		resultLabel.Text = "Unlocked!"
		inputBox.Text = ""
		screenGui.Enabled = false
	else
		resultLabel.TextColor3 = Color3.fromRGB(255,0,0)
		resultLabel.Text = "Wrong code!"
		inputBox.Text = ""
		spawn(function() shake(frame) end)
	end
end)

cancelBtn.MouseButton1Click:Connect(function()
	screenGui:Destroy()
end)
