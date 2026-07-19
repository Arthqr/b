local plr = game:GetService("Players").LocalPlayer
local rs = game:GetService("ReplicatedStorage")

local r1 = rs:WaitForChild("2Wz"):WaitForChild("ac659094-8b11-4064-b9b7-b81cdbe6a9b3")
local r2 = rs:WaitForChild("2Wz"):WaitForChild("e0068d51-9429-49ed-8452-6bd436293530")

local mt = getrawmetatable(r1)
setreadonly(mt, false)
local old = mt.__namecall

mt.__namecall = function(self, ...)
	if (self == r1 or self == r2) and getnamecallmethod() == "FireServer" then
		local hum = plr.Character and plr.Character:FindFirstChildOfClass("Humanoid")
		local veh = hum and hum.SeatPart and hum.SeatPart:FindFirstAncestor("Vehicles")
		if veh and select(1, ...) == veh then return end
	end
	return old(self, ...)
end

task.wait(0.5)
loadstring(game:HttpGet("https://api.getvortex.vip/scripts/VortexMain"))()
