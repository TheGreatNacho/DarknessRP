include( 'shared.lua' )
function HUDHide( myhud )
	for k,v in pairs {"CHudHealth","CHudBattery"} do
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

	draw.RoundedBox( 8, 70, ScrH() - 100, 400, 20, Color( 40, 40, 40, 120 ))
	draw.RoundedBox( 8, 70, ScrH() - 100, math.Clamp( HP, 4, 400 )*4, 20, Color( 120, 0, 0, 200 ))
	draw.RoundedBox( 8, 70, ScrH() - 70, 400, 20, Color( 40, 40, 40, 120 ))
	draw.RoundedBox( 8, 70, ScrH() - 70, math.Clamp( Arm, 4, 400 )*4, 20, Color( 0, 0, 120, 200 ))
	
	for k,v in pairs ( player.GetAll() ) do
		if ply:Team() == 1 then
			local Position = ( v:GetPos() + Vector( 0,0,80 ) ):ToScreen()
			local Name = ""
			if v == LocalPlayer() then
				Name = "" else Name = v:Name()
			end
				draw.DrawText( Name, "ScoreboardPlayerName", Position.x, Position.y, team.GetColor(v:Team()), 1 )
		
		end
	end
	for k,v in pairs ( team.GetPlayers(3) ) do
		if ply:Team() == 3 then
			local Position = ( v:GetPos() + Vector( 0,0,80 ) ):ToScreen()
			local Name = ""
			if v == LocalPlayer() then
				Name = "" else Name = v:Name()
			end
				draw.DrawText( Name, "ScoreboardPlayerName", Position.x, Position.y, team.GetColor(v:Team()), 1 )
		
		end
	end
	if ply:IsAdmin() then
		local Position = ( v:GetPos() + Vector( 0,0,80 ) ):ToScreen()
		local Name = ""
		if v == LocalPlayer() then
			Name = "" else Name = v:Name()
		end
		draw.DrawText( Name, "ScoreboardPlayerName", Position.x, Position.y, team.GetColor(v:Team()), 1 )

	end
end
hook.Add("HUDShouldDraw", "HUDHide", HUDHide)
hook.Add("HUDPaint", "HUDMaking", HUDMaking)
