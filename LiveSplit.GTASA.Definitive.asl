// GTA San Andreas Definitive Edition autosplitter
// Original code by tduva and contributors, adapted for DE by hoxi
// The variable names in the comments are a combination of old OG SA ones and new SA DE ones, so don't take all you see here as 100% correct
// Patterns for signature scanning and global variable indexes provided by Parik


state("SanAndreas", "1.0.0.14296"){}
state("SanAndreas", "1.0.0.14388"){}
state("SanAndreas", "1.0.0.14718"){}

startup
{
	//=============================================================================
	// Memory Addresses
	//=============================================================================
	// There are more memory addresses defined in `init` in the "Version Detection"
	// and "Memory Watcher" sections.

	// Collectibles
	//=============
	/*
	 * Collectible type acts as setting ID, so don't change it.
	 */
	vars.collectibles = new Dictionary<string,int> {
		{"Photos",	166},
		{"Tags",	322},
		{"Oysters",	243},
		{"Horseshoes", 241},
		{"Stunts (Completed)", 145}
	};

	// Missions
	//=========
	/*
	 * Global variable index and the associated values and missions.
	 *
	 * Commenting out missions may interfere with custom splits that
	 * refer to their status (MissionPassed-function).
	 *
	 * Mission names defined here also act as setting IDs, so don't change
	 * them.
	 */
	vars.missions = new Dictionary<int, Dictionary<int, string>> {
		{450, new Dictionary<int, string> { // $INTRO_TOTAL_PASSED_MISSIONS
			{1, "Big Smoke"},
			{2, "Ryder"}
		}},
		{454, new Dictionary<int, string> { // $SWEET_TOTAL_PASSED_MISSIONS
			{1, "Tagging up Turf"},
			{2, "Cleaning the Hood"},
			{3, "Drive-Thru"},
			{4, "Nines and AKs"},
			{5, "Drive-By"},
			{6, "Sweet's Girl"},
			{7, "Cesar Vialpando"},
			{8, "Doberman"},
			{9, "Los Sepulcros"}
		}},
		{456, new Dictionary<int, string> { // $SMOKE_TOTAL_PASSED_MISSIONS
			{1, "OG Loc"},
			{2, "Running Dog"},
			{3, "Wrong Side of the Tracks"},
			{4, "Just Business"}
		}},
		{455, new Dictionary<int, string> { // $RYDER_TOTAL_PASSED_MISSIONS
			{1, "Home Invasion"},
			{2, "Catalyst"},
			{3, "Robbing Uncle Sam"}
		}},
		{460, new Dictionary<int, string> { // $LS_FINAL_TOTAL_PASSED_MISSIONS
			{1, "Reuniting the Families"},
			{2, "The Green Sabre"}
		}},
		{458, new Dictionary<int, string> { // $CRASH_LS_TOTAL_PASSED_MISSIONS
			{1, "Burning Desire"},
			{2, "Gray Imports"}
		}},
		{457, new Dictionary<int, string> { // $OG_LOC_TOTAL_PASSED_MISSIONS
			{1, "Life's a Beach"},
			{2, "Madd Dogg's Rhymes"},
			{3, "Management Issues"},
			{4, "House Party (Cutscene)"},
			{5, "House Party"}
		}},
		{459, new Dictionary<int, string> { // $MISSION_LOWRIDER_PASSED
			{1, "High Stakes Lowrider"}
		}}, 
		{495, new Dictionary<int, string> { // $MISSION_BADLANDS_PASSED
			{1, "Badlands"}
		}},
		{720, new Dictionary<int, string> { // $MISSION_TANKER_COMMANDER_PASSED
			{1, "Tanker Commander"}
		}},
		{719, new Dictionary<int, string> { // $MISSION_SMALL_TOWN_BANK_PASSED
			{1, "Small Town Bank"}
		}},
		{718, new Dictionary<int, string> { // $MISSION_LOCAL_LIQUOR_STORE_PASSED
			{1, "Local Liquor Store"}
		}},
		{721, new Dictionary<int, string> { // $ALL_CATALINA_MISSIONS_PASSED (not aptly named variable)
			{1, "Against All Odds"}
		}},
		{3584, new Dictionary<int, string> { // $2163
			{1, "King in Exile"}
		}},
		{493, new Dictionary<int, string> { // $TRUTH_TOTAL_PASSED_MISSIONS
			{1, "Body Harvest"},
			{2, "Are You Going To San Fierro?"}
		}},
		{3751, new Dictionary<int, string> { // $RACES_WON_NUMBER (first 3 Races are in a fixed order due to missions)
			{2, "Wu Zi Mu"},
			{3, "Farewell, My Love"},
			{25, "All Races Won"}
		}},
		{543, new Dictionary<int, string> { // $GARAGE_TOTAL_PASSED_MISSIONS
			{1, "Wear Flowers in your Hair"},
			{2, "Deconstruction"}
		}},
		{545, new Dictionary<int, string> { // $WUZIMU_TOTAL_PASSED_MISSIONS
			{1, "Mountain Cloud Boys"},
			{2, "Ran Fa Li"},
			{3, "Lure"},
			{4, "Amphibious Assault"},
			{5, "The Da Nang Thang"}
		}},
		{547, new Dictionary<int, string> { // $SYNDICATE_TOTAL_PASSED_MISSIONS
			{1, "Photo Opportunity"},
			{2, "Jizzy (Cutscene)"},
			{3, "Jizzy"},
			{4, "T-Bone Mendez"},
			{5, "Mike Toreno"},
			{6, "Outrider"},
			{7, "Ice Cold Killa"},
			{8, "Pier 69"},
			{9, "Toreno's Last Flight"},
			{10, "Yay Ka-Boom-Boom"}
		}},
		{548, new Dictionary<int, string> { // $CRASH_SF_TOTAL_PASSED_MISSIONS
			{1, "555 WE TIP"},
			{2, "Snail Trail"}
		}},
		{595, new Dictionary<int, string> { // $TORENO_TOTAL_PASSED_MISSIONS
			{1, "Monster"},
			{2, "Highjack"},
			{3, "Interdiction"},
			{4, "Verdant Meadows"},
			{5, "Learning to Fly"},
			{6, "N.O.E."},
			{7, "Stowaway"},
			{8, "Black Project"},
			{9, "Green Goo"}
		}},
		{544, new Dictionary<int, string> { // $ZERO_TOTAL_PASSED_MISSIONS
			{1, "Air Raid"},
			{2, "Supply Lines..."},
			{3, "New Model Army"}
		}},
		{546, new Dictionary<int, string> { // $STEAL_TOTAL_PASSED_MISSIONS
			{1, "Zeroing In"},
			{2, "Test Drive"},
			{3, "Customs Fast Track"},
			{4, "Puncture Wounds"}
		}},
		{599, new Dictionary<int, string> { // $CASINO_TOTAL_PASSED_MISSIONS
			{1, "Fender Ketchup"},
			{2, "Explosive Situation"},
			{3, "You've Had Your Chips"},
			{4, "Don Peyote"},
			{5, "Intensive Care"},
			{6, "The Meat Business"},
			{7, "Fish in a Barrel"},
			{8, "Freefall"},
			{9, "Saint Mark's Bistro"}
		}},
		{600, new Dictionary<int, string> { // $598 (CRASH_LV)
			{1, "Misappropriation"},
			{2, "High Noon"}
		}},
		{601, new Dictionary<int, string> { // $599 (Madd Dogg)
			{1, "Madd Dogg"}
		}},
		{602, new Dictionary<int, string> { // $HEIST_TOTAL_PASSED_MISSIONS
			{1, "Architectural Espionage"},
			{2, "Key to her Heart"},
			{3, "Dam and Blast"},
			{4, "Cop Wheels"},
			{5, "Up, Up and Away!"},
			{6, "Breaking the Bank at Caligula's"}
		}},
		{628, new Dictionary<int, string> { // $MANSION_TOTAL_PASSED_MISSIONS
			{1, "A Home in the Hills"},
			{2, "Vertical Bird"},
			{3, "Home Coming"},
			{4, "Cut Throat Business"}
		}},
		{629, new Dictionary<int, string> { // $GROVE_TOTAL_PASSED_MISSIONS
			{1, "Beat Down on B Dup"},
			{2, "Grove 4 Life"}
		}},
		{631, new Dictionary<int, string> { // $RIOT_TOTAL_PASSED_MISSIONS
			{1, "Riot"},
			{2, "Los Desperados"},
			{3, "End of the Line Part 1"},
			{4, "End of the Line Part 2"},
			{5, "End of the Line Part 3"} // After credits
		}},
		{9581, new Dictionary<int, string> { // $TRUCKING_TOTAL_PASSED_MISSIONS
			{1, "Trucking 1"},
			{2, "Trucking 2"},
			{3, "Trucking 3"},
			{4, "Trucking 4"},
			{5, "Trucking 5"},
			{6, "Trucking 6"},
			{7, "Trucking 7"},
			{8, "Trucking 8"}
		}},
		{9593, new Dictionary<int,string> {
			{1, "Quarry 1"},
			{2, "Quarry 2"},
			{3, "Quarry 3"},
			{4, "Quarry 4"},
			{5, "Quarry 5"},
			{6, "Quarry 6"},
			{7, "Quarry 7"}
		}}
	/*
		{0x64A9C4, new Dictionary<int, string> { // $CURRENT_WANTED_LIST (Export)
			{1, "Export List 1 Complete"},
			{2, "Export List 2 Complete"}
		}},
		{0x64ABE0, new Dictionary<int, string> { // $ALL_CARS_COLLECTED_FLAG
			{1, "Export List 3 Complete"}
		}},
	*/
	};

	// Other Missions
	//===============
	// Addresses that are responsible for a single mission each.
	//
	vars.missions2 = new Dictionary<string, Dictionary<int, string>> {
		// Flight School not here because it is a Story Mission
		{"Schools", new Dictionary<int, string> {
			{8832, "Driving School Passed"},	// $MISSION_BACK_TO_SCHOOL_PASSED
			{3390, "Boat School Passed"},	// $MISSION_BOAT_SCHOOL_PASSED
			{3622, "Bike School Passed"},	// $MISSION_DRIVING_SCHOOL_PASSED (actually Bike School)
		}},
		{"Vehicle Submissions", new Dictionary<int, string> {
			{2898, "Firefighter Complete"},	// $1489 (directly goes to 2 when complete)
			{2897, "Vigilante Complete"},	// $1488
			{2900, "Taxi Mission Complete"},	// $MISSION_TAXI_PASSED ($1491)
			{2896, "Paramedic Complete"},	// $1487
			{3412, "Pimping Complete"},		// $MISSION_PIMPING_PASSED ($1991)
		}},
		{"Properties", new Dictionary<int, string> {
			{3039, "Zero (RC Shop Bought)"},
			{735, "Santa Maria Beach (Safehouse)"},
			{736, "Rockshore West (Safehouse)"},
			{737, "Fort Carson (Safehouse)"},
			{738, "Prickle Pine (Safehouse)"},
			{739, "Whitewood Estate (Safehouse)"},
			{740, "Palomino Creek (Safehouse)"},
			{741, "Redsands West (Safehouse)"},
			{742, "Verdant Bluffs (Safehouse)"},
			{743, "Calton Heights (Safehouse)"},
			{744, "Mulholland (Safehouse)"},
			{745, "Paradiso (Safehouse)"},
			{746, "Hashbury (Safehouse)"},
			{747, "Verona Beach (Safehouse)"},
			{748, "Pirates In Men's Pants (Hotel Suite)"},
			{749, "The Camel's Toe (Hotel Suite)"},
			{750, "Chinatown (Safehouse)"},
			{751, "Whetstone (Safehouse)"},
			{752, "Doherty (Safehouse)"},
			{753, "Queens (Hotel Suite)"},
			{754, "Angel Pine (Safehouse)"},
			{755, "El Quebrados (Safehouse)"},
			{756, "Tierra Robada (Safehouse)"},
			{757, "Dillimore (Safehouse)"},
			{758, "Jefferson (Safehouse)"},
			{759, "Old Venturas Strip (Hotel Suite)"},
			{760, "The Clown's Pocket (Hotel Suite)"},
			{761, "Creek (Safehouse)"},
			{762, "Willowfield (Safehouse)"},
			{763, "Blueberry (Safehouse)"},
		}},
		{"Freight", new Dictionary<int, string> {
			{9670, "Freight Level 1"},	// $8240
			{9669, "Freight Level 2"},	// $8239 (goes to 2 at the end of the level)
		}},
		{"Gym Moves", new Dictionary<int, string> {
			{9575, "Los Santos Gym Moves"}, 	// $8153
			{9576, "San Fierro Gym Moves"}, 	// $8154
			{9580, "Las Venturas Gym Moves"}, 	// $8158
		}},
		{"Challenges", new Dictionary<int, string> {
			{4214, "NRG-500 Stunt Challenge"}, 	// $4214
			{4213, "BMX Stunt Challenge"},	// $4213
			{6690, "Shooting Range Complete"}, 	// $5272
		}},	
		{"Assets", new Dictionary<int, string> {
			{3413, "Los Santos Courier"}, 	// $MISSION_COURIER_LS_PASSED ($1992)
			{3414, "Las Venturas Courier"}, 	// $MISSION_COURIER_LV_PASSED ($1993)
			{3415, "San Fierro Courier"}, 	// $MISSION_COURIER_SF_PASSED ($1994)
			{3320, "Valet Parking Complete"}, 	// $1900
		}},
		// Races addresses are based on the global variable $RACES_WON ($3661), which
		// is an array. The number in the comment is the $RACE_INDEX ($353).
		// 
		// Missing are races that are already done during story missions:
		// Lowrider Race (0), Badlands A (7), Badlands B (8)
		//
		{"LS Races", new Dictionary<int, string> {
			{3722, "Little Loop"},		// 1
			{3723, "Backroad Wanderer"}, 	// 2
			{3724, "City Circuit"},		// 3
			{3725, "Vinewood (Race)"},		// 4
			{3726, "Freeway (Race)"},		// 5
			{3727, "Into the Country"},		// 6
		}},
		{"SF Races", new Dictionary<int, string> {	
			{3728, "Dirtbike Danger"},		// 9
			{3729, "Bandito County"},		// 10
			{3730, "Go-Go Karting"},		// 11
			{3731, "San Fierro Fastlane"}, 	// 12
			{3732, "San Fierro Hills"},		// 13
			{3733, "Country Endurance"}, 	// 14
		}},
		{"LV Races", new Dictionary<int, string> {
			{3734, "SF to LV"},			// 15
			{3735, "Dam Rider"},		// 16
			{3736, "Desert Tricks"},		// 17
			{3737, "LV Ringroad"},		// 18
		}},
		{"Air Races", new Dictionary<int, string> {
			{3738, "World War Ace"},		// 19
			{3739, "Barnstorming"},		// 20
			{3740, "Military Service"}, 	// 21
			{3741, "Chopper Checkpoint"}, 	// 22
			{3742, "Whirly Bird Waypoint"},	// 23
			{3743, "Heli Hell"},		// 24
		}},
		{"Stadium Events", new Dictionary<int, string> {
			{3744, "8-Track"},			// 25
			{3745, "Dirt Track"},		// 26
			{91, "Kickstart"}, 		// $MISSION_KICKSTART_PASSED ($90)
			{3362, "Bloodring"}, 		// $MISSION_BLOODRING_PASSED ($1941)
		}},
	};

	// Import/Export
	//==============
	vars.exportLists = new Dictionary<int, List<string>> {
		{0, new List<string> {
			"Buffalo", "Sentinel", "Infernus", "Camper", "Admiral",
			"Patriot", "Sanchez", "Stretch", "Feltzer", "Remington"
		}},
		{1, new List<string> {
			"Cheetah", "Rancher", "Stallion", "Tanker", "Comet",
			"Slamvan", "Blista Compact", "Stafford", "Sabre", "FCR-900"
		}},
		{2, new List<string> {
			"Banshee", "Super GT", "Journey", "Huntley", "BF Injection",
			"Blade", "Freeway", "Mesa", "ZR-350", "Euros"
		}}
	};

	// Thread Start
	//=============
	// Split when a certain thread was started, usually when a mission was started.
	//
	vars.startMissions = new Dictionary<string, string> {
		{"grove2", "GT #1"},	// Grove 4 Life
		{"manson5", "GT #2"},	// Cut Throat Business
		{"steal", "Wang Cars (Showroom Bought)"},
		{"planes", "Plane Flight"},
		{"psch", "Verdant Meadows (Safehouse)"},
		{"dskool", "Driving School Started"}
	};

	//=============================================================================
	// Utility Functions
	//=============================================================================

	/*
	 * Easier debug output.
	 */
	Action<string> DebugOutput = (text) => {
		print("[GTASA:DE Autosplitter] "+text);
	};
	vars.DebugOutput = DebugOutput;

	//=============================================================================
	// State keeping
	//=============================================================================

	// Already split splits during this attempt (until timer reset)
	vars.split = new List<string>();

	// Track timer phase
	vars.PrevPhase = null;

	// Timestamp when the last load occured (load means loading from a save
	// and such, not load screens)
	vars.lastLoad = 0;

	// Timestamp when the last split was executed (to prevent double-splits)
	vars.lastSplit = 0;

	//=============================================================================
	// Settings
	//=============================================================================
	// Settings are mostly added manually (not directly from the mission definition)
	// so they can be manually sorted (the usual mission order).

	// Setting Functions
	//==================

	// Check if the given string is the name of a mission as defined in vars.missions
	Func<string, bool> missionPresent = m => {
		foreach (var item in vars.missions)
		{
			foreach (var item2 in item.Value)
			{
				if (item2.Value == m)
				{
					return true;
				}
			}
		}
		foreach (var item in vars.missions2)
		{
			foreach (var item2 in item.Value)
			{
				if (item2.Value == m)
				{
					return true;
				}
			}
		}
		vars.DebugOutput("Mission not found: "+m);
		return false;
	};


/*
	Func<Dictionary<int, Dictionary<int, string>>, string, bool> missionPresent2 = (d, m) => {
		foreach (var item in d)
		{
			foreach (var item2 in item.Value)
			{
				if (item2.Value == m)
				{
					return true;
				}
			}
		}
		return false;
	};
*/
	// Function to add a list of missions (including check if they are a mission)
	Action<string, List<string>> addMissionList = (parent, missions) => {
		foreach (var mission in missions) {
			if (missionPresent(mission)) {
				settings.Add(mission, true, mission, parent);
			}
		}
	};

	// Add missions from vars.missions (also add parent/header)
	//
	// header: only label
	// section: used for parent setting
	// missions: key for vars.missions (address)
	Action<string, int, string> addMissionsHeader = (section, missions, header) => {
		var parent = section+"Missions";
		settings.Add(parent, true, header);
		foreach (var item in vars.missions[missions]) {
			var mission = item.Value;
			if (missionPresent(mission)) {
				settings.Add(mission, true, mission, parent);
			}
		}
	};

	// Add missions from vars.missions2 (to existing parent)
	//
	// missions: existing parent setting, key for vars.missions2
	// defaultValue: default value for all added settings
	Action<string, bool> addMissions2 = (missions, defaultValue) => {
		var parent = missions;
		foreach (var item in vars.missions2[missions]) {
			var mission = item.Value;
			settings.Add(mission, defaultValue, mission, parent);
		}
	};

	// Adds missions from vars.missions2 (also add parent/header)
	//
	// header: only label
	// missions: parent setting name, key for vars.missions2
	// defaultValue: default value for all added settings
	Action<string, bool, string> addMissions2Header = (missions, defaultValue, header) => {
		var parent = missions;
		settings.Add(parent, defaultValue, header);
		addMissions2(missions, defaultValue);
	};

	// Add a single mission (checking if it's a mission)
	Action<string, bool, string> addMissionCustom = (mission, defaultValue, label) => {
		if (missionPresent(mission)) {
			settings.Add(mission, defaultValue, label);
		}
	};

	// Add a single mission, with default values (checking if it's a mission)
	Action<string> addMission = (mission) => {
		if (missionPresent(mission)) {
			settings.Add(mission);
		}
	};


	// Main Missions
	//==============
	settings.Add("Missions", true, "Main Missions (any%)");
	settings.SetToolTip("Missions", "Main Missions and other splits that commonly occur in the any% route");

	settings.CurrentDefaultParent = "Missions";
	settings.Add("LS", true, "Los Santos");
	settings.Add("BL", true, "Badlands");
	settings.Add("SF", true, "San Fierro");
	settings.Add("Desert", true);
	settings.Add("LV", true, "Las Venturas");
	settings.Add("RTLS", true, "RTLS");
	settings.CurrentDefaultParent = null;
	
	// Los Santos
	//-----------
	addMissionList("LS", new List<string>() {
		"Big Smoke", "Ryder", "Tagging up Turf", "Cleaning the Hood", "Drive-Thru",
		"Nines and AKs", "OG Loc", "Life's a Beach", "Running Dog", "Drive-By",
		"Sweet's Girl", "Cesar Vialpando", "High Stakes Lowrider", "Madd Dogg's Rhymes",
		"Management Issues", "House Party (Cutscene)", "Burning Desire",
		"Wrong Side of the Tracks", "Just Business", "Doberman", "Gray Imports",
		"Home Invasion", "House Party", "Catalyst", "Robbing Uncle Sam", "Los Sepulcros",
		"Reuniting the Families", "The Green Sabre"
	});

	// Badlands
	//---------
	addMissionList("BL", new List<string>() {
		"Badlands", "Tanker Commander", "Body Harvest", "King in Exile", 
		"Small Town Bank", "Local Liquor Store", "Against All Odds", "Wu Zi Mu",
		"Farewell, My Love", "Are You Going To San Fierro?"
	});

	// San Fierro
	//-----------
	addMissionList("SF", new List<string>() {
		"Wear Flowers in your Hair", "555 WE TIP", "Deconstruction", "Photo Opportunity",
		"Jizzy (Cutscene)", "Jizzy", "T-Bone Mendez", "Mike Toreno", "Outrider",
		"Snail Trail", "Mountain Cloud Boys", "Ran Fa Li", "Lure", "Ice Cold Killa",
		"Amphibious Assault", "Pier 69", "Toreno's Last Flight", "The Da Nang Thang",
		"Yay Ka-Boom-Boom"
	});


	// Desert
	//-------
	addMissionList("Desert", new List<string>() {
		"Monster", "Highjack", "Interdiction", "Verdant Meadows", "Learning to Fly"
	});

	// Las Venturas
	//-------------
	addMissionList("LV", new List<string>() {
		"N.O.E.", "Freefall", "Fender Ketchup", "Explosive Situation", "You've Had Your Chips",
		"Don Peyote", "Intensive Care", "The Meat Business", "Fish in a Barrel", "Madd Dogg",
		"Misappropriation", "Stowaway", "Black Project", "High Noon", "Green Goo",
		"Saint Mark's Bistro"
	});

	// Return to Los Santos
	//---------------------
	settings.CurrentDefaultParent = "RTLS";

	addMissionList("RTLS", new List<string>() {
		"A Home in the Hills", "Vertical Bird", "Home Coming", "Beat Down on B Dup",
		"Grove 4 Life", "Cut Throat Business", "Riot", "Los Desperados"
	});
	addMissionCustom("End of the Line Part 1", false, "End of the Line Part 1 (after killing Big Smoke)");
	addMissionCustom("End of the Line Part 2", false, "End of the Line Part 2 (start of Chase)");
	addMissionCustom("End of the Line Part 3", false, "End of the Line Part 3 (after Credits)");

	settings.Add("GT #1", false, "Gang Territories #1 (at starting of Grove 4 Life)");
	settings.Add("GT #2", false, "Gang Territories #2 (at starting of Cut Throat Business)");
	settings.Add("any%", true, "End of any% (start of Firetruck Bridge Cutscene)");

	settings.CurrentDefaultParent = null;


	// Side Missions
	//==============
	settings.Add("Missions2", true, "Side Missions");
	settings.CurrentDefaultParent = "Missions2";

	addMissionsHeader("Heist", 602, "Heist");
	addMissionsHeader("Zero", 544, "Zero");
	addMissionsHeader("Wang Cars", 546, "Wang Cars");
	addMissionsHeader("Trucking", 9581, "Trucking");
	addMissionsHeader("Quarry", 9593, "Quarry");
	addMissions2Header("Assets", true, "Other Asset Missions");
	addMissions2Header("Schools", true, "Schools");
	settings.Add("Driving School Started", false, "Driving School Started", "Schools");
	settings.SetToolTip("Driving School Started", "Splits when starting Driving School for the first time");
	addMissions2Header("Vehicle Submissions", true, "Vehicle Submissions");
	addMissionList("Vehicle Submissions", new List<string>() { "Freight Level 1", "Freight Level 2" });
	addMissions2Header("Gym Moves", true, "Gym Moves");

	// Challenges
	//-----------
	settings.Add("Challenges", true, "Challenges", "Missions2");
	settings.CurrentDefaultParent = "Challenges";
	settings.Add("Chiliad Challenge #1");
	settings.Add("Chiliad Challenge #2");
	settings.Add("Chiliad Challenge #3");
	addMissions2("Challenges", true);

	// Stadium Events
	//---------------
	settings.CurrentDefaultParent = "Missions2";
	addMissions2Header("Stadium Events", true, "Stadium Events");
	settings.CurrentDefaultParent = null;

	// Races
	//------
	settings.Add("Races", false, "Races", "Missions2");
	settings.CurrentDefaultParent = "Races";

	settings.Add("All Races Won");
	addMissions2Header("LS Races", false, "Los Santos");
	addMissions2Header("SF Races", false, "San Fierro");
	addMissions2Header("LV Races", false, "Las Venturas");
	addMissions2Header("Air Races", false, "Air Races");

	settings.CurrentDefaultParent = null;

	// Import/Export
	//--------------
	settings.Add("Export Lists", false, "Import/Export", "Missions2");
	foreach (var list in vars.exportLists)
	{
		var listNumber = list.Key+1;
		var parent = "Export List "+listNumber;
		settings.Add(parent, true, "List "+listNumber, "Export Lists");
		foreach (var item in list.Value)
		{
			settings.Add("Export "+item, false, item, parent);
		}
		var listComplete = "Export List "+listNumber+" Complete";
		settings.Add(listComplete, false, listComplete, parent);
	}

	// Other
	//======
	settings.CurrentDefaultParent = null;
	settings.Add("Other", false);
	settings.CurrentDefaultParent = "Other";
	settings.Add("Plane Flight", false);
	settings.SetToolTip("Plane Flight", "Splits when entering the ticket machine marker for the first time");
	// Add "Properties" before addMissions2, so Wang Cars can be added at the top
	settings.Add("Properties", false);
	settings.Add("Verdant Meadows (Safehouse)", false, "Verdant Meadows (Safehouse)", "Properties");
	settings.Add("Wang Cars (Showroom Bought)", false, "Wang Cars (Showroom Bought)", "Properties");
	addMissions2("Properties", false);
	settings.CurrentDefaultParent = null;
	

	// Collectibles
	//=============
	settings.Add("Collectibles", false, "Collectibles");
	settings.CurrentDefaultParent = "Collectibles";
	foreach (var item in vars.collectibles)
	{
		settings.Add(item.Key+"All", false, item.Key+" (All Done)");
		settings.Add(item.Key+"Each", false, item.Key+" (Each)");
	}
	settings.CurrentDefaultParent = null;


	// Other Settings
	//===============
	settings.Add("startOnSaveLoad", false, "Start timer when loading save (experimental)");
	settings.SetToolTip("startOnSaveLoad",
		@"This may start the timer too early on New Game, however if you have Reset enabled, 
 it should reset again before the desired start.");
	settings.Add("doubleSplitPrevention", true, "Double-Split Prevention");
	settings.SetToolTip("doubleSplitPrevention",
@"Impose cooldown of 2.5s between auto-splits.
This may not work for all types of splits.");


	//=============================================================================
	// Other Stuff
	//=============================================================================
	refreshRate = 20;
	vars.waiting = false;
}

init
{
	// Used for getting addresses from pattern scans
	Func<int, string, int> getAddressFromPattern = (patternOffset, patternStr) => {
		var page = modules.First();
		var scanner = new SignatureScanner(game, page.BaseAddress, page.ModuleMemorySize);
		IntPtr offsetPtr = scanner.Scan(new SigScanTarget(patternOffset, patternStr));
		return (int) (offsetPtr.ToInt64() - page.BaseAddress.ToInt64() + game.ReadValue<int>(offsetPtr) + 0x4);
	};

	// Used for getting specific values from pattern scans
	Func<int, string, int> getValueFromPattern = (patternOffset, patternStr) => {
        var page = modules.First();
        var scanner = new SignatureScanner(game, page.BaseAddress, page.ModuleMemorySize);
        IntPtr offsetPtr = scanner.Scan(new SigScanTarget(patternOffset, patternStr));
        return (int) (game.ReadValue<int>(offsetPtr));
    };


	// Used for integer stats
	Func<int, int> getIntStatOffset = (statId) => {
		return (int) (statId - 82) * 4;
	};

	// Used for global variables
	Func<int, int> getVariableOffset = (index) => {
		return (int) (index * 4);
	};
	
	//=============================================================================
	// Version Detection
	//=============================================================================
	vars.enabled = true;

	int statBaseAddr 	= 	getAddressFromPattern(16, "?? 8b c3 ff ?? ?? ?? ?? ?? eb ?? 8b d3 ?? 8d 0d ?? ?? ?? ?? e8 ?? ?? ?? ??");
	int scriptBaseAddr 	= 	getAddressFromPattern(5, "74 ?? ?? 8d 05 ?? ?? ?? ?? ?? 83 3c ?? 01 74 ??");
	int startAddr 		=	getAddressFromPattern(9, "8b 05 ?? ?? ?? ?? ?? 8b ?? ?? ?? ?? ?? 83 f8 08 73 ?? ?? c6 ?? ?? ?? ?? ?? 01");
	int startOffset		=	getValueFromPattern(21, "8b 05 ?? ?? ?? ?? ?? 8b ?? ?? ?? ?? ?? 83 f8 08 73 ?? ?? c6 ?? ?? ?? ?? ?? 01");
	int threadAddr 		=	getAddressFromPattern(9, "?? 53 ?? 83 ec ?? ?? 8b 15 ?? ?? ?? ?? ?? 85 d2 74 ?? 33 c9 ?? 8d 05 ?? ?? ?? ??");
	int loadingAddr 	=	getAddressFromPattern(3, "0f b6 ?? ?? ?? ?? ?? ?? 88 ?? ?? ?? ?? ?? ?? 89 ?? ?? ?? ?? ?? 66 89 ?? ?? ?? ?? ?? ?? 88");
	int playTimeAddr	=	getAddressFromPattern(2, "8b 15 ?? ?? ?? ?? ?? 85 c9 74 ?? 8b 05 ?? ?? ?? ?? 05 20 bf 02 00");

	// Detect Version
	//===============
	// Use executable metadata for detecting specific versions
	var fvi = modules.First().FileVersionInfo;
	version = string.Join(".", fvi.FileMajorPart, fvi.FileMinorPart, fvi.FileBuildPart, fvi.FilePrivatePart);

	// Version detected
	//=================

	if (version == "")
	{
		version = "<unknown>";
		vars.enabled = false;
	}
	
	

	//=============================================================================
	// Memory Watcher
	//=============================================================================

	// Add missions as watched memory values
	vars.watchers = new MemoryWatcherList();

	// Same address for several different splits
	foreach (var item in vars.missions) {
		vars.watchers.Add(
			new MemoryWatcher<int>(
				new DeepPointer(scriptBaseAddr + getVariableOffset(item.Key))
			) { Name = item.Key.ToString() }
		);

		// Check if setting for each mission exists (this will output a message to debug if not,
		// for development)
		foreach (var m in item.Value) {
			if (settings[m.Value]) { }
		}
	}

	// Different address for each split
	foreach (var item in vars.missions2) {
		foreach (var m in item.Value) {
			vars.watchers.Add(
				new MemoryWatcher<int>(
					new DeepPointer(scriptBaseAddr + getVariableOffset(m.Key))
				) { Name = m.Value }
			);

			if (settings[m.Value]) { }
		}
	}
	
	// Add global variables that aren't missions
	vars.watchers.Add(new MemoryWatcher<int>(new DeepPointer(scriptBaseAddr + getVariableOffset(9436))) { Name = "eotl" });
	vars.watchers.Add(new MemoryWatcher<int>(new DeepPointer(scriptBaseAddr + getVariableOffset(3218))) { Name = "chiliadRace" });
	vars.watchers.Add(new MemoryWatcher<int>(new DeepPointer(scriptBaseAddr + getVariableOffset(3220))) { Name = "chiliadDone" });

	// This turns to 0 while the load screen is still up, so it's only used for split prevention
	vars.watchers.Add(new MemoryWatcher<bool>(new DeepPointer(loadingAddr)) { Name = "loading" });

	// Not sure how this flag acts outside the intro, so it's only used for the start
	vars.watchers.Add(new MemoryWatcher<byte>(new DeepPointer(startAddr, startOffset)) { Name = "startFlag" });

	vars.watchers.Add(new StringWatcher(new DeepPointer(threadAddr, 0x10), 8) { Name = "thread" });

	// Playing time only used for the start/reset, may find some other use later maybe?
	vars.watchers.Add(new MemoryWatcher<int>(new DeepPointer(playTimeAddr)) { Name = "playTime" });


	// Times wasted/busted stats, not used currently, could be used for bustedwarp/deathwarp splits later if needed
	//vars.watchers.Add(new MemoryWatcher<int>(new DeepPointer(statBaseAddr + getIntStatOffset(133))) { Name = "timesBusted" });
	//vars.watchers.Add(new MemoryWatcher<int>(new DeepPointer(statBaseAddr + getIntStatOffset(135))) { Name = "timesWasted" });

	// Collectibles
	//=============

	foreach (var item in vars.collectibles) {
		var type = item.Key;
		var id = item.Value;
		vars.watchers.Add(
			new MemoryWatcher<int>(
				new DeepPointer(statBaseAddr + getIntStatOffset(id))
			) { Name = type }
		);
	}

	// Export Lists
	//=============

	vars.watchers.Add(new MemoryWatcher<int>(new DeepPointer(scriptBaseAddr + getVariableOffset(1088))) { Name = "exportList" });
	var exportBaseAddr = scriptBaseAddr + getVariableOffset(1099);
	for (int i = 0; i < 10; i++)
	{
		var address = exportBaseAddr + i*4;
		//print(address.ToString("X"));
		vars.watchers.Add(new MemoryWatcher<int>(new DeepPointer(address)) { Name = "export"+i });
	}

	vars.watchers.UpdateAll(game);

	//=============================================================================	
	// Utility functions
	//=============================================================================

	/*
	 * Check if splitting should occur based on whether this split
	 * has already been split since the timer started or is on the
	 * blacklist.
	 * 
	 * If this returns true (the split should occur), the split
	 * is also added to the list of already split splits. (Kappa b)
	 */
	Func<string, bool> TrySplit = (splitId) => {
		if (!settings[splitId]) {
			return false;
		}
		if (!vars.split.Contains(splitId)) {
			vars.split.Add(splitId);
			/*
			 * Double split prevention (mostly for duping). This is set to 2.5s so that dupes should
			 * (hopefully) not split spice, whereas close-on splits like the Deathwarp to Angel Pine
			 * after Body Harvest still do get split.
			 *
			 * Make sure to always add this to the already executed splits, so that cooldown-prevented
			 * splits are not split if a savegame is loaded and the dupe done again.
			 */
			if (!settings["doubleSplitPrevention"] || Environment.TickCount - vars.lastSplit > 2500) {
				vars.DebugOutput("Split: "+splitId);
				vars.lastSplit = Environment.TickCount;
				return true;
			}
			else {
				vars.DebugOutput("Split Prevented (Cooldown): "+splitId);
			}
		}
		return false;
	};
	vars.TrySplit = TrySplit;

	/*
	 * Check if the given mission (the name has to be exact) has
	 * already been passed, based on the current memory value.
	 * 
	 * Returns true if the mission should already have been passed,
	 * false otherwise.
	 */
	Func<string, bool> MissionPassed = m => {
		foreach (var item in vars.missions) {
			foreach (var item2 in item.Value) {
				if (item2.Value == m) {
					int currentValue = vars.watchers[item.Key.ToString()].Current;
					vars.DebugOutput("Check: "+m+" "+item2.Key.ToString()+" >= "+currentValue);
					return currentValue >= item2.Key;
				}
			}
		}
		vars.DebugOutput("Mission not found: "+m);
		return false;
	};
	vars.Passed = MissionPassed;
}

update
{
	//=============================================================================
	// General Housekeeping
	//=============================================================================
	// Disable all timer control actions if version was not detected
	if (!vars.enabled)
		return false;

	// Update always, to prevent splitting after loading (if possible, doesn't seem to be 100% reliable)
	vars.watchers.UpdateAll(game);

	// Clear list of already executed splits if timer is reset
	if (timer.CurrentPhase != vars.PrevPhase)
	{
		if (timer.CurrentPhase == TimerPhase.NotRunning)
		{
			vars.split.Clear();
			vars.DebugOutput("Cleared list of already executed splits");
		}
		vars.PrevPhase = timer.CurrentPhase;
	}
}

split
{
	//=============================================================================
	// Split prevention
	//=============================================================================
	if (vars.watchers["loading"].Current) {
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
	// Splits
	//=============================================================================

	// Split missions
	//===============
	foreach (var item in vars.missions) {
		var value = vars.watchers[item.Key.ToString()];
		if (value.Current > value.Old && item.Value.ContainsKey(value.Current)) {
			string splitId = item.Value[value.Current];
			if (vars.TrySplit(splitId)) {
				return true;
			}
		}
	}

	foreach (var item in vars.missions2) {
		foreach (var m in item.Value) {
			var value = vars.watchers[m.Value];
			// Some values changes from 0 -> 2, so check for > 0
			if (value.Current > 0 && value.Old == 0)
			{
				return vars.TrySplit(m.Value);
			}
		}
	}

	// Split collectibles
	//===================
	foreach (var item in vars.collectibles) {
		var value = vars.watchers[item.Key.ToString()];
		if (value.Current > value.Old) {
			var type = item.Key;
			if (settings[type+"All"])
			{
				int max = 50;
				if (type == "Tags")
					max = 100;
				if (type == "Stunts (Completed)")
					max = 70;
				if (value.Current == max && value.Old == max-1)
				{
					return vars.TrySplit(type+"All");
				}
			}
			if (settings[type+"Each"]) {
				// Need to keep track of already split splits seperately from the setting
				var splitName = type+" "+value.Current;
				if (!vars.split.Contains(splitName))
				{
					vars.split.Add(splitName);
					vars.DebugOutput("Split: "+splitName);
					return true;
				}
			}
		}
	}

	// End of any%
	//============
	var eotl = vars.watchers["eotl"];
	if (eotl.Current == 3 && eotl.Old == 2)
	{
		// This check is probably not necessary since the variable $8014 seems to be
		// only used in EotL Part 3, but just to be safe.
		if (vars.Passed("End of the Line Part 2"))
		{
			return vars.TrySplit("any%");
		}
	}

	// Starting a certain mission
	//===========================
	// This requires the feature of splitting every split only once, because
	// it only checks the first thread, which can sometimes change. Even when
	// checking all threads, it could cause issues if a mission is restarted
	// (e.g. if the mission failed, rather than an earlier Save loaded, where
	// splitting again may or may not be actually wanted).
	//
	// This is relatively lazy and simply checks for the first thread in the
	// list, which probably is the thread that was last started.
	//
	var thread = vars.watchers["thread"];
	if (thread.Current != thread.Old)
	{
		foreach (var item in vars.startMissions)
		{
			if (thread.Current == item.Key && vars.TrySplit(item.Value))
			{
				return true;
			}
		}
	}

	// Chiliad Challenge
	//==================
	// "chiliadRace" contains the next race to be started (1-3), but also repeats
	// when you do the races again (changes to 1 on finishing the last race).
	// "chiliadDone" changes from 0 to 1 when all races have been done.
	//
	var chiliadRace = vars.watchers["chiliadRace"];
	var chiliadDone = vars.watchers["chiliadDone"];
	if ((chiliadRace.Current > chiliadRace.Old && chiliadRace.Current > 1 && chiliadDone.Current == 0)
		|| chiliadDone.Current > chiliadDone.Old)
	{
		var raceDone = chiliadRace.Current - 1;
		if (chiliadDone.Current == 1)
			raceDone = 3;
		return vars.TrySplit("Chiliad Challenge #"+raceDone);
	}

	// Import/Export Lists
	//====================
	// The three lists all contain 10 vehicles, which have their exported state
	// stored in an array, so basicially 10 values that change from 0 to 1 when
	// that car is exported. This is per list, so which vehicles the values
	// refer to changes based on which list is active.
	//
	var exportList = vars.watchers["exportList"].Current;
	if (exportList >= 0 && exportList <= 2)
	{
		bool allDone = true;
		bool shouldSplit = false;
		int vehicleId = 0;
		for (int i = 0; i < 10; i++)
		{
			// Check if this vehicle has just been exported
			var vehicle = vars.watchers["export"+i];
			if (vehicle.Current == 1 && vehicle.Old == 0)
			{
				shouldSplit = true;
				vehicleId = i;
			}
			// If one vehicle wasn't exported, the list can't be all done
			if (vehicle.Current == 0) {
				allDone = false;
			}
		}
		if (shouldSplit)
		{
			if (vars.TrySplit("Export "+vars.exportLists[exportList][vehicleId]))
			{
				return true;
			}
			if (allDone && vars.TrySplit("Export List "+(exportList+1)+" Complete"))
			{
				return true;
			}
		}
	}
}

start
{
	//=============================================================================
	// Starting Timer
	//=============================================================================

	var startFlag = vars.watchers["startFlag"];
	var playTime = vars.watchers["playTime"];

	// New Game
	//=========
	/*
	 * startFlag switches to 0 from 1 when the game begins to fade out to the intro cutscene.
	 * The check for the playing time is there so timer doesn't start/reset when loading a save.
	 */
	if (startFlag.Current == 0 && startFlag.Old == 1 && playTime.Current < 5 * 1000)
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
	//=============================================================================
	// Resetting Timer
	//=============================================================================

	var startFlag = vars.watchers["startFlag"];
	var playTime = vars.watchers["playTime"];

	/*
	 * Use same check for reset for the timer to reset and start in the same cycle.
	 * Only downside is that accidental new game will reset the timer (but who would do that with the way DE menu is laid out?)
	 */
	if (startFlag.Current == 0 && startFlag.Old == 1 && playTime.Current < 5 * 1000)
	{
		if (settings.ResetEnabled)
		{
			// Only output when actually resetting timer (the return value of this method
			// is only respected by LiveSplit when the setting is actually enabled)
			vars.DebugOutput("Reset");

			// Clear already split missions, just in case
			vars.split.Clear();			
		}
		return true;
	}
}

