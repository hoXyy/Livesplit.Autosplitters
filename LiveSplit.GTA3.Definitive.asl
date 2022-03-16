// GTA III Definitive Edition autosplitter by hoxi, initial version by illuminati7777
// Heavily based on the original GTA III/VC autosplitters

// needed for each version to be actually detected properly
state("LibertyCity", "1.0.0.14296"){}
state("LibertyCity", "1.0.0.14377"){}
state("LibertyCity", "1.0.0.14718"){}
state("LibertyCity", "1.0.0.15284"){}

startup
{
	refreshRate = 20; // default 60, lowered for less CPU usage

	vars.missions = new Dictionary<string,Dictionary<int,string>> {
		{"Luigi Goterelli", new Dictionary<int,string> {
			{0x4E1993C, "Give Me Liberty & Luigi's Girls"},
			{0x4E19940, "Don't Spank Ma Bitch Up"},
			{0x4E19944, "Drive Misty For Me"},
			{0x4E19948, "Pump-Action Pimp"},
			{0x4E1994C, "The Fuzz Ball"}
		}},
		{"Joey Leone", new Dictionary<int,string> {
			{0x4E19954, "Mike Lips Last Lunch"},
			{0x4E19958, "Farewell 'Chunky' Lee Chong"},
			{0x4E1995C, "Van Heist"},
			{0x4E19960, "Cipriani's Chauffeur"},
			{0x4E19964, "Dead Skunk in The Trunk"},
			{0x4E19968, "The Getaway"}
		}},
		{"Marty Chonks", new Dictionary<int,string> {
			{0x4E199E0, "The Crook"},
			{0x4E199E4, "The Thieves"},
			{0x4E199E8, "The Wife"},
			{0x4E199EC, "Her Lover"}
		}},
		{"Toni Cipriani", new Dictionary<int,string> {
			{0x4E19970, "Taking Out The Laundry"},
			{0x4E19974, "The Pick-up"},
			{0x4E19978, "Salvatore's Called A Meeting"},
			{0x4E1997C, "Triads and Tribulations"},
			{0x4E19980, "Blow Fish"}
		}},
		{"Salvatore Leone", new Dictionary<int,string> {
			{0x4E19988, "Chaperone"},
			{0x4E1998C, "Cutting The Grass"},
			{0x4E19990, "Bomb Da Base: Act I"},
			{0x4E19994, "Bomb Da Base: Act II"},
			{0x4E19998, "Last Requests"}
		}},
		{"El Burro", new Dictionary<int,string> {
			{0x4E19A0C, "Turismo"},
			{0x4E199B8, "I Scream, You Scream"},
			{0x4E199BC, "Trial By Fire"},
			{0x4E199C0, "Big 'n' Veiny"}
		}},
		{"Asuka Kasen", new Dictionary<int,string> {
			{0x4E19A4C, "Sayonara Salvatore"},
			{0x4E19A50, "Under Surveillance"},
			{0x4E19A54, "Paparazzi Purge"},
			{0x4E19A58, "Payday for Ray"},
			{0x4E19A5C, "Two-Faced Tanner"},
			{0x4E19AE4, "Bait"},
			{0x4E19AE8, "Espresso-2-Go!"},
			{0x4E19AEC, "S.A.M"}
		}},
		{"Kenji Kasen", new Dictionary<int,string> {
			{0x4E19A80, "Kanbu Bust-out"},
			{0x4E19A84, "Grand Theft Auto"},
			{0x4E19A88, "Deal Steal"},
			{0x4E19A8C, "Shima"},
			{0x4E19A90, "Smack Down"}
		}},
		{"Ray Machowski", new Dictionary<int,string> {
			{0x4E19A64, "Silence the Sneak"},
			{0x4E19A68, "Arms Shortage"},
			{0x4E19A6C, "Evidence Dash"},
			{0x4E19A70, "Gone Fishing"},
			{0x4E19A74, "Plaster Blaster"},
			{0x4E19A78, "Marked Man"}
		}},
		{"Donald Love", new Dictionary<int,string> {
			{0x4E19A98, "Liberator"},
			{0x4E19A9C, "Waka-Gashira Wipeout!"},
			{0x4E19AA0, "A Drop in the Ocean"},
			{0x4E19AD0, "Grand Theft Aero"},
			{0x4E19AD4, "Escort Service"},
			{0x4E19AD8, "Decoy"},
			{0x4E19ADC, "Love's Disappearance"}		
		}},
		{"King Courtney", new Dictionary<int,string> {
			{0x4E19AA8, "Bling-Bling Scramble"},
			{0x4E19AAC, "Uzi Rider"},
			{0x4E19AB0, "Gangcar Round-up"},
			{0x4E19AB4, "Kingdom Come"}
		}},
		{"Catalina", new Dictionary<int,string> {
			{0x4E19B1C, "The Exchange"}
		}},
		{"D-Ice", new Dictionary<int,string> {
			{0x4E19AF8, "Uzi Money"},
			{0x4E19AFC, "Toyminator"},
			{0x4E19B00, "Rigged to Blow"},
			{0x4E19B04, "Bullion Run"},
			{0x4E19B08, "Rumble"}
		}},
		{"Off-Road Challenges", new Dictionary<int,string> {
			{0x4E19B44, "Patriot Playground"},
			{0x4E19B50, "Multistorey Mayhem"},
			{0x4E19B48, "A Ride in the Park"},
			{0x4E19B4C, "Gripped!"}
		}},
		{"RC Toyz Missions", new Dictionary<int,string> {
			{0x4E19BC0, "Diablo Destruction"},
			{0x4E19BC4, "Mafia Massacre"},
			{0x4E19BC8, "Rumpo Rampage"},
			{0x4E19BCC, "Casino Calamity"},
		}}
	};

	// Script names used for mission start checking
	vars.scripts = new Dictionary<string,string> {
		{"luigi2", "Don't Spank Ma Bitch Up"},
		{"luigi3", "Drive Misty For Me"},
		{"luigi4", "Pump-Action Pimp"},
		{"luigi5", "The Fuzz Ball"},
		{"joey1", "Mike Lips Last Lunch"},
		{"joey2", "Farewell 'Chunky' Lee Chong"},
		{"joey3", "Van Heist"},
		{"joey4", "Cipriani's Chauffeur"},
		{"joey5", "Dead Skunk in The Trunk"},
		{"joey6", "The Getaway"},
		{"meat1", "The Crook"},
		{"meat2", "The Thieves"},
		{"meat3", "The Wife"},
		{"meat4", "Her Lover"},
		{"toni1", "Taking Out The Laundry"},
		{"toni2", "The Pick-up"},
		{"toni3", "Salvatore's Called A Meeting"},
		{"toni4", "Triads and Tribulations"},
		{"toni5", "Blow Fish"},
		{"frank1", "Chaperone"},
		{"frank2", "Cutting The Grass"},
		{"frank21", "Bomb Da Base: Act I"},
		{"frank3", "Bomb Da Base: Act II"},
		{"frank4", "Last Requests"},
		{"diablo1", "Turismo"},
		{"diablo2", "I Scream, You Scream"},
		{"diablo3", "Trial By Fire"},
		{"diablo4", "Big 'n' Veiny"},
		{"asuka1", "Sayonara Salvatore"},
		{"asuka2", "Under Surveillance"},
		{"asuka3", "Paparazzi Purge"},
		{"asuka4", "Payday for Ray"},
		{"asuka5", "Two-Faced Tanner"},
		{"asusb1", "Bait"},
		{"asusb2", "Espresso-2-Go!"},
		{"asusb3", "S.A.M"},
		{"kenji1", "Kanbu Bust-out"},
		{"kenji2", "Grand Theft Auto"},
		{"kenji3", "Deal Steal"},
		{"kenji4", "Shima"},
		{"kenji5", "Smack Down"},
		{"ray1", "Silence the Sneak"},
		{"ray2", "Arms Shortage"},
		{"ray3", "Evidence Dash"},
		{"ray4", "Gone Fishing"},
		{"ray5", "Plaster Blaster"},
		{"ray6", "Marked Man"},
		{"love1", "Liberator"},
		{"love2", "Waka-Gashira Wipeout!"},
		{"love3", "A Drop in the Ocean"},
		{"love4", "Grand Theft Aero"},
		{"love5", "Escort Service"},
		{"love6", "Decoy"},
		{"love7", "Love's Disappearance"},		
		{"yard1", "Bling-Bling Scramble"},
		{"yard2", "Uzi Rider"},
		{"yard3", "Gangcar Round-up"},
		{"yard4", "Kingdom Come"},
		{"cat1", "The Exchange"},
		{"hood1", "Uzi Money"},
		{"hood2", "Toyminator"},
		{"hood3", "Rigged to Blow"},
		{"hood4", "Bullion Run"},
		{"hood5", "Rumble"},
		{"t4x4_1", "Patriot Playground"},
		{"mayhem", "Multistorey Mayhem"},
		{"t4x4_2", "A Ride in the Park"},
		{"t4x4_3", "Gripped!"},
		{"rc1", "Diablo Destruction"},
		{"rc2", "Mafia Massacre"},
		{"rc3", "Rumpo Rampage"},
		{"rc4", "Casino Calamity"}
	};

	// Inserts split into settings and adds the mission to our separate list.
	Action<string, bool> addMissionChain = (contact, defaultValue) => {
		var parent = contact;
		foreach (var mission in vars.missions[contact]) {
			settings.Add(mission.Value + " (end)", defaultValue, mission.Value, parent + " (end)");
			vars.missionsEnd.Add(mission.Value + " (end)");
		}
	};
	
	// Inserts header (i.e. mission giver) into settings.
	Action<string, bool, string> addMissionHeader = (contact, defaultValue, header) => {
		var parent = contact;
		settings.Add(parent + " (end)", defaultValue, header);
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
			settings.Add(mission.Value + " (start)", defaultValue, mission.Value, parent + " (start)");
		}
	};
	
	Action<string, bool, string> addMissionHeaderStart = (contact, defaultValue, header) => {
		var parent = contact;
		settings.Add(parent + " (start)", defaultValue, header);
		addMissionChainStart(contact, defaultValue);
	};

	vars.collectibleAddresses = new Dictionary<int,string> {
		{0x4E1A5CC, "Hidden Packages"},
		{0x4E1A1A8, "Unique Stunt Jumps"},
		{0x4E1A2A4, "Rampages"}
	};

	// Address offsets
	vars.nameOffset = 0x0;
	vars.scriptOffset = 0x0;
	vars.startOffset = 0x0;
	vars.loadOffset = 0x0;

	// Timer phase storage
	vars.prevPhase = null;

	// Split list to prevent double-splitting
	vars.splits = new List<string>();

	// Lists for checks
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
	settings.CurrentDefaultParent = "collectibles";
	foreach (var collectible in vars.collectibleAddresses) {
		settings.Add(collectible.Value+"All", false, collectible.Value+ " (All Done)");
		settings.Add(collectible.Value+"Each", false, collectible.Value+ " (Each)");
	};

	// Any% final split setting
	settings.CurrentDefaultParent = null;
	settings.Add("any_end", true, "Any% Final Split");
	settings.SetToolTip("any_end", "Splits once you lose control on \"The Exchange\".");

	// Debug output
	Action<string> DebugOutput = (text) => {
		print("[GTAIII:DE Autosplitter] "+text);
	};
	vars.DebugOutput = DebugOutput;

	// Split prevention things
	vars.lastLoad = Environment.TickCount;
	vars.waiting = false;
}

init
{
	var fvi = modules.First().FileVersionInfo;
	version = string.Join(".", fvi.FileMajorPart, fvi.FileMinorPart, fvi.FileBuildPart, fvi.FilePrivatePart);
	vars.version = new Version(version);

	// Version detection
	switch(version)
	{
		case "1.0.0.14296":
			break; 
		case "1.0.0.14377":
			vars.nameOffset = 0x3810;
			vars.scriptOffset = 0x3800;
			vars.startOffset = 0x2010;
			vars.loadOffset = 0x3810;
			break;
		case "1.0.0.14718":
			vars.startOffset = 0x18360;
			vars.nameOffset = 0x19BB0;
			vars.scriptOffset = 0x19B80;
			vars.loadOffset = 0x19B90;
			break;
		case "1.0.0.15284":
			vars.startOffset = 0x18F98D;
			vars.nameOffset = -0x3863A8;
			vars.loadOffset = -0x36A90C;
			vars.scriptOffset = -0xCD3D0;
			break;

	}

	// Add memory watchers
	vars.memoryWatchers = new MemoryWatcherList();

	vars.memoryWatchers.Add(new StringWatcher(new DeepPointer(0x4F70578+vars.nameOffset), 10){ Name = "MissionScript" });

	// Not sure how this flag acts outside the intro, so it's only used for the start
	vars.memoryWatchers.Add(new MemoryWatcher<byte>(new DeepPointer(0x4BF2D67+vars.startOffset)) { Name = "startFlag" });

	// Used for split prevention on loads
	vars.memoryWatchers.Add(new MemoryWatcher<bool>(new DeepPointer(0x4F9D11C+vars.loadOffset)) { Name = "loading" });

	// Any% final split stuff
	vars.memoryWatchers.Add(new MemoryWatcher<int>(new DeepPointer(0x4E19C00+vars.scriptOffset)){ Name = "teTimer" });
	vars.memoryWatchers.Add(new MemoryWatcher<int>(new DeepPointer(0x4E1D93C+vars.scriptOffset)){ Name = "teHelipad" });

	// Missions
	foreach (var strand in vars.missions) {
		foreach (var address in strand.Value) {
			vars.memoryWatchers.Add(new MemoryWatcher<int>(new DeepPointer(address.Key+vars.scriptOffset)){ Name = address.Value });
		}
	}

	// Collectibles
	foreach (var collectible in vars.collectibleAddresses) {
		vars.memoryWatchers.Add(new MemoryWatcher<int>(new DeepPointer(collectible.Key+vars.scriptOffset)){ Name = collectible.Value });
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
	//=============================================================================
	// Split prevention
	//=============================================================================
	if (vars.memoryWatchers["loading"].Current) {
		vars.DebugOutput("Loading");
		vars.lastLoad = Environment.TickCount;
		return false;
	}
	if (Environment.TickCount - vars.lastLoad < 500) {
		// Prevent splitting shortly after loading from a save, since this can
		// sometimes occur because memory values change
		if (!vars.waiting)
		{
			vars.DebugOutput("Wait..");
			vars.waiting = true;
		}
		return false;
	}
	if (vars.waiting)
	{
		vars.DebugOutput("Done waiting..");
		vars.waiting = false;
	}

	//=============================================================================
	// Missions passed check
	//=============================================================================
	foreach (var mission in vars.missionsEnd) {
		if (settings[mission]) {
			if (vars.memoryWatchers[mission.Replace(" (end)", string.Empty)].Current == vars.memoryWatchers[mission.Replace(" (end)", string.Empty)].Old+1) {
				if (!vars.splits.Contains(mission)) {
					vars.DebugOutput("Mission End Split: " + mission);
					vars.splits.Add(mission);
					return true;
				}
			}
		}
	}

	//=============================================================================
	// Missions start check
	//=============================================================================
	foreach (var script in vars.scripts) {
		if (settings[script.Value + " (start)"]) {
			if (vars.memoryWatchers["MissionScript"].Current != vars.memoryWatchers["MissionScript"].Old) {
				if (vars.memoryWatchers["MissionScript"].Current == script.Key) {
					if (!vars.splits.Contains(script + " (start)")) {
						vars.DebugOutput("Mission Start Split: " + script.Value);
						vars.splits.Add(script + " (start)");
						return true;
					}
				}
			}
		}
	}

	//=============================================================================
	// Collectibles check
	//=============================================================================
	foreach (var collectible in vars.collectibleAddresses) {
		var cvalue = vars.memoryWatchers[collectible.Value.ToString()];
		if (cvalue.Current > cvalue.Old) {
			if (settings[collectible.Value+"All"]) // adjusting the max count for each collectible type based on what we want to split.
			{
				int max = 20;
				if (collectible.Value == "Hidden Packages")	{
					max = 100;
				}
				if (cvalue.Current == max && cvalue.Old == max-1) {
					var splitName = collectible.Value+" "+cvalue.Current;
					if (!vars.splits.Contains(splitName)) {
						vars.DebugOutput("All Collectibles Split: " + splitName);
						vars.splits.Add(splitName);
						return true;
					}
				}
			}
			if (settings[collectible.Value+"Each"]) { // if it's each, add the collectible to splits list and try to split.
					var splitName = collectible.Value+" "+cvalue.Current;
					if (!vars.splits.Contains(splitName)) {
						vars.DebugOutput("Collectible Split: " + splitName);
						vars.splits.Add(splitName);
						return true;
					}				
			}
		}
	}

	//=============================================================================
	// Any% final split
	//=============================================================================
	if (settings["any_end"]) {
		if (vars.memoryWatchers["MissionScript"].Current == "cat1") {
			if (vars.memoryWatchers["teHelipad"].Current == 1 && vars.memoryWatchers["teTimer"].Current != vars.memoryWatchers["teTimer"].Old) {
				if (!vars.splits.Contains("any_end")) {
					vars.DebugOutput("Any% Final Split");
					vars.splits.Add("any_end");
					return true;
				}
			}
		}
	}
}

start
{
	var startFlag = vars.memoryWatchers["startFlag"];
	var thread = vars.memoryWatchers["MissionScript"];

	// New Game
	//=========
	/*
	 * startFlag switches to 0 from 1 when the game begins to fade out to the intro cutscene.
	 * The check for the thread is there just for safety.
	 */
	if (startFlag.Current == 0 && startFlag.Old == 1 && thread.Current == "intro")
	{
		if (settings.StartEnabled)
		{
			// Only output when actually starting timer (the return value of this method
			// is only respected by LiveSplit when the setting is actually enabled)
			vars.DebugOutput("New Game");
		}
		return true;
	}
}

reset
{
	var startFlag = vars.memoryWatchers["startFlag"];
	var thread = vars.memoryWatchers["MissionScript"];

	/*
	 * Use same check for reset for the timer to reset and start in the same cycle.
	 * Only downside is that accidental new game will reset the timer (but who would do that with the way DE menu is laid out?)
	 */
	if (startFlag.Current == 0 && startFlag.Old == 1 && thread.Current == "intro")
	{
		if (settings.ResetEnabled)
		{
			// Only output when actually resetting timer (the return value of this method
			// is only respected by LiveSplit when the setting is actually enabled)
			vars.DebugOutput("Reset");
			
			// Clear already split missions, just in case
			vars.splits.Clear();
		}
		return true;
	}
}

