--[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
repeat task.wait() until game:IsLoaded();
local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/DiosDi/VexonHub/refs/heads/main/WindUI"))()

--Goofy anti-staff
loadstring(game:HttpGet("https://raw.githubusercontent.com/RiderOfRise67/SkidRiseHUB/refs/heads/main/AntiStaff.lua"))()

WindUI:AddTheme({
	Name = 'Dark',
	Accent = '#18181b',
	Dialog = '#18181b',
	Outline = '#FFFFFF',
	Text = '#FFFFFF',
	Placeholder = '#999999',
	Background = '#0e0e10',
	Button = '#52525b',
	Icon = '#a1a1aa',
})
WindUI:AddTheme({
	Name = 'Light',
	Accent = '#f4f4f5',
	Dialog = '#f4f4f5',
	Outline = '#000000',
	Text = '#000000',
	Placeholder = '#666666',
	Background = '#ffffff',
	Button = '#e4e4e7',
	Icon = '#52525b',
})
WindUI:AddTheme({
	Name = 'Gray',
	Accent = '#374151',
	Dialog = '#374151',
	Outline = '#d1d5db',
	Text = '#f9fafb',
	Placeholder = '#9ca3af',
	Background = '#1f2937',
	Button = '#4b5563',
	Icon = '#d1d5db',
})
WindUI:AddTheme({
	Name = 'Blue',
	Accent = '#1e40af',
	Dialog = '#1e3a8a',
	Outline = '#93c5fd',
	Text = '#f0f9ff',
	Placeholder = '#60a5fa',
	Background = '#1e293b',
	Button = '#3b82f6',
	Icon = '#93c5fd',
})
WindUI:AddTheme({
	Name = 'Green',
	Accent = '#059669',
	Dialog = '#047857',
	Outline = '#6ee7b7',
	Text = '#ecfdf5',
	Placeholder = '#34d399',
	Background = '#064e3b',
	Button = '#10b981',
	Icon = '#6ee7b7',
})
WindUI:AddTheme({
	Name = 'Red',
	Accent = '#991b1b',
	Dialog = '#991b1b',
	Outline = '#fecaca',
	Text = '#fef2f2',
	Placeholder = '#f87171',
	Background = '#450a0a',
	Button = '#dc2626',
	Icon = '#fecaca',
})

WindUI:AddTheme({
	Name = 'Rise',
	Accent = '#ff3131',
	Dialog = '#2a0505',
	Outline = '#5c0000',
	Text = '#ffffff',
	Placeholder = '#8c4a4a',
	Background = '#120000',
	Button = '#d00000',
	Icon = '#ff3131',
})


WindUI:SetNotificationLower(true)


local themes = {
	'Dark',
	'Light',
	'Gray',
	'Blue',
	'Green',
	'Red',
	'Rise',
}
local currentThemeIndex = 1

if not getgenv().TransparencyEnabled then
	getgenv().TransparencyEnabled = false
end



Window = WindUI:CreateWindow({
	Title = 'RiseHub',
	Icon = 'crown', -- bu icon yerine kendi logonun id sini koyabilirsin şöyle: rbxassetid://84519376661277
	Author = 'Evade',
	Folder = 'risehub', -- bune bilmiyom ama config ile alakalı muhtemlen
	Size = UDim2.fromOffset(500, 240), --ui ın boyutunu ayarlıyon benimkiyle aynı şuan
	Transparent = getgenv().TransparencyEnabled, -- ui daki profil bastında tema deyişiyo onun silsoku bu
	Theme = 'Rise', -- buraya ilk açıldında olacak tema
	Background = 'rbxassetid://81101282829716', -- buraya fotoyu koyacan arka pilanın
	Resizable = true, -- ui boyutu sağ alttan ayarlana bilirmi onu ayarlıyon
	NewElements = true, -- hatırlamıyom bunu ehe ama iyi bişey trust
	CornerRadius = UDim.new(0, 0), -- kenar yumuşaklı
	SideBarWidth = 210, -- şu tabların oldu yerin büyüklü
	BackgroundImageTransparency = 0.8, -- arka pilandaki fotonun saydamlı
	HideSearchBar = false, -- tabların en üstünde arama yeri varya onu aç kapa yapıyo
	ScrollBarEnabled = true, -- şu tabların ve tabın içindeki yerlerde alta yukarı kaydırma yapan şey varya onu aç kapa yapıyo
	User = {
		Enabled = true,
		Anonymous = false,
		Callback = function()
			currentThemeIndex = currentThemeIndex + 1

			if currentThemeIndex > #themes then
				currentThemeIndex = 1
			end

			local newTheme = themes[currentThemeIndex]

			WindUI:SetTheme(newTheme)
			WindUI:Notify({
				Title = 'Theme Changed',
				Content = 'Switched to ' .. newTheme .. ' theme!',
				Duration = 2,
				Icon = 'palette',
			})
			print('Switched to ' .. newTheme .. ' theme')
		end,
	}, -- arka pilan deyiştirme fonksiyonu profil fotosuna tıkladında
})

Window:Tag({
	Title = 'Freemium',
	Icon = 'crown',
	Color = Color3.fromHex('#FF0006'),
	Radius = 4,
})


pcall(function()
	Window:CreateTopbarButton('TransparencyToggle', 'eye', function()
		if getgenv().TransparencyEnabled then
			getgenv().TransparencyEnabled = false

			pcall(function()
				Window:ToggleTransparency(false)
			end)
			WindUI:Notify({
				Title = 'Transparency',
				Content = 'Transparency disabled',
				Duration = 3,
				Icon = 'eye',
			})
			print('Transparency = false')
		else
			getgenv().TransparencyEnabled = true

			pcall(function()
				Window:ToggleTransparency(true)
			end)
			WindUI:Notify({
				Title = 'Transparency',
				Content = 'Transparency enabled',
				Duration = 3,
				Icon = 'eye-off',
			})
			print(' Transparency = true')
		end

		print('Debug - Current Transparency state:', getgenv().TransparencyEnabled)
	end, 990)
end)


Window:EditOpenButton({
	Title = 'RiseHub',
	CornerRadius = UDim.new(0, 6),
	StrokeThickness = 2,
	Color = ColorSequence.new(Color3.fromRGB(100, 0, 0), Color3.fromRGB(200, 0, 0)),
	Draggable = true,
	Enabled = true,
	OnlyMobile = false,
})



Tabs = {}

Tabs.MainTab = Window:Tab({ Title = "Main", Icon = "layout-dashboard", Desc = "Main"})
Tabs.PlayerTab = Window:Tab({ Title = "Players", Icon = "user", Desc = "General"})
Tabs.VisualTab = Window:Tab({ Title = "Visuals", Icon = "camera", Desc = "Visual materials are available here."})
Tabs.AutoTab = Window:Tab({ Title = "Automatic", Icon = "calendar-sync", Desc = "Automatic things"})
Tabs.DashTab = Window:Tab({ Title = "E-Dash", Icon = "laugh", Desc = "Creating an e-Dash is now very easy."})
Tabs.FarmTab = Window:Tab({ Title = "Auto-Farm", Icon = "circle-dollar-sign", Desc = "Perfect for reaching level 100 quickly."})
Tabs.UtilsTab = Window:Tab({ Title = "Utils", Icon = "toolbox", Desc = "Other Things"})
Tabs.CreditsTab = Window:Tab({ Title = "Credits", Icon = "crown", Desc = "All Credits"})

Window:SelectTab(Tabs.MainTab)

Tabs.MainTab:Paragraph({
	Title = "Welcome to Rise Script!",
	Desc = "Rise Script is the highest quality Roblox script. </3",

})

Tabs.MainTab:Divider({})

Tabs.MainTab:ButtonKeybind({
	Title = "Keybind",
	Desc = "Click the row or press the bound key.",
	Icon = "rocket",
	Value = "G",
	CanChange = true,
	Callback = function(trigger)
		notify("ButtonKeybind", "Triggered with bound key/button: " .. tostring(trigger or "click"), "rocket")
	end
})

Tabs.MainTab:Button({
	Title = "Discord Server",
	Desc = "The link to our Discord server that you will click on is copied.",
	Locked = false,
	Callback = function()
		setclipboard("discord.gg/risehub")
	end
})



SettingsSection = Tabs.PlayerTab:Section({Opened = true, Box = true, BoxBorder = true, Icon = 'settings', 
	Title = "Game Settings",
})

local currentSettings = {
	Speed = "1500",
	JumpCap = "1",
	AirStrafeAcceleration = "187"
}
local appliedOnce = false
local playerModelPresent = false
local gameStatsPath = workspace:WaitForChild("Game"):WaitForChild("Stats")
getgenv().ApplyMode = "Not Optimized"

local requiredFields = {
	Friction = true,
	AirStrafeAcceleration = true,
	JumpHeight = true,
	RunDeaccel = true,
	JumpSpeedMultiplier = true,
	JumpCap = true,
	SprintCap = true,
	WalkSpeedMultiplier = true,
	BhopEnabled = true,
	Speed = true,
	AirAcceleration = true,
	RunAccel = true,
	SprintAcceleration = true
}

local function hasAllFields(tbl)
	if type(tbl) ~= "table" then
		return false
	end
	for field, _ in pairs(requiredFields) do
		if rawget(tbl, field) == nil then
			return false
		end
	end
	return true
end

local function getConfigTables()
	local tables = {}
	for _, obj in ipairs(getgc(true)) do
		local success, result =
			pcall(function()
				if hasAllFields(obj) then
					return obj
				end
			end)
		if success and result then
			table.insert(tables, result)
		end
	end
	return tables
end

local function applyToTables(callback)
	local targets = getConfigTables()
	if #targets == 0 then
		return
	end

	if getgenv().ApplyMode == "Optimized" then
		task.spawn(function()
			for i, tableObj in ipairs(targets) do
				if tableObj and typeof(tableObj) == "table" then
					pcall(callback, tableObj)
				end

				if i % 3 == 0 then
					task.wait()
				end
			end
		end)
	else
		for i, tableObj in ipairs(targets) do
			if tableObj and typeof(tableObj) == "table" then
				pcall(callback, tableObj)
			end
		end
	end
end

SettingsSection:Input({
	Title = "Player Speed",
	Desc = "Set the movement speed (Default 1500).",
	Value = "1500",
	Placeholder = "1500",
	Callback = function(Value)
		local val = tonumber(Value)
		if val and val >= 1450 and val <= 100008888 then
			currentSettings.Speed = tostring(val)
			applyToTables(function(obj)
				obj.Speed = val
			end)
		end
	end
})

SettingsSection:Input({
	Title = "Player Jump",
	Desc = "Set player jump power (Default 3.5).",
	Value = "3.5",
	Placeholder = "3.5",
	Callback = function(Value)
		if Value and tonumber(Value) then
			JumpPowerValue = tonumber(Value)
		end
	end
})

SettingsSection:Input({
	Title = "Player Jump Cap",
	Desc = "Limit the jump height (Default 1).",
	Value = "1",
	Placeholder = "1",
	Callback = function(Value)
		local val = tonumber(Value)
		if val and val >= 0.1 and val <= 5088888 then
			currentSettings.JumpCap = tostring(val)
			applyToTables(function(obj)
				obj.JumpCap = val
			end)
		end
	end
})

SettingsSection:Input({
	Title = "Player Strafe Acceleration",
	Desc = "Air control acceleration (Default 187).",
	Value = "187",
	Placeholder = "187",
	Callback = function(Value)
		local val = tonumber(Value)
		if val and val >= 1 and val <= 1000888888 then
			currentSettings.AirStrafeAcceleration = tostring(val)
			applyToTables(function(obj)
				obj.AirStrafeAcceleration = val
			end)
		end
	end
})


SettingsSection:Dropdown({
	Title = "Select Apply Method",
	Desc = "Choose between Optimized or Not Optimized logic.",
	Values = {"Not Optimized", "Optimized"},
	Value = "Not Optimized",
	Callback = function(Value)
		getgenv().ApplyMode = Value
	end
})

local function applyStoredSettings()
	local settings = {
		{field = "Speed", value = tonumber(currentSettings.Speed)},
		{field = "JumpCap", value = tonumber(currentSettings.JumpCap)},
		{field = "AirStrafeAcceleration", value = tonumber(currentSettings.AirStrafeAcceleration)}
	}

	for _, setting in ipairs(settings) do
		if
			setting.value and tostring(setting.value) ~= "1500" and tostring(setting.value) ~= "1" and
			tostring(setting.value) ~= "187"
		then
			applyToTables(function(obj)
				obj[setting.field] = setting.value
			end)
		end
	end
end

local function applySettingsWithDelay()
	if not playerModelPresent or appliedOnce then
		return
	end

	appliedOnce = true

	local settings = {
		{field = "Speed", value = tonumber(currentSettings.Speed), delay = math.random(1, 14)},
		{field = "JumpCap", value = tonumber(currentSettings.JumpCap), delay = math.random(1, 14)},
		{
			field = "AirStrafeAcceleration",
			value = tonumber(currentSettings.AirStrafeAcceleration),
			delay = math.random(1, 14)
		}
	}

	for _, setting in ipairs(settings) do
		if
			setting.value and tostring(setting.value) ~= "1500" and tostring(setting.value) ~= "1" and
			tostring(setting.value) ~= "187"
		then
			task.spawn(function()
				task.wait(setting.delay)
				applyToTables(function(obj)
					obj[setting.field] = setting.value
				end)
			end)
		end
	end
end

local function isPlayerModelPresent()
	local GameFolder = workspace:FindFirstChild("Game")
	local PlayersFolder = GameFolder and GameFolder:FindFirstChild("Players")
	local player = game.Players.LocalPlayer
	return PlayersFolder and PlayersFolder:FindFirstChild(player.Name) ~= nil
end

SettingsSection:Divider({})

local velocityHandlerName = "vFlyVelocity"
local gyroHandlerName = "vFlyGyro"
local vFlyConnection
local vFlySpeed = 50

local function getRoot(char)
	return char and char:FindFirstChild("HumanoidRootPart")
end

local function removeVFly()
	if vFlyConnection then
		vFlyConnection:Disconnect()
		vFlyConnection = nil
	end
	local char = LocalPlayer.Character
	local root = getRoot(char)
	if root then
		if root:FindFirstChild(velocityHandlerName) then
			root[velocityHandlerName]:Destroy()
		end
		if root:FindFirstChild(gyroHandlerName) then
			root[gyroHandlerName]:Destroy()
		end
	end
	if char and char:FindFirstChildOfClass("Humanoid") then
		char:FindFirstChildOfClass("Humanoid").PlatformStand = false
	end
end

local function applyVFly()
	removeVFly()
	local char = LocalPlayer.Character
	local root = getRoot(char)
	if not root then return end
	local camera = workspace.CurrentCamera

	local controlModule =
		require(LocalPlayer.PlayerScripts:WaitForChild("PlayerModule"):WaitForChild("ControlModule"))

	local bv = Instance.new("BodyVelocity")
	bv.Name = velocityHandlerName
	bv.MaxForce = Vector3.new(9e9, 9e9, 9e9)
	bv.Velocity = Vector3.zero
	bv.Parent = root

	local bg = Instance.new("BodyGyro")
	bg.Name = gyroHandlerName
	bg.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
	bg.P = 1000
	bg.D = 50
	bg.Parent = root

	vFlyConnection = RunService.RenderStepped:Connect(function()
		local humanoid = char:FindFirstChildWhichIsA("Humanoid")
		if not (humanoid and root and bv and bg) then return end

		humanoid.PlatformStand = true
		bg.CFrame = camera.CFrame

		local direction = controlModule:GetMoveVector()
		local finalVelocity = Vector3.zero

		finalVelocity = finalVelocity + camera.CFrame.RightVector * direction.X * vFlySpeed
		finalVelocity = finalVelocity - camera.CFrame.LookVector * direction.Z * vFlySpeed

		bv.Velocity = finalVelocity
	end)
end

SettingsSection:Toggle({
	Title = "Fly Hack",
	Desc = "Flying is Nice (Ban Risk)",
	Value = false,
	Callback = function(value)
		if value == true then
			print("Activated!")
			applyVFly()
		else
			print("Disabled!")
			removeVFly()
		end
	end
})

SettingsSection:Slider({
	Title = "Fly Speed",
	Desc = "Set your new fly speed",
	Step = 1,
	Value = {
		Min = 16,
		Max = 100,
		Default = 50,
	},
	Callback = function(value)
		vFlySpeed = value
		print(value)
	end
})





PlayerEspSection = Tabs.VisualTab:Section({Opened = true, Box = true, BoxBorder = true, Icon = 'person-standing', 
	Title = "Player ESP",
})

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local lp = Players.LocalPlayer

local espEnabled = false
local espTable = {}

local function clearEsp(plr)
	if espTable[plr] then
		if espTable[plr].Highlight then espTable[plr].Highlight:Destroy() end
		if espTable[plr].Billboard then espTable[plr].Billboard:Destroy() end
		if espTable[plr].Connection then espTable[plr].Connection:Disconnect() end
		if espTable[plr].Loop then task.cancel(espTable[plr].Loop) end
		espTable[plr] = nil
	end
end

local function createEsp(plr)
	clearEsp(plr)

	if not espEnabled or plr == lp then return end

	local function setup(char)
		local head = char:WaitForChild("Head", 10)
		if not head then return end

		local highlight = Instance.new("Highlight")
		highlight.Name = "Rise_ESP"
		highlight.FillTransparency = 0.5
		highlight.OutlineTransparency = 0
		highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
		highlight.Parent = char

		local bill = Instance.new("BillboardGui")
		bill.Name = "Rise_Name"
		bill.Size = UDim2.new(0, 150, 0, 30)
		bill.StudsOffset = Vector3.new(0, 3, 0)
		bill.AlwaysOnTop = true
		bill.Parent = char
		bill.Adornee = head

		local label = Instance.new("TextLabel")
		label.Size = UDim2.new(1, 0, 1, 0)
		label.BackgroundTransparency = 1
		label.TextColor3 = Color3.fromRGB(255, 255, 255)
		label.Font = Enum.Font.Highway
		label.TextSize = 14
		label.Parent = bill

		local loop = task.spawn(function()
			while char.Parent and espEnabled do
				local isDowned = char:GetAttribute("Downed")

				if isDowned then
					highlight.FillColor = Color3.fromRGB(255, 0, 0) -- Kırmızı
					highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
					label.Text = plr.DisplayName .. " [DOWN]"
					label.TextColor3 = Color3.fromRGB(255, 0, 0)
				else
					highlight.FillColor = Color3.fromRGB(0, 255, 0) -- Yeşil
					highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
					label.Text = plr.DisplayName
					label.TextColor3 = Color3.fromRGB(255, 255, 255)
				end
				task.wait(0.5)
			end
		end)

		espTable[plr] = {
			Highlight = highlight,
			Billboard = bill,
			Loop = loop
		}
	end

	local conn = plr.CharacterAdded:Connect(setup)
	if plr.Character then task.spawn(setup, plr.Character) end

	if espTable[plr] then
		espTable[plr].Connection = conn
	else
		espTable[plr] = {Connection = conn}
	end
end

PlayerEspSection:Toggle({
	Title = "Player ESP",
	Desc = "It allows you to see all the players from every angle and through walls",
	Value = false,
	Callback = function(state)
		espEnabled = state

		if state then
			for _, plr in pairs(Players:GetPlayers()) do
				createEsp(plr)
			end

			_G.PlayerAddedConn = Players.PlayerAdded:Connect(createEsp)
			_G.PlayerRemovingConn = Players.PlayerRemoving:Connect(clearEsp)
		else
			if _G.PlayerAddedConn then _G.PlayerAddedConn:Disconnect() end
			if _G.PlayerRemovingConn then _G.PlayerRemovingConn:Disconnect() end

			for _, plr in pairs(Players:GetPlayers()) do
				clearEsp(plr)
			end
		end
	end
})

PlayerEspSection:Divider({})

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

local Events = nil
local CharacterFolder = nil
local EmoteRemote = nil
local PassCharacterInfo = nil
local remoteSignal = nil

local currentTag = nil
local currentEmotes = {}
local selectEmotes = {}
local emoteEnabled = {}
local pendingSlot = nil

local replacerCurrent = {}
local replacerSelected = {}
local swappedPairs = {}

for i = 1, 12 do
	currentEmotes[i] = ""
	selectEmotes[i] = ""
	emoteEnabled[i] = false
	replacerCurrent[i] = ""
	replacerSelected[i] = ""
end

local function readTagFromFolder(f)
	if not f then return nil end
	return f:GetAttribute("Tag") or (f:FindFirstChild("Tag") and f.Tag.Value)
end

local function onRespawn()
	currentTag = nil
	pendingSlot = nil
	task.spawn(function()
		local startTime = tick()
		while tick() - startTime < 10 do
			if workspace:FindFirstChild("Game") and workspace.Game:FindFirstChild("Players") then
				local folder = workspace.Game.Players:FindFirstChild(player.Name)
				if folder then
					currentTag = readTagFromFolder(folder)
					if currentTag then break end
				end
			end
			task.wait(0.5)
		end
	end)
end

local function fireSelect(slot)
	local tagNumber = tonumber(currentTag)
	if not tagNumber or not selectEmotes[slot] or selectEmotes[slot] == "" then return end

	if remoteSignal then
		pcall(function()
			local buf = buffer.create(2)
			buffer.writeu8(buf, 0, tagNumber)
			buffer.writeu8(buf, 1, 17)
			firesignal(remoteSignal, buf, {selectEmotes[slot]})
		end)
	end
end

task.spawn(function()
	Events = ReplicatedStorage:WaitForChild("Events", 10)
	CharacterFolder = Events and Events:WaitForChild("Character", 10)
	EmoteRemote = CharacterFolder and CharacterFolder:WaitForChild("Emote", 10)
	PassCharacterInfo = CharacterFolder and CharacterFolder:WaitForChild("PassCharacterInfo", 10)
	remoteSignal = PassCharacterInfo and PassCharacterInfo.OnClientEvent

	if PassCharacterInfo and EmoteRemote then
		local oldNamecall
		oldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
			local method = getnamecallmethod()
			local args = {...}

			if method == "FireServer" and self == EmoteRemote and type(args[1]) == "string" then
				for i = 1, 12 do
					if emoteEnabled[i] and currentEmotes[i] ~= "" and args[1] == currentEmotes[i] then
						pendingSlot = i
						task.spawn(function()
							task.wait(0.1)
							if pendingSlot == i then
								pendingSlot = nil
								fireSelect(i)
							end
						end)
						return nil
					end
				end
			end
			return oldNamecall(self, ...)
		end)
	end
end)


for i = 1, 12 do
	PlayerEspSection:Input({
		Title = "Owned Emote " .. i,
		Desc = "The emote you currently own",
		Placeholder = "Enter name...",
		Callback = function(t)
			currentEmotes[i] = t:gsub("%s+", "")
		end
	})

	PlayerEspSection:Input({
		Title = "Target Emote " .. i,
		Desc = "The emote to play instead",
		Placeholder = "Enter name...",
		Callback = function(t)
			selectEmotes[i] = t:gsub("%s+", "")
		end
	})
end

PlayerEspSection:Button({
	Title = "Apply Mappings",
	Desc = "Activate your emote changes",
	Callback = function()
		local hasAny = false
		for i = 1, 12 do
			if currentEmotes[i] ~= "" and selectEmotes[i] ~= "" then
				emoteEnabled[i] = true
				hasAny = true
			end
		end

		WindUI:Notify({
			Title = "Rise-San",
			Content = hasAny and "Mappings Applied Successfully!" or "Please enter emote names first.",
			Duration = 3,
			Icon = "check",
		})
	end
})

PlayerEspSection:Button({
	Title = "Reset All",
	Desc = "Clear emote changer settings.",
	Callback = function()
		for i = 1, 12 do
			currentEmotes[i] = ""
			selectEmotes[i] = ""
			emoteEnabled[i] = false
		end
		WindUI:Notify({
			Title = "Rise-San",
			Content = "Changer settings cleared.",
			Duration = 3,
			Icon = "trash",
		})
	end
})


for i = 1, 12 do
	PlayerEspSection:Input({
		Title = "Original Name " .. i,
		Desc = "File to be renamed",
		Placeholder = "Enter name...",
		Callback = function(t)
			replacerCurrent[i] = t
		end
	})

	PlayerEspSection:Input({
		Title = "New Name " .. i,
		Desc = "File to be renamed",
		Placeholder = "Enter name...",
		Callback = function(t)
			replacerSelected[i] = t
		end
	})
end

function SwapEmotes(cName, sName)
	local folder = ReplicatedStorage:FindFirstChild("Items") and ReplicatedStorage.Items:FindFirstChild("Emotes")
	if not folder then return false end
	local obj1 = folder:FindFirstChild(cName)
	local obj2 = folder:FindFirstChild(sName)
	if obj1 and obj2 then
		local temp = sName .. "_temp"
		obj1.Name = temp
		obj2.Name = cName
		obj1.Name = sName
		return true
	end
	return false
end

PlayerEspSection:Button({
	Title = "Swap Names",
	Desc = "Swap file names in ReplicatedStorage.",
	Callback = function()
		local successCount = 0
		for i = 1, 12 do
			if replacerCurrent[i] ~= "" and replacerSelected[i] ~= "" then
				if SwapEmotes(replacerCurrent[i], replacerSelected[i]) then
					swappedPairs[replacerCurrent[i]] = replacerSelected[i]
					successCount = successCount + 1
				end
			end
		end
		WindUI:Notify({
			Title = "Replacer",
			Content = successCount .. " adet isim başarıyla takas edildi.",
			Duration = 3,
			Icon = "refresh-cw",
		})
	end
})

PlayerEspSection:Button({
	Title = "Restore Names",
	Desc = "Restore original file names.",
	Callback = function()
		for old, new in pairs(swappedPairs) do
			SwapEmotes(new, old)
		end
		swappedPairs = {}
		WindUI:Notify({
			Title = "Restored",
			Content = "Names returned to normal.",
			Duration = 3,
			Icon = "undo",
		})
	end
})


player.CharacterAdded:Connect(function()
	task.wait(1)
	onRespawn()
end)

onRespawn()

PlayerEspSection:Divider({})

CosmaticSection = Tabs.VisualTab:Section({Opened = true, Box = true, BoxBorder = true, Icon = 'hat-glasses', 
	Title = "Cosmatic Changer",
})


local ReplicatedStorage = game:GetService("ReplicatedStorage")

local cosmetic1 = ""
local cosmetic2 = ""
local originalCosmetic1 = ""
local originalCosmetic2 = ""
local isSwapped = false

local function normalize(str)
	return str:gsub("%s+", ""):lower()
end

local function levenshtein(s, t)
	local m, n = #s, #t
	local d = {}
	for i = 0, m do d[i] = {[0] = i} end
	for j = 0, n do d[0][j] = j end
	for i = 1, m do
		for j = 1, n do
			local cost = (s:sub(i, i) == t:sub(j, j)) and 0 or 1
			d[i][j] = math.min(d[i - 1][j] + 1, d[i][j - 1] + 1, d[i - 1][j - 1] + cost)
		end
	end
	return d[m][n]
end

local function similarity(s, t)
	local nS = normalize(s)
	local nT = normalize(t)
	local dist = levenshtein(nS, nT)
	return 1 - dist / math.max(#nS, #nT)
end

local function findSimilar(name, folder)
	local bestMatch = name
	local bestScore = 0.5
	for _, c in ipairs(folder:GetChildren()) do
		local score = similarity(name, c.Name)
		if score > bestScore then
			bestScore = score
			bestMatch = c.Name
		end
	end
	return bestMatch
end

CosmaticSection:Input({
	Title = "Current Cosmetics",
	Desc = "Enter the name of the cosmetic you are wearing.",
	Placeholder = "Enter current cosmetic name...",
	Callback = function(Value)
		cosmetic1 = Value
		if not isSwapped then
			originalCosmetic1 = Value
		end
	end
})

CosmaticSection:Input({
	Title = "Select Cosmetics",
	Desc = "Enter the name of the cosmetic you want to see.",
	Placeholder = "Enter cosmetic to swap with...",
	Callback = function(Value)
		cosmetic2 = Value
		if not isSwapped then
			originalCosmetic2 = Value
		end
	end
})

CosmaticSection:Button({
	Title = "Apply Cosmetics",
	Desc = "Swaps the visual models of the cosmetics.",
	Callback = function()
		pcall(function()
			if cosmetic1 == "" or cosmetic2 == "" or cosmetic1 == cosmetic2 then
				WindUI:Notify({
					Title = "Error",
					Content = "Please enter two valid and distinct names.",
					Duration = 3,
					Icon = "alert-circle"
				})
				return
			end

			local Cosmetics = ReplicatedStorage:WaitForChild("Items"):WaitForChild("Cosmetics")
			local target1 = findSimilar(cosmetic1, Cosmetics)
			local target2 = findSimilar(cosmetic2, Cosmetics)

			local a = Cosmetics:FindFirstChild(target1)
			local b = Cosmetics:FindFirstChild(target2)

			if not a or not b then
				WindUI:Notify({
					Title = "Error",
					Content = "Accessories not found.",
					Duration = 3,
					Icon = "x-circle"
				})
				return
			end

			if not isSwapped then
				originalCosmetic1 = target1
				originalCosmetic2 = target2
			end

			local tempRoot = Instance.new("Folder", Cosmetics)
			tempRoot.Name = "__temp_swap_" .. tostring(tick()):gsub("%.", "_")

			local tempA = Instance.new("Folder", tempRoot)
			local tempB = Instance.new("Folder", tempRoot)

			for _, c in ipairs(a:GetChildren()) do c.Parent = tempA end
			for _, c in ipairs(b:GetChildren()) do c.Parent = tempB end

			for _, c in ipairs(tempA:GetChildren()) do c.Parent = b end
			for _, c in ipairs(tempB:GetChildren()) do c.Parent = a end

			tempRoot:Destroy()
			isSwapped = true

			WindUI:Notify({
				Title = "Rise-San",
				Content = "Successfully swapped " .. target1 .. " with " .. target2,
				Duration = 4,
				Icon = "check"
			})
		end)
	end
})

CosmaticSection:Button({
	Title = "Reset Cosmetics",
	Desc = "Reverts all visual swaps to original state.",
	Callback = function()
		pcall(function()
			if not isSwapped then
				WindUI:Notify({
					Title = "Error",
					Content = "No cosmetics have been swapped yet.",
					Duration = 3,
					Icon = "info"
				})
				return
			end

			local Cosmetics = ReplicatedStorage:WaitForChild("Items"):WaitForChild("Cosmetics")
			local a = Cosmetics:FindFirstChild(originalCosmetic1)
			local b = Cosmetics:FindFirstChild(originalCosmetic2)

			if a and b then
				local tempRoot = Instance.new("Folder", Cosmetics)
				tempRoot.Name = "__temp_reset_" .. tostring(tick()):gsub("%.", "_")

				local tempA = Instance.new("Folder", tempRoot)
				local tempB = Instance.new("Folder", tempRoot)

				for _, c in ipairs(a:GetChildren()) do c.Parent = tempA end
				for _, c in ipairs(b:GetChildren()) do c.Parent = tempB end

				for _, c in ipairs(tempA:GetChildren()) do c.Parent = b end
				for _, c in ipairs(tempB:GetChildren()) do c.Parent = a end

				tempRoot:Destroy()
				isSwapped = false

				WindUI:Notify({
					Title = "Rise-San",
					Content = "Successfully reset cosmetics to original state.",
					Duration = 3,
					Icon = "refresh-ccw"
				})
			else
				WindUI:Notify({
					Title = "Hata",
					Content = "Could not find original cosmetics to reset.",
					Duration = 3,
					Icon = "alert-triangle"
				})
			end
		end)
	end
})




AutoCarrySection = Tabs.AutoTab:Section({Opened = true, Box = true, BoxBorder = true, Icon = 'handshake', 
	Title = "Auto-Carry",
})

AutoCarrySection:Button({
	Title = "Auto-Carry",
	Desc = "Carrying is much easier now",
	Locked = false,
	Callback = function()
		loadstring(game:HttpGet("https://pastefy.app/fDUxYN9L/raw"))()
	end
})


BhopSection = Tabs.AutoTab:Section({Opened = true, Box = true, BoxBorder = true, Icon = 'rabbit', 
	Title = "Bhop (Bunny Hop)",
})

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local LocalPlayer = Players.LocalPlayer
local bhopEnabled = false

local bhopGui = Instance.new("ScreenGui")
bhopGui.Name = "bhop_kalici"
bhopGui.ResetOnSpawn = false
bhopGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
bhopGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
bhopGui.Enabled = false

local riseGui = Instance.new("Frame")
riseGui.Name = "riseGui"
riseGui.Parent = bhopGui
riseGui.BackgroundTransparency = 1.000
riseGui.Size = UDim2.new(0, 100, 0, 100)

local Button = Instance.new("TextButton")
Button.Name = "Button"
Button.Parent = riseGui
Button.BackgroundColor3 = Color3.fromRGB(126, 0, 0)
Button.BackgroundTransparency = 0.350
Button.Position = UDim2.new(6.14, -182, 2.06, -47)
Button.Size = UDim2.new(0, 142, 0, 40)
Button.Text = ""

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 15)
UICorner.Parent = Button

local TextLabel = Instance.new("TextLabel")
TextLabel.Parent = Button
TextLabel.BackgroundTransparency = 1.000
TextLabel.Size = UDim2.new(1, 0, 1, 0)
TextLabel.Font = Enum.Font.Highway
TextLabel.Text = "Bhop: OFF"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextSize = 17.000
TextLabel.Active = false

local dragging = false
local dragInput, dragStart, startPos
local isTap = true

local function UpdateBhopState(state)
	bhopEnabled = state
	TextLabel.Text = state and "Bhop: ON" or "Bhop: OFF"
	Button.BackgroundColor3 = state and Color3.fromRGB(200, 0, 0) or Color3.fromRGB(126, 0, 0)
end

Button.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPos = Button.Position
		isTap = true

		local conn
		conn = input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
				if conn then conn:Disconnect() end
				if isTap then UpdateBhopState(not bhopEnabled) end
			end
		end)
	end
end)

Button.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
		dragInput = input
		if dragStart and (input.Position - dragStart).Magnitude > 5 then
			isTap = false
		end
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if input == dragInput and dragging then
		local delta = input.Position - dragStart
		Button.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
end)

RunService.Heartbeat:Connect(function()
	if bhopEnabled then
		local character = LocalPlayer.Character
		if character then
			local humanoid = character:FindFirstChildOfClass("Humanoid")
			if humanoid and humanoid.Health > 0 and humanoid.MoveDirection.Magnitude > 0 then
				local state = humanoid:GetState()
				if state == Enum.HumanoidStateType.Running or state == Enum.HumanoidStateType.Landed then
					humanoid.Jump = true
					humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
				end
			end
		end
	end
end)

BhopSection:Toggle({
	Title = "Bhop",
	Desc = "Automatic jumps",
	Value = false,
	Callback = function(state) 
		UpdateBhopState(state)
	end
})

BhopSection:Toggle({
	Title = "Show Bhop UI",
	Desc = "Adds shortcuts for mobile users.",
	Value = false,
	Callback = function(state) 
		bhopGui.Enabled = state
	end
})


AutoRespawnSection = Tabs.AutoTab:Section({Opened = true, Box = true, BoxBorder = true, Icon = 'rabbit', 
	Title = "Auto-Respawn"
})

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local LocalPlayer = Players.LocalPlayer
local Events = ReplicatedStorage:WaitForChild("Events")

local autoRespawnEnabled = false

AutoRespawnSection:Toggle({
	Title = "Auto-Respawn",
	Desc = "You are reborn instantly upon death.",
	Value = false,
	Callback = function(state)
		autoRespawnEnabled = state

		if state then
			print("Auto-Respawn: Aktif!")
			task.spawn(function()
				while autoRespawnEnabled do
					local character = LocalPlayer.Character
					if character and character:GetAttribute("Downed") == true then
						Events.Player.ChangePlayerMode:FireServer(true)
					end
					task.wait(2.25)
				end
			end)
		else
			print("Auto-Respawn: Devre Dışı!")
		end
	end
})

GravitySection = Tabs.AutoTab:Section({Opened = true, Box = true, BoxBorder = true, Icon = 'globe', 
	Title = "Gravity"
})


GravitySection:Button({
	Title = "Gravity",
	Desc = "It allows you to glide slowly.",
	Locked = false,
	Callback = function()
		loadstring(game:HttpGet("https://pastefy.app/b6ju1J4s/raw"))()
	end
})


InfSlideSection = Tabs.DashTab:Section({Opened = true, Box = true, BoxBorder = true, Icon = 'infinity', 
	Title = "Infinite Slide",
})

local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

local infiniteSlideEnabled = false
local slideFrictionValue = -8
local movementTables = {}
local infiniteSlideHeartbeat = nil
local infiniteSlideCharacterConn = nil
local lastState = nil
local frictionApplied = false
local cachedPlayerModel = nil
local cacheTime = 0
local CACHE_DURATION = 1

local requiredKeys = {"Friction", "AirStrafeAcceleration", "JumpHeight", "RunDeaccel", "JumpSpeedMultiplier", "JumpCap", "SprintCap", "WalkSpeedMultiplier", "BhopEnabled", "Speed", "AirAcceleration", "RunAccel", "SprintAcceleration"}

local function hasRequiredFields(tbl)
	if typeof(tbl) ~= "table" then return false end
	for _, key in ipairs(requiredKeys) do
		if rawget(tbl, key) == nil then return false end
	end
	return true
end

local function findMovementTables()
	movementTables = {}
	for _, obj in ipairs(getgc(true)) do
		if hasRequiredFields(obj) then
			table.insert(movementTables, obj)
		end
	end
	return #movementTables > 0
end

local function setSlideFriction(value)
	if frictionApplied and value == slideFrictionValue then return end
	local appliedCount = 0
	for _, tbl in ipairs(movementTables) do
		pcall(function()
			if tbl.Friction ~= value then
				tbl.Friction = value
				appliedCount = appliedCount + 1
			end
		end)
	end
	frictionApplied = (value == slideFrictionValue)
end

local function updatePlayerModel()
	local currentTime = tick()
	if cachedPlayerModel and (currentTime - cacheTime) < CACHE_DURATION then
		if cachedPlayerModel.Parent then return cachedPlayerModel end
	end
	local gameFolder = workspace:FindFirstChild("Game")
	local playersFolder = gameFolder and gameFolder:FindFirstChild("Players")
	cachedPlayerModel = playersFolder and playersFolder:FindFirstChild(player.Name)
	cacheTime = currentTime
	return cachedPlayerModel
end

local function infiniteSlideHeartbeatFunc()
	if not infiniteSlideEnabled then return end
	local playerModel = updatePlayerModel()
	if not playerModel then return end

	local state = playerModel:GetAttribute("State")
	if state == lastState then return end
	lastState = state

	if state == "Slide" then
		pcall(function() playerModel:SetAttribute("State", "EmotingSlide") end)
	elseif state == "EmotingSlide" then
		setSlideFriction(slideFrictionValue)
	else
		if frictionApplied then
			setSlideFriction(5)
			frictionApplied = false
		end
	end
end

local function setInfiniteSlide(enabled)
	infiniteSlideEnabled = enabled
	if enabled then
		findMovementTables()
		if not infiniteSlideCharacterConn then
			infiniteSlideCharacterConn = player.CharacterAdded:Connect(function()
				task.wait(1)
				findMovementTables()
			end)
		end
		infiniteSlideHeartbeat = RunService.RenderStepped:Connect(infiniteSlideHeartbeatFunc)
	else
		if infiniteSlideHeartbeat then infiniteSlideHeartbeat:Disconnect() end
		if infiniteSlideCharacterConn then infiniteSlideCharacterConn:Disconnect() end
		setSlideFriction(5)
		movementTables = {}
	end
end

local featureStates = { EmoteSpeedValue = 2 }
local originalEmoteSpeeds = {}
local itemsFolder = ReplicatedStorage:FindFirstChild("Items")
local emotesFolder = itemsFolder and itemsFolder:FindFirstChild("Emotes")

if emotesFolder then
	for _, emoteModule in ipairs(emotesFolder:GetChildren()) do
		if emoteModule:IsA("ModuleScript") then
			local success, emoteData = pcall(require, emoteModule)
			if success and emoteData and emoteData.EmoteInfo then
				originalEmoteSpeeds[emoteModule.Name] = emoteData.EmoteInfo.SpeedMult
			end
		end
	end
end

local function applyEmoteSpeed(speedValue)
	if not emotesFolder then return end
	for _, emoteModule in ipairs(emotesFolder:GetChildren()) do
		if emoteModule:IsA("ModuleScript") then
			local success, emoteData = pcall(require, emoteModule)
			if success and emoteData and emoteData.EmoteInfo and emoteData.EmoteInfo.SpeedMult ~= 0 then
				emoteData.EmoteInfo.SpeedMult = speedValue
			end
		end
	end
end


InfSlideSection:Toggle({
	Title = "Infinite Slide",
	Desc = "Enables frictionless sliding and infinite slide states.",
	Value = false,
	Callback = function(state)
		setInfiniteSlide(state)
	end
})

InfSlideSection:Input({
	Title = "Slide Speed",
	Desc = "Lower negative values (e.g. -15) are faster.",
	Placeholder = "-8",
	Callback = function(text)
		local num = tonumber(text)
		if num then
			slideFrictionValue = num
			if infiniteSlideEnabled then setSlideFriction(slideFrictionValue) end
		end
	end
})

EmoteSpeedSction = Tabs.DashTab:Section({Opened = true, Box = true, BoxBorder = true, Icon = 'laugh', 
	Title = "Emote Speed",
})


EmoteSpeedSction:Input({
	Title = "Emote Speed Value",
	Desc = "Default: 1500 | Adjust speed multiplier",
	Placeholder = "1500",
	Callback = function(value)
		local num = tonumber(value)
		if num and num > 0 then
			featureStates.EmoteSpeedValue = num
			applyEmoteSpeed(num / 1000)
		end
	end
})

EmoteSpeedSction:Button({
	Title = "Apply Speed to Unwalkable",
	Desc = "Fix emotes that don't move",
	Callback = function()
		if not emotesFolder then return end
		local speedValue = featureStates.EmoteSpeedValue or 2
		for _, emoteModule in ipairs(emotesFolder:GetChildren()) do
			if emoteModule:IsA("ModuleScript") then
				local success, emoteData = pcall(require, emoteModule)
				if success and emoteData and emoteData.EmoteInfo and emoteData.EmoteInfo.SpeedMult == 0 then
					emoteData.EmoteInfo.SpeedMult = speedValue
				end
			end
		end
		WindUI:Notify({ Title = "Rise", Content = "Unwalkable emotes fixed.", Duration = 3, Icon = "zap" })
	end
})

EmoteSpeedSction:Button({
	Title = "Reset Emote Speed",
	Desc = "Having Trouble? Reset speed or rejoin",
	Callback = function()
		if not emotesFolder then return end
		for _, emoteModule in ipairs(emotesFolder:GetChildren()) do
			local originalSpeed = originalEmoteSpeeds[emoteModule.Name]
			if originalSpeed then
				local success, emoteData = pcall(require, emoteModule)
				if success and emoteData and emoteData.EmoteInfo then
					emoteData.EmoteInfo.SpeedMult = originalSpeed
				end
			end
		end
		WindUI:Notify({ Title = "Rise", Content = "Speeds restored.", Duration = 3, Icon = "refresh-cw" })
	end
})


local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Debris = game:GetService("Debris")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

getgenv().EasyTrimp = {
	Enabled = false,
	BaseSpeed = 50,
	ExtraSpeed = 100,
	FloorDrop = 0
}

local speed = getgenv().EasyTrimp.BaseSpeed
local last = tick()
local airTick = 0
local airSum = 0
local airborne = false
local push = nil
local mobileButtonInstance = nil

local function CreateMobileButton()
	if mobileButtonInstance then return mobileButtonInstance end
	local RiseTrimp = Instance.new("ScreenGui")
	RiseTrimp.Name = "RiseTrimp_Mobile"
	RiseTrimp.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	RiseTrimp.ResetOnSpawn = false
	local TrimpFrame = Instance.new("Frame")
	TrimpFrame.Name = "Trimp"
	TrimpFrame.Parent = RiseTrimp
	TrimpFrame.BackgroundTransparency = 1.000
	TrimpFrame.Position = UDim2.new(0.68, 0, 0.645, 0)
	TrimpFrame.Size = UDim2.new(0, 100, 0, 100)
	local Button = Instance.new("TextButton")
	Button.Name = "Button"
	Button.Parent = TrimpFrame
	Button.BackgroundColor3 = Color3.fromRGB(126, 0, 0)
	Button.BackgroundTransparency = 0.350
	Button.Position = UDim2.new(0, 0, 0, 0)
	Button.Size = UDim2.new(0, 142, 0, 40)
	Button.Font = Enum.Font.SourceSans
	Button.Text = ""
	Button.TextColor3 = Color3.fromRGB(0, 0, 0)
	local UICorner = Instance.new("UICorner")
	UICorner.CornerRadius = UDim.new(0, 15)
	UICorner.Parent = Button
	local TextLabel = Instance.new("TextLabel")
	TextLabel.Parent = Button
	TextLabel.BackgroundTransparency = 1.000
	TextLabel.Size = UDim2.new(1, 0, 1, 0)
	TextLabel.Font = Enum.Font.Highway
	TextLabel.Text = "Easy Trimp"
	TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.TextSize = 17.000

	local dragging = false
	local dragStart = nil
	local startPos = nil

	Button.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = TrimpFrame.Position

			input.Changed:Connect(function()
				if dragging and input.UserInputType == Enum.UserInputType.Touch then
					local delta = input.Position - dragStart
					TrimpFrame.Position = UDim2.new(
						startPos.X.Scale,
						startPos.X.Offset + delta.X,
						startPos.Y.Scale,
						startPos.Y.Offset + delta.Y
					)
				end
			end)
		end
	end)

	UserInputService.InputChanged:Connect(function(input)
		if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
			local delta = input.Position - dragStart
			TrimpFrame.Position = UDim2.new(
				startPos.X.Scale,
				startPos.X.Offset + delta.X,
				startPos.Y.Scale,
				startPos.Y.Offset + delta.Y
			)
		end
	end)

	Button.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = false
		end
	end)

	Button.MouseButton1Click:Connect(function()
		getgenv().EasyTrimp.Enabled = not getgenv().EasyTrimp.Enabled
		Button.BackgroundColor3 = getgenv().EasyTrimp.Enabled and Color3.fromRGB(0, 126, 60) or Color3.fromRGB(126, 0, 0)
	end)

	mobileButtonInstance = RiseTrimp
	return RiseTrimp
end

RunService.RenderStepped:Connect(function()
	local dt = tick() - last
	last = tick()

	local char = LocalPlayer.Character
	local hrp = char and char:FindFirstChild("HumanoidRootPart")
	local hum = char and char:FindFirstChild("Humanoid")
	if not hrp or not hum then return end

	local inAir = hum.FloorMaterial == Enum.Material.Air

	if airborne and not inAir then
		speed = math.max(getgenv().EasyTrimp.BaseSpeed - getgenv().EasyTrimp.FloorDrop, speed - 10)
	end
	airborne = inAir

	if getgenv().EasyTrimp.Enabled then
		if inAir then
			airTick = airTick + dt
			while airTick >= 0.04 do
				airTick = airTick - 0.04
				speed = math.min(getgenv().EasyTrimp.BaseSpeed + getgenv().EasyTrimp.ExtraSpeed, speed + 0.1)
			end
		else
			airTick = 0
			speed = math.max(getgenv().EasyTrimp.BaseSpeed - getgenv().EasyTrimp.FloorDrop, speed - (2.5 * dt))
		end

		if push then push:Destroy() end
		local look = Camera.CFrame.LookVector
		local moveDir = Vector3.new(look.X, 0, look.Z).Unit

		local bv = Instance.new("BodyVelocity")
		bv.Velocity = moveDir * speed
		bv.MaxForce = Vector3.new(4e5, 0, 4e5)
		bv.Parent = hrp
		Debris:AddItem(bv, 0.1)
		push = bv
	else
		if push then push:Destroy() push = nil end
		speed = getgenv().EasyTrimp.BaseSpeed
	end
end)

EasyTripSection = Tabs.DashTab:Section({Opened = true, Box = true, BoxBorder = true, Icon = 'ribbon', Title = "Easy Trimp" })

EasyTripSection:Toggle({
	Title = "Easy Trimp",
	Desc = "It speeds up the process, making trimming easier.",
	Value = false,
	Callback = function(state) getgenv().EasyTrimp.Enabled = state end
})

EasyTripSection:Toggle({
	Title = "Show Easy Trimp Button",
	Desc = "Creates a shortcut for mobile.",
	Value = false,
	Callback = function(state)
		local gui = CreateMobileButton()
		gui.Parent = state and LocalPlayer:WaitForChild("PlayerGui") or nil
	end
})

EasyTripSection:Input({
	Title = "Base Speed",
	Desc = "Default running speed",
	Placeholder = "50",
	Callback = function(t) getgenv().EasyTrimp.BaseSpeed = tonumber(t) or 50 end
})

EasyTripSection:Input({
	Title = "Extra Speed",
	Desc = "Max speed added in air",
	Placeholder = "100",
	Callback = function(t) getgenv().EasyTrimp.ExtraSpeed = tonumber(t) or 100 end
})

BounceSystemSection = Tabs.DashTab:Section({Opened = true, Box = true, BoxBorder = true, Icon = 'file-sliders', Title = "Bounce System" })

BounceSystemSection:Toggle({
	Title = "Bounce Multiplier",
	Desc = "Enable bounce velocity",
	Value = false,
	Callback = function(state) 
		BounceSystem.Config.Enabled = state 
		if state then BounceSystem:Initialize() end
	end
})

BounceSystemSection:Input({
	Title = "Multiplier Value",
	Desc = "80 = 1 stud",
	Placeholder = "80",
	Callback = function(t) BounceSystem.Config.VelocityMultiplier = tonumber(t) or 80 end
})

BounceSystemSection:Input({
	Title = "Bounce Height",
	Desc = "Super bounce heigh",
	Placeholder = "190",
	Callback = function(t) featureStates.BounceHeight = tonumber(t) or 190 end
})

BounceSystemSection:Toggle({
	Title = "Super Bounce",
	Desc = "Enable super bounce.",
	Value = false,
	Callback = function(state) featureStates.SuperBounceEnabled = state end
})

BounceSystemSection:Dropdown({
	Title = "Auto Jump Type",
	Desc = "Jump logic",
	Values = {"Bounce", "Realistic"},
	Value = "Bounce",
	Callback = function(option) getgenv().autoJumpType = option end
})

AutoCrouch = Tabs.DashTab:Section({Opened = true, Box = true, BoxBorder = true, Icon = 'armchair', 
	Title = "Auto Crouch",
})

local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

if not featureStates then
	featureStates = {
		AutoCrouch = false,
		AutoCrouchMode = "Air"
	}
end

local previousCrouchState = false
local spamDown = true
local crouchConnection = nil
local keybindConnection = nil
local mobileGuiInstance = nil

local function fireKeybind(down, key)
	local ohTable = {["Down"] = down, ["Key"] = key}
	local eventsFolder = player:WaitForChild("PlayerScripts", 5):WaitForChild("Events", 5)
	local tempEvents = eventsFolder:WaitForChild("temporary_events", 5)
	local event = tempEvents:WaitForChild("UseKeybind", 5)

	if event then
		event:Fire(ohTable)
	end
end

local function createRiseCrouchGui()
	if mobileGuiInstance then return mobileGuiInstance end

	local RiseCrouch = Instance.new("ScreenGui")
	local eee = Instance.new("Frame")
	local Button = Instance.new("TextButton")
	local UICorner = Instance.new("UICorner")
	local TextLabel = Instance.new("TextLabel")

	RiseCrouch.Name = "RiseCrouch"
	RiseCrouch.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	RiseCrouch.ResetOnSpawn = false

	eee.Name = "eee"
	eee.Parent = RiseCrouch
	eee.BackgroundTransparency = 1.000
	eee.Position = UDim2.new(0.5, -71, 0.15, 0)
	eee.Size = UDim2.new(0, 100, 0, 100)

	eee.Active = true
	eee.Draggable = true 

	Button.Name = "Button"
	Button.Parent = eee
	Button.BackgroundColor3 = featureStates.AutoCrouch and Color3.fromRGB(0, 126, 60) or Color3.fromRGB(126, 0, 0)
	Button.BackgroundTransparency = 0.350
	Button.Position = UDim2.new(0, 0, 0, 0)
	Button.Size = UDim2.new(0, 142, 0, 40)
	Button.Font = Enum.Font.SourceSans
	Button.Text = ""

	UICorner.CornerRadius = UDim.new(0, 15)
	UICorner.Parent = Button

	TextLabel.Parent = Button
	TextLabel.BackgroundTransparency = 1.000
	TextLabel.Size = UDim2.new(1, 0, 1, 0)
	TextLabel.Font = Enum.Font.Highway
	TextLabel.Text = "Auto Crouch"
	TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.TextSize = 17.000

	Button.MouseButton1Click:Connect(function()
		featureStates.AutoCrouch = not featureStates.AutoCrouch

		Button.BackgroundColor3 = featureStates.AutoCrouch and Color3.fromRGB(0, 126, 60) or Color3.fromRGB(126, 0, 0)

		if AutoCrouchToggle then
			AutoCrouchToggle:SetValue(featureStates.AutoCrouch)
		end

		if featureStates.AutoCrouch then
			startAutoCrouchLogic()
		else
			stopAutoCrouchLogic()
		end
	end)

	mobileGuiInstance = RiseCrouch
	return RiseCrouch
end

function startAutoCrouchLogic()
	if crouchConnection then crouchConnection:Disconnect() end

	crouchConnection = RunService.Heartbeat:Connect(function()
		local character = player.Character
		local humanoid = character and character:FindFirstChild("Humanoid")
		if not humanoid then return end

		local mode = featureStates.AutoCrouchMode
		local isAir = (humanoid.FloorMaterial == Enum.Material.Air)

		if mode == "Normal" then
			fireKeybind(spamDown, "Crouch")
			spamDown = not spamDown
		else
			local shouldCrouch = (mode == "Air" and isAir) or (mode == "Ground" and not isAir)
			if shouldCrouch ~= previousCrouchState then
				fireKeybind(shouldCrouch, "Crouch")
				previousCrouchState = shouldCrouch
			end
		end
	end)
end

function stopAutoCrouchLogic()
	if crouchConnection then
		crouchConnection:Disconnect()
		crouchConnection = nil
	end
	if previousCrouchState then
		fireKeybind(false, "Crouch")
		previousCrouchState = false
	end
end

AutoCrouch:Toggle({
	Title = "Auto Crouch",
	Desc = "Press C to toggle if you on keyboard",
	Value = false,
	Callback = function(state)
		featureStates.AutoCrouch = state

		if mobileGuiInstance then
			local btn = mobileGuiInstance.eee.Button
			btn.BackgroundColor3 = state and Color3.fromRGB(0, 126, 60) or Color3.fromRGB(126, 0, 0)
		end

		if state then
			startAutoCrouchLogic()
		else
			stopAutoCrouchLogic()
		end
	end
})

AutoCrouch:Toggle({
	Title = "Show Auto Crouch Button",
	Desc = "Creates a shortcut for mobile.",
	Value = false,
	Callback = function(state)
		local gui = createRiseCrouchGui()
		gui.Parent = state and player:WaitForChild("PlayerGui") or nil
	end
})

AutoCrouch:Dropdown({
	Title = "Auto Crouch Mode",
	Desc = "Air: In the air, Ground: On the ground, Normal: Spam",
	Values = {"Air", "Normal", "Ground"},
	Value = "Air",
	Callback = function(option)
		featureStates.AutoCrouchMode = option
	end
})

UserInputService.InputBegan:Connect(function(input, gp)
	if gp then return end
	if input.KeyCode == Enum.KeyCode.C then
		local newState = not featureStates.AutoCrouch
		AutoCrouchToggle:SetValue(newState)
	end
end)

LagSwitch1 = Tabs.DashTab:Section({Opened = true, Box = true, BoxBorder = true, Icon = 'square-power', 
	Title = "Lag Switch",
})

local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

getgenv().lagSwitchEnabled = false
getgenv().lagDuration = 0.5

local isLagActive = false
local lagInputConnection = nil
local mobileLagGui = nil

local function triggerLag()
	if isLagActive or not getgenv().lagSwitchEnabled then return end
	isLagActive = true

	task.spawn(function()
		local duration = getgenv().lagDuration or 0.5
		local startTime = tick()
		while tick() - startTime < duration do
			local a = math.random(1, 1000000) * math.random(1, 1000000)
			a = a / math.random(1, 10000)
		end
		isLagActive = false
	end)
end

local function connectLKey()
	if lagInputConnection then return end
	lagInputConnection = UserInputService.InputBegan:Connect(function(input, gp)
		if gp then return end
		if input.KeyCode == Enum.KeyCode.L and getgenv().lagSwitchEnabled then
			triggerLag()
		end
	end)
end

local function disconnectLKey()
	if lagInputConnection then
		lagInputConnection:Disconnect()
		lagInputConnection = nil
	end
end

local function CreateLagMobileUI()
	if mobileLagGui then return mobileLagGui end

	local Riselagswitch = Instance.new("ScreenGui")
	local switch = Instance.new("Frame")
	local Button = Instance.new("TextButton")
	local UICorner = Instance.new("UICorner")
	local TextLabel = Instance.new("TextLabel")

	Riselagswitch.Name = "Riselagswitch"
	Riselagswitch.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	Riselagswitch.ResetOnSpawn = false

	switch.Name = "switch"
	switch.Parent = Riselagswitch
	switch.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	switch.BackgroundTransparency = 1.000
	switch.Position = UDim2.new(0.5, -71, 0.3, 0)
	switch.Size = UDim2.new(0, 142, 0, 40)

	Button.Name = "Button"
	Button.Parent = switch
	Button.BackgroundColor3 = Color3.fromRGB(126, 0, 0)
	Button.BackgroundTransparency = 0.350
	Button.Size = UDim2.new(1, 0, 1, 0)
	Button.Font = Enum.Font.SourceSans
	Button.Text = ""

	UICorner.CornerRadius = UDim.new(0, 15)
	UICorner.Parent = Button

	TextLabel.Parent = Button
	TextLabel.BackgroundTransparency = 1.000
	TextLabel.Size = UDim2.new(1, 0, 1, 0)
	TextLabel.Font = Enum.Font.Highway
	TextLabel.Text = "Lag Switch"
	TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.TextSize = 17.000

	local dragging, dragInput, dragStart, startPos
	Button.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = switch.Position
		end
	end)

	UserInputService.InputChanged:Connect(function(input)
		if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
			local delta = input.Position - dragStart
			switch.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		end
	end)

	Button.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = false
		end
	end)

	Button.MouseButton1Click:Connect(function()
		triggerLag()
		Button.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
		task.wait(0.1)
		Button.BackgroundColor3 = Color3.fromRGB(126, 0, 0)
	end)

	mobileLagGui = Riselagswitch
	return Riselagswitch
end

LagSwitch1:Toggle({
	Title = "Lag Switch",
	Desc = "PC Keybind: L",
	Value = false,
	Callback = function(state)
		getgenv().lagSwitchEnabled = state
		if state then
			connectLKey()
		else
			disconnectLKey()
		end
	end
})

LagSwitch1:Toggle({
	Title = "Show Lag Switch UI",
	Desc = "Adds shortcuts for mobile users.",
	Value = false,
	Callback = function(state)
		local gui = CreateLagMobileUI()
		gui.Parent = state and LocalPlayer:WaitForChild("PlayerGui") or nil
	end
})

LagSwitch1:Input({
	Title = "Lag Duration (seconds)",
	Desc = "Lag time (example: 0.5)",
	Placeholder = "0.5",
	Callback = function(text)
		local num = tonumber(text)
		if num and num > 0 then
			getgenv().lagDuration = num
		end
	end
})

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Debris = game:GetService("Debris")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

getgenv().EasyTrimp = { Enabled = false, BaseSpeed = 50, ExtraSpeed = 100, FloorDrop = 0 }
getgenv().lagSwitchEnabled = false
getgenv().lagDuration = 0.5

local featureStates = {
	AutoCrouch = false,
	AutoCrouchMode = "Air",
	AutoXP = false,
	AntiAFK = false,
	TicketsFarm = false,
	MoneyFarm = false,
	FastRevive = false,
	SuperBounceEnabled = false,
	BounceHeight = 190
}

local function MakeDraggable(frame, dragHandle)
	local dragging, dragInput, dragStart, startPos
	dragHandle.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = frame.Position
		end
	end)
	UserInputService.InputChanged:Connect(function(input)
		if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
			local delta = input.Position - dragStart
			frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		end
	end)
	dragHandle.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = false
		end
	end)
end

local function CreateTrimpMobile()
	local RiseTrimp = Instance.new("ScreenGui")
	local Trimp = Instance.new("Frame")
	local Button = Instance.new("TextButton")
	local UICorner = Instance.new("UICorner")
	local TextLabel = Instance.new("TextLabel")

	RiseTrimp.Name = "RiseTrimp"
	RiseTrimp.ResetOnSpawn = false
	Trimp.Name = "Trimp"
	Trimp.Parent = RiseTrimp
	Trimp.BackgroundTransparency = 1
	Trimp.Position = UDim2.new(0.6, 0, 0.5, 0)
	Trimp.Size = UDim2.new(0, 100, 0, 100)

	Button.Name = "Button"
	Button.Parent = Trimp
	Button.BackgroundColor3 = Color3.fromRGB(126, 0, 0)
	Button.BackgroundTransparency = 0.35
	Button.Size = UDim2.new(0, 142, 0, 40)
	Button.Text = ""

	UICorner.CornerRadius = UDim.new(0, 15)
	UICorner.Parent = Button

	TextLabel.Parent = Button
	TextLabel.BackgroundTransparency = 1
	TextLabel.Size = UDim2.new(1, 0, 1, 0)
	TextLabel.Font = Enum.Font.Highway
	TextLabel.Text = "Easy Trimp"
	TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.TextSize = 17

	MakeDraggable(Trimp, Button)
	Button.MouseButton1Click:Connect(function()
		getgenv().EasyTrimp.Enabled = not getgenv().EasyTrimp.Enabled
	end)
	return RiseTrimp
end

local function CreateCrouchMobile()
	local RiseCrouch = Instance.new("ScreenGui")
	local eee = Instance.new("Frame")
	local Button = Instance.new("TextButton")
	local UICorner = Instance.new("UICorner")
	local TextLabel = Instance.new("TextLabel")

	RiseCrouch.Name = "RiseCrouch"
	RiseCrouch.ResetOnSpawn = false
	eee.Name = "eee"
	eee.Parent = RiseCrouch
	eee.BackgroundTransparency = 1
	eee.Position = UDim2.new(0.6, 0, 0.6, 0)
	eee.Size = UDim2.new(0, 100, 0, 100)

	Button.Name = "Button"
	Button.Parent = eee
	Button.BackgroundColor3 = Color3.fromRGB(126, 0, 0)
	Button.BackgroundTransparency = 0.35
	Button.Size = UDim2.new(0, 142, 0, 40)
	Button.Text = ""

	UICorner.CornerRadius = UDim.new(0, 15)
	UICorner.Parent = Button

	TextLabel.Parent = Button
	TextLabel.BackgroundTransparency = 1
	TextLabel.Size = UDim2.new(1, 0, 1, 0)
	TextLabel.Font = Enum.Font.Highway
	TextLabel.Text = "Auto Crouch"
	TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.TextSize = 17

	MakeDraggable(eee, Button)
	Button.MouseButton1Click:Connect(function()
		featureStates.AutoCrouch = not featureStates.AutoCrouch
	end)
	return RiseCrouch
end

local function CreateLagMobile()
	local Riselagswitch = Instance.new("ScreenGui")
	local switch = Instance.new("Frame")
	local Button = Instance.new("TextButton")
	local UICorner = Instance.new("UICorner")
	local TextLabel = Instance.new("TextLabel")

	Riselagswitch.Name = "Riselagswitch"
	Riselagswitch.ResetOnSpawn = false
	switch.Name = "switch"
	switch.Parent = Riselagswitch
	switch.BackgroundTransparency = 1
	switch.Position = UDim2.new(0.6, 0, 0.7, 0)
	switch.Size = UDim2.new(0, 100, 0, 100)

	Button.Name = "Button"
	Button.Parent = switch
	Button.BackgroundColor3 = Color3.fromRGB(126, 0, 0)
	Button.BackgroundTransparency = 0.35
	Button.Size = UDim2.new(0, 142, 0, 40)
	Button.Text = ""

	UICorner.CornerRadius = UDim.new(0, 15)
	UICorner.Parent = Button

	TextLabel.Parent = Button
	TextLabel.BackgroundTransparency = 1
	TextLabel.Size = UDim2.new(1, 0, 1, 0)
	TextLabel.Font = Enum.Font.Highway
	TextLabel.Text = "Lag Switch"
	TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.TextSize = 17

	MakeDraggable(switch, Button)
	Button.MouseButton1Click:Connect(function()
		if not isLagActive then
			isLagActive = true
			task.spawn(function()
				local startTime = tick()
				while tick() - startTime < (getgenv().lagDuration or 0.5) do
					local a = math.random(1, 10^6) * math.random(1, 10^6)
				end
				isLagActive = false
			end)
		end
	end)
	return Riselagswitch
end

EasyTrimp1 = Tabs.DashTab:Section({Opened = true, Box = true, BoxBorder = true, Icon = 'bike', Title = "Easy Trimp" })

EasyTrimp1:Toggle({
	Title = "Easy Trimp",
	Desc = "Makes trimming much easier in the air.",
	Value = false,
	Callback = function(state) getgenv().EasyTrimp.Enabled = state end
})

local trimpGui = CreateTrimpMobile()
EasyTrimp1:Toggle({
	Title = "Mobile Button",
	Desc = "Creates a mobile toggle for Trimp.",
	Value = false,
	Callback = function(state) trimpGui.Parent = state and LocalPlayer.PlayerGui or nil end
})

EasyTrimp1:Input({
	Title = "Base Speed",
	Desc = "Initial running speed.",
	Placeholder = "50",
	Callback = function(t) getgenv().EasyTrimp.BaseSpeed = tonumber(t) or 50 end
})

AutoCrouch1 = Tabs.DashTab:Section({Opened = true, Box = true, BoxBorder = true, Icon = 'croissant', Title = "Auto Crouch" })

AutoCrouch1:Toggle({
	Title = "Auto Crouch",
	Desc = "Automatically crouches based on mode (Key: C).",
	Value = false,
	Callback = function(state) featureStates.AutoCrouch = state end
})

local crouchGui = CreateCrouchMobile()
AutoCrouch1:Toggle({
	Title = "Mobile Button",
	Desc = "Creates a mobile toggle for Auto Crouch.",
	Value = false,
	Callback = function(state) crouchGui.Parent = state and LocalPlayer.PlayerGui or nil end
})

AutoCrouch1:Dropdown({
	Title = "Auto Crouch Mode",
	Desc = "Select when to crouch.",
	Values = {"Air", "Normal", "Ground"},
	Value = "Air",
	Callback = function(v) featureStates.AutoCrouchMode = v end
})

LagSwitch2 = Tabs.DashTab:Section({Opened = true, Box = true, BoxBorder = true, Icon = 'square-power', Title = "Lag Switch" })

LagSwitch2:Toggle({
	Title = "Lag Switch",
	Desc = "Simulates lag (Key: L).",
	Value = false,
	Callback = function(state) getgenv().lagSwitchEnabled = state end
})

local lagGui = CreateLagMobile()
LagSwitch2:Toggle({
	Title = "Mobile Button",
	Desc = "Creates a mobile trigger for Lag.",
	Value = false,
	Callback = function(state) lagGui.Parent = state and LocalPlayer.PlayerGui or nil end
})

LagSwitch2:Input({
	Title = "Lag Duration",
	Desc = "Duration of the lag in seconds.",
	Placeholder = "0.5",
	Callback = function(t) getgenv().lagDuration = tonumber(t) or 0.5 end
})



Tabs.FarmTab:Paragraph({
	Title = "WARNING",
	Desc = "Enabling Auto-Farm on regular servers will increase your chances of getting banned, so we recommend choosing VIP servers or enabling the Staff-Detector feature from the Utils tab.",

})

Tabs.FarmTab:Paragraph({
	Title = "HzShawde",
	Desc = "Auto-Farm unfortunately got a patch :c but we'll fix this soon </3",

})


Tabs.FarmTab:Toggle({
	Title = "Auto XP",
	Desc = "High speed XP farming. Stay safe in the air.",
	Locked = true,
	LockedTitle = "Patched",
	Value = false, -- default value
	Callback = function(state) 
		print("Toggle Activated" .. tostring(state))
	end
})



Tabs.FarmTab:Toggle({
	Title = "Anti AFK",
	Desc = "Prevents being kicked for inactivity.",
	Value = false, -- default value
	Callback = function(state) 
		print("Toggle Activated" .. tostring(state))
	end
})


Tabs.FarmTab:Toggle({
	Title = "Tickets Farm",
	Desc = "Automatically collects map tickets.",
	Locked = true,
	LockedTitle = "Patched",
	Value = false, -- default value
	Callback = function(state) 
		print("Toggle Activated" .. tostring(state))
	end
})


Tabs.FarmTab:Toggle({
	Title = "Money Farm",
	Desc = "Auto revives downed players for money rewards.",
	Locked = true,
	LockedTitle = "Patched",
	Value = false, -- default value
	Callback = function(state) 
		print("Toggle Activated" .. tostring(state))
	end
})



StaffDetectorSection = Tabs.UtilsTab:Section({Opened = true, Box = true, BoxBorder = true, Icon = 'user-star', 
	Title = "Staff Detector",
})

StaffDetectorSection:Toggle({
	Title = "Staff Detector",
	Desc = "You will be immediately kicked from the server when a staff member joins",
	Value = true, -- default value
	Callback = function(state) 
		print("Toggle Activated" .. tostring(state))
	end
})

GodModeSection = Tabs.UtilsTab:Section({Opened = true, Box = true, BoxBorder = true, Icon = 'shield-user', 
	Title = "God Mode",
})

local players = game:GetService("Players")
local rs = game:GetService("ReplicatedStorage")
local runService = game:GetService("RunService")

local lp = players.LocalPlayer

local godmodeEnabled = false
local godmodeConnections = {}
local godmodeHeartbeat = nil


local function updateGodmodeGui()
	local pg = lp:FindFirstChild("PlayerGui")
	if not pg then return end

	local shared = pg:FindFirstChild("Shared")
	if not shared then return end

	local hud = shared:FindFirstChild("HUD")
	if hud then
		hud.Visible = true
	end

	local respawn = shared:FindFirstChild("Respawn")
	if respawn then
		respawn.Visible = false
	end
end

local function respawnFunc()
	local events = rs:WaitForChild("Events", 5)
	if events then
		local playerEvents = events:WaitForChild("Player", 5)
		if playerEvents then
			local changeMode = playerEvents:WaitForChild("ChangePlayerMode", 5)
			if changeMode then
				changeMode:FireServer(true)
			end
		end
	end
end

local function setupDownControl(character)
	local tetiklendi = false

	local attrConn = character:GetAttributeChangedSignal("DownedTimeLeft"):Connect(function()
		if not godmodeEnabled then return end
		local val = character:GetAttribute("DownedTimeLeft")
		if val and val <= 40 and not tetiklendi then
			tetiklendi = true
			respawnFunc()
		end
	end)
	table.insert(godmodeConnections, attrConn)

	local num = character:FindFirstChild("DownedTimeLeft")
	if num and num:IsA("NumberValue") then
		local valConn = num:GetPropertyChangedSignal("Value"):Connect(function()
			if not godmodeEnabled then return end
			if num.Value <= 40 and not tetiklendi then
				tetiklendi = true
				respawnFunc()
			end
		end)
		table.insert(godmodeConnections, valConn)
	end
end


local function startGodmodeLoop()
	if godmodeHeartbeat then godmodeHeartbeat:Disconnect() end

	godmodeHeartbeat = runService.Heartbeat:Connect(function()
		if not godmodeEnabled then return end

		local character = lp.Character
		if character and character.Parent then
			for name, _ in pairs(character:GetAttributes()) do
				if string.find(string.lower(name), "down") then
					character:SetAttribute(name, false)
				end
			end

			if character:GetAttribute("State") == "Down" then
				character:SetAttribute("State", "Run")
			end

			updateGodmodeGui()
		end
	end)
end

local function enableGodmode()
	if lp.Character then
		setupDownControl(lp.Character)
	end

	local charConn = lp.CharacterAdded:Connect(function(character)
		if godmodeEnabled then
			setupDownControl(character)
		end
	end)
	table.insert(godmodeConnections, charConn)

	startGodmodeLoop()
end

local function disableGodmode()
	for _, conn in pairs(godmodeConnections) do
		if typeof(conn) == "RBXScriptConnection" then
			conn:Disconnect()
		end
	end
	godmodeConnections = {}

	if godmodeHeartbeat then
		godmodeHeartbeat:Disconnect()
		godmodeHeartbeat = nil
	end
end

GodModeSection:Toggle({
	Title = "God Mode",
	Desc = "Thanks, not today.",
	Value = false,
	Callback = function(state)
		godmodeEnabled = state
		if state then
			enableGodmode()
		else
			disableGodmode()
		end
	end
})

BattlePassBypassSection = Tabs.UtilsTab:Section({Opened = true, Box = true, BoxBorder = true, Icon = 'ticket', 
	Title = "BattlePass Bypass",
})

BattlePassBypassSection:Toggle({
	Title = "Open Unlocked Pass",
	Desc = "Hides the 'Unlocked' overlay in the Battlepass view.",
	Value = false,
	Callback = function(state)
		if state then
			if not featureStates.UnlockedPassLoop then
				featureStates.UnlockedPassLoop = RunService.Heartbeat:Connect(function()
					pcall(function()
						local menu = game:GetService("Players").LocalPlayer.PlayerGui.Menu
						if menu and menu.Views and menu.Views.Battlepass and menu.Views.Battlepass.ViewPass then
							local center = menu.Views.Battlepass.ViewPass.Center
							if center and center.ViewPass and center.ViewPass.Unlocked then
								center.ViewPass.Unlocked.Visible = false
							end
						end
					end)
				end)
			end
		else
			if featureStates.UnlockedPassLoop then
				featureStates.UnlockedPassLoop:Disconnect()
				featureStates.UnlockedPassLoop = nil

				pcall(function()
					local menu = game:GetService("Players").LocalPlayer.PlayerGui.Menu
					if menu and menu.Views and menu.Views.Battlepass and menu.Views.Battlepass.ViewPass then
						local center = menu.Views.Battlepass.ViewPass.Center
						if center and center.ViewPass and center.ViewPass.Unlocked then
							center.ViewPass.Unlocked.Visible = true
						end
					end
				end)
			end
		end
	end
})

BattlePassBypassSection:Toggle({
	Title = "Open Exchange",
	Desc = "Switches the Battlepass view to the Exchange screen.",
	Value = false,
	Callback = function(state)
		if state then
			if not featureStates.ExchangeOpenLoop then
				featureStates.ExchangeOpenLoop = RunService.Heartbeat:Connect(function()
					pcall(function()
						local menu = game:GetService("Players").LocalPlayer.PlayerGui.Menu
						if menu and menu.Views and menu.Views.Battlepass then
							if menu.Views.Battlepass.Exchange then
								menu.Views.Battlepass.Exchange.Visible = true
							end

							if menu.Views.Battlepass.ViewPass then
								menu.Views.Battlepass.ViewPass.Visible = false
							end
						end
					end)
				end)
			end
		else
			if featureStates.ExchangeOpenLoop then
				featureStates.ExchangeOpenLoop:Disconnect()
				featureStates.ExchangeOpenLoop = nil

				pcall(function()
					local menu = game:GetService("Players").LocalPlayer.PlayerGui.Menu
					if menu and menu.Views and menu.Views.Battlepass then
						if menu.Views.Battlepass.Exchange then
							menu.Views.Battlepass.Exchange.Visible = false
						end
						if menu.Views.Battlepass.ViewPass then
							menu.Views.Battlepass.ViewPass.Visible = true
						end
					end
				end)
			end
		end
	end
})

BattlePassBypassSection:Toggle({
	Title = "Full Bright",
	Desc = "Removes shadows and maximizes lighting brightness.",
	Value = false,
	Callback = function(state)
		featureStates.FullBright = state
		local Lighting = game:GetService("Lighting")
		local RunService = game:GetService("RunService")

		if state then
			featureStates.originalBrightness = Lighting.Brightness
			featureStates.originalAmbient = Lighting.Ambient
			featureStates.originalOutdoorAmbient = Lighting.OutdoorAmbient
			featureStates.originalColorShiftBottom = Lighting.ColorShift_Bottom
			featureStates.originalColorShiftTop = Lighting.ColorShift_Top

			local function applyFullBright()
				Lighting.Brightness = 1
				Lighting.Ambient = Color3.new(1, 1, 1)
				Lighting.OutdoorAmbient = Color3.new(1, 1, 1)
				Lighting.ColorShift_Bottom = Color3.new(1, 1, 1)
				Lighting.ColorShift_Top = Color3.new(1, 1, 1)
			end

			applyFullBright()

			if featureStates.fullBrightConnection then
				featureStates.fullBrightConnection:Disconnect()
			end
			featureStates.fullBrightConnection = RunService.Heartbeat:Connect(function()
				if featureStates.FullBright then
					applyFullBright()
				end
			end)

			featureStates.fullBrightCharConnection = game.Players.LocalPlayer.CharacterAdded:Connect(function()
				task.wait(1)
				if featureStates.FullBright then
					applyFullBright()
				end
			end)
		else
			if featureStates.fullBrightConnection then
				featureStates.fullBrightConnection:Disconnect()
			end
			if featureStates.fullBrightCharConnection then
				featureStates.fullBrightCharConnection:Disconnect()
			end

			if featureStates.originalBrightness then
				Lighting.Brightness = featureStates.originalBrightness
				Lighting.Ambient = featureStates.originalAmbient
				Lighting.OutdoorAmbient = featureStates.originalOutdoorAmbient
				Lighting.ColorShift_Bottom = featureStates.originalColorShiftBottom
				Lighting.ColorShift_Top = featureStates.originalColorShiftTop
			end
		end
	end
})

BattlePassBypassSection:Toggle({
	Title = "No Fog",
	Desc = "Clears all atmospheric fog and depth effects.",
	Value = false,
	Callback = function(state)
		local Lighting = game:GetService("Lighting")
		if state then
			featureStates.originalFogEnd = Lighting.FogEnd
			featureStates.originalAtmospheres = {}
			for _, atmosphere in ipairs(Lighting:GetChildren()) do
				if atmosphere:IsA("Atmosphere") then
					table.insert(featureStates.originalAtmospheres, atmosphere:Clone())
					atmosphere:Destroy()
				end
			end
			Lighting.FogEnd = 1000000
		else
			if featureStates.originalFogEnd then
				Lighting.FogEnd = featureStates.originalFogEnd
			end
			if featureStates.originalAtmospheres then
				for _, atmosphere in ipairs(featureStates.originalAtmospheres) do
					atmosphere.Parent = Lighting
				end
			end
		end
	end
})


Tabs.CreditsTab:Paragraph({
	Title = "Main Owner",
	Desc = "HzShawde (He was known as Shadow.)"
})

Tabs.CreditsTab:Paragraph({
	Title = "Other Owner",
	Desc = "RightHit"
})

Tabs.CreditsTab:Paragraph({
	Title = "Helper",
	Desc = "Vexon"
})
