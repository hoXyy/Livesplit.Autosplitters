// GTA Vice City Definitive Edition autosplitter by hoxi
// Heavily based on the original GTA III/VC autosplitters

// needed for each version to be actually detected properly
state("ViceCity", "1.0.0.14296"){}
state("ViceCity", "1.0.0.14388"){}
state("ViceCity", "1.0.0.14718"){}
state("ViceCity", "1.0.0.15399"){}

startup
{
	refreshRate = 20; // default 60, lowered for less CPU usage

	// Assets/missions with only one objective (sans Kent Paul)
	vars.missions2 = new Dictionary<string, int> {
		{"Checkpoint Charlie (Boatyard)", 0x4E68830},
		{"Distribution (Cherry Poppers)", 0x4E68844},
		{"Pole Position ($300 Spent)", 0x4E68FDC},
		{"Rifle Range (45 Points)", 0x4E69968}
	};

	vars.missions = new Dictionary<string,Dictionary<int,string>> {
		{"Ken Rosenberg", new Dictionary<int,string> {
			{0x4E68228, "An Old Friend"},
			{0x4E68230, "The Party"},
			{0x4E68234, "Back Alley Brawl"},
			{0x4E68238, "Jury Fury"},
			{0x4E6823C, "Riot"},
		}},
		{"Avery Carrington", new Dictionary<int,string> {
			{0x4E68280, "Four Iron"},
			{0x4E68284, "Demolition Man"},
			{0x4E68288, "Two Bit Hit"}
		}},
		{"Colonel Cortez", new Dictionary<int,string> {
			{0x4E68244, "Treacherous Swine"},
			{0x4E68248, "Mall Shootout"},
			{0x4E6824C, "Guardian Angels"},
			{0x4E68250, "Sir, Yes Sir!"},
			{0x4E68254, "All Hands on Deck!"}
		}},
		{"Ricardo Diaz", new Dictionary<int,string> {
			{0x4E6825C, "The Chase"},
			{0x4E68260, "Phnom Penh '86"},
			{0x4E68264, "The Fastest Boat"},
			{0x4E68268, "Supply & Demand"}
		}},
		{"Kent Paul", new Dictionary<int,string> {
			{0x4E68278, "Death Row"}
		}},
		{"Vercetti", new Dictionary<int,string> {
			{0x4E6826C, "Rub Out"},
			{0x4E682E8, "Keep Your Friends Close..."}
		}},
		{"Umberto Robina", new Dictionary<int,string> {
			{0x4E6830C, "Stunt Boat Challenge"},
			{0x4E68310, "Cannon Fodder"},
			{0x4E68314, "Naval Engagement"},
			{0x4E68318, "Trojan Voodoo"}
		}},
		{"Auntie Poulet", new Dictionary<int,string> {
			{0x4E68320, "Juju Scramble"},
			{0x4E68324, "Bombs Away!"},
			{0x4E68328, "Dirty Lickin's"}
		}},
		{"Mitch Baker", new Dictionary<int,string> {
			{0x4E682FC, "Alloy Wheels of Steel"},
			{0x4E68300, "Messing with the Man"},
			{0x4E68304, "Hog Tied"}
		}},
		{"Love Fist", new Dictionary<int,string> {
			{0x4E68330, "Love Juice"},
			{0x4E68334, "Psycho Killer"},
			{0x4E68338, "Publicity Tour"}
		}},
		{"Phil Cassidy", new Dictionary<int,string> {
			{0x4E682A8, "Gun Runner"},
			{0x4E682AC, "Boomshine Saigon"}
		}},
		{"Mr. Black", new Dictionary<int,string> {
			{0x4E68358, "Road Kill"},
			{0x4E6835C, "Waste the Wife"},
			{0x4E68360, "Autocide"},
			{0x4E68364, "Check Out at the Check In"},
			{0x4E68368, "Loose Ends"},
		}},
		{"Vercetti Mansion", new Dictionary<int,string> {
			{0x4E682D8, "Shakedown"},
			{0x4E682DC, "Bar Brawl"},
			{0x4E682E0, "Cop Land"}
		}},
		{"Printworks", new Dictionary<int,string> {
			{0x4E682F0, "Spilling the Beans"},
			{0x4E682F4, "Hit the Courier"},
			{0x4E682E4, "Cap the Collector"}
		}},
		{"Sunshine Autos Imports", new Dictionary<int,string> {
			{0x4E69060, "List 1"},
			{0x4E69064, "List 2"},
			{0x4E69068, "List 3"},
			{0x4E6906C, "List 4"}
		}},
		{"Sunshine Autos Races", new Dictionary<int,string> {
			{0x4E69924, "Terminal Velocity"},
			{0x4E69928, "Ocean Drive"},
			{0x4E6992C, "Border Run"},
			{0x4E69930, "Capital Cruise"},
			{0x4E69934, "Tour!"},
			{0x4E69938, "VC Endurance"},
		}},
		{"Film Studio", new Dictionary<int,string> {
			{0x4E682B4, "Recruitment Drive"},
			{0x4E682B8, "Dildo Dodo"},
			{0x4E682BC, "Martha's Mug Shot"},
			{0x4E682C0, "G-spotlight"}
		}},
		{"Kaufman Cabs", new Dictionary<int,string> {
			{0x4E68380, "V.I.P"},
			{0x4E68384, "Friendly Rivarly"},
			{0x4E68388, "Cabmaggedon"}
		}},
		{"Malibu", new Dictionary<int,string> {
			{0x4E68290, "No Escape?"},
			{0x4E68294, "The Shootist"},
			{0x4E68298, "The Driver"},
			{0x4E6829C, "The Job"}
		}},
		{"Stadium Events", new Dictionary<int,string> {
			{0x4E69948, "Hotring"},
			{0x4E6994C, "Bloodring"},
			{0x4E6F668, "Dirtring"}
		}},
		{"Chopper Checkpoints", new Dictionary<int,string> {
			{0x4E69918, "Ocean Beach Chopper Checkpoint"},
			{0x4E6991C, "Vice Point Chopper Checkpoint"},
			{0x4E69920, "Little Haiti Chopper Checkpoint"},
			{0x4E69914, "Downtown Chopper Checkpoint"}
		}},
		{"Off-Road Challenges", new Dictionary<int, string> {
			{0x4E68400, "PCJ Playground"},
			{0x4E68430, "Cone Crazy"},
			{0x4E68460, "Trial By Dirt"},
			{0x4E68464, "Test Track"}
		}},
		{"RC Top-Fun", new Dictionary<int, string> {
			{0x4E7020C, "RC Raider"},
			{0x4E70360, "RC Bandit"},
			{0x4E70730, "RC Baron"}
		}},
		{"Vehicle Missions", new Dictionary<int, string> {
			{0x4E69908, "Paramedic (Level 12)"},
			{0x4E69910, "Firefighter (Level 12)"},
			{0x4E684C8, "Pizza Boy (Level 10)"},
			{0x4E6990C, "Vigilante (Level 12)"},
			{0x4E68488, "Taxi (100 Fares)"}
		}},
		{"Safehouses", new Dictionary<int, string> {
			{0x4E69320, "1102 Washington Street"},
			{0x4E69324, "3321 Vice Point"},
			{0x4E69328, "El Swanko Casa"},
			{0x4E6931C, "Hyman Condo"},
			{0x4E6932C, "Links View"},
			{0x4E69330, "Ocean Heights"},
			{0x4E69318, "Skumole Shack"}
		}},
	};

	// Script names used for mission start checking
	vars.scripts = new Dictionary<string,string> {
		{"lawyer1", "The Party"},
		{"lawyer2", "Back Alley Brawl"},
		{"lawyer3", "Jury Fury"},
		{"lawyer4", "Riot"},
		{"generl1", "Treacherous Swine"},
		{"col2", "Mall Shootout"},
		{"generl3", "Guardian Angels"},
		{"col_4", "Sir, Yes Sir!"},
		{"col_5", "All Hands on Deck!"},
		{"baron1", "The Chase"},
		{"baron2", "Phnom Penh '86"},
		{"baron3", "The Fastest Boat"},
		{"baron4", "Supply & Demand"},
		{"baron5", "Rub Out"},
		{"kent1", "Death Row"},
		{"serg1", "Four Iron"},
		{"serg3", "Demolition Man"},
		{"serg2", "Two Bit Hit"},
		{"bankjo1", "No Escape?"},
		{"bankjo2", "The Shootist"},
		{"bankjo3", "The Driver"},
		{"bankjo4", "The Job"},
		{"phil1", "Gun Runner"},
		{"phil2", "Boomshine Saigon"},
		{"porno1", "Recruitment Drive"},
		{"porno2", "Dildo Dodo"},
		{"porno3", "Martha's Mug Shot"},
		{"porno4", "G-spotlight"},
		{"protec1", "Shakedown"},
		{"protec2", "Bar Brawl"},
		{"protec3", "Cop Land"},
		{"count1", "Spilling the Beans"},
		{"count2", "Hit the Courier"},
		{"cap_1", "Cap the Collector"},
		{"fin_1", "Keep Your Friends Close..."},
		{"bike1", "Alloy Wheels of Steel"},
		{"bike2", "Messing with the Man"},
		{"bike3", "Hog Tied"},
		{"cuban1", "Stunt Boat Challenge"},
		{"cuban2", "Cannon Fodder"},
		{"cuban3", "Naval Engagement"},
		{"cuban4", "Trojan Voodoo"},
		{"hait1", "Juju Scramble"},
		{"hait2", "Bombs Away!"},
		{"hait3", "Dirty Lickin's"},
		{"rockb1", "Love Juice"},
		{"rockb2", "Psycho Killer"},
		{"rockb3", "Publicity Tour"},
		{"assin1", "Road Kill"},
		{"assin2", "Waste the Wife"},
		{"assin3", "Autocide"},
		{"assin4", "Check Out at the Check In"},
		{"assin5", "Loose Ends"},
		{"taxwar1", "V.I.P"},
		{"taxwar2", "Friendly Rivarly"},
		{"taxwar3", "Cabmaggedon"},
	};

	// Inserts split into settings and adds the mission to our separate list.
	Action<string, bool> addMissionChain = (contact, defaultValue) => {
		var parent = contact;
		foreach (var mission in vars.missions[contact]) {
			settings.Add(mission.Value, defaultValue, mission.Value, parent);
			// Adding a separate check for stadium to be able to split for all three.
			if (mission.Value == "Hotring" || mission.Value == "Bloodring" || mission.Value == "Dirtring") {
				vars.stadList.Add(mission.Value);
			}
			vars.missionsEnd.Add(mission.Value);
		}
	};
	
	// Inserts header (i.e. mission giver) into settings.
	Action<string, bool, string> addMissionHeader = (contact, defaultValue, header) => {
		var parent = contact;
		settings.Add(parent, defaultValue, header);
		addMissionChain(contact, defaultValue);
	};

	// Copy of above functions for mission/asset start
	Action<string, bool> addMissionChainStart = (missions, defaultValue) => {
		var parent = missions;
		foreach (var mission in vars.missions[missions]) {
			// only add settings we actually want to split on
			if (vars.scripts.ContainsValue(mission.Value)) {
				settings.Add(mission.Value + " (start)", defaultValue, mission.Value, parent + " (start)");
			}
		}
	};
	
	Action<string, bool, string> addMissionHeaderStart = (contact, defaultValue, header) => {
		var parent = contact;
		settings.Add(parent + " (start)", defaultValue, header);
		addMissionChainStart(contact, defaultValue);
	};

	vars.collectibleAddresses = new Dictionary<int,string> {
		{0x4E69334, "Hidden Packages"},
		{0x4E68B10, "Unique Stunt Jumps"},
		{0x4E694B8, "Rampages"},
		{0x4E696B8, "Robberies"}
	};

	// Address offsets
	vars.nameOffset = 0x0;
	vars.scriptOffset = 0x0;
	vars.loadOffset = 0x0;
	vars.flagOffset = 0x0;
	vars.timerOffset = 0x0;
	vars.finishOffset = 0x0;

	// Timer phase storage
	vars.prevPhase = null;

	// Split list to prevent double-splitting
	vars.splits = new List<string>();

	// Lists for checks
	vars.missionsEnd = new List<string>();
	vars.stadList = new List<string>(); // stadium missions list

	// Add settings groups
	settings.Add("Missions (end)", true, "Missions (end)");
	settings.Add("Assets (end)", true, "Assets (end)");
	settings.Add("Missions (start)", false, "Missions (start)");
	settings.Add("Assets (start)", false, "Assets (start)");
	settings.Add("Sunshine Autos", false, "Sunshine Autos", "Assets (end)");
	settings.Add("Odd Jobs", false, "Odd Jobs");
	settings.Add("Collectibles", false, "Collectibles");

	// Adding mission headers
	// Adding mission headers for mission end
	settings.CurrentDefaultParent = "Missions (end)";
	addMissionHeader("Ken Rosenberg", true, "Lawyer");
	addMissionHeader("Avery Carrington", false, "Avery Carrington");
	addMissionHeader("Colonel Cortez", true, "Colonel Cortez");
	addMissionHeader("Ricardo Diaz", true, "Ricardo Diaz");
	
	addMissionHeader("Kent Paul", true, "Kent Paul");
	addMissionHeader("Vercetti", true, "Vercetti");
	addMissionHeader("Umberto Robina", false, "Umberto Robina");
	addMissionHeader("Auntie Poulet", false, "Auntie Poulet");
	
	addMissionHeader("Mitch Baker", false, "Mitch Baker");
	addMissionHeader("Love Fist", false, "Love Fist");
	addMissionHeader("Phil Cassidy", false, "Phil Cassidy");
	addMissionHeader("Mr. Black", false, "Mr. Black");
	
	// Asset (end) headers (includes mansion and printworks).
	settings.CurrentDefaultParent = "Assets (end)";
	addMissionHeader("Vercetti Mansion", true, "Vercetti Mansion");
	addMissionHeader("Printworks", true, "Printworks");
	addMissionHeader("Film Studio", false, "Film Studio");
	addMissionHeader("Kaufman Cabs", false, "Kaufman Cabs");
	addMissionHeader("Malibu", false, "Malibu");

	// Adding mission headers for mission start
	settings.CurrentDefaultParent = "Missions (start)";
	addMissionHeaderStart("Ken Rosenberg", true, "Lawyer");
	addMissionHeaderStart("Avery Carrington", false, "Avery Carrington");
	addMissionHeaderStart("Colonel Cortez", true, "Colonel Cortez");
	addMissionHeaderStart("Ricardo Diaz", true, "Ricardo Diaz");
	
	addMissionHeaderStart("Kent Paul", true, "Kent Paul");
	addMissionHeaderStart("Vercetti", true, "Vercetti");
	addMissionHeaderStart("Umberto Robina", false, "Umberto Robina");
	addMissionHeaderStart("Auntie Poulet", false, "Auntie Poulet");
	
	addMissionHeaderStart("Mitch Baker", false, "Mitch Baker");
	addMissionHeaderStart("Love Fist", false, "Love Fist");
	addMissionHeaderStart("Phil Cassidy", false, "Phil Cassidy");
	addMissionHeaderStart("Mr. Black", false, "Mr. Black");
	
	// Asset (start) headers (includes mansion and printworks).
	settings.CurrentDefaultParent = "Assets (start)";
	addMissionHeaderStart("Vercetti Mansion", true, "Vercetti Mansion");
	addMissionHeaderStart("Printworks", true, "Printworks");
	addMissionHeaderStart("Film Studio", false, "Film Studio");
	addMissionHeaderStart("Kaufman Cabs", false, "Kaufman Cabs");
	addMissionHeaderStart("Malibu", false, "Malibu");

	// Adding settings for "mission2" list and storing in missionList.
	foreach (var mission in vars.missions2)
	{
		settings.CurrentDefaultParent = "Assets (end)";
		// Seperate check for Rifle Range to categorize it appropriately
		if (mission.Key == "Rifle Range (45 Points)") {
			settings.CurrentDefaultParent = "Odd Jobs";
		}
		settings.Add(mission.Key, false, mission.Key);
		vars.missionsEnd.Add(mission.Key);
	}

	// Both SSA objectives
	settings.CurrentDefaultParent = "Sunshine Autos";
	addMissionHeader("Sunshine Autos Imports", false, "Imports");
	addMissionHeader("Sunshine Autos Races", false, "Races");
	
	// And everything else
	settings.CurrentDefaultParent = "Odd Jobs";
	addMissionHeader("Stadium Events", false, "Stadium Events");
	settings.Add("stadAll", false, "Stadium Events (All Done)", "Stadium Events"); // setting used later to split for all 3 stadium missions
	addMissionHeader("Chopper Checkpoints", false, "Chopper Checkpoints");
	addMissionHeader("Off-Road Challenges", false, "Off-Road Challenges");
	addMissionHeader("RC Top-Fun", false, "RC Top-Fun");
	addMissionHeader("Vehicle Missions", false, "Vehicle Missions");
	
	// Collectibles (Packages, Rampages, USJs, Robberies, and Properties/Safehouses).
	settings.CurrentDefaultParent = "Collectibles";
	addMissionHeader("Safehouses", false, "Safehouses");
	foreach (var collectible in vars.collectibleAddresses) {
		settings.Add(collectible.Value+"All", false, collectible.Value+ " (All Done)");
		settings.Add(collectible.Value+"Each", false, collectible.Value+ " (Each)");
	}

	// Debug output
	Action<string> DebugOutput = (text) => {
		print("[GTAVC:DE Autosplitter] "+text);
	};
	vars.DebugOutput = DebugOutput;

	// Split prevention things
	vars.lastLoad = Environment.TickCount;
	vars.waiting = false;

	// Any% final split setting
	settings.CurrentDefaultParent = null;
	settings.Add("any_end", true, "Any% Final Split");
	settings.SetToolTip("any_end", "Splits once you lose control on \"Keep Your Friends Close\".");

	// Used later to count stadium missions
	vars.stadAllCount = 0;
}

init
{
	// Use executable metadata for detecting specific versions
	var fvi = modules.First().FileVersionInfo;
	version = string.Join(".", fvi.FileMajorPart, fvi.FileMinorPart, fvi.FileBuildPart, fvi.FilePrivatePart);
	vars.version = new Version(version);

	switch(version)
	{
		case "1.0.0.14296":
			break;
		case "1.0.0.14388":
			vars.nameOffset = 0x5010; 
			vars.scriptOffset = 0x7400;
			vars.finishOffset = 0x7400;
			vars.loadOffset = 0x42A12C;
			vars.flagOffset = -0x22074B;
			vars.timerOffset = 0x6810;
			break;
		case "1.0.0.14718":
			vars.scriptOffset = 0xC780;
			vars.nameOffset = 0xA360;
			vars.finishOffset = 0xC774;
			vars.timerOffset = 0xBB70;
			vars.flagOffset = -0x46AB23;
			vars.loadOffset = 0x42F4FC; 
			break;
		case "1.0.0.15399":
			vars.scriptOffset = -0x6520;
			vars.nameOffset = 0x6220;
			vars.timerOffset = 0x7A30;
			vars.loadOffset = 0x42B76C;
			vars.flagOffset = -0x46EB33;
			vars.finishOffset = -0x652C; // I don't think this is correct, so TODO: replace this with a correct offset
			break;
	}

	// Add memory watchers
	vars.memoryWatchers = new MemoryWatcherList();

	vars.memoryWatchers.Add(new StringWatcher(new DeepPointer(0x4C44980+vars.nameOffset), 10){ Name = "MissionScript" });
	vars.memoryWatchers.Add(new MemoryWatcher<int>(new DeepPointer(0x4C4FFB4+vars.timerOffset)){ Name = "GameTimer" });

	// Not sure how this flag acts outside the intro, so it's only used for the start
	vars.memoryWatchers.Add(new MemoryWatcher<byte>(new DeepPointer(0x508F3F3+vars.flagOffset)) { Name = "startFlag" });

	// Used for split prevention on loads
	vars.memoryWatchers.Add(new MemoryWatcher<bool>(new DeepPointer(0x4C1A8C0+vars.loadOffset)) { Name = "loading" });

	// Final any% split stuff
	vars.memoryWatchers.Add(new MemoryWatcher<int>(new DeepPointer(0x4E6D0A4+vars.finishOffset)) { Name = "vance_flag" });
	vars.memoryWatchers.Add(new MemoryWatcher<int>(new DeepPointer(0x4E6D0BC+vars.finishOffset)) { Name = "sonny_flag" });
	vars.memoryWatchers.Add(new MemoryWatcher<int>(new DeepPointer(0x4E6D0B8+vars.finishOffset)) { Name = "sonny_timer" });


	// Missions
	foreach (var strand in vars.missions) {
		foreach (var address in strand.Value) {
			if (address.Value == "Dirtring" || address.Value == "RC Raider" || address.Value == "RC Baron" || address.Value == "RC Bandit") {
				// 1.0.0.14718 and up have different offsets for these 4
				if (vars.version.Revision >= 14718) {
					vars.memoryWatchers.Add(new MemoryWatcher<int>(new DeepPointer(address.Key+vars.finishOffset)){ Name = address.Value });
				} else {
					vars.memoryWatchers.Add(new MemoryWatcher<int>(new DeepPointer(address.Key+vars.scriptOffset)){ Name = address.Value });
				}
			}
			vars.memoryWatchers.Add(new MemoryWatcher<int>(new DeepPointer(address.Key+vars.scriptOffset)){ Name = address.Value });
		}
	}

	foreach (var address in vars.missions2) {
		vars.memoryWatchers.Add(new MemoryWatcher<int>(new DeepPointer(address.Value+vars.scriptOffset)){ Name = address.Key });
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
		if (settings["stadAll"]) {
			foreach (var stadEvent in vars.stadList) {
				if (vars.memoryWatchers[stadEvent].Current > vars.memoryWatchers[stadEvent].Old && !vars.splits.Contains(stadEvent)) {
					vars.splits.Add(stadEvent);
					// add the completed stadium mission to splits list, and increment total counter by 1.
					vars.stadAllCount = vars.stadAllCount + 1;
					if (vars.stadAllCount == 3) {
						// when all 3 are done, split!
						vars.DebugOutput("All Stadium Events Split");
						return true;
					}
				}
			}
		}
		if (settings[mission]) {
			if (vars.memoryWatchers[mission].Current > vars.memoryWatchers[mission].Old) {
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
				int max = 15;
				if (collectible.Value == "Rampages")	{
					max = 35;
				}
				if (collectible.Value == "Unique Stunt Jumps") {
					max = 36;
				}
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
		if (vars.memoryWatchers["vance_flag"].Current == -11 && vars.memoryWatchers["sonny_flag"].Current == -11) {
			if (vars.memoryWatchers["sonny_timer"].Current < vars.memoryWatchers["GameTimer"].Current) {
				if (!vars.splits.Contains("any_end")) {
					vars.splits.Add("any_end");
					vars.DebugOutput("Any% final split");
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
	var time = vars.memoryWatchers["GameTimer"];
	var loading = vars.memoryWatchers["loading"];

	// New Game
	//=========
	/*
	 * startFlag switches to 0 from 1 when the game begins to fade out to the intro cutscene.
	 * The check for the thread, load and time is there just for safety.
	 */
	if (!loading.Current && startFlag.Current == 0 && startFlag.Old != 0 && thread.Current == "intro" && time.Current < 5 * 1000)
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
	var time = vars.memoryWatchers["GameTimer"];
	var loading = vars.memoryWatchers["loading"];

	/*
	 * Use same check for reset for the timer to reset and start in the same cycle.
	 * Only downside is that accidental new game will reset the timer (but who would do that with the way DE menu is laid out?)
	*/
	if (!loading.Current && startFlag.Current == 0 && startFlag.Old != 0 && thread.Current == "intro" && time.Current < 5 * 1000)
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

