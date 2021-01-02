game["Run Service"].RenderStepped:connect(function()
    settings().Physics.PhysicsEnvironmentalThrottle = Enum.EnviromentalPhysicsThrottle.Disabled
    settings().Physics.AllowSleep = false
    setsimulationradius(math.huge*math.huge,math.huge*math.huge)
end)

spawn(function()
while true do
settings().Physics.AllowSleep = false
game:GetService("Players").LocalPlayer.ReplicationFocus = workspace
sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", 1/0)
sethiddenproperty(game.Players.LocalPlayer, "MaximumSimulationRadius", 1/0)
setsimulationradius(1/0)
game:GetService("RunService").Heartbeat:wait()
end
end)

game["Run Service"].RenderStepped:connect(function()
    settings().Physics.AllowSleep = false
    setsimulationradius(math.huge*math.huge,math.huge*math.huge)
end)
local Network = coroutine.create(function()
while true do
game:GetService("RunService").Heartbeat:Wait()
settings().Physics.AllowSleep = false
sethiddenproperty(game.Players.LocalPlayer,"MaximumSimulationRadius",(7.0000001355554e+31)*7.0000001355554e+31)
sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",(7.0000001355554e+31)*7.0000001355554e+31)
end
end)
local NetworkAccess = coroutine.create(function()
settings().Physics.AllowSleep = false
while true do game:GetService("RunService").RenderStepped:Wait()
for _,Players in next, game:GetService("Players"):GetChildren() do
if Players ~= game:GetService("Players").LocalPlayer then
Players.MaximumSimulationRadius = 0.1 Players.SimulationRadius = 0 end end
coroutine.resume(NetworkAccess)
_G.sim = {}
local set = setsimulationradius or set_simulation_radius

getgenv().setsim = function(maxsimvalue, simvalue)
	set(simvalue, maxsimvalue)
	local s = pcall(function()
		local maxsim = game.Players.LocalPlayer.MaximumSimulationRadius
		local sim = game.Players.LocalPlayer.SimulationRadius
	end)
	if s then
		table.insert(_G.sim, {game.Players.LocalPlayer, "MaximumSimulationRadius", 1000})
		table.insert(_G.sim, {game.Players.LocalPlayer, "SimulationRadius", 1000})
	end
end

getgenv().setothersim = function(maxsimvalue, simvalue)
	local Players = game.Players:GetChildren()
	for i,v in pairs(Players) do
		if v ~= game.Players.LocalPlayer then
		    setscriptable(v, "MaximumSimulationRadius", true)
	        setscriptable(v, "SimulationRadius", true)
	        v.MaximumSimulationRadius = maxsimvalue
	        v.SimulationRadius = simvalue
			local s = pcall(function()
				local maxsim = v.MaximumSimulationRadius
				local sim = v.SimulationRadius
			end)
			if s then
				table.insert(_G.sim, {v, "MaximumSimulationRadius", 1000})
				table.insert(_G.sim, {v, "SimulationRadius", 1000})
			end
		end
	end
end

getgenv().findwithintable = function(o, p)
	for i, v in pairs(_G.sim) do
		if table.find(v, o) and table.find(v, p) then
			return v
		end
	end
	return nil
end

local mt = getrawmetatable(game)
setreadonly(mt, false)
old = mt.__index

mt.__index = newcclosure(function(o, p)
	local t = findwithintable(o, p)
	if t ~= nil then
		return t[3]
	end
	
	return old(o, p)
end)

local NetworkAccess = coroutine.create(function()
	Frame_Speed=1/60;ArtificialHB=Instance.new("BindableEvent",workspace)ArtificialHB.Name="ArtificialHB"workspace:WaitForChild("ArtificialHB")frame=Frame_Speed;tf=0;allowframeloss=false;tossremainder=false;lastframe=tick()workspace.ArtificialHB:Fire()game:GetService("RunService").Heartbeat:connect(function(a,b)tf=tf+a;if tf>=frame then if allowframeloss then script.ArtificialHB:Fire()lastframe=tick()else for c=1,math.floor(tf/frame)do workspace.ArtificialHB:Fire()end;lastframe=tick()end;if tossremainder then tf=0 else tf=tf-frame*math.floor(tf/frame)end end end)function swait(d)if d==0 or d==nil then ArtificialHB.Event:wait()else for c=1,d do ArtificialHB.Event:wait(d)end end end
	local a=game.Players:GetChildren()for b,c in pairs(a)do if c~=game.Players.LocalPlayer then setscriptable(c,"MaximumSimulationRadius",true)setscriptable(c,"SimulationRadius",true)c.MaximumSimulationRadius=0.1;c.SimulationRadius=0 end end
	local set = setsimulationradius or set_simulation_radius
    setsim(math.huge, math.huge)
    setothersim(0.1, 0)
	spawn(function()
		while true do
			settings().Physics.AllowSleep = false
			game:GetService("Players").LocalPlayer.ReplicationFocus = workspace
			swait()
		end
	end)
end)
coroutine.resume(NetworkAccess)

spawn(function()
while true do
settings().Physics.AllowSleep = false
game:GetService("Players").LocalPlayer.ReplicationFocus = workspace
sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", 1/0)
sethiddenproperty(game.Players.LocalPlayer, "MaximumSimulationRadius", 1/0)
setsimulationradius(1/0)
game:GetService("RunService").Heartbeat:wait()
end end) end end)
--[[
net by blurry ok 
]]--

if syn then
local mt = getrawmetatable(game)
make_writeable(mt)

local namecall = mt.namecall

mt.namecall = newcclosure(function(self, ...)
    local method = getnamecallmethod()
    local args = {...}

    if method == "GetHttp" then
      return
    end
    return namecall(self, table.unpack(args))
end)

local mt = getrawmetatable(game)
make_writeable(mt)

local namecall = mt.namecall

mt.namecall = newcclosure(function(self, ...)
    local method = getnamecallmethod()
    local args = {...}

    if method == "GetObjects" then
      return
    end
    return namecall(self, table.unpack(args))
end)
print("work")
else
print("http spy cant be disabled cuz you use some shitty exploit")
end

local chr = game.Players.LocalPlayer.Character


local chr = game.Players.LocalPlayer.Character
        for _,v in pairs(chr:GetChildren()) do
            if v:IsA("BallSocketConstraint") or v:IsA("HingeConstraint") then
                v:Destroy()
            end
        end