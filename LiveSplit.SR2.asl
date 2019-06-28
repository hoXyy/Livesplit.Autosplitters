
state("sr2_pc", "Steam")
{
    // mission addresses
    int missions : 0x1053384;
    int strongholds : 0x10533C8;
    int activities : 0x105340C;

    // collectibles addresses 
    int tags : 0x10535E8;
    int cd : 0x27C7150;
    int jumps : 0x10535A4;
    int barnstorming : 0x1053670;


    // activities addresses
    int races : 0x1055760;
    int trafficking : 0x1053918;
    int fraud : 0x1053D14;
    int snatch : 0x1054000;
    int derby : 0x1053890;
    int escort : 0x10539A0;
    int trailblazing : 0x1053C04;
    int mayhem : 0x1053E68;
    int fuzz : 0x1053AB0; 
    int crowdcontrol : 0x10537C4;
    int chopshop : 0x10536B4;
    int hitman : 0x10536F8;
    int fightclub: 0x1053A28;
    int septic : 0x1053F34;
    int heliassault : 0x1053B38;   

    // other addresses
    string255 cutscene : 0x02127D10, 0x4, 0x0;
    int startFlag : 0x1F870C0;
    // Thanks Mr. Mary for finding these 2 addresses
    int cutsceneLoad : 0xA9D670;
    bool saveLoad : 0xA8EB88;          
}

state("sr2_pc", "GOG")
{
    // mission addresses
    int missions : 0x1053384;
    int strongholds : 0x10533C8;
    int activities : 0x105340C;

    // collectibles addresses 
    int tags : 0x10535E8;
    int cd : 0x27C7150;
    int jumps : 0x10535A4;
    int barnstorming : 0x1053670;


    // activities addresses
    int races : 0x1055760;
    int trafficking : 0x1053918;
    int fraud : 0x1053D14;
    int snatch : 0x1054000;
    int derby : 0x1053890;
    int escort : 0x10539A0;
    int trailblazing : 0x1053C04;
    int mayhem : 0x1053E68;
    int fuzz : 0x1053AB0; 
    int crowdcontrol : 0x10537C4;
    int chopshop : 0x10536B4;
    int hitman : 0x10536F8;
    int fightclub: 0x1053A28;
    int septic : 0x1053F34;
    int heliassault : 0x1053B38;   

    // other addresses
    string255 cutscene : 0x02127D10, 0x4, 0x0;
    int startFlag : 0x1F870A0;
    // Thanks Mr. Mary for finding these 2 addresses
    int cutsceneLoad : 0xA9D670;
    bool saveLoad : 0xA8EB88;    
}

startup
{
    settings.Add("main", true, "Main");
    settings.Add("activities", false, "Activities");     
    settings.Add("collectibles", false, "Collectibles");

    settings.CurrentDefaultParent = "main";
    settings.Add("missions", true, "Missions");
    settings.Add("strongholds", true, "Strongholds");

    settings.CurrentDefaultParent = "collectibles";
    settings.Add("tags", false, "Tags");
    settings.Add("cd", false, "CDs");
    settings.Add("jumps", false, "Stunt Jumps");
    settings.Add("barnstorming", false, "Barnstorming");

    vars.activities = new Dictionary<string, string>{
        {"chopshop", "Chop Shop"},
        {"crowdcontrol", "Crowd Control"},
        {"derby", "Demolition Derby"},
        {"trafficking", "Drug Trafficking"},
        {"escort", "Escort"},
        {"fightclub", "Fight Club"},
        {"fuzz", "FUZZ"},
        {"heliassault", "Heli Assault"},
        {"hitman", "Hitman"},
        {"fraud", "Insurance Fraud"},
        {"mayhem", "Mayhem"},
        {"races", "Races"},
        {"septic", "Septic Avenger"},
        {"snatch", "Snatch"},
        {"trailblazing", "Trail Blazing"}
    };

	foreach (var Script in vars.activities) {
		settings.Add(Script.Key, true, Script.Value, "activities");
	}     
}

init
{
   //timer.IsGameTimePaused = false;

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

    if (settings["chopshop"])
    {
        if (current.chopshop == old.chopshop+1)
        {
            return true;
        }
    }

    if (settings["crowdcontrol"])
    {
        if (current.crowdcontrol == old.crowdcontrol+1)
        {
            return true;
        }
    }

    if (settings["derby"])
    {
        if (current.derby == old.derby+1)
        {
            return true;
        }
    }

    if (settings["trafficking"])
    {
        if (current.trafficking == old.trafficking+1)
        {
            return true;
        }
    }

    if (settings["escort"])
    {
        if (current.escort == old.escort+1)
        {
            return true;
        }
    }

    if (settings["fightclub"])
    {
        if (current.fightclub == old.fightclub+1)
        {
            return true;
        }
    }

    if (settings["fuzz"])
    {
        if (current.fuzz == old.fuzz+1)
        {
            return true;
        }
    }  

    if (settings["heliassault"])
    {
        if (current.heliassault == old.heliassault+1)
        {
            return true;
        }
    }

    if (settings["hitman"])
    {
        if (current.hitman == old.hitman+1)
        {
            return true;
        }
    }

    if (settings["fraud"])
    {
        if (current.fraud == old.fraud+1)
        {
            return true;
        }
    }

    if (settings["mayhem"])
    {
        if (current.mayhem == old.mayhem+1)
        {
            return true;
        }
    }

    if (settings["races"])
    {
        if (current.races == old.races+1)
        {
            return true;
        }
    }

    if (settings["septic"])
    {
        if (current.septic == old.septic+1)
        {
            return true;
        }
    }

    if (settings["snatch"])
    {
        if (current.snatch == old.septic+1)
        {
            return true;
        }
    }

    if (settings["trailblazing"])
    {
        if (current.trailblazing == old.trailblazing+1)
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

//exit
//{
//    timer.IsGameTimePaused = true;
//}