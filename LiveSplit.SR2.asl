// TODO: Add Stronghold settings
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

    settings.CurrentDefaultParent = "missions";
    settings.Add("saintsMissions", true, "Third Street Saints");
    settings.Add("brotherhoodMissions", true, "The Brotherhood");
    settings.Add("roninMissions", true, "The Ronin");
    settings.Add("samediMissions", true, "Sons of Samedi");
    settings.Add("ultorMissions", true, "Ultor");    

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

    vars.saintsMissions = new Dictionary<string, string> {
        {"TSSP01-02.cscx", "Jailbreak"},
        {"TSSP02-02.cscx", "Appointed Defender"},
        {"TSSP03-02.cscx", "Down Payment"},
        {"TSSP04-02.cscx", "Three Kings"}
    };

	// Add Saints mission list
	vars.missionsList = new List<string>();

	foreach (var Script in vars.saintsMissions) {
		settings.Add(Script.Key, true, Script.Value, "saintsMissions");
		vars.missionsList.Add(Script.Key); 
	}	    

    vars.brotherhoodMissions = new Dictionary<string, string>{
        {"BR01-02.cscx", "First Impressions"},
        {"BR02-02.cscx", "Reunion Tour"},
        {"BR03-02.cscx", "Waste Not Want Not"},
        {"BR04-02.cscx", "Red Asphalt"},
        {"BR05-02.cscx", "Bank Error in Your Favor"},
        {"BR06-02.cscx", "Thank you and Goodnight!"},
        {"BR07-02.cscx", "Retribution"},
        {"BR08-02.cscx", "Jail Bait"},
        {"BR09-02.cscx", "The Enemy of My Enemy"},
        {"BR10-02.cscx", "The Siege"},
        {"BR11-02.cscx", "Showdown"}
    }; 


	foreach (var Script in vars.brotherhoodMissions) {
		settings.Add(Script.Key, true, Script.Value, "brotherhoodMissions");
		vars.missionsList.Add(Script.Key); 
	}

    vars.roninMissions = new Dictionary<string, string>{
        {"RO01-02.cscx", "Saint's Seven"},
        {"RO02-02.cscx", "Laundry Day"},
        {"RO03-02.cscx", "Road Rage"},
        {"RO04-02.cscx", "Bleeding Out"},
        {"RO05-02.cscx", "Orange Threat Level"},
        {"RO06-02.cscx", "Kanto Connection"},
        {"RO07-02.cscx", "Visiting Hours"},
        {"RO08-02.cscx", "Room Service"},
        {"RO09-02.cscx", "Rest in Peace"},
        {"RO10-02.cscx", "Good D"},
        {"RO11-02.cscx", "One Man's Junk..."}
    };


	foreach (var Script in vars.roninMissions) {
		settings.Add(Script.Key, true, Script.Value, "roninMissions");
		vars.missionsList.Add(Script.Key); 
	}

    vars.samediMissions = new Dictionary<string, string>{
        {"SS01-02.cscx", "Got Dust, Will Travel"},
        {"SS02-02.cscx", "File in the Cake"},
        {"SS03-02.cscx", "Airborne Assault"},
        {"SS04-02.cscx", "Veteran Child"},
        {"SS05-02.cscx", "Burning Down the House"},
        {"SS06-02.cscx", "Bad Trip"},
        {"SS07-02.cscx", "Bonding Experience"},
        {"SS08-02.cscx", "Riot Control"},
        {"SS09-02.cscx", "Eternal Sunshine"},
        {"SS10-02.cscx", "Assault on Precinct 31"},
        {"SS11-02.cscx", "The Shopping Maul"}
    }; 


	foreach (var Script in vars.samediMissions) {
		settings.Add(Script.Key, true, Script.Value, "samediMissions");
		vars.missionsList.Add(Script.Key); 
	}  

    vars.ultorMissions = new Dictionary<string, string>{
        {"TSSE01-02.cscx", "Picking a Fight"},
        {"TSSE02-02.cscx", "Pyramid Scheme"},
        {"TSSE03-02.cscx", "Salting the Earth...Again"},
        {"TSSE04-02.cscx", "... and a Better Life"},
        {"BON02.cscx", "Revelation"}
    };


	foreach (var Script in vars.ultorMissions) {
		settings.Add(Script.Key, true, Script.Value, "ultorMissions");
		vars.missionsList.Add(Script.Key); 
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

	if (current.missions == old.missions+1)  
	{
		if (vars.missionsList.Contains(vars.LastCutscene) && settings[vars.LastCutscene] && !vars.missionSplits.Contains(vars.LastCutscene))
		{
			vars.missionSplits.Add(vars.LastCutscene);
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