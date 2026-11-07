// GTA Vice City Definitive Edition Autosplitter (Universal / Platform-Agnostic)
// Supports: Steam, Rockstar Games Launcher (RGL), Epic Games Store across all versions:
// 1.0, 1.01, 1.03, 1.04, 1.04.5, 1.0.17 (Steam/Epic), 1.112 (Steam/RGL/Epic), 1.113+
// Created by hoxi & kouty, updated with dynamic scanning and multi-platform architecture.

state("ViceCity"){}

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
		if (mission.Key == "Rifle Range (45 Points)") {
			settings.CurrentDefaultParent = "Odd Jobs";
		}
		settings.Add(mission.Key, false, mission.Key);
		vars.missionsEnd.Add(mission.Key);
	}

	// Sunshine Autos objectives
	settings.CurrentDefaultParent = "Sunshine Autos";
	addMissionHeader("Sunshine Autos Imports", false, "Imports");
	addMissionHeader("Sunshine Autos Races", false, "Races");
	
	// Odd jobs
	settings.CurrentDefaultParent = "Odd Jobs";
	addMissionHeader("Stadium Events", false, "Stadium Events");
	settings.Add("stadAll", false, "Stadium Events (All Done)", "Stadium Events");
	addMissionHeader("Chopper Checkpoints", false, "Chopper Checkpoints");
	addMissionHeader("Off-Road Challenges", false, "Off-Road Challenges");
	addMissionHeader("RC Top-Fun", false, "RC Top-Fun");
	addMissionHeader("Vehicle Missions", false, "Vehicle Missions");
	
	// Collectibles
	settings.CurrentDefaultParent = "Collectibles";
	addMissionHeader("Safehouses", false, "Safehouses");
	foreach (var collectible in vars.collectibleAddresses) {
		settings.Add(collectible.Value+"All", false, collectible.Value+ " (All Done)");
		settings.Add(collectible.Value+"Each", false, collectible.Value+ " (Each)");
	}

	// Debug output
	Action<string> DebugOutput = (text) => {
		print("[GTAVC:DE Universal] "+text);
	};
	vars.DebugOutput = DebugOutput;

	// Split prevention variables
	vars.lastLoad = Environment.TickCount;
	vars.waiting = false;
	vars.wasLoading = false;

	// Set in init, false if the addresses couldn't be found
	vars.ready = false;

	// Any% final split setting
	settings.CurrentDefaultParent = null;
	settings.Add("any_end", true, "Any% Final Split");
	settings.SetToolTip("any_end", "Splits once you lose control on \"Keep Your Friends Close\".");

	vars.stadAllCount = 0;
}

init
{
	var mainModule = modules.First();
	var fvi = mainModule.FileVersionInfo;
	version = string.Join(".", fvi.FileMajorPart, fvi.FileMinorPart, fvi.FileBuildPart, fvi.FilePrivatePart);
	if (string.IsNullOrEmpty(version) || version == "0.0.0.0")
	{
		version = fvi.ProductVersion ?? "";
	}
	vars.DebugOutput("Detected executable version: " + (string.IsNullOrEmpty(version) ? "<unknown>" : version));

	var scanner = new SignatureScanner(game, mainModule.BaseAddress, mainModule.ModuleMemorySize);

	IntPtr ptrScript = IntPtr.Zero;
	IntPtr ptrStart = IntPtr.Zero;
	IntPtr ptrLoading = IntPtr.Zero;
	IntPtr ptrMission = IntPtr.Zero;

	int scriptSpaceRVA = 0;
	int startFlagRVA = 0;
	int loadingRVA = 0;
	int missionScriptRVA = 0;
	vars.scriptOffset = 0;

	// 1. ScriptSpace scan (Array of global script variables)
	// Instruction: lea rdi, [rip + disp32] (CRunningScript variable access)
	var targetScript = new SigScanTarget(6, "8b 51 18 48 8d 3d ?? ?? ?? ?? 48 03 d7");
	ptrScript = scanner.Scan(targetScript);
	if (ptrScript != IntPtr.Zero)
	{
		scriptSpaceRVA = (int)(ptrScript.ToInt64() - mainModule.BaseAddress.ToInt64() + game.ReadValue<int>(ptrScript) + 4);
		vars.scriptOffset = scriptSpaceRVA - 0x4E679F0;
		vars.DebugOutput(string.Format("Found ScriptSpace at RVA 0x{0:X} (scriptOffset: 0x{1:X})", scriptSpaceRVA, vars.scriptOffset));
	}
	else
	{
		vars.DebugOutput("ScriptSpace pattern scan failed!");
	}

	// 2. StartFlag scan (Menu start transition flag)
	// Instruction: e8 [disp32] 32 c0 c6 05 [disp32] 00 (sets flag to 0 on New Game transition)
	var targetStart = new SigScanTarget(9, "e8 ?? ?? ?? ?? 32 c0 c6 05 ?? ?? ?? ?? 00");
	ptrStart = scanner.Scan(targetStart);
	if (ptrStart != IntPtr.Zero)
	{
		startFlagRVA = (int)(ptrStart.ToInt64() - mainModule.BaseAddress.ToInt64() + game.ReadValue<int>(ptrStart) + 5);
		vars.DebugOutput(string.Format("Found startFlag at RVA 0x{0:X}", startFlagRVA));
	}
	else
	{
		vars.DebugOutput("startFlag pattern scan failed!");
	}

	// 3. Loading scan (Game loading state boolean)
	var targetLoading = new SigScanTarget(0, "8b 15 ?? ?? ?? ?? e8 ?? ?? ?? ?? 8b 05 ?? ?? ?? ?? 89 05 ?? ?? ?? ?? c6 05 ?? ?? ?? ?? 01");
	ptrLoading = scanner.Scan(targetLoading);
	if (ptrLoading != IntPtr.Zero)
	{
		// The flag is cleared right after the pattern, by one of two 7 byte instructions
		byte op = game.ReadValue<byte>(ptrLoading + 30);
		if (op == 0xC6) // c6 05 [disp32] 00 (up to 1.0.17)
		{
			loadingRVA = (int)((ptrLoading + 37).ToInt64() - mainModule.BaseAddress.ToInt64() + game.ReadValue<int>(ptrLoading + 32));
		}
		else if (op == 0x40) // 40 88 3d [disp32] (1.112+)
		{
			loadingRVA = (int)((ptrLoading + 37).ToInt64() - mainModule.BaseAddress.ToInt64() + game.ReadValue<int>(ptrLoading + 33));
		}

		if (loadingRVA != 0)
		{
			vars.DebugOutput(string.Format("Found loading at RVA 0x{0:X}", loadingRVA));
		}
		else
		{
			vars.DebugOutput(string.Format("Loading pattern found, but followed by unknown opcode 0x{0:X2}!", op));
		}
	}
	else
	{
		vars.DebugOutput("Loading pattern scan failed!");
	}

	// 4. MissionScript scan (Current running mission thread name: "intro", "lawyer1", etc.)
	// Instruction: 89 05 [disp32] 48 8d 0d [disp32] 49 8b c2
	// lea rcx, [rip + disp32] loads pointer to presence string buffer; +0x5C is the mission script string
	var targetMission = new SigScanTarget(9, "89 05 ?? ?? ?? ?? 48 8d 0d ?? ?? ?? ?? 49 8b c2");
	ptrMission = scanner.Scan(targetMission);
	if (ptrMission != IntPtr.Zero)
	{
		int disp = game.ReadValue<int>(ptrMission);
		missionScriptRVA = (int)(ptrMission.ToInt64() - mainModule.BaseAddress.ToInt64() + disp + 4 + 0x5C);
		vars.DebugOutput(string.Format("Found MissionScript at RVA 0x{0:X}", missionScriptRVA));
	}
	else
	{
		vars.DebugOutput("MissionScript pattern scan failed!");
	}

	// Every address comes from the pattern scans above, so no per-executable offset table is needed.
	// If a scan fails (i.e. a future update changed the code), disable the autosplitter instead of reading garbage.
	vars.ready = ptrScript != IntPtr.Zero && startFlagRVA != 0 && loadingRVA != 0 && missionScriptRVA != 0;
	if (!vars.ready)
	{
		vars.DebugOutput("One or more pattern scans failed for version " + version + ", autosplitter disabled!");
	}

	// Determine variable offset shifts across game updates.
	// These only depend on which main.scm the update shipped with, so the version number is enough
	// and it doesn't matter which store the executable is from.
	// Every watched variable was checked against the main.scm of each update.
	int layoutGroup = 1;
	int lateShift = 0; // shift of the variables at the end of the variable space
	if (fvi.FileBuildPart >= 112)
	{
		layoutGroup = 3; // 1.112+ Title Updates
		vars.DebugOutput("Variable layout: Group 3 (Title Update 1.112+)");
	}
	else if (fvi.FileBuildPart >= 8 || fvi.FilePrivatePart >= 15399)
	{
		layoutGroup = 2; // 1.04, 1.04.5, Steam, Epic
		lateShift = -4;
		vars.DebugOutput("Variable layout: Group 2 (1.04 through 1.0.17)");
	}
	else if (fvi.FilePrivatePart >= 14718)
	{
		lateShift = -12; // 1.03
		vars.DebugOutput("Variable layout: Group 1 (1.03)");
	}
	else
	{
		vars.DebugOutput("Variable layout: Group 1 (1.0 and 1.01)");
	}

	// Single unified function returning the exact byte offset inside ScriptSpace
	Func<int, int> getVarOffset = (baseOffset10) => {
		if (layoutGroup == 3) {
			if (baseOffset10 < 2500) return baseOffset10 + 4;   // Contact missions (+4 bytes)
			if (baseOffset10 < 5000) return baseOffset10 + 8;   // Off-Road, Taxi, Pizza, Boatyard, USJ (+8 bytes)
			if (baseOffset10 < 20000) return baseOffset10 + 12; // Pole Position, Sunshine, Collectibles, Stadium (+12 bytes)
			if (baseOffset10 < 30000) return baseOffset10;      // Final mission variables (same as 1.0)
			if (baseOffset10 < 33000) return baseOffset10 + 12; // Dirtring (+12 bytes)
			return baseOffset10 + 16;                           // RC Top-Fun (+16 bytes)
		}
		// 1.03 through 1.0.17: only the final mission variables, Dirtring and RC Top-Fun moved
		if (baseOffset10 >= 20000) return baseOffset10 + lateShift;
		return baseOffset10;
	};

	// Add memory watchers
	vars.memoryWatchers = new MemoryWatcherList();

	vars.memoryWatchers.Add(new StringWatcher(new DeepPointer(missionScriptRVA), 10){ Name = "MissionScript" });
	vars.memoryWatchers.Add(new MemoryWatcher<byte>(new DeepPointer(startFlagRVA)) { Name = "startFlag" });
	vars.memoryWatchers.Add(new MemoryWatcher<bool>(new DeepPointer(loadingRVA)) { Name = "loading" });

	// Final any% split stuff
	// GameTimer is the script variable the missions store the game time in every frame. The final mission
	// itself compares it against sonny_timer to decide when control is taken away.
	vars.memoryWatchers.Add(new MemoryWatcher<int>(new DeepPointer(scriptSpaceRVA + getVarOffset(0x4E6CD60 - 0x4E679F0))) { Name = "GameTimer" });
	vars.memoryWatchers.Add(new MemoryWatcher<int>(new DeepPointer(scriptSpaceRVA + getVarOffset(0x4E6D0A4 - 0x4E679F0))) { Name = "vance_flag" });
	vars.memoryWatchers.Add(new MemoryWatcher<int>(new DeepPointer(scriptSpaceRVA + getVarOffset(0x4E6D0BC - 0x4E679F0))) { Name = "sonny_flag" });
	vars.memoryWatchers.Add(new MemoryWatcher<int>(new DeepPointer(scriptSpaceRVA + getVarOffset(0x4E6D0B8 - 0x4E679F0))) { Name = "sonny_timer" });

	// Missions
	foreach (var strand in vars.missions) {
		foreach (var address in strand.Value) {
			int varOffset = getVarOffset(address.Key - 0x4E679F0);
			vars.memoryWatchers.Add(new MemoryWatcher<int>(new DeepPointer(scriptSpaceRVA + varOffset)){ Name = address.Value });
		}
	}

	foreach (var address in vars.missions2) {
		int varOffset = getVarOffset(address.Value - 0x4E679F0);
		vars.memoryWatchers.Add(new MemoryWatcher<int>(new DeepPointer(scriptSpaceRVA + varOffset)){ Name = address.Key });
	}

	// Collectibles
	foreach (var collectible in vars.collectibleAddresses) {
		int varOffset = getVarOffset(collectible.Key - 0x4E679F0);
		vars.memoryWatchers.Add(new MemoryWatcher<int>(new DeepPointer(scriptSpaceRVA + varOffset)){ Name = collectible.Value });
	}
}

update
{
	// Disables start, split and reset if init couldn't find the addresses
	if (!vars.ready) return false;

	try
	{
		vars.memoryWatchers.UpdateAll(game);
	}
	catch (Exception)
	{
		return false;
	}

	// If timer state changes.
	if (timer.CurrentPhase != vars.prevPhase) {
		// Cleanup when the timer is stopped.
		if (timer.CurrentPhase == TimerPhase.NotRunning) {
			vars.splits.Clear();
			vars.stadAllCount = 0;
		}
		vars.prevPhase = timer.CurrentPhase;
	}
}

split
{
	//=============================================================================
	// Split prevention
	//=============================================================================
	if (vars.memoryWatchers["loading"].Current) {
		if (!vars.wasLoading)
		{
			vars.DebugOutput("Loading");
			vars.wasLoading = true;
		}
		vars.lastLoad = Environment.TickCount;
		return false;
	}
	vars.wasLoading = false;
	if (Environment.TickCount - vars.lastLoad < 500) {
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
	if (settings["stadAll"]) {
		foreach (var stadEvent in vars.stadList) {
			if (vars.memoryWatchers[stadEvent].Current > vars.memoryWatchers[stadEvent].Old && !vars.splits.Contains(stadEvent)) {
				vars.splits.Add(stadEvent);
				vars.stadAllCount = vars.stadAllCount + 1;
				if (vars.stadAllCount == 3) {
					vars.DebugOutput("All Stadium Events Split");
					return true;
				}
			}
		}
	}
	foreach (var mission in vars.missionsEnd) {
		if (settings[mission]) {
			var flag = vars.memoryWatchers[mission];
			if (flag.Current > flag.Old) {
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
	var thread = vars.memoryWatchers["MissionScript"];
	string threadName = thread.Current;
	if (threadName != null && thread.Changed && vars.scripts.ContainsKey(threadName)) {
		string startName = vars.scripts[threadName] + " (start)";
		if (settings[startName] && !vars.splits.Contains(startName)) {
			vars.DebugOutput("Mission Start Split: " + startName);
			vars.splits.Add(startName);
			return true;
		}
	}

	//=============================================================================
	// Collectibles check
	//=============================================================================
	foreach (var collectible in vars.collectibleAddresses) {
		var cvalue = vars.memoryWatchers[collectible.Value.ToString()];
		if (cvalue.Current > cvalue.Old) {
			if (settings[collectible.Value+"All"])
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
			if (settings[collectible.Value+"Each"]) {
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
			vars.DebugOutput("New Game started!");
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
	*/
	if (startFlag.Current == 0 && startFlag.Old == 1 && thread.Current == "intro")
	{
		if (settings.ResetEnabled)
		{
			vars.DebugOutput("Reset triggered");
			vars.splits.Clear();
			vars.stadAllCount = 0;
		}
		return true;
	}
}
