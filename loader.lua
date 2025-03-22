local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "Alucard Hub | Evo Tycoon",
   Icon = 17091459839,
   LoadingTitle = "Alucard Hub",
   LoadingSubtitle = "By Alucard",
   Theme = "Amethyst"
})

local Tab = Window:CreateTab("Auto Farm", 4483362458) -- Title, Image

local Toggle = Tab:CreateToggle({
    Name = "Auto click",
    CurrentValue = false,
    Flag = "Toggle",
    Callback = function(Value)
        _G.AutoClick = Value  -- Atualiza o estado do AutoClick com o Toggle
    end,
})

Toggle:Set(false)  -- Inicializa o Toggle como falso

spawn(function()
    while true do
        if _G.AutoClick then
            local args = {
                [1] = {
                    [1] = "Grind",
                    [2] = workspace.Server.Mobs.Zaruto:FindFirstChild("C91A7CCB-7E52-4089-B8BE-848402C63B8D")
                }
            }

            game:GetService("ReplicatedStorage").Remotes.Server:FireServer(unpack(args))
        end
        wait() -- Evita sobrecarregar o jogo
    end
end)

local Section = Tab:CreateSection("Section Example")

Section:Set("Section Example")

local Toggle = Tab:CreatToggle({
  Name = "Auto Egg",
  CurrentValue = false,
  Flag = "Toggle1",
  Callback = function(Value)
    _G.AutoEgg = Value 
    end,
})
Toggle:Set(false)

spawn(function)()
  while true do 
    if _G.AutoEgg then 
      local args = {
    [1] = {
        [1] = "TierBuy",
        [2] = workspace.Client.Maps.Zaruto.Interact.Tier,
        [3] = "E",
        [4] = {}
    }
}
end

game:GetService("ReplicatedStorage").Remotes.Server:FireServer(unpack(args))
wait()
  end 
end)




local Divider = Tab:CreateDivider()

Divider:Set(false) -- Whether the divider's visibility is to be set to true or false.
Rayfield:Destroy()
