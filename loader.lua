local Fluent = loadstring(game:HttpGet("https://raw.githubusercontent.com/discoart/FluentPlus/refs/heads/main/release.lua"))()
local SaveManager = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local VirtualInputManager = game:GetService("VirtualInputManager")
local HttpService = game:GetService("HttpService")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game.Workspace
local Players = game.Players
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local rootPart = character:WaitForChild("HumanoidRootPart")

-- Janela principal
local Window = Fluent:CreateWindow({
    Title = "Alucard Hub",
    SubTitle = "by alucard",
    TabWidth = 120,
    Size = UDim2.fromOffset(580, 400),
    Acrylic = false,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl
})

local Tabs = {
    Infos = Window:AddTab({ Title = " | Script Infos", Icon = "info" }),
    Setup = Window:AddTab({ Title = "  | Setup", Icon = "banana" }),
    Main = Window:AddTab({ Title = " | Farm", Icon = "swords" }),
    Summon = Window:AddTab({ Title = " | Summon", Icon = "egg" }),
    Raid = Window:AddTab({ Title = " | Gamemodes", Icon = "swords" }),
    Dungeon = Window:AddTab({ Title = " | Gamemodes", Icon = "sword" }),
    Portal = Window:AddTab({ Title = " | Portal", Icon = "target" }),
    Teleport = Window:AddTab({ Title = "| Teleport", Icon = "map-pin" }),
    Roll = Window:AddTab({ Title = "| Roll", Icon = "user" }),
    Settings = Window:AddTab({ Title = "| Settings", Icon = "settings" }),
}

local Options = Fluent.Options

getgenv().Settings = {
    DefaultDelay = 0.5,
    MinDelay = 0.1,
    MaxDelay = 5
}

getgenv().NearestMobsEnabled = false
getgenv().CollectPotionsEnabled = false

local mobFolder = workspace:WaitForChild("Enemy"):WaitForChild("Mob")

local function getNextMob()
	for _, mob in ipairs(mobFolder:GetChildren()) do
		if mob:IsA("Model") and mob:FindFirstChild("HumanoidRootPart") then
			return mob
		end
	end
	return nil
end

local function teleportTo(position)
	rootPart.CFrame = CFrame.new(position + Vector3.new(0, 3, 0))
end

-- Conecta evasiva com base na hitbox
local function connectEvadeOnHitbox(mob)
    local hitbox = mob:FindFirstChild("Hitbox") or mob:FindFirstChildWhichIsA("BasePart")
    if not hitbox then return end

    local connection
    connection = hitbox.Touched:Connect(function(hit)
        if hit:IsDescendantOf(character) then
            local direction = (rootPart.Position - mob.HumanoidRootPart.Position).Unit
            local evadePos = rootPart.Position + direction * 15
            teleportTo(evadePos)
            task.wait(0.5)
        end
    end)

    task.spawn(function()
        while mob.Parent == mobFolder and getgenv().NearestMobsEnabled do
            task.wait()
        end
        if connection then connection:Disconnect() end
    end)
end

-- Função de farm com evasiva por hitbox
local function autoFarm()
	while getgenv().NearestMobsEnabled do
		local mob = getNextMob()
		if mob then
			local mobRoot = mob:WaitForChild("HumanoidRootPart")
			teleportTo(mobRoot.Position)

			connectEvadeOnHitbox(mob)

			while mob.Parent == mobFolder and getgenv().NearestMobsEnabled do
				RunService.RenderStepped:Wait()
			end
		else
			task.wait(0.5)
		end
	end
end

-- Coleta de poções
local function collectPotions()
	local potionFolder = workspace:FindFirstChild("Poition")
	if not potionFolder then return end

	while getgenv().CollectPotionsEnabled do
		for _, potion in ipairs(potionFolder:GetChildren()) do
			if potion:IsA("Model") and potion:FindFirstChild("TouchInterest") then
				if potion:FindFirstChild("PrimaryPart") then
					teleportTo(potion.PrimaryPart.Position)
				elseif potion:FindFirstChildWhichIsA("BasePart") then
					teleportTo(potion:FindFirstChildWhichIsA("BasePart").Position)
				end
				task.wait(0.3)
			end
		end
		task.wait(0.5)
	end
end

-- Toggles na aba Farm
Tabs.Main:AddToggle("NearestMobs", {
    Title = "Nearest Mobs",
    Default = false,
    Callback = function(state)
        getgenv().NearestMobsEnabled = state
        if state then
            task.spawn(autoFarm)
        end
    end
})

Tabs.Main:AddToggle("CollectPotions", {
    Title = "Coletar Potions",
    Default = false,
    Callback = function(state)
        getgenv().CollectPotionsEnabled = state
        if state then
            task.spawn(collectPotions)
        end
    end
})