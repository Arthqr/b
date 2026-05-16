loadstring(game:HttpGet("https://api.getvortex.vip/scripts/VortexMain"))()
task.wait(3)

local plr = game:GetService("Players").LocalPlayer
local rs = game:GetService("ReplicatedStorage")

local r1 = rs:WaitForChild("GpP"):WaitForChild("d502bb53-208f-40ad-ba58-27f59d357f37")
local r2 = rs:WaitForChild("GpP"):WaitForChild("2800de1a-2381-4d56-8106-04d5aabcc7f4")

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