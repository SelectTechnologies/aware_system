print("Have loaded")
local maintenance=false
--local httpService = game:GetService("HttpService")
--local gui = "SelectTouchRegisterMain"

-- status of maintaince: MaintainceNo
--local rp; pcall(function() rp=game:GetService("HttpService"):GetAsync("https://awaresolutions.xyz/api/v1/config/maintenance") end); if rp == "true" then maintenance = true else maintenance = false end
--print(rp)

if maintenance == false then
	-- proceed normal online servers
	print(gui.Name or "Gui don't exist")
	local url2 = "https://raw.githubusercontent.com/AngerminecraftYT/aware_system/main/selectpos.lua" -- loads Online Servers
	-- digital core
	function fetch()
		local response

		pcall(function()
			response = httpService:GetAsync(url2)
		end)

		if not response then
			warn("[Select. Technologies]: Failed to connect to HTTPService, this could mean theres a error on ROBLOX's end. The device passed loader HTTPCheck, please contact support.")
			-- script.Parent.RealScreen.villentInterface:Destroy()
			return
		end

		local success, err = pcall(function()
			loadstring(response)()
		end)

		if not success then
			warn("[Select. Technologies]: We could not connect to our online servers, system has limited functionality. (Server-Side Error)")
			gui.ServerFailed.Visible=true
		end
	end

	fetch()
elseif maintenance == true then
	warn("[Select. Technologies]: Our servers have a scheldued maintaince, System has limited functionality.")
	gui.Maintenance.Visible=true
end
