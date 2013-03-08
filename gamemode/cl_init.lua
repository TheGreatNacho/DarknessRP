include( 'shared.lua' )
ESP = false
function HUDHide( myhud )
	for k, v in pairs {"CHudHealth","CHudBattery"} do
		if myhud == v then return false end
	end
end

function GM:HUDDrawTargetID()
     return false
end

surface.CreateFont("ScoreboardPlayerName", {
	size = 19,
	weight = 500,
	antialias = true,
	shadow = false,
	font = "coolvetica"})
function HUDMaking()
	local ply = LocalPlayer()
	local HP = ply:Health()
	local Arm = ply:Armor()
	local Aim = ply:GetEyeTrace().Entity

	draw.RoundedBox( 8, 70, ScrH() - 100, 400, 20, Color( 40, 40, 40, 120 ))
	draw.RoundedBox( 8, 70, ScrH() - 100, math.Clamp( HP, 4, 400 )*4, 20, Color( 120, 0, 0, 200 ))
	draw.RoundedBox( 8, 70, ScrH() - 70, 400, 20, Color( 40, 40, 40, 120 ))
	draw.RoundedBox( 8, 70, ScrH() - 70, math.Clamp( Arm, 4, 400 )*4, 20, Color( 0, 0, 120, 200 ))
	
	draw.RoundedBox( 8, 30, 50, 170, 54, Color( 0, 0, 120, 200 ))
	draw.DrawText("Role: "..team.GetName(ply:Team()), "ScoreboardPlayerName", 40, 60, Color( 200, 0, 0, 255),0)
	if string.sub(ply:GetModel(), 23, 26) == "male" then
		draw.DrawText("Sex: Male", "ScoreboardPlayerName", 40, 75, Color( 200, 0, 0, 255), 0)
	elseif string.sub(ply:GetModel(), 23, 26) == "fema" then
	draw.DrawText("Sex: Female", "ScoreboardPlayerName", 40, 75, Color( 200, 0, 0, 255), 0)
	else
		draw.DrawText("Sex: Unknown", "ScoreboardPlayerName", 40, 75, Color( 200, 0, 0, 255), 0)
	end
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
	
	for k,v in pairs ( player.GetAll() ) do
		if ply:Team() == 1 then
			local Position = ( v:GetPos() + Vector( 0,0,80 ) ):ToScreen()
			local Name = ""
			local Team = ""
			local Col = Color(255,255,255)
			if v == LocalPlayer() then
				Name = "" 
			else 
				Name = v:Name()
			end
			if v:Team() == 2 then
				Team = "Victom"
				Col = Color(255,255,255)
			elseif v:Team() == 3 then
				Team = "Minion"
				Col = Color(200,0,0)
			else
				Team = "Darkness"
				Col = Color(200,0,0)
			end
				draw.DrawText( Name, "ScoreboardPlayerName", Position.x, Position.y+15, Col, 1 )
				draw.DrawText( Team, "ScoreboardPlayerName", Position.x, Position.y+30, Col, 1 )
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
	if name == "" then
		ply:PrintMessage( HUD_PRINTTALK, "Please press F4 and set an RP name." )
		name = ply:Name()
	end
	if string.sub(strText, 1,1) == "/" then
		print(ply:Name().." "..strText)
		if ( string.sub(strText, 1,2) == "//") then
			text = string.sub(strText, 3, string.len(strText))
			table.insert( tab, Color( 200, 0, 0 ) )
			table.insert( tab, "(OOC) " )
			table.insert( tab, team.GetColor(ply:Team()))
			table.insert( tab, name)
			table.insert( tab, Color( 255, 255, 255 ) )
			table.insert( tab, ": ")
		end
		
		
		if ( string.sub(strText, 1,3) == "/me") then
			text = string.sub(strText, 4, string.len(strText))
			
			table.insert( tab, team.GetColor(ply:Team()) )
			table.insert( tab, name..text )
		else
			table.insert( tab, Color( 255, 255, 255 ) )
			table.insert( tab, text )
		end
	end
	
	
	
	if string.sub(strText, 1,1) ~= "/" then
		if ply:Team() == 1 then
			table.insert( tab, Color(255,0,0) )
			table.insert( tab, name )
		else
			table.insert( tab, Color(255,255,255) )
			table.insert( tab, name )
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
	
	base:SetPos( ScrW()/2 - 225, ScrH()/2 - 100 )
	base:SetSize( 450, 110 )
	base:SetVisible( true )
	base:SetTitle( "DarknessRP" )
	base:SetDraggable( false )
	base:ShowCloseButton( true )
	base:MakePopup()
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
		if textA:GetValue() == "" then
			chat.AddText("You changed your name to: Anon")
			name = "Anon"
		else
			chat.AddText("You changed your name to: "..textA:GetValue())
			if string.len(ply:Name()) > 10 then
				name = (" ("..string.sub(ply:Name(), 1, 10)..") "..textA:GetValue())
			else
				name = (" ("..ply:Name()..") "..textA:GetValue())
			end
		end
		base:SetVisible( false )
	end
	
	local labelA = vgui.Create("DLabel", base)
	labelA:SetPos(30,43)
	labelA:SetColor(Color(255,255,255,255))
	labelA:SetFont("default")
	labelA:SetText("RP Name: ")
	labelA:SizeToContents()
end
		 
--Timers and event hooks-- 
usermessage.Hook( "OpenA", DermaA )
hook.Add("HUDShouldDraw", "HUDHide", HUDHide)
hook.Add("HUDPaint", "HUDMaking", HUDMaking)

