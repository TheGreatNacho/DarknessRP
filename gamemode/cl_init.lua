include( 'shared.lua' )
ESP = false
A = nil
function HUDHide( myhud )
	for k, v in pairs {"CHudHealth","CHudBattery"} do
		if myhud == v then return false end
	end
end

function GM:HUDDrawTargetID()
     return false
end

surface.CreateFont("ScoreboardPlayerName", {
	size = 20,
	weight = 500,
	antialias = true,
	shadow = false,
	font = "Face Your Fears"})
function HUDMaking()
	local ply = LocalPlayer()
	local HP = ply:Health()
	local Arm = ply:Armor()
	local Aim = ply:GetEyeTrace().Entity
	if HP > 1 then
		draw.RoundedBox( 8, 70, ScrH() - 100, 400, 20, Color( 40, 40, 40, 120 ))
		draw.RoundedBox( 8, 70, ScrH() - 100, math.Clamp( HP, 4, 400 )*4, 20, Color( 120, 0, 0, 200 ))
	end
	if Arm > 1 then
		draw.RoundedBox( 8, 70, ScrH() - 70, 400, 20, Color( 40, 40, 40, 120 ))
		draw.RoundedBox( 8, 70, ScrH() - 70, math.Clamp( Arm, 4, 400 )*4, 20, Color( 0, 0, 120, 200 ))
	end
	
	draw.RoundedBox( 8, 30, 50, 170, 54, Color( 0, 0, 120, 200 ))
	draw.DrawText("Role: "..team.GetName(ply:Team()), "ScoreboardPlayerName", 40, 60, Color( 200, 0, 0, 255),0)
	
	if render.GetLightColor(ply:EyePos()):Distance(Vector(0,0,0))*1000 > 15 and ply:Team() == 1 then
		draw.RoundedBox( 8, ScrW()/2 - 200, 10, 400, 40, Color( 200, 0, 0, 120 ))
		draw.DrawText("GET OUT OF THE LIGHT", "ScoreboardPlayerName", ScrW()/2 - 75, 20, Color( 0, 0, 0, 255), 0)
		net.Start("HurtDark")
		net.WriteEntity(ply)
		net.SendToServer()
	end
	if string.sub(ply:GetModel(), 23, 26) == "male" then
		draw.DrawText("Sex: Male", "ScoreboardPlayerName", 40, 75, Color( 200, 0, 0, 255), 0)
	elseif string.sub(ply:GetModel(), 23, 26) == "fema" then
	draw.DrawText("Sex: Female", "ScoreboardPlayerName", 40, 75, Color( 200, 0, 0, 255), 0)
	else
		draw.DrawText("Sex: Unknown", "ScoreboardPlayerName", 40, 75, Color( 200, 0, 0, 255), 0)
	end
	--Adding GUI for looking at items--
	if (ply:EyePos():Distance( Aim:GetPos() ) < 256) then
		if Aim:GetClass() == "func_door" then
			local PositionA = ( Aim:GetPos() + Vector( 0,0,0 ) ):ToScreen()
			local PositionB = ( Aim:GetPos() + Vector( 0,0,-5 ) ):ToScreen()
			draw.DrawText( "This is a door", "ScoreboardPlayerName", PositionA.x, PositionA.y, Color(255,100,0,255), 1 )
			draw.DrawText( "Press 'E' to open", "ScoreboardPlayerName", PositionB.x, PositionB.y, Color(255,100,0,255), 1 )
		end
		if Aim:GetClass() == "prop_door_rotating" then
			local Position = ( Aim:GetPos() + Vector( 0,0,0 ) ):ToScreen()
			draw.DrawText( "This is a door. Press 'E' to open", "ScoreboardPlayerName", Position.x+30, Position.y, Color(255,100,0,255), 1 )
		end
		if Aim:GetClass() == "weapon_pistol" then
			local Position = ( Aim:GetPos() + Vector( 0,0,0 ) ):ToScreen()
			draw.RoundedBox( 8, Position.x, Position.y, 170, 80, Color( 100, 0, 0, 200 ))
			draw.DrawText( "Pistol", "ScoreboardPlayerName", Position.x+80, Position.y, Color(0,0,0,255), 1 )
			draw.DrawText( "Type: Light weapon", "ScoreboardPlayerName", Position.x+5, Position.y+15, Color(0,0,0,255), 0 )
			draw.DrawText( "Description: A silver", "ScoreboardPlayerName", Position.x+5, Position.y+30, Color(0,0,0,255), 0 )
			draw.DrawText( "pistol used for short", "ScoreboardPlayerName", Position.x+5, Position.y+45, Color(0,0,0,255), 0 )
			draw.DrawText( "range combat.", "ScoreboardPlayerName", Position.x+5, Position.y+60, Color(0,0,0,255), 0 )
		end
		if Aim:GetClass() == "weapon_crowbar" then
			local Position = ( Aim:GetPos() + Vector( 0,0,0 ) ):ToScreen()
			draw.RoundedBox( 8, Position.x, Position.y, 170, 80, Color( 100, 0, 0, 200 ))
			draw.DrawText( "Crowbar", "ScoreboardPlayerName", Position.x+80, Position.y, Color(0,0,0,255), 1 )
			draw.DrawText( "Type: Light weapon", "ScoreboardPlayerName", Position.x+5, Position.y+15, Color(0,0,0,255), 0 )
			draw.DrawText( "Description: A long", "ScoreboardPlayerName", Position.x+5, Position.y+30, Color(0,0,0,255), 0 )
			draw.DrawText( "bar, usually used for", "ScoreboardPlayerName", Position.x+5, Position.y+45, Color(0,0,0,255), 0 )
			draw.DrawText( "opening crates.", "ScoreboardPlayerName", Position.x+5, Position.y+60, Color(0,0,0,255), 0 )
		end
		if Aim:GetClass() == "weapon_shotgun" then
			local Position = ( Aim:GetPos() + Vector( 0,0,0 ) ):ToScreen()
			draw.RoundedBox( 8, Position.x, Position.y, 170, 80, Color( 100, 0, 0, 200 ))
			draw.DrawText( "Shotgun", "ScoreboardPlayerName", Position.x+80, Position.y, Color(0,0,0,255), 1 )
			draw.DrawText( "Type: Heavy weapon", "ScoreboardPlayerName", Position.x+5, Position.y+15, Color(0,0,0,255), 0 )
			draw.DrawText( "Description: A gun that", "ScoreboardPlayerName", Position.x+5, Position.y+30, Color(0,0,0,255), 0 )
			draw.DrawText( "can fire two scatter", "ScoreboardPlayerName", Position.x+5, Position.y+45, Color(0,0,0,255), 0 )
			draw.DrawText( "bullets.", "ScoreboardPlayerName", Position.x+5, Position.y+60, Color(0,0,0,255), 0 )
		end
		if Aim:GetClass() == "weapon_smg1" then
			local Position = ( Aim:GetPos() + Vector( 0,0,0 ) ):ToScreen()
			draw.RoundedBox( 8, Position.x, Position.y, 170, 80, Color( 100, 0, 0, 200 ))
			draw.DrawText( "Mp 7", "ScoreboardPlayerName", Position.x+80, Position.y, Color(0,0,0,255), 1 )
			draw.DrawText( "Type: Heavy weapon", "ScoreboardPlayerName", Position.x+5, Position.y+15, Color(0,0,0,255), 0 )
			draw.DrawText( "Description: A gun that", "ScoreboardPlayerName", Position.x+5, Position.y+30, Color(0,0,0,255), 0 )
			draw.DrawText( "fire multible bullets over", "ScoreboardPlayerName", Position.x+5, Position.y+45, Color(0,0,0,255), 0 )
			draw.DrawText( "a shot period.", "ScoreboardPlayerName", Position.x+5, Position.y+60, Color(0,0,0,255), 0 )
		end
	end
	--------------------------------------
	if ESP == true then
		if ply:IsAdmin() then
			--Nothing is ment to be here--
		else
			if Aim:IsValid() then
				if ply:Team() ~= 1 then
					local Position = ( Aim:GetPos() + Vector( 0,0,80 ) ):ToScreen()
					Name = Aim:Name()
					if Aim:Team() == 1 then
						Name = "Unknown" 
					else 
						Name = Aim:Name()
					end
					draw.DrawText( Name, "ScoreboardPlayerName", Position.x, Position.y+15, team.GetColor(Aim:Team()), 1 )
				end
			end
		end
	else
		if Aim:IsValid() then
			if ply:Team() ~= 1 then
			local Position = ( Aim:GetPos() + Vector( 0,0,80 ) ):ToScreen()
				if Aim:IsPlayer() then
					Name = Aim:Name()
					if Aim:Team() == 1 then
						Name = "Unknown" 
					else 
						Name = Aim:Name()
					end
				draw.DrawText( Name, "ScoreboardPlayerName", Position.x, Position.y+15, team.GetColor(Aim:Team()), 1 )
				end
			end
		end
	end
	-------------------------------------
	
	for k,v in pairs ( player.GetAll() ) do
--[[ Darkness ESP ]]--
		if ply:Team() == 1 then
			local Position = ( v:GetPos() + Vector( 0,0,80 ) ):ToScreen()
			local Name = ""
			local Team = ""
			local Light = ""
			local Col = Color(255,255,255)
			if v == LocalPlayer() then
				Name = "" 
				Team = ""
				Light = ""
			else 
				Name = v:Name()
				if render.GetLightColor(v:EyePos()):Distance(Vector(0,0,0))*1000 > 15 then
					Light = "In Light"
				else
					Light = "In the Darkness"
				end
				if v:Team() == 2 then
					Team = "Victom"
					Col = Color(255,255,255)
				elseif v:Team() == 3 then
					Team = "Minion"
					Col = Color(100,0,0)
				elseif v:Team() == 4 then
					Team = "Dead"
					Col = Color(100,0,0)
				else
					Team = "Darkness"
					Col = Color(100,0,0)
				end
			end
				
			draw.DrawText( Light, "ScoreboardPlayerName", Position.x, Position.y-20, Col, 1 )
			draw.DrawText( Name, "ScoreboardPlayerName", Position.x, Position.y-5, Col, 1 )
			draw.DrawText( Team, "ScoreboardPlayerName", Position.x, Position.y+10, Col, 1 )
			--Health and Armor bar--
			draw.RoundedBox(4, Position.x-30, Position.y+25,60,10,Color(50,50,50,200))
			if v:Health()>1 then
				draw.RoundedBox(4, Position.x-30, Position.y+25,v:Health()/100*60,5,Color(255,0,0,200))
			end
			if v:Armor()>1 then
				draw.RoundedBox(4, Position.x-30, Position.y+30,v:Armor()/100*60,5,Color(0,0,255,200))
			end
				
		end
	end
	if ESP == true then
		for k,v in pairs ( player.GetAll() ) do
			if ply:IsAdmin() then
				local Position = ( v:GetPos() + Vector( 0,0,80 ) ):ToScreen()
				local Name = ""
				if v == LocalPlayer() then
					Name = "" else Name = v:Name()
				end
				draw.DrawText( Name, "ScoreboardPlayerName", Position.x, Position.y+15, team.GetColor(v:Team()), 1 )
				draw.DrawText( team.GetName(v:Team()), "ScoreboardPlayerName", Position.x, Position.y+30, team.GetColor(v:Team()), 1 )
			end
		end
	end
	
	for k,v in pairs ( team.GetPlayers(3) ) do
		if ply:Team() == 3 then
			local Position = ( v:GetPos() + Vector( 0,0,80 ) ):ToScreen()
			local Name = ""
			if v == LocalPlayer() then
				Name = "" else Name = v:Name()
			end
				draw.DrawText( "Friend", "ScoreboardPlayerName", Position.x, Position.y, team.GetColor(v:Team()), 1 )
		
		end
	end
end

function GM:OnPlayerChat(  ply,  strText,  bTeamOnly,  bPlayerIsDead )
	local tab = {}
	local text = strText
	if cl_name == "" then
		cl_name = ply:Name()
	end
	if string.sub(strText, 1,1) == "/" then
		print(ply:Name().." "..strText)
		if ( string.sub(strText, 1,2) == "//" or string.sub(strText, 1,4) == "/ooc") then
			if string.sub(strText, 1,2) == "//" and  !string.sub(strText, 1,3) == "// " then
				text = string.sub(strText, 3, string.len(strText))
			elseif string.sub(strText, 1,3) == "// " then
				text = string.sub(strText, 4, string.len(strText))
			else
				text = string.sub(strText, 6, string.len(strText))
			end
			table.insert( tab, Color( 100, 0, 0 ) )
			table.insert( tab, "(OOC) " )
			table.insert( tab, team.GetColor(ply:Team()))
			table.insert( tab, ply)
			table.insert( tab, Color( 255, 255, 255 ) )
			table.insert( tab, ": ")
			table.insert( tab, text )
		elseif ( string.sub(strText, 1,3) == "/me") then
			text = string.sub(strText, 4, string.len(strText))
			
			table.insert( tab, team.GetColor(ply:Team()) )
			table.insert( tab, ply:GetName() )
			table.insert( tab, text )
		end
	end
	
	if string.sub(strText, 1,1) ~= "/" then
		if ply:Team() == 1 then
			table.insert( tab, Color(100,0,0) )
			table.insert( tab, ply )
		else
			table.insert( tab, Color(255,255,255) )
			table.insert( tab, ply)
		end
		
		table.insert( tab, Color( 255, 255, 255 ) )
		table.insert( tab, ": " )
		table.insert( tab, Color( 255, 255, 255 ) )
		table.insert( tab, text )
	end
	
	chat.AddText( unpack(tab) )

	return true
end	
function DermaA()
	local base = vgui.Create( "DFrame" )
	local ply = LocalPlayer()
	
	base:SetPos( ScrW()/2 - 225, ScrH()/2 - ScrH()/3 )
	base:SetSize( 450, 400 )
	base:SetVisible( true )
	base:SetTitle( "DarknessRP" )
	base:SetDraggable( false )
	base:ShowCloseButton( true )
	base.Paint = function()
		surface.SetDrawColor( 0, 0, 0, 255 )
		surface.DrawRect( 0, 0, base:GetWide(), base:GetTall() )
	end
	base:MakePopup()
	
	local icon = vgui.Create( "DModelPanel", base )
	icon:SetModel( LocalPlayer():GetModel() )
	icon:SetPos(0, 100)
	icon:SetSize( 400, 400 )
	icon:SetCamPos( Vector( 10, 95, 40 ) )
	icon:SetLookAt( Vector( 10, 10, 25 ) )
	-----------------------------------------
	if ply:Team() == 1 then
		local MiB = vgui.Create("DButton")
		MiB:SetParent( base )
		MiB:SetPos(340,340)
		MiB:SetSize(80,30)
		MiB:SetText("Select Minion")
		MiB.DoClick = function ()
		local MenuButtonOptions = DermaMenu() -- Creates the menu
			for k,v in pairs(team.GetPlayers(4)) do
				MenuButtonOptions:AddOption(v:Nick(), function()
				RunConsoleCommand("say", "/minion "..v:Nick())
			end)
		end
		MenuButtonOptions:Open() -- Open the menu AFTER adding your options
	end
	--------The above shall be removed if it turns out to be a pain in the fucking ass---------
		local D1A = vgui.Create( "DButton" )
		D1A:SetParent( base )
		D1A:SetPos(50,140)
		D1A:SetSize(60,30)
		D1A:SetText("Death")
		D1A.DoClick = function()
			for k,v in pairs(player.GetAll()) do
				v:EmitSound(  "/ambient/voices/citizen_beaten3.wav",  100,  100 )
			end
		end
		
		local D1B = vgui.Create( "DButton" )
		D1B:SetParent( base )
		D1B:SetPos(50,200)
		D1B:SetSize(60,30)
		D1B:SetText("Call")
		D1B.DoClick = function()
			for k,v in pairs(player.GetAll()) do
				v:EmitSound(  "/npc/fast_zombie/fz_scream1.wav",  100,  100 )
			end
		end
		
		local D1C = vgui.Create( "DButton" )
		D1C:SetParent( base )
		D1C:SetPos(50,260)
		D1C:SetSize(60,30)
		D1C:SetText("Cry")
		D1C.DoClick = function()
			timer.Create("Cry", 9, 1, function()
				for k,v in pairs(player.GetAll()) do
					concommand.Run(v, "drp_stopsound")
					v:EmitSound(  "/ambient/voices/crying_loop1.wav",  100,  100 )
				end
			end)
		end
		
		local D1D = vgui.Create( "DButton" )
		D1D:SetParent( base )
		D1D:SetPos(50,320)
		D1D:SetSize(60,30)
		D1D:SetText("Scream")
		D1D.DoClick = function()
			for k,v in pairs(player.GetAll()) do
				v:EmitSound(  "/ambient/creatures/town_child_scream1.wav",  100,  100 )
			end
		end
	end
	
	if ply:IsAdmin() then
		local buttonA = vgui.Create( "DButton" )
		buttonA:SetParent( base )
		if ESP == false then
			buttonA:SetText( "ESP = Off" )
		else
			buttonA:SetText( "ESP = On" )
		end
		buttonA:SetPos(360, 70)
		buttonA:SetSize(60,30)
		buttonA.DoClick = function()
			if ESP == false then
				ESP = true
				buttonA:SetText( "ESP = On" )
				base:SetVisible( false )
			else
				ESP = false
				buttonA:SetText( "ESP = Off" )
				base:SetVisible( false )
			end
		end
	end
	
	local textA = vgui.Create( "DTextEntry", base )
	textA:SetPos( 100,40 )
	textA:SetTall( 20 )
	textA:SetWide( 320 )
	textA:SetEnterAllowed( true )
	textA.OnEnter = function()
		/*if textA:GetValue() == "" then
			chat.AddText("You changed your name to: Anon")
			if string.len(ply:Name()) > 10 then
				ply:SetRPName(" ("..string.sub(ply:Name(), 1, 10)..") Anon")
			else
				ply:SetRPName(" ("..ply:Name()..") Anon")
			end
		else
			chat.AddText("You changed your name to: "..textA:GetValue())
			if string.len(ply:Name()) > 10 then
				ply:SetRPName(" ("..string.sub(ply:Name(), 1, 10)..") "..textA:GetValue())
			else
				ply:SetRPName(" ("..ply:Name()..") "..textA:GetValue())
			end
		end
		base:SetVisible( false )*/
	end
	
	local labelA = vgui.Create("DLabel", base)
	labelA:SetPos(30,43)
	labelA:SetColor(Color(255,255,255,255))
	labelA:SetFont("default")
	labelA:SetText("RP Name: ")
	labelA:SizeToContents()
	
	local labelB = vgui.Create("DLabel", base)
	labelB:SetPos(30,100)
	labelB:SetColor(Color(255,255,255,255))
	labelB:SetFont("default")
	labelB:SetText("This is you: "..ply:Name())
	labelB:SizeToContents()
end
		 
--Event Hooks-- 
usermessage.Hook( "OpenA", DermaA )
hook.Add("HUDShouldDraw", "HUDHide", HUDHide)
hook.Add("HUDPaint", "HUDMaking", HUDMaking)

