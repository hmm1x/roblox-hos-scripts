--hmm1x's edit of mokiros fe thing dont bully me im just a idiot
materials = {
	"Glass",
	"Marble",
	"Pebble",
	"Neon"
}
if game:GetService("RunService"):IsClient() then error("script must be serverside using c/ nor h/") end
if not owner.Character:FindFirstChild("LUAhEAD") then error("this script requires the hat: 2309346267") end
local Player,game,owner = owner,game
local RealPlayer = Player
do
	local function randomstring()
		local length = math.random(10,20)
		local array = {}
		for i = 1,length do
			array[i] = string.char(math.random(32,126))
		end
		return table.concat(array)
	end	
	vers = 1.2
	local table = {"lighting cannon is "..math.random(1,2546465).." adopted","krnl is garbage","lua LuaU exists","saint stole all effects from trimphase for his script clover","["..randomstring().."]"}
	local value = math.random(1,#table) 
	local picked_value = table[value] 
	print("fecc by mokiros, edited by hmm1x")
	print("gotta give the smartman credits 😎😎😎")	
	warn("fun fact of the day: "..tostring(picked_value))
	local RealPlayer = RealPlayer
	script.Parent = RealPlayer.Character

	--Fake event to make stuff like Mouse.KeyDown work
	local Disconnect_Function = function(this)
		this[1].Functions[this[2]] = nil
	end
	local Disconnect_Metatable = {__index={disconnect=Disconnect_Function,Disconnect=Disconnect_Function}}
	local FakeEvent_Metatable = {__index={
		Connect = function(this,f)
			local i = tostring(math.random(0,10000))
			while this.Functions[i] do
				i = tostring(math.random(0,10000))
			end
			this.Functions[i] = f
			return setmetatable({this,i},Disconnect_Metatable)
		end
	}}
	FakeEvent_Metatable.__index.connect = FakeEvent_Metatable.__index.Connect
	print("loading fakeEvent")	
	local function fakeEvent()
		return setmetatable({Functions={}},FakeEvent_Metatable)
	end

	--Creating fake input objects with fake variables
	local FakeMouse = {Hit=CFrame.new(),KeyUp=fakeEvent(),KeyDown=fakeEvent(),Button1Up=fakeEvent(),Button1Down=fakeEvent(),Button2Up=fakeEvent(),Button2Down=fakeEvent()}
	FakeMouse.keyUp = FakeMouse.KeyUp
	FakeMouse.keyDown = FakeMouse.KeyDown
	local UIS = {InputBegan=fakeEvent(),InputEnded=fakeEvent()}
	local CAS = {Actions={},BindAction=function(self,name,fun,touch,...)
		CAS.Actions[name] = fun and {Name=name,Function=fun,Keys={...}} or nil
	end}
	--Merged 2 functions into one by checking amount of arguments
	CAS.UnbindAction = CAS.BindAction

	--This function will trigger the events that have been :Connect()'ed
	local function TriggerEvent(self,ev,...)
		for _,f in pairs(self[ev].Functions) do
			f(...)
		end
	end
	FakeMouse.TriggerEvent = TriggerEvent
	UIS.TriggerEvent = TriggerEvent

	--Client communication
	local Event = Instance.new("RemoteEvent")
	Event.Name = "UserInput_Event"
	Event.OnServerEvent:Connect(function(plr,io)
		if plr~=RealPlayer then return end
		FakeMouse.Target = io.Target
		FakeMouse.Hit = io.Hit
		if not io.isMouse then
			local b = io.UserInputState == Enum.UserInputState.Begin
			if io.UserInputType == Enum.UserInputType.MouseButton1 then
				return FakeMouse:TriggerEvent(b and "Button1Down" or "Button1Up")
			end
			if io.UserInputType == Enum.UserInputType.MouseButton2 then
				return FakeMouse:TriggerEvent(b and "Button2Down" or "Button2Up")
			end
			for _,t in pairs(CAS.Actions) do
				for _,k in pairs(t.Keys) do
					if k==io.KeyCode then
						t.Function(t.Name,io.UserInputState,io)
					end
				end
			end
			FakeMouse:TriggerEvent(b and "KeyDown" or "KeyUp",io.KeyCode.Name:lower())
			UIS:TriggerEvent(b and "InputBegan" or "InputEnded",io,false)
		end
	end)
	Event.Parent = NLS([==[local Event = script:WaitForChild("UserInput_Event")
	local Mouse = owner:GetMouse()
	local UIS = game:GetService("UserInputService")
	local input = function(io,RobloxHandled)
		if RobloxHandled then return end
		--Since InputObject is a client-side instance, we create and pass table instead
		Event:FireServer({KeyCode=io.KeyCode,UserInputType=io.UserInputType,UserInputState=io.UserInputState,Hit=Mouse.Hit,Target=Mouse.Target})
	end
	UIS.InputBegan:Connect(input)
	UIS.InputEnded:Connect(input)

	local h,t
	--Give the server mouse data every second frame, but only if the values changed
	--If player is not moving their mouse, client won't fire events
	local HB = game:GetService("RunService").Heartbeat
	while true do
		if h~=Mouse.Hit or t~=Mouse.Target then
			h,t=Mouse.Hit,Mouse.Target
			Event:FireServer({isMouse=true,Target=t,Hit=h})
		end
		--Wait 2 frames
		for i=1,2 do
			HB:Wait()
		end
	end]==],script)


	----Sandboxed game object that allows the usage of client-side methods and services
	--Real game object
	local RealGame = game
	print("realgame object loaded (allows usage of clientside methods, service)")
	--Metatable for fake service
	local FakeService_Metatable = {
		__index = function(self,k)
			local s = rawget(self,"_RealService")
			if s then
				return typeof(s[k])=="function"
					and function(_,...)return s[k](s,...)end or s[k]
			end
		end,
		__newindex = function(self,k,v)
			local s = rawget(self,"_RealService")
			if s then s[k]=v end
		end
	}
	local function FakeService(t,RealService)
		t._RealService = typeof(RealService)=="string" and RealGame:GetService(RealService) or RealService
		return setmetatable(t,FakeService_Metatable)
	end
	print("metatable fakeservice loaded")

	--Fake game object
	local FakeGame = {
		GetService = function(self,s)
			return rawget(self,s) or RealGame:GetService(s)
		end,
		Players = FakeService({
			LocalPlayer = FakeService({GetMouse=function(self)return FakeMouse end},Player)
		},"Players"),
		UserInputService = FakeService(UIS,"UserInputService"),
		ContextActionService = FakeService(CAS,"ContextActionService"),
		RunService = FakeService({
			_btrs = {},
			RenderStepped = RealGame:GetService("RunService").Heartbeat,
			BindToRenderStep = function(self,name,_,fun)
				self._btrs[name] = self.Heartbeat:Connect(fun)
			end,
			UnbindFromRenderStep = function(self,name)
				self._btrs[name]:Disconnect()
			end,
		},"RunService")
	}
	print("fakegame object loaded")
	rawset(FakeGame.Players,"localPlayer",FakeGame.Players.LocalPlayer)
	FakeGame.service = FakeGame.GetService
	FakeService(FakeGame,game)
	print("wrapping everything up")
	--Changing owner to fake player object to support owner:GetMouse()
	game,owner = FakeGame,FakeGame:GetService("Players").LocalPlayer
	print("hmm1x's edit of mokiros FECC v"..vers.." loaded")
	game:GetService("RunService").Heartbeat:Connect(function()
		script.Name = randomstring()
	end)
end
game:GetService("Chat").BubbleChatEnabled = true
function chat(part, msg)
	game:GetService("Chat"):Chat(part, msg)
end
local w = Instance.new("WorldModel", script)
local wrench = Instance.new("SpawnLocation", w)
w.Name = math.random()
wrench.Name = math.random()
local bill = Instance.new("BillboardGui", wrench)
bill.Size = UDim2.new(1.25, 0, 1.25, 0)
bill.AlwaysOnTop = true
local wimage = Instance.new("ImageLabel", bill)
wimage.Image = "rbxassetid://8834590566"
wimage.ImageColor3 = Color3.new(1, 1, 1)
wimage.BackgroundTransparency = 1
wimage.ImageTransparency = 1
wimage.Size = UDim2.new(1,0, 1,0)
wrench.Size = Vector3.new(5,5,5)
local amongus = Instance.new("SpawnLocation", w)
amongus.Anchored = true
amongus.Enabled = false
amongus.Size = Vector3.new(0,0,0)
amongus.Transparency = false
amongus.CanCollide = false
amongus.Name = math.random()
wrench.Anchored = true
wrench.CanCollide = false
wrench.CanQuery = false
wrench.CanTouch = false
wrench.Enabled = false
wrench.Transparency = 1
local char = owner.Character
local root = char.HumanoidRootPart
game:GetService("RunService").Heartbeat:Connect(function()
	game:GetService("TweenService"):Create(wrench,TweenInfo.new(2,Enum.EasingStyle.Circular,Enum.EasingDirection.Out),{Position = root.Position}):Play()
end)
local mo = owner:GetMouse()
local com = owner.Character:WaitForChild("LUAhEAD")
local comp = com:WaitForChild("Handle")
local xp = "rbxassetid://"..9301999294


local staet = Instance.new("Sound", root)
staet.Volume = 1
staet.SoundId = "rbxassetid://587166970"
root.Anchored = true
local err = Instance.new("Sound", root)
local victory = Instance.new("Sound", root)
victory.SoundId = "rbxassetid://12222253"
victory.Volume = 3
err.SoundId = "rbxassetid://"..9066167010
err.Volume = 1
local shutdown = Instance.new("Sound", root)
shutdown.SoundId = "rbxassetid://"..6224656636
shutdown.Volume = 1
local head = owner.Character.Head
local sleep = false
local music = Instance.new("Sound", root)
music.Volume = 3
music.SoundId = "rbxassetid://1845458027"
music.Looped = true
music.Playing = true
music.PlaybackSpeed = 0 
chat(head, "Booting, Please stand by..")

wait(3)
function hax()
	local foe = mo.Target
	if foe.Name == "Base" then
		return
	end	
	chat(head, "Terminal: Hacked "..foe.Name..".")	
	local eff = Instance.new("SpawnLocation", script)
	eff.Enabled = false
	eff.CanCollide = false
	local sound = Instance.new("Sound", eff)
	sound.Volume = 2
	sound.PlaybackSpeed = math.random(1,3)
	sound:Play()
	sound.SoundId = "rbxassetid://3264923"
	eff.Anchored = true
	eff.CanQuery = false
	eff.CanTouch = false
	eff.Color = Color3.new(0.180392, 1, 0)
	game:GetService("RunService").Heartbeat:Connect(function()
		eff.Material = materials[math.random(1,#materials)]
	end)
	eff.CFrame = foe.CFrame
	eff.Size = foe.Size
	local mesh = Instance.new("SpecialMesh", foe)
	mesh.Name = math.random()
	mesh.Scale = Vector3.new(0,0,0)
	mesh.Offset = Vector3.new(9e9,9e9,9e9)
	game:GetService("TweenService"):Create(eff,TweenInfo.new(2,Enum.EasingStyle.Circular,Enum.EasingDirection.Out),{Transparency = 1}):Play()
	if eff.Transparency == 1 then
		eff:Destroy()
	end
	
end

chat(head, "Windows XP has booted.")
staet:Play()
root.Anchored = false
comp:WaitForChild("Mesh").TextureId = "rbxassetid://9301999281"
mo.KeyDown:Connect(function(key)
	if key == "b" then
		comp:WaitForChild("Mesh").TextureId = "rbxassetid://"..9302985099
		shutdown:Play()
		chat(head, "A problem has been detected and Windows has been shut down to prevent damage to your computer. If this is the first time you've seen this stop error screen, restart your computer. if this screen appears again, follow these steps:Check to make sure any new hardware or software is properly installed. I this is a new installation, ask your hardware or software manufacturer for and Windows updates you might need.If problems continue, disable or remove any newly installed hardware or software. Disable BIOS memory options such as caching or shadowing. If you need to use Safe Mode to remove or disable components, restart your computer, press F8 to select Advanced Startup Options, and then select Safe Mode.")
		root.Anchored = true
		wait(2)
		local expl = Instance.new("Explosion", root)
		expl.Position = root.Position
		err:Play()
	elseif key == "e" then
		err:Play()
		chat(head, "errored")
	elseif key == "n" then
		shutdown:Play()
		chat(head, "Terminal: sleep mode = true")
		root.Anchored = true
		comp:WaitForChild("Mesh").TextureId = "rbxassetid://"..9303129779
	elseif key == "v" then
		chat(head, "Terminal: sleep mode = false")
		root.Anchored = false
		staet:Play()
		comp:WaitForChild("Mesh").TextureId = "rbxassetid://"..9301999281
	elseif key == "x" then
		game:GetService("TweenService"):Create(music,TweenInfo.new(2,Enum.EasingStyle.Circular,Enum.EasingDirection.Out),{PlaybackSpeed = 1}):Play()
		game:GetService("TweenService"):Create(wimage,TweenInfo.new(2,Enum.EasingStyle.Circular,Enum.EasingDirection.Out),{ImageTransparency = 0.3}):Play()		
		chat(head, "Terminal: playing music")
	elseif key == "c" then
		game:GetService("TweenService"):Create(music,TweenInfo.new(2,Enum.EasingStyle.Circular,Enum.EasingDirection.Out),{PlaybackSpeed = 0}):Play()
		game:GetService("TweenService"):Create(wimage,TweenInfo.new(2,Enum.EasingStyle.Circular,Enum.EasingDirection.Out),{ImageTransparency = 1}):Play()		
		chat(head, "Terminal: paused music")
	elseif key == "h" then
		hax()
	elseif key == "j" then
		victory:Play()
		chat(head, "Winner!")
	end
end)
owner.Chatted:Connect(function(msge)
	chat(head, msge)
	if msge:sub(1,3) == "id/" then
		music.SoundId = "rbxassetid://"..msge:sub(4,155456)
		
		chat(head, "changed music id")
	end
end)
