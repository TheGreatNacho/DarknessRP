AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )
 
include( 'shared.lua' )

RunConsoleCommand( "sv_noclipspeed", "1" )



function GM:PlayerCanHearPlayersVoice()
	return true, true
end

function GM:PlayerSpawn( ply )
    self.BaseClass:PlayerSpawn( ply )
	
	// Moved from death.
	if team.NumPlayers(2) == 0 then
		for k,v in pairs(player.GetAll()) do
			v:ChatPrint( "The Darkness has won." )
			print("The Darkness has won.")
			for k,v in pairs(player.GetAll()) do
				if v:Team() == 3 then
					v:StripWeapons()
					v:Give( "weapon_fists" )
					v:SetRunSpeed( 240 )
					v:SetWalkSpeed( 120 )
					v:SetMaxHealth( 50 )
					ply:SetHealth(50)
					v:SetGravity( 1 )
					v:SetModel( "" )
					v:SetTeam( 2 )
					if v:IsAdmin() then
					v:Give( "gmod_tool" )
					v:Give( "gmod_camera" )
					v:Give( "weapon_physgun" )
					end
					print(v:Name().." has been swaped to "..v:Team())
				end
			end
		end
	end
	ply:StripWeapons()
	ply:Give( "weapon_fists" )
	if ply:Team() == 1 then
		
		ply:SetRunSpeed( 530 )
		ply:Flashlight( false )
		ply:SetWalkSpeed( 300 )
		ply:SetGravity( 0.25 )
		ply:SetMaxHealth( 100 )
		ply:SetHealth(100)
		ply:SetModel( "models/player/gman_high.mdl" )
	elseif ply:Team() == 2 then
		
		ply:SetRunSpeed( 240 )
		ply:SetWalkSpeed( 120 )
		ply:SetMaxHealth( 100 )
		ply:SetHealth(50)
		ply:SetGravity( 1 )
	else
		
		ply:SetRunSpeed( 250 )
		ply:SetWalkSpeed( 150 )
		ply:SetGravity( 0.75 )
		ply:SetMaxHealth( 25 )
		ply:SetHealth(25)
	end
	if ply:IsAdmin() then
		ply:Give( "gmod_tool" )
		ply:Give( "gmod_camera" )
		ply:Give( "weapon_physgun" )
	end
	ply:PrintMessage( HUD_PRINTTALK, "You are ".. team.GetName( ply:Team() ) )
	local Citirand1 = math.random(1,12)
	local Citirand2 = math.random(1,18)
	local Gend = math.random(1,2)
	
	if ply:Team() == 1 then
		ply:SetModel("models/player/gman_high.mdl")
	else
		if Gend == 1 then
			ply:SetModel("models/player/female" .. Citirand1)
		else
			ply:SetModel("models/player/male" .. Citirand2)
		end
	end
end

function GM:PlayerInitialSpawn( ply )
	SetATeam( ply )
	ply:PrintMessage( HUD_PRINTTALK, "Welcome, " .. ply:Name() .. "! You are ".. team.GetName( ply:Team() ) )
	local Citirand1 = math.random(1,12)
	local Citirand2 = math.random(1,18)
	local Gend = math.random(1,2)
	
	if ply:Team() == 1 then
		ply:SetModel("models/player/gman_high.mdl")
	else
		if Gend == 1 then
			ply:SetModel("models/player/female" .. Citirand1)
		else
			ply:SetModel("models/player/male" .. Citirand2)
		end
	end
end

function GM:PlayerDeath( ply, inf, att )
	if ply:Team() == 1 then
		// If you are darkness and you are killed
		
		
		ply:SetTeam( 3 )
		att:SetTeam( 1 )
		att:PrintMessage( HUD_PRINTTALK, "When the Darkness leaves one body, it consumes another." )
		att:SetRunSpeed( 530 )
		ModelSeting( att )
		att:Flashlight( false )
		att:SetWalkSpeed( 300 )
		att:SetGravity( 0.25 )
		att:Give( "weapon_fists" )
		att:PrintMessage( HUD_PRINTTALK, "You are ".. team.GetName( ply:Team() ) )
		if att:IsAdmin() then
			att:Give( "gmod_tool" )
			att:Give( "gmod_camera" )
			att:Give( "weapon_physgun" )
		end
	else
		// If you are a citizen and you are killed
		ply:StripWeapons()
		ply:SetTeam( 3 )
		if att:Team() == 1 then
			for k,v in pairs(player.GetAll()) do
				v:ChatPrint( "Another victim falls to the darkness." )
				print("Another victim falls to the darkness.")
				v:ChatPrint("There are: "..team.NumPlayers(2).." Citizens left.")
				print("There are:"..team.NumPlayers(2).." Citizens left.")
			end
			// Citizen killed by Darkness
			
			
			ply:PrintMessage( HUD_PRINTTALK, "You were killed by the Darkness.")
		else
			// Citizen killed by Team
			
			
			att:PrintMessage( HUD_PRINTTALK, "Try not to kill your friends." )
			for k,v in pairs(player.GetAll()) do
				v:ChatPrint( "Another victim falls to the darkness." )
				print("Another victim falls to the darkness.")
				v:ChatPrint("There are: "..team.NumPlayers(2).." Citizens left.")
				print("There are:"..team.NumPlayers(2).." Citizens left.")
			end
		end
	end
end

function GM:PlayerNoClip( ply, on )
	if ply:Team() == 1 or ply:IsAdmin() then
		return true
	else
		return false
	end
end

function GM:PlayerUse( ply, entity )
	if ply:Team() == 1 then
		return false
	else
		return true
	end
end

function GM:PlayerSwitchFlashlight(  ply, on )
	if ply:Team() == 1 then
		return false
	else
		return true
	end
end

-----------------My Functions----------------------
---------------------------------------------------
---------------------------------------------------
---------------------------------------------------

function SetATeam( ply )
	ply:StripWeapons()
		if team.NumPlayers( 1 ) ~= 1 or ply:Team() == 1 then
				ply:SetTeam( 1 )
				ply:Give( "weapon_fists" )
				ply:SetRunSpeed( 530 )
				ply:SetWalkSpeed( 300 )
				Ply:Flashlight( false )
				ply:SetGravity( 0.25 )
				ply:SetMaxHealth( 100 )
				ply:SetHealth(100)
				
			else
				ply:SetTeam( 2 )
				ply:Give( "weapon_fists" )
				ply:SetRunSpeed( 240 )
				ply:SetWalkSpeed( 120 )
				ply:SetModel( "" )
				ply:SetGravity( 1 )
				ply:SetMaxHealth( 50 )
				ply:SetHealth(50)
				
		end
	if ply:IsAdmin() then
		ply:Give( "gmod_tool" )
		ply:Give( "gmod_camera" )
		ply:Give( "weapon_physgun" )
	end
end

function ChatCommands( ply, text, public )
	if (string.sub( text, 1, 5) == "/swap") then
	ply:StripWeapons()
		if ply:Team() == 1 then
			ply:SetTeam( 2 )
				ply:Give( "weapon_fists" )
				ply:SetRunSpeed( 240 )
				ply:SetWalkSpeed( 120 )
				ply:SetMaxHealth( 50 )
				ply:SetHealth(50)
				ply:SetGravity( 1 )
				
			ply:PrintMessage( HUD_PRINTTALK, "You are now a Citizen." )
		else
			if team.NumPlayers( 1 ) == 1 then
				ply:PrintMessage( HUD_PRINTTALK, "Team cannot be swapped at this time." )
			else
				ply:SetTeam( 1 )
				ply:Give( "weapon_fists" )
				ply:SetRunSpeed( 530 )
				ply:SetMaxHealth( 100 )
				Ply:Flashlight( false )
				ply:SetHealth(100)
				ply:SetWalkSpeed( 300 )
				ply:SetGravity( 0.25 )
				
			end
		end
		if ply:IsAdmin() then
		ply:Give( "gmod_tool" )
		ply:Give( "gmod_camera" )
		ply:Give( "weapon_physgun" )
	end
	end
	
	if (string.sub( text, 1, 6) == "/aswap") then
		ply:StripWeapons()
		if ply:Team() == 1 then
			ply:SetTeam( 2 )
			ply:Give( "weapon_fists" )
			ply:SetRunSpeed( 240 )
			ply:SetWalkSpeed( 120 )
			ply:SetMaxHealth( 50 )
			
			
			ply:PrintMessage( HUD_PRINTTALK, "You are now a Citizen." )
			
			local randply = math.random(1, team.NumPlayers( 2 ))
			team.GetPlayers(2)[randply]:SetTeam(1)
			team.GetPlayers(2)[randply]:StripWeapons()
			team.GetPlayers(2)[randply]:Give( "weapon_fists" )
			team.GetPlayers(2)[randply]:SetRunSpeed( 240 )
			team.GetPlayers(2)[randply]:SetWalkSpeed( 120 )
			team.GetPlayers(2)[randply]:SetModel( "" )
			team.GetPlayers(2)[randply]:PrintMessage( HUD_PRINTTALK, "You are now a Citizen." )
		else
			team.GetPlayers(1)[1]:SetTeam( 2 )
			ply:SetTeam( 1 )
			
			ply:SetRunSpeed( 530 )
			ply:SetMaxHealth( 100 )
			Ply:Flashlight( false )
			ply:SetWalkSpeed( 300 )
			ply:SetGravity( 0.25 )
			ply:Give( "weapon_fists" )
			
		end
	end
	if ply:IsAdmin() then
		ply:Give( "gmod_tool" )
		ply:Give( "gmod_camera" )
		ply:Give( "weapon_physgun" )
	end
end


hook.Add("PlayerSay", "ChatCommands", ChatCommands )