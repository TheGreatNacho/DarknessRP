GM.Name = "DarknessRP"
GM.Author = "TheGreatNacho"
GM.Email = "tedwood3@gmail.com"
GM.Website = "www.rectangulargaming.net"

DeriveGamemode( "sandbox" )
name = ""

team.SetUp( 1, "The Darkness", Color(100,0,0))
team.SetUp( 2, "Citizen", Color(255,255,255))
team.SetUp( 3, "Minion", Color(220,220,220))

timer.Create( "popup",10,0, function()
	
end)
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
util.PrecacheModel( "models/player/group01/female_01.mdl" )
util.PrecacheModel( "models/player/group01/female_02.mdl" )
util.PrecacheModel( "models/player/group01/female_03.mdl" )
util.PrecacheModel( "models/player/group01/female_04.mdl" )
util.PrecacheModel( "models/player/group01/female_05.mdl" )
util.PrecacheModel( "models/player/group01/female_06.mdl" )
util.PrecacheModel( "models/player/group01/male_01.mdl" )
util.PrecacheModel( "models/player/group01/male_02.mdl" )
util.PrecacheModel( "models/player/group01/male_03.mdl" )
util.PrecacheModel( "models/player/group01/male_04.mdl" )
util.PrecacheModel( "models/player/group01/male_05.mdl" )
util.PrecacheModel( "models/player/group01/male_06.mdl" )
util.PrecacheModel( "models/player/group01/male_07.mdl" )
util.PrecacheModel( "models/player/group01/male_08.mdl" )
util.PrecacheModel( "models/player/group01/male_09.mdl" )
 
skins = {"models/player/group01/female_01.mdl",
		 "models/player/group01/female_02.mdl",
		 "models/player/group01/female_03.mdl",
		 "models/player/group01/female_04.mdl",
		 "models/player/group01/female_05.mdl",
		 "models/player/group01/female_06.mdl",
		 "models/player/group01/male_01.mdl",
		 "models/player/group01/male_02.mdl",
		 "models/player/group01/male_03.mdl",
		 "models/player/group01/male_04.mdl",
		 "models/player/group01/male_05.mdl",
		 "models/player/group01/male_06.mdl",
		 "models/player/group01/male_07.mdl",
		 "models/player/group01/male_08.mdl",
		 "models/player/group01/male_09.mdl"
		 }