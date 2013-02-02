GM.Name = "HorrorRP"
GM.Author = "TheGreatNacho"
GM.Email = "tedwood3@gmail.com"
GM.Website = "www.rectangulargaming.net"

DeriveGamemode( "sandbox" )

team.SetUp( 1, "The Darkness", Color(0,0,0))
team.SetUp( 2, "Citizen", Color(255,255,255))
team.SetUp( 3, "Minion", Color(50,50,50))
team.SetUp( 4, "Dead", Color(0,100,0))

util.PrecacheModel( "models/player/gman_high.mdl" )