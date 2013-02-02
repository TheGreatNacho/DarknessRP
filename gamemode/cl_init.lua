include( 'shared.lua' )

function HUDHide( myhud )
	for k,v in pairs {"CHudHealth","CHudBattery"} do
		if myhud == v then return false end
	end
end

function HUDMaking()
	local ply = LocalPlayer()
	local HP = ply:Health()
	local Arm = ply:Armor()

	draw.RoundedBox( 8, 70, ScrH() - 100, 400, 20, Color( 40, 40, 40, 120 ))
	draw.RoundedBox( 8, 70, ScrH() - 100, math.Clamp( HP, 4, 400 )*4, 20, Color( 120, 0, 0, 200 ))
	draw.RoundedBox( 8, 70, ScrH() - 70, 400, 20, Color( 40, 40, 40, 120 ))
	draw.RoundedBox( 8, 70, ScrH() - 70, math.Clamp( Arm, 4, 400 )*4, 20, Color( 0, 0, 120, 200 ))
end

hook.Add("HUDShouldDraw", "HUDHide", HUDHide)
hook.Add("HUDPaint", "HUDMaking", HUDMaking)