// needed for each version to be actually detected properly
state("LibertyCity", "1.0.0.14296"){}
state("LibertyCity", "1.0.0.14377"){}

startup
{
	vars.missions = new Dictionary<string,Dictionary<string,string>> {
		{"Luigi Goterelli", new Dictionary<string,string> {
			{"eight", "Give Me Liberty & Luigi's Girls"},
			{"luigi2", "Don't Spank Ma Bitch Up"},
			{"luigi3", "Drive Misty For Me"},
			{"luigi4", "Pump-Action Pimp"},
			{"luigi5", "The Fuzz Ball"}
		}},
		{"Joey Leone", new Dictionary<string,string> {
			{"joey1", "Mike Lips Last Lunch"},
			{"joey2", "Farewell 'Chunky' Lee Chong"},
			{"joey3", "Van Heist"},
			{"joey4", "Cipriani's Chauffeur"},
			{"joey5", "Dead Skunk in The Trunk"},
			{"joey6", "The Getaway"}
		}},
		{"Marty Chonks", new Dictionary<string,string> {
			{"meat1", "The Crook"},
			{"meat2", "The Thieves"},
			{"meat3", "The Wife"},
			{"meat4", "Her Lover"}
		}},
		{"Toni Cipriani", new Dictionary<string,string> {
			{"toni1", "Taking Out The Laundry"},
			{"toni2", "The Pick-up"},
			{"toni3", "Salvatore's Called A Meeting"},
			{"toni4", "Triads and Tribulations"},
			{"toni5", "Blow Fish"}
		}},
		{"Salvatore Leone", new Dictionary<string,string> {
			{"frank1", "Chaperone"},
			{"frank2", "Cutting The Grass"},
			{"frank21", "Bomb Da Base: Act I"},
			{"frank3", "Bomb Da Base: Act II"},
			{"frank4", "Last Requests"}
		}},
		{"El Burro", new Dictionary<string,string> {
			{"diablo1", "Turismo"},
			{"diablo2", "I Scream, You Scream"},
			{"diablo3", "Trial By Fire"},
			{"diablo4", "Big 'n' Veiny"}
		}},
		{"Asuka Kasen", new Dictionary<string,string> {
			{"asuka1", "Sayonara Salvatore"},
			{"asuka2", "Under Surveillance"},
			{"asuka3", "Paparazzi Purge"},
			{"asuka4", "Payday for Ray"},
			{"asuka5", "Two-Faced Tanner"},
			{"asusb1", "Bait"},
			{"asusb2", "Espresso-2-Go!"},
			{"asusb3", "S.A.M"}
		}},
		{"Kenji Kasen", new Dictionary<string,string> {
			{"kenji1", "Kanbu Bust-out"},
			{"kenji2", "Grand Theft Auto"},
			{"kenji3", "Deal Steal"},
			{"kenji4", "Shima"},
			{"kenji5", "Smack Down"}
		}},
		{"Ray Machowski", new Dictionary<string,string> {
			{"ray1", "Silence the Sneak"},
			{"ray2", "Arms Shortage"},
			{"ray3", "Evidence Dash"},
			{"ray4", "Gone Fishing"},
			{"ray5", "Plaster Blaster"},
			{"ray6", "Marked Man"}
		}},
		{"Donald Love", new Dictionary<string,string> {
			{"love1", "Liberator"},
			{"love2", "Waka-Gashira Wipeout!"},
			{"love3", "A Drop in the Ocean"},
			{"love4", "Grand Theft Aero"},
			{"love5", "Escort Service"},
			{"love6", "Decoy"},
			{"love7", "Love's Disappearance"}		
		}},
		{"King Courtney", new Dictionary<string,string> {
			{"yard1", "Bling-Bling Scramble"},
			{"yard2", "Uzi Rider"},
			{"yard3", "Gangcar Round-up"},
			{"yard4", "Kingdom Come"}
		}},
		{"Catalina", new Dictionary<string,string> {
			{"cat1", "The Exchange"}
		}},
		{"D-Ice", new Dictionary<string,string> {
			{"hood1", "Uzi Money"},
			{"hood2", "Toyminator"},
			{"hood3", "Rigged to Blow"},
			{"hood4", "Bullion Run"},
			{"hood5", "Rumble"}
		}},
		{"Off-Road Challenges", new Dictionary<string,string> {
			{"t4x4_1", "Patriot Playground"},
			{"mayhem", "Multistorey Mayhem"},
			{"t4x4_2", "A Ride in the Park"},
			{"t4x4_3", "Gripped!"}
		}},
		{"RC Toyz Missions", new Dictionary<string,string> {
			{"rc1", "Diablo Destruction"},
			{"rc2", "Mafia Massacre"},
			{"rc3", "Rumpo Rampage"},
			{"rc4", "Casino Calamity"},
		}}
	};

	// Inserts split into settings and adds the mission to our separate list.
	Action<string, bool> addMissionChain = (contact, defaultValue) => {
		var parent = contact;
		foreach (var mission in vars.missions[contact]) {
			settings.Add(mission.Key + "_end", defaultValue, mission.Value, parent + "_end");
			vars.missionsEnd.Add(mission.Key + "_end");
		}
	};
	
	// Inserts header (i.e. mission giver) into settings.
	Action<string, bool, string> addMissionHeader = (contact, defaultValue, header) => {
		var parent = contact;
		settings.Add(parent + "_end", defaultValue, header);
		addMissionChain(contact, defaultValue);
	};

	// Copy of above functions for mission/asset start
	Action<string, bool> addMissionChainStart = (missions, defaultValue) => {
		var parent = missions;
		foreach (var mission in vars.missions[missions]) {
			if (mission.Value == "Give Me Liberty & Luigi's Girls") // don't need this
			{
				continue;
			}
			settings.Add(mission.Key + "_start", defaultValue, mission.Value, parent + "_start");
			vars.missionsStart.Add(mission.Key + "_start");
		}
	};
	
	Action<string, bool, string> addMissionHeaderStart = (contact, defaultValue, header) => {
		var parent = contact;
		settings.Add(parent + "_start", defaultValue, header);
		addMissionChainStart(contact, defaultValue);
	};

	vars.collectibleAddresses = new Dictionary<int,string> {
		{0x4E1A5CC, "Hidden Packages"},
		{0x4E1A1A8, "Unique Stunt Jumps"},
		{0x4E1A2A4, "Rampages"}
	};

	// Address offsets
	vars.offset1 = 0;
	vars.offset2 = 0;

	// Timer phase storage
	vars.prevPhase = null;

	// Split list to prevent double-splitting
	vars.splits = new List<string>();

	// Lists for checks
	vars.missionsStart = new List<string>();
	vars.missionsEnd = new List<string>();

	// Add settings groups
	settings.Add("missions_end", true, "Missions (end)");
	settings.Add("missions_start", false, "Missions (start)");
	settings.Add("collectibles", false, "Collectibles");

	// Adding mission headers
	settings.CurrentDefaultParent = "missions_end";
	foreach (var header in vars.missions) {
		addMissionHeader(header.Key, true, header.Key);
		
	}

	settings.CurrentDefaultParent = "missions_start";
	foreach(var header in vars.missions) {
		addMissionHeaderStart(header.Key, false, header.Key);
	}

	// Add collectible settings
	foreach (var collectible in vars.collectibleAddresses) {
		settings.Add(collectible.Value, false, collectible.Value, "collectibles");
	};
}

init
{
	// Version detection
	switch(modules.First().ModuleMemorySize)
	{
		case 91697152:
			version = "1.0.0.14296";
			vars.offset1 = 0x0;
			vars.offset2 = 0x0;
			break; 
		case 91702272:
			version = "1.0.0.14377";
			vars.offset1 = 0x3810;
			vars.offset2 = 0x3800;
			break;
	}

	// Add memory watchers
	vars.memoryWatchers = new MemoryWatcherList();

	vars.memoryWatchers.Add(new MemoryWatcher<int>(new DeepPointer("LibertyCity.exe", 0x4E8BE84+vars.offset1)){ Name = "MissionsPassed" });
	vars.memoryWatchers.Add(new StringWatcher(new DeepPointer("LibertyCity.exe", 0x4F70578+vars.offset1), 64){ Name = "MissionScript" });

	foreach (var collectible in vars.collectibleAddresses) {
		vars.memoryWatchers.Add(new MemoryWatcher<int>(new DeepPointer("LibertyCity.exe", collectible.Key+vars.offset2)){ Name = collectible.Value });
	};
}

update
{
	vars.memoryWatchers.UpdateAll(game);

	// If timer state changes.
	if (timer.CurrentPhase != vars.prevPhase) {
		// Cleanup when the timer is stopped.
		if (timer.CurrentPhase == TimerPhase.NotRunning) {
			vars.splits.Clear();
		}
		// Stores the current phase the timer is in, so we can use the old one on the next frame.
		vars.prevPhase = timer.CurrentPhase;
	}
}

split
{
	// Missions passed check
	foreach (var mission in vars.missionsEnd) {
		if (settings[mission]) {
			if (vars.memoryWatchers["MissionsPassed"].Current == vars.memoryWatchers["MissionsPassed"].Old+1) {
				if (vars.memoryWatchers["MissionScript"].Current == mission.Replace("_end", string.Empty)) {
					if (!vars.splits.Contains(mission)) {
						vars.splits.Add(mission);
						return true;
					}
				}
			}
		}
	}

	// Missions start check
	foreach (var mission in vars.missionsStart) {
		if (settings[mission]) {
			if (vars.memoryWatchers["MissionScript"].Current != vars.memoryWatchers["MissionScript"].Old) {
				if (vars.memoryWatchers["MissionScript"].Current == mission.Replace("_start", string.Empty)) {
					if (!vars.splits.Contains(mission)) {
						vars.splits.Add(mission);
						return true;
					}
				}
			}
		}
	}


	// Collectibles check
	foreach (var collectible in vars.collectibleAddresses) {
		if (settings[collectible.Value])
		{
			if (vars.memoryWatchers[collectible.Value].Current == vars.memoryWatchers[collectible.Value].Old+1) {
				return true;
			}
		}
	}
}

