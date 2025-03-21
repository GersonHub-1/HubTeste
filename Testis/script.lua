local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

-- Definição dos CFrames para os locais de farm
local cframe1 = CFrame.new(-111.889557, 8.59891033, 602.983643, -0.841278911, 0.0240386184, 0.540066719, -6.49762413e-08, 0.999010861, -0.0444665365, -0.540601492, -0.0374087878, -0.840446651)
local cframe2 = CFrame.new(-125.865211, 8.60136127, 624.283142, 0.161213011, 0.0425012782, 0.986004055, 6.03235639e-09, 0.999072313, -0.0430645794, -0.986919701, 0.0069425758, 0.161063448)

-- Alterna entre os dois CFrames
local currentCFrame = cframe1

-- Função para teleportar
local function teleportTo(cframe)
    humanoidRootPart.CFrame = cframe
end

-- Função para monitorar e detectar inimigos derrotados
local function monitorarInimigos()
    local inimigosDerrotados = false

    while true do
        wait(1) -- Aguarda 1 segundo entre cada verificação

        -- Verifica se há inimigos no local
        for _, v in pairs(workspace:GetChildren()) do
            if v:IsA("Model") and v:FindFirstChild("Humanoid") then
                local humanoid = v.Humanoid
                
                -- Se o inimigo estiver morto (saúde <= 0), teleporta
                if humanoid.Health <= 0 then
                    inimigosDerrotados = true
                    break -- Encerra o loop após detectar um inimigo derrotado
                end
            end
        end

        -- Se um inimigo foi derrotado, teleporta para o próximo CFrame
        if inimigosDerrotados then
            if currentCFrame == cframe1 then
                currentCFrame = cframe2
            else
                currentCFrame = cframe1
            end
            teleportTo(currentCFrame)
            inimigosDerrotados = false -- Reseta o estado para aguardar a derrota do próximo inimigo
        end
    end
end

-- Inicia o monitoramento dos inimigos
monitorarInimigos()