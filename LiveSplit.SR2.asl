state("sr2_pc", "Steam")
{
    int missions : 0x1053384;
    int strongholds : 0x10533C8;
    int activities : 0x105340C;
    int tags : 0x10535E8;
    int cd : 0x27C7150;
    int jumps : 0x10535A4;
    int barnstorming : 0x1053670;
    string255 cutscene : 0x02127D10, 0x4, 0x0;
    int startFlag : 0x1F870C0;
    // Thanks Mr. Mary for finding these 2 addresses
	int cutsceneLoad : 0xA9D670;
	bool saveLoad : 0xA8EB88;
    bool inRace : 0x25E3F34;           
}

state("sr2_pc", "GOG")
{
    int missions : 0x1053384;
    int strongholds : 0x10533C8;
    int activities : 0x105340C;
    int tags : 0x10535E8;
    int cd : 0x27C7150;
    int jumps : 0x10535A4;
    int barnstorming : 0x1053670;
    string255 cutscene : 0x02127D10, 0x4, 0x0;
    int startFlag : 0x1F870A0;
	int cutsceneLoad : 0xA9D670;
	bool saveLoad : 0xA8EB88;  
    bool inRace : 0x25E3F34;   
}

startup
{
    settings.Add("main", true, "Main");
    settings.Add("collectibles", false, "Collectibles");
    settings.Add("misc", false, "Misc");

    settings.CurrentDefaultParent = "main";
    settings.Add("missions", true, "Missions");
    settings.Add("strongholds", true, "Strongholds");

    settings.CurrentDefaultParent = "collectibles";
    settings.Add("tags", false, "Tags");
    settings.Add("cd", false, "CDs");

    settings.CurrentDefaultParent = "misc";
    settings.Add("activities", false, "Activities");
    settings.Add("jumps", false, "Stunt Jumps");
    settings.Add("barnstorming", false, "Barnstorming");
    settings.Add("race", false, "Races (experimental)");
    settings.SetToolTip("race", "Splits once you exit or finish a race.");
}

init
{

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

    if (settings["missions"])
    { 
        if (current.missions == old.missions+1)
        {
            return true;
        }
    }

    if (settings["strongholds"])
    {
        if (current.strongholds == old.strongholds+1)
        {
            return true;
        }
    }

    if (settings["tags"])
    {
        if (current.tags == old.tags+1)
        {
            return true;
        }
    }

    if (settings["cd"])
    {
        if (current.cd == old.cd+1)
        {
            return true;
        }
    }

    if (settings["activities"])
    {
        if (current.activities == old.activities+1)
        {
            return true;
        }
    }

    if (settings["jumps"])
    {
        if (current.jumps == old.jumps+1)
        {
            return true;
        }
    }

    if (settings["barnstorming"])
    {
        if (current.barnstorming == old.barnstorming+1)
        {
            return true;
        }
    }

    if (settings["race"])
    {
        if (!current.inRace && old.inRace)
        {
            return true;
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