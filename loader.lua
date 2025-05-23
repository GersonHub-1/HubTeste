local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "Alucard Hub | Evo Tycoon",
   Icon = 17091459839,
   LoadingTitle = "Alucard Hub",
   LoadingSubtitle = "By Alucard",
   Theme = "Amethyst"
})
--Tabs
local MainTab = Window:CreateTab("Main Farm", 17091459839)

-- Variáveis de controle
local autoClickEnabled = false
local autoEggEnabled = false
local autoCollectEnabled = false

-- Auto Click
MainTab:CreateToggle({
   Name = "Auto Click",
   CurrentValue = false,
   Callback = function(Value)
      autoClickEnabled = Value

      task.spawn(function()
         while autoClickEnabled do
            local function getClosestPart()
                local closestPart = nil
                local shortestDistance = math.huge
                local playerPos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position

                for _, part in pairs(workspace.Server.Mobs:GetDescendants()) do
                    if part:IsA("Part") then
                        local distance = (part.Position - playerPos).Magnitude
                        if distance < shortestDistance then
                            shortestDistance = distance
                            closestPart = part
                        end
                    end
                end

                return closestPart
            end

            local closest = getClosestPart()
            if closest then
                local args = {
                    [1] = {
                        [1] = "Click"
                    },
                    [2] = {
                        [1] = "Mob",
                        [2] = closest
                    }
                }
                game:GetService("ReplicatedStorage").Remotes.Server:FireServer(unpack(args))
            end
            wait()
         end
      end)
   end,
})

-- Auto Egg
MainTab:CreateToggle({
   Name = "Auto Egg",
   CurrentValue = false,
   Callback = function(Value)
      autoEggEnabled = Value

      task.spawn(function()
         while autoEggEnabled do
            local args = {
                [1] = {
                    [1] = "BuyTier",
                    [2] = workspace.Client:FindFirstChild("Summon Stars"):FindFirstChild("Demon Slayer"):FindFirstChild("Basic Tier"),
                    [3] = "E",
                    [4] = "Demon Slayer"
                }
            }
            game:GetService("ReplicatedStorage").Remotes.Server:FireServer(unpack(args))
            wait()
         end
      end)
   end,
})

-- Auto Collect
MainTab:CreateToggle({
   Name = "Auto Collect",
   CurrentValue = false,
   Callback = function(Value)
      autoCollectEnabled = Value

      if autoCollectEnabled then
         local player = game.Players.LocalPlayer
         local character = player.Character or player.CharacterAdded:Wait()
         local debrisFolder = workspace:WaitForChild("Debris")
         local runService = game:GetService("RunService")

         local function moveToCharacter(obj)
            local connection
            connection = runService.Heartbeat:Connect(function()
               if obj and obj.Parent and character and character:FindFirstChild("HumanoidRootPart") then
                  local targetPos = character.HumanoidRootPart.Position
                  local direction = (targetPos - obj.Position).Unit
                  local speed = 10
                  obj.Velocity = direction * speed
               else
                  connection:Disconnect()
               end
            end)
         end

         -- Objetos já existentes
         for _, obj in ipairs(debrisFolder:GetChildren()) do
            if obj:IsA("BasePart") then
               moveToCharacter(obj)
            end
         end

         -- Novos objetos
         debrisFolder.ChildAdded:Connect(function(obj)
            if obj:IsA("BasePart") then
               moveToCharacter(obj)
            end
         end)
      end
   end,
})