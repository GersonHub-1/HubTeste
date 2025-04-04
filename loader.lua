local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Alucard Hub | Evo Tycoon",
    Icon = 17091459839,
    LoadingTitle = "Alucard Hub",
    LoadingSubtitle = "By Alucard",
    Theme = "Amethyst"
})

local Tab = Window:CreateTab("Auto Farm", 4483362458)

_G.AutoEgg = false
_G.AutoClick = false

local ToggleEgg = Tab:CreateToggle({
    Name = "Auto Egg",
    CurrentValue = false,
    Callback = function(Value)
        _G.AutoEgg = Value
        while _G.AutoEgg do 
            wait()

local args = {
    [1] = {
        ["drawCardPlatformId"] = 70001,
        ["count"] = 2
    }
}

game:GetService("ReplicatedStorage").Remotes.ExtractHero:InvokeServer(unpack(args))

        end
    end
})

local ToggleClick = Tab:CreateToggle({
    Name = "Auto Fuse",
    CurrentValue = false,
    Callback = function(Value)
        _G.AutoFuse = Value
        while _G.AutoFuse do 
            wait()

local args = {
    [1] = {
        ["mainHeroGuid"] = "cc006cb4-423a-4278-86fb-c588087ecf1b",
        ["decomposeHeroGuids"] = {
            [1] = "5b8c8f50-30b0-406f-bda1-1076c6b125a1",
            [2] = "c94307ff-81d3-4ce8-a2db-ed0bc9e8a23f",
            [3] = "bce5542d-9be9-4649-adf6-3a7a8a697377",
            [4] = "988e0f7d-e624-4b55-821c-ab749d25ffcb",
            [5] = "69239a4f-08b2-4377-977f-846925692257",
            [6] = "fba04107-78ef-4a93-87f6-adcf635552ae",
            [7] = "f99316d6-275f-4f12-9f4c-eece1d9830b6",
            [8] = "f5677103-8f26-4628-a86f-6d177df3e292",
            [9] = "e446c554-d74e-4529-b26c-9ac32686f38e",
            [10] = "c565dac9-7691-407b-96dd-043c3472afcc",
            [11] = "b8c5c27b-11fd-4d4e-9e04-a357c5fde8ad",
            [12] = "a693a255-2d25-444b-a39a-abce34996222",
            [13] = "8ebfbf58-6101-436c-9431-bb0eee34888c",
            [14] = "822e7d53-b287-4875-8e3b-75d86e5996a9",
            [15] = "7344f56f-b93f-4f84-ae42-2ade3e134cda",
            [16] = "6b4e5868-e2d7-492f-96a8-2a2d3753d3ec",
            [17] = "6158376d-49a6-45b5-925f-3f6523218d11",
            [18] = "59fb41eb-80e1-430c-9a8a-1f0ff1d4a654",
            [19] = "4a2c40f6-a2e9-4e8f-9fd9-98307a38eb83",
            [20] = "375f281e-506b-4e2b-9bc5-5920a00132c8",
            [21] = "216a9ab5-2eee-4432-9b41-4014e6ea7a43",
            [22] = "1154c304-3b39-4582-8f0b-9a9f9ec6cada",
            [23] = "0f1fdc5d-2b24-4059-a651-05b7cd086b95",
            [24] = "0ad747aa-d346-4edc-bb5b-2c440107e4d3",
            [25] = "09bb40d8-b2a6-43d6-a5a4-abcd2fa837ab",
            [26] = "08f688cb-e0f3-447c-8c0c-e4c7f75e80c3",
            [27] = "071bdebe-0a6f-44b6-be97-79b1f96189cc",
            [28] = "f08c2975-410e-483c-a048-86479966ac9e",
            [29] = "d002da4f-fccd-48b2-8d15-323f64e48ce2",
            [30] = "c9f47ab1-8760-4162-84e7-3a9eb31d507a",
            [31] = "b10f98c4-314b-4689-ac18-00aa13dcb06b",
            [32] = "b0dbbafa-7e9f-4150-b469-98ff64d1f380",
            [33] = "ace28072-8b84-43f8-ae54-6c2d717ed73d",
            [34] = "ac062978-26c9-4ef6-b5da-fc8ea252f08e",
            [35] = "a98890b5-ed70-4ee6-a85a-769ba7a90c97",
            [36] = "a89a1d7a-615e-4516-8b2c-5736ee146c64",
            [37] = "9dc97342-aaec-4ca2-91e6-570050ae66a6",
            [38] = "9185552e-e211-4d7a-8ef4-9756b4389428",
            [39] = "8ff6d207-044a-4035-b4ba-a5d424e0b137",
            [40] = "8b9b63b3-f507-4413-82a6-d7ea86aea560",
            [41] = "89fd6269-840c-45ca-98ed-479d2f0723b4",
            [42] = "7846b79f-1514-4b32-9da5-7049579e6cf2",
            [43] = "60cf33dd-623b-438f-8354-9816a6f5668e",
            [44] = "5ee2a6fa-b7dd-45c5-b56d-3f5b611ef406",
            [45] = "5c79e7a9-d2a8-42d5-ac9a-5d6444b621ad",
            [46] = "54f15c68-4e7e-4be1-b805-6356ef2154d2",
            [47] = "505b7ea5-132d-4e16-8912-32ebbebebc9a",
            [48] = "4fcb015f-7db0-4ed2-b97c-10a4c5537689",
            [49] = "4f577129-6013-4fce-8874-d714875019c5",
            [50] = "4b301896-3d8a-4fd0-850a-2b69ba908ac4",
            [51] = "3cc4f7b9-4ad0-4347-9f3e-375ad3a862e9",
            [52] = "3311cd8c-7df4-478c-88a5-22b0d7b5666c",
            [53] = "30e96a72-7de0-480c-822e-897ea3267752",
            [54] = "2c9b1635-756f-47f0-a214-2ecd4049f78f",
            [55] = "2993157d-d0a6-484d-9f9d-b915fc849b9d",
            [56] = "23bff8b0-b8ff-4704-bb04-5bdae8942c49",
            [57] = "111f82f6-9187-4758-9b96-b22cd4ecfcdb",
            [58] = "0d8cbbcf-f7cc-4cdc-9024-7bbd8b399769",
            [59] = "0cbf87e5-d32e-4b82-9bc0-a4add7928056"
        }
    }
}

game:GetService("ReplicatedStorage").Remotes.HeroFuse:FireServer(unpack(args))
        end
    end
})
