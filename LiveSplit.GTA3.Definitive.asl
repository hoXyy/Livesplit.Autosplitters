state("LibertyCity"){}

startup
{
	// Script names for each supported mission
	vars.missionScripts = new Dictionary<string,string> {
		{"eight", "Give Me Liberty & Luigi's Girls"},
		{"luigi2", "Don't Spank Ma Bitch Up"},
		{"luigi3", "Drive Misty For Me"},
		{"meat1", "The Crook"},
		{"meat2", "The Thieves"},
		{"meat3", "The Wife"},
		{"meat4", "Her Lover"},
		{"joey1", "Mike Lips Last Lunch"},
		{"joey2", "Farewell 'Chunky' Lee Chong"},
		{"joey3", "Van Heist"},
		{"joey4", "Cipriani's Chauffeur"},
		{"toni1", "Taking Out The Laundry"},
		{"joey5", "Dead Skunk in The Trunk"},
		{"diablo1", "Turismo"},
		{"joey6", "The Getaway"},
		{"toni2", "The Pick-up"},
		{"t4x4_1", "Patriot Playground"},
		{"toni3", "Salvatore's Called A Meeting"},
		{"frank1", "Chaperone"},
		{"frank2", "Cutting The Grass"},
		{"toni4", "Triads and Tribulations"},
		{"luigi4", "Pump-Action Pimp"},
		{"rc1", "Diablo Destruction"},
		{"luigi5", "The Fuzz Ball"},
		{"diablo2", "I Scream, You Scream"},
		{"diablo3", "Trial By Fire"},
		{"diablo4", "Big 'n' Veiny"},
		{"rc2", "Mafia Massacre"},
		{"toni5", "Blow Fish"},
		{"frank21", "Bomb Da Base: Act I"},
		{"frank3", "Bomb Da Base: Act II"},
		{"frank4", "Last Requests"},
		{"asuka1", "Sayonara Salvatore"},
		{"yard1", "Bling-Bling Scramble"},
		{"asuka2", "Under Surveillance"},
		{"kenji1", "Kanbu Bust-out"},
		{"rc4", "Casino Calamity"},
		{"kenji2", "Grand Theft Auto"},
		{"yard2", "Uzi Rider"},
		{"mayhem", "Multistorey Mayhem"},
		{"asuka3", "Paparazzi Purge"},
		{"asuka4", "Payday for Ray"},
		{"ray1", "Silence the Sneak"},
		{"asuka5", "Two-Faced Tanner"},
		{"kenji3", "Deal Steal"},
		{"kenji4", "Shima"},
		{"kenji5", "Smack Down"},
		{"t4x4_2", "A Ride in the Park"},
		{"ray2", "Arms Shortage"},
		{"ray3", "Evidence Dash"},
		{"ray4", "Gone Fishing"},
		{"yard3", "Gangcar Round-up"},
		{"ray5", "Plaster Blaster"},
		{"yard4", "Kingdom Come"},
		{"love1", "Liberator"},
		{"love2", "Waka-Gashira Wipeout!"},
		{"love3", "A Drop in the Ocean"},
		{"love4", "Grand Theft Aero"},
		{"ray6", "Marked Man"},
		{"love5", "Escort Service"},
		{"rc3", "Rumpo Rampage"},
		{"hood1", "Uzi Money"},
		{"hood2", "Toyminator"},
		{"hood3", "Rigged to Blow"},
		{"hood4", "Bullion Run"},
		{"asusb1", "Bait"},
		{"love6", "Decoy"},
		{"love7", "Love's Disappearance"},
		{"asusb2", "Espresso-2-Go!"},
		{"asusb3", "S.A.M"},
		{"cat1", "The Exchange"},
		{"hood5", "Rumble"},
		{"t4x4_3", "Gripped!"}
	};

	vars.collectibleAddresses = new Dictionary<int,string> {
		{0x4E1A5CC, "Hidden Packages"},
		{0x4E1A1A8, "Unique Stunt Jumps"},
		{0x4E1A2A4, "Rampages"}
	};

	// Split list to prevent double-splitting
	vars.splits = new List<string>();


	// Add settings groups
	settings.Add("missions", true, "Missions");
	settings.Add("collectibles", false, "Collectibles");

	// Add missions settings
	foreach (var mission in vars.missionScripts) {
		settings.Add(mission.Key, true, mission.Value, "missions");
	};

	// Add collectible settings
	foreach (var collectible in vars.collectibleAddresses) {
		settings.Add(collectible.Value, false, collectible.Value, "collectibles");
	};
}

init
{
	// Add memory watchers
	vars.memoryWatchers = new MemoryWatcherList();

	vars.memoryWatchers.Add(new MemoryWatcher<int>(new DeepPointer("LibertyCity.exe", 0x4E8BE84)){ Name = "MissionsPassed" });
	vars.memoryWatchers.Add(new StringWatcher(new DeepPointer("LibertyCity.exe", 0x4F70578), 64){ Name = "MissionScript" });

	foreach (var collectible in vars.collectibleAddresses) {
		vars.memoryWatchers.Add(new MemoryWatcher<int>(new DeepPointer("LibertyCity.exe", collectible.Key)){ Name = collectible.Value });
	};
}

update
{
	vars.memoryWatchers.UpdateAll(game);
}

split
{
	// Missions check
	if (vars.memoryWatchers["MissionsPassed"].Current == vars.memoryWatchers["MissionsPassed"].Old+1) {
		if (!vars.splits.Contains(vars.memoryWatchers["MissionScript"].Current)) {
			vars.splits.Add(vars.memoryWatchers["MissionScript"].Current);
			return true;
		}
	}

	// Collectibles check
	foreach (var collectible in vars.collectibleAddresses) {
		if (vars.memoryWatchers[collectible.Value].Current == vars.memoryWatchers[collectible.Value].Old+1) {
			return true;
		}
	}
}

