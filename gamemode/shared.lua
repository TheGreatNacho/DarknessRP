GM.Name = "HorrorRP"
GM.Author = "TheGreatNacho"
GM.Email = "tedwood3@gmail.com"
GM.Website = "www.rectangulargaming.net"

DeriveGamemode( "sandbox" )
BooleonA = false
team.SetUp( 1, "The Darkness", Color(0,0,0))
team.SetUp( 2, "Citizen", Color(255,255,255))
team.SetUp( 3, "Minion", Color(50,50,50))
team.SetUp( 4, "Dead", Color(0,100,0))

timer.Create( "heal", 1, 0, function()
	for k,v in pairs(player.GetAll()) do
		if v:Team() == 1 then
			if v:Health() < 100 then
				v:SetHealth(v:Health()+1)
			end
		end
	end
end)

util.PrecacheModel( "models/player/gman_high.mdl" )
util.PrecacheModel( "models/player/female01" )
util.PrecacheModel( "models/player/female02" )
util.PrecacheModel( "models/player/female03" )
util.PrecacheModel( "models/player/female04" )
util.PrecacheModel( "models/player/female05" )
util.PrecacheModel( "models/player/female06" )
util.PrecacheModel( "models/player/female07" )
util.PrecacheModel( "models/player/female08" )
util.PrecacheModel( "models/player/female09" )
util.PrecacheModel( "models/player/female10" )
util.PrecacheModel( "models/player/female11" )
util.PrecacheModel( "models/player/female12" )
util.PrecacheModel( "models/player/male01" )
util.PrecacheModel( "models/player/male02" )
util.PrecacheModel( "models/player/male03" )
util.PrecacheModel( "models/player/male04" )
util.PrecacheModel( "models/player/male05" )
util.PrecacheModel( "models/player/male06" )
util.PrecacheModel( "models/player/male07" )
util.PrecacheModel( "models/player/male08" )
util.PrecacheModel( "models/player/male09" )
util.PrecacheModel( "models/player/male10" )
util.PrecacheModel( "models/player/male11" )
util.PrecacheModel( "models/player/male12" )
util.PrecacheModel( "models/player/male13" )
util.PrecacheModel( "models/player/male14" )
util.PrecacheModel( "models/player/male15" )
util.PrecacheModel( "models/player/male16" )
util.PrecacheModel( "models/player/male17" )
util.PrecacheModel( "models/player/male18" )