
-- Function to create a Box around a player
local function createESPBox(player)
    local character = player.Character
    if not character then return end

    -- Create the Box
    local espBox = Instance.new("BoxHandleAdornment")
    espBox.Name = "ESPBox"
    espBox.Adornee = character
    espBox.Size = character:GetExtentsSize()
    espBox.Color3 = Color3.fromRGB(255, 0, 0)  -- Red color
    espBox.Transparency = 0.5
    espBox.AlwaysOnTop = true
    espBox.ZIndex = 5
    espBox.Parent = character

    -- Update the Box size when the character size changes
    character:GetPropertyChangedSignal("Size"):Connect(function()
        espBox.Size = character:GetExtentsSize()
    end)
end

-- Add ESP box to all existing players
for _, player in pairs(game.Players:GetPlayers()) do
    createESPBox(player)
end

-- Add ESP box to new players
game.Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function()
        createESPBox(player)
    end)
end)
