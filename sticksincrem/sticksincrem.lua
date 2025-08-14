local MacLib = loadstring(game:HttpGet("https://github.com/biggaboy212/Maclib/releases/latest/download/maclib.txt"))()
local Window = MacLib:Window({
	Title = "Sticks Incremental [Test]",
	Subtitle = "Version: Beta 1",
	Size = UDim2.fromOffset(868, 650),
	DragStyle = 1,
	DisabledWindowControls = {},
	ShowUserInfo = true,
	Keybind = Enum.KeyCode.RightControl,
	AcrylicBlur = true,
})
local tabGroups = {
	TabGroup1 = Window:TabGroup()
}
local tabs = {
	Main = tabGroups.TabGroup1:Tab({ Name = "Farming"}),
	Main2 = tabGroups.TabGroup1:Tab({ Name = "Buying"}),
}
local sections = {
	MainSection1 = tabs.Main:Section({ Side = "Left" }),
	MainSection2 = tabs.Main2:Section({ Side = "Left" }),
	MainSection3 = tabs.Main2:Section({ Side = "Left" }),
}
sections.MainSection1:Header({
	Name = "Auto Farm(Server may be lagging)"
})
sections.MainSection2:Header({
	Name = "Auto Buy"
})
sections.MainSection3:Header({
	Name = "Auto Rebirth"
})
local kolvo = nil
sections.MainSection1:Slider({
	Name = "Sticks per second",
	Default = 100,
	Minimum = 1,
	Maximum = 900,
	DisplayMethod = "Sticks",
	Precision = 0,
	Callback = function(Value)
	    kolvo = Value
	end
}, "Slider")
sections.MainSection1:Toggle({
	Name = "Auto Farm Sticks",
	Default = false,
	Callback = function(value)
	    getgenv().state = value
	    while getgenv().state and task.wait(1) do
	        for i = 0, kolvo do
                game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("PickUp"):FireServer("Stick")
            end
	    end
	end,
}, "Toggle")
sections.MainSection2:Toggle({
	Name = "Auto Buy 'More Sticks'",
	Default = false,
	Callback = function(value)
	    getgenv().state2 = value
	    while getgenv().state2 and task.wait() do
            game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("BuyUpgrade"):FireServer("CollectAmount", game:GetService("Players").LocalPlayer:WaitForChild("Values"):WaitForChild("Sticks"))
	    end
	end,
}, "Toggle")
sections.MainSection3:Toggle({
	Name = "Auto Buy Rebirths",
	Default = false,
	Callback = function(value)
	    getgenv().state3 = value
	    while getgenv().state3 and task.wait() do
            game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Rebirth"):FireServer()
	    end
	end,
}, "Toggle")
