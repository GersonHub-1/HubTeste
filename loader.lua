

local codes = {
    "CHEMREACTION!",
    "OTOYA!!"
}

for _, code in ipairs(codes) do
    game:GetService("ReplicatedStorage").Packages.Knit.Services.CodesService.RF.Redeem:InvokeServer(code)
end


loadstring(game:HttpGet("https://raw.githubusercontent.com/Zayn31214/name/refs/heads/main/SterlingNew"))()
