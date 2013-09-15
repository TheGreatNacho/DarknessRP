GM.Name = "DarknessRP"
GM.Author = "TheGreatNacho"
GM.Email = "tedwood3@gmail.com"
GM.Website = "www.rectangulargaming.net"
/* Change log

*/
DeriveGamemode( "sandbox" )

llevel = nil

concommand.Add("drp_stopsound", function()
	RunConsoleCommand("stopsound")
end)

concommand.Add("drp_unspecall", function()
	if LocalPlayer():IsAdmin() then
		for k,v in pairs(player.GetAll()) do
			v:UnSpectate()
			v:Kill()
		end
	end
end)

concommand.Add("drp_hurt", function()
	if LocalPlayer():Team() == 1 then
		if LocalPlayer():Health() < 10 and LocalPlayer():Health() > 0 then
			LocalPlayer():SetHealth(LocalPlayer():Health() - 10)
		elseif LocalPlayer():Health() < 0 or LocalPlayer():Health() == 0 then
			LocalPlayer():Kill()
		end
	end
end)


team.SetUp( 1, "The Darkness", Color(100,0,0))
team.SetUp( 2, "Citizen", Color(255,255,255))
team.SetUp( 3, "Minion", Color(220,220,220))
team.SetUp( 4, "Dead", Color(255,0,0))

timer.Create( "tick", 1, 0, function()
	for k,v in pairs(player.GetAll()) do
		if v:Team() == 1 then
			if v:Health() < 100 then
				v:SetHealth(v:Health()+1)
			end
		end
	end
end)



util.PrecacheModel( "models/player/grim.mdl" )
resource.AddFile("models/player/grim.mdl")
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
util.PrecacheSound( "/ambient/voices/citizen_beaten3.wav" )
util.PrecacheSound( "/ambient/voices/fz_scream1.wav" )
util.PrecacheSound( "/ambient/voices/crying_loop1.wav" )
util.PrecacheSound(	"/ambient/creatures/town_child_scream1.wav"	)


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