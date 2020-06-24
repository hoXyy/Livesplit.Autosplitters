
state("sr2_pc", "Steam")
{
    string255 cutscene : 0x02127D10, 0x4, 0x0;
    int startFlag : 0x1F870C0;
    int percent : 0x1052C58;
    // Thanks Mr. Mary for finding these 2 addresses
    int cutsceneLoad : 0xA9D670;
    bool saveLoad : 0xA8EB88;          
}

state("sr2_pc", "GOG")
{
    string255 cutscene : 0x02127D10, 0x4, 0x0;
    int startFlag : 0x1F870A0;
    int percent : 0x1052C58;
    // Thanks Mr. Mary for finding these 2 addresses
    int cutsceneLoad : 0xA9D670;
    bool saveLoad : 0xA8EB88;    
}

startup
{
    vars.aslName = "Saints Row 2 Autosplitter";
    if(timer.CurrentTimingMethod == TimingMethod.RealTime)
        {
            var timingMessage = MessageBox.Show(
                "This game uses Game Time (time without loads) as the main timing method.\n"+
                "LiveSplit is currently set to show Real Time (time INCLUDING loads).\n"+
                "Would you like the timing method to be set to Game Time for you?",
                vars.aslName+" | LiveSplit",
                MessageBoxButtons.YesNo,MessageBoxIcon.Question
            );
            if (timingMessage == DialogResult.Yes) timer.CurrentTimingMethod = TimingMethod.GameTime;
	}
    
    settings.Add("main", true, "Main");
    settings.Add("activities", false, "Activities");     
    settings.Add("collectibles", false, "Collectibles");

    settings.CurrentDefaultParent = "main";
    settings.Add("iMissions", true, "Missions");
    settings.Add("iStrongholds", true, "Strongholds");
    settings.Add("100", false, "100% Completion");
    settings.SetToolTip("100", "Splits once you reach 100% completion.");

    settings.CurrentDefaultParent = "collectibles";
    settings.Add("iTags", false, "Tags");
    settings.Add("iCD", false, "CDs");
    settings.Add("iJumps", false, "Stunt Jumps");
    settings.Add("iBarnstorming", false, "Barnstorming");

    settings.CurrentDefaultParent = "activities";
    settings.Add("iChopShop", true, "Chop Shop");
    settings.Add("iCrowdControl", true, "Crowd Control");
    settings.Add("iDerby", true, "Destruction Derby");
    settings.Add("iEscort", true, "Escort");
    settings.Add("iFightClub", true, "Fight Club");
    settings.Add("iFuzz", true, "FUZZ");
    settings.Add("iHeliAssault", true, "Heli Assault");
    settings.Add("iHitman", true, "Hitman");
    settings.Add("iFraud", true, "Insurance Fraud");
    settings.Add("iMayhem", true, "Mayhem");
    settings.Add("iRaces", true, "Races");
    settings.Add("iSeptic", true, "Septic Avenger");
    settings.Add("iSnatch", true, "Snatch");
    settings.Add("iTrafficking", true, "Trafficking");
    settings.Add("iTrailBlazing", true, "Trail Blazing");


    vars.addresses = new Dictionary<string, int>{
        {"iMissions", 0x1053384},
        {"iStrongholds", 0x10533C8},
        {"iTags", 0x10535E8},
        {"iCD", 0x27C7150},
        {"iJumps", 0x10535A4},
        {"iBarnstorming", 0x1053670},
        {"iChopShop", 0x10536B4},
        {"iCrowdcontrol", 0x10537C4},
        {"iDerby", 0x1053890},
        {"iEscort", 0x10539A0},
        {"iFightClub", 0x1053A28},
        {"iFuzz", 0x1053AB0},
        {"iHeliAssault", 0x1053B38},
        {"iHitman", 0x10536F8},
        {"iFraud", 0x1053D14},
        {"iMayhem", 0x1053E68},
        {"iRaces", 0x1055760},
        {"iSeptic", 0x1053F34},
        {"iSnatch", 0x1054000},
        {"iTrafficking", 0x1053918},
        {"iTrailBlazing", 0x1053C04}
    };
   
}

init
{
	// Create new empty MemoryWatcherList
	vars.memoryWatchers = new MemoryWatcherList();

    if ((int)modules.First().BaseAddress == 0x400000)
    {
        if ((int)modules.First().ModuleMemorySize == 0x3159000)
        {
            version = "GOG";
        }
        else if ((int)modules.First().ModuleMemorySize == 0x31AD000)
        {
            version = "Steam";
        }
    }
    else
    {
        version = "";
    }    


	// MemoryWatcher wrapper
	Action<string, int> mw = (name, address) => {
		vars.memoryWatchers.Add(new MemoryWatcher<int>(new DeepPointer("sr2_pc.exe", address)){ Name = name }); 
	};

    foreach (var a in vars.addresses) {
        mw(a.Key, a.Value);
    }

    vars.LastCutscene = null;
}

update
{
    if (version == "")
    {
        return false;
    }

    if (current.cutscene != null)
    {
        vars.LastCutscene = current.cutscene;
    }

	// Update all MemoryWatchers
	vars.memoryWatchers.UpdateAll(game);


}

start
{
    if (vars.LastCutscene == "TSSP01-01.cscx" && current.startFlag == 1 && current.startFlag != old.startFlag)
    {
        return true;
    }
}

split
{
    // 100% split
    if (settings["100"])
    {
        if (current.percent == 100 && current.percent != old.percent)
        {
            return true;
        }
    }

    foreach (var mw in vars.memoryWatchers)  {
        var name = mw.Name;

        if (settings.ContainsKey(name) && settings[name]) {
            if (mw.Current == mw.Old + 1) {
                return true;
            }
        }
    }             
}

reset
{
    return vars.LastCutscene == "TSSP-INTRO2.cscx";
}

isLoading
{
    return current.cutsceneLoad == 0 || !current.saveLoad;
}

