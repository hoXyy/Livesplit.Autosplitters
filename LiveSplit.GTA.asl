// GTA1, London 1969 & London 1961 autosplitter by hoxi
// TODO: Proper statistics tracking, full London support

state("Grand Theft Auto")
{
    int score: 0x34F23C;
    int bigyellowtext: 0x384864;
    int multiplier: 0x34F240;
    int InGame: 0x38513C;
    int InCutscene: "mss32.dll", 0x22E90;
    int IsPaused: 0x3846B8;
    int RequiredScore: 0x2B3B84;
    int SecretsAmount: 0x27638C;
    int MissionsAmount: 0x2B3B78;
    string30 CurrentDistrict: 0x2B3E30;
}

state("gta_uk")
{
    int score: 0x40D018;
    int bigyellowtext: 0x448308;
    int multiplier: 0x40D01C;
    int InGame: 0x448C04;
    int InCutscene: 0x10FFB0;
    int IsPaused: 0x448174;
    int RequiredScore: 0x336A18;
    int SecretsAmount: 0x2FB92C;
    int MissionsAmount: 0x2835AC;
    string30 CurrentDistrict: 0x35CAB8;
}


state("gta_61")
{
    int score: 0x40EC20;
    int bigyellowtext: 0x449F18;
    int multiplier: 0x40EC24;
    int InGame: 0x4393B0;
    int InCutscene: 0x111438;
    int IsPaused: 0x449D84;
    int RequiredScore: 0x338620;
    string30 CurrentDistrict: 0x35E6C0;
}

startup
{
    // game specific setting groups
    settings.Add("GTA1", true, "GTA 1");
    settings.Add("1969", true, "London 1969");
    settings.Add("1961", true, "London 1961");

    // main setting groups for GTA 1
    settings.Add("RequiredScoreMetGTA1", true, "Required Score Met", "GTA1");
    settings.SetToolTip("RequiredScoreMetGTA1", "Split when the required score to finish the chapter is met.");
    settings.Add("DistrictFinishedGTA1", true, "Finished District", "GTA1");
    settings.SetToolTip("DistrictFinishedGTA1", "Split when the finishing cutscene of the chapter is started.");
    settings.Add("MissionPassGTA1", true, "Missions", "GTA1");
    settings.SetToolTip("MissionPassGTA1", "Split on mission pass.");

    // city specific groups (score met)
    settings.Add("LCScore", true, "Liberty City", "RequiredScoreMetGTA1");
    settings.Add("SAScore", true, "San Andreas", "RequiredScoreMetGTA1");
    settings.Add("VCScore", true, "Vice City", "RequiredScoreMetGTA1");
    
    // Liberty City specific splits (score met)
    settings.Add("LC1Score", true, "Gangsta Bang", "LCScore");
    settings.Add("LC2Score", true, "Heist Almighty", "LCScore");

    // San Andreas specific splits (score met)
    settings.Add("SA1Score", true, "Mandarin Mayhem", "SAScore");
    settings.Add("SA2Score", true, "Tequila Slammer", "SAScore");

    // Vice City specific splits (score met)
    settings.Add("VC1Score", true, "Bent Cop Blues", "VCScore");
    settings.Add("VC2Score", true, "Rasta Blasta", "VCScore");

    // city specific groups (district finished)
    settings.Add("LCFinished", true, "Liberty City", "DistrictFinishedGTA1");
    settings.Add("SAFinished", true, "San Andreas", "DistrictFinishedGTA1");
    settings.Add("VCFinished", true, "Vice City", "DistrictFinishedGTA1");
    
    // Liberty City specific splits (district finished)
    settings.Add("LC1Finished", true, "Gangsta Bang", "LCFinished");
    settings.Add("LC2Finished", true, "Heist Almighty", "LCFinished");

    // San Andreas specific splits (district finished)
    settings.Add("SA1Finished", true, "Mandarin Mayhem", "SAFinished");
    settings.Add("SA2Finished", true, "Tequila Slammer", "SAFinished");

    // Vice City specific splits (district finished)
    settings.Add("VC1Finished", true, "Bent Cop Blues", "VCFinished");
    settings.Add("VC2Finished", true, "Rasta Blasta", "VCFinished");

    // city specific groups (mission pass)
    settings.Add("LCMission", true, "Liberty City", "MissionPassGTA1");
    settings.Add("SAMission", true, "San Andreas", "MissionPassGTA1");
    settings.Add("VCMission", true, "Vice City", "MissionPassGTA1");
    
    // Liberty City specific splits (mission pass)
    settings.Add("LC1Mission", true, "Gangsta Bang", "LCMission");
    settings.Add("LC2Mission", true, "Heist Almighty", "LCMission");

    // San Andreas specific splits (mission pass)
    settings.Add("SA1Mission", true, "Mandarin Mayhem", "SAMission");
    settings.Add("SA2Mission", true, "Tequila Slammer", "SAMission");

    // Vice City specific splits (mission pass)
    settings.Add("VC1Mission", true, "Bent Cop Blues", "VCMission");
    settings.Add("VC2Mission", true, "Rasta Blasta", "VCMission");  

    // main setting groups for London 1969
    settings.Add("RequiredScoreMet1969", true, "Required Score Met", "1969");
    settings.SetToolTip("RequiredScoreMet1969", "Split when the required score to finish the chapter is met.");
    settings.Add("DistrictFinished1969", true, "Finished District", "1969");
    settings.SetToolTip("DistrictFinished1969", "Split when the finishing cutscene of the chapter is started.");
    settings.Add("MissionPass1969", true, "Missions", "1969");
    settings.SetToolTip("MissionPass1969", "Split on mission pass.");

    // chapter specific groups for London 1969 (score met)
    settings.Add("1969Chapter2Score", true, "Mods and Sods", "RequiredScoreMet1969");
    settings.Add("1969Chapter3Score", true, "Chelsea Smile", "RequiredScoreMet1969");
    settings.Add("1969Chapter4Score", true, "Dead Certainty", "RequiredScoreMet1969");

    // chapter specific groups for London 1969 (chapter finished)
    settings.Add("1969Chapter1Finish", true, "Boys will be Thieves", "DistrictFinished1969");
    settings.Add("1969Chapter2Finish", true, "Mods and Sods", "DistrictFinished1969");
    settings.Add("1969Chapter3Finish", true, "Chelsea Smile", "DistrictFinished1969");
    settings.Add("1969Chapter4Finish", true, "Dead Certainty", "DistrictFinished1969");

    // chapter specific groups for London 1969 (mission pass)
    settings.Add("1969Chapter1Mission", true, "Boys will be Thieves", "MissionPass1969");
    settings.Add("1969Chapter2Mission", true, "Mods and Sods", "MissionPass1969");
    settings.Add("1969Chapter3Mission", true, "Chelsea Smile", "MissionPass1969");
    settings.Add("1969Chapter4Mission", true, "Dead Certainty", "MissionPass1969");

    // main setting groups for London 1961
    settings.Add("RequiredScoreMet1961", true, "Required Score Met", "1961");
    settings.SetToolTip("RequiredScoreMet1961", "Split when the required score to finish the chapter is met.");
    settings.Add("DistrictFinished1961", true, "Finished District", "1961");
    settings.SetToolTip("DistrictFinished1969", "Split when the finishing cutscene of the chapter is started.");
    settings.Add("MissionPass1961", true, "Missions", "1961");
    settings.SetToolTip("MissionPass1961", "Split on mission pass.");

    // London 1961 has only one chapter, therefore making chapter specific splits is redundant 

}

init
{
    refreshRate = 23;

    vars.doSplit = false;
    vars.LC1ScoreMet = false;
    vars.LC2ScoreMet = false;
    vars.SA1ScoreMet = false;
    vars.SA2ScoreMet = false;
    vars.VC1ScoreMet = false;
    vars.VC2ScoreMet = false;
    vars.L1969Chapter2ScoreMet = false;
    vars.L1969Chapter3ScoreMet = false;
    vars.L1969Chapter4ScoreMet = false;
    vars.L1961ScoreMet = false;
    vars.BigTextTriggered = 0;
    vars.MultiplierTriggered = 0;
    vars.LastBigText = 0;
    vars.LastMultiplier = 0;
    vars.doMissionSplit = 0;
}

update
{
    // Mission splitting logic
    vars.doSplit = false;

    if ((current.bigyellowtext == 1) && (current.bigyellowtext != old.bigyellowtext))
    {
    	  vars.BigTextTriggered = 1;
    	  vars.LastBigText = Environment.TickCount;
    }
    
    if (current.multiplier == old.multiplier+1)
    {
    	  vars.MultiplierTriggered = 1;
    	  vars.LastMultiplier = Environment.TickCount;
    }

    if ((vars.MultiplierTriggered == 1) && (vars.BigTextTriggered == 1))
    {
        if (vars.LastMultiplier - vars.LastBigText <= 5500)
        {
            vars.doMissionSplit = 1;
        }
    }

    // GTA 1 splits

    if (vars.doMissionSplit == 1)
    {
        vars.MultiplierTriggered = 0;
        vars.BigTextTriggered = 0;        
    }

    if (settings["LC1Score"])
    {
        if ((!vars.LC1ScoreMet) && (current.score >= current.RequiredScore) && (current.CurrentDistrict == "Easy Liberty City NEW"))
        {
            vars.LC1ScoreMet = true;
            vars.doSplit = true;
        }
    }

    if (settings["LC2Score"])
    {
        if ((!vars.LC2ScoreMet) && (current.score >= current.RequiredScore) && (current.CurrentDistrict == "Medium Liberty City new"))
        {
            vars.LC2ScoreMet = true;
            vars.doSplit = true;
        }
    }

    // using required score for VC1 and VC2 because they're both called "Vice is Painless" in the code
    if (settings["VC1Score"])
    {
        if ((!vars.VC1ScoreMet) && (current.score >= current.RequiredScore) && (current.RequiredScore == 3000000))
        {
            vars.VC1ScoreMet = true;
            vars.doSplit = true;
        }
    }

    if (settings["VC2Score"])
    {
        if ((!vars.VC2ScoreMet) && (current.score >= current.RequiredScore) && (current.RequiredScore == 5000000))
        {
            vars.VC2ScoreMet = true;
            vars.doSplit = true;
        }
    }

    if (settings["SA1Score"]) 
    {
        if ((!vars.SA1ScoreMet) && (current.score >= current.RequiredScore) && (current.CurrentDistrict == "San Andreas medium"))
        {
            vars.SA1ScoreMet = true;
            vars.doSplit = true;
        }
    }

    if (settings["SA2Score"]) 
    {
        if ((!vars.SA2ScoreMet) && (current.score >= current.RequiredScore) && (current.CurrentDistrict == "San Andreas hard"))
        {
            vars.SA2ScoreMet = true;
            vars.doSplit = true;
        }
    }

    if (settings["LC1Finished"])
    {
        if ((current.CurrentDistrict == "Easy Liberty City NEW") && (current.InCutscene == 1) && (current.InCutscene != old.InCutscene) && (current.InCutscene != 0))
        {
            vars.doSplit = true;
        }
    }

    if (settings["LC2Finished"])
    {
        if ((current.CurrentDistrict == "Medium Liberty City new") && (current.InCutscene == 1) && (current.InCutscene != old.InCutscene) && (current.InCutscene != 0))
        {
            vars.doSplit = true;
        }
    }

    // using required score for VC1 and VC2 because they're both called "Vice is Painless" in the code
    if (settings["VC1Finished"])
    {
        if ((current.RequiredScore == 3000000) && (current.InCutscene == 1) && (current.InCutscene != old.InCutscene) && (current.InCutscene != 0))
        {
            vars.doSplit = true;
        }
    }

    if (settings["VC2Finished"])
    {
        if ((current.RequiredScore == 5000000) && (current.InCutscene == 1) && (current.InCutscene != old.InCutscene) && (current.InCutscene != 0))
        {
            vars.doSplit = true;
        }
    }

    if (settings["SA1Finished"])
    {
        if ((current.CurrentDistrict == "San Andreas medium") && (current.InCutscene == 1) && (current.InCutscene != old.InCutscene) && (current.InCutscene != 0))
        {
            vars.doSplit = true;
        }        
    }

    if (settings["SA2Finished"])
    {
        if ((current.CurrentDistrict == "San Andreas hard") && (current.InCutscene == 1) && (current.InCutscene != old.InCutscene) && (current.InCutscene != 0))
        {
            vars.doSplit = true;
        }        
    }

    if (settings["LC1Mission"])
    {
        if ((current.CurrentDistrict == "Easy Liberty City NEW") && (vars.doMissionSplit == 1))
        {
            vars.doSplit = true;
            vars.doMissionSplit = 0;
        }
    }
    if (settings["LC2Mission"])
    {
        if ((current.CurrentDistrict == "Medium Liberty City new") && (vars.doMissionSplit == 1))
        {
            vars.doSplit = true;
            vars.doMissionSplit = 0;
        }
    }
    if (settings["VC1Mission"])
    {
        if ((current.RequiredScore == 3000000) && (vars.doMissionSplit == 1))
        {
            vars.doSplit = true;
            vars.doMissionSplit = 0;
        }
    }
    if (settings["VC2Mission"])
    {
        if ((current.RequiredScore == 5000000) && (vars.doMissionSplit == 1))
        {
            vars.doSplit = true;
            vars.doMissionSplit = 0;
        }
    }
    if (settings["SA1Mission"])
    {
        if ((current.CurrentDistrict == "San Andreas medium") && (vars.doMissionSplit == 1))
        {
            vars.doSplit = true;
            vars.doMissionSplit = 0;
        }
    }
    if (settings["SA2Mission"])
    {
        if ((current.CurrentDistrict == "San Andreas hard") && (vars.doMissionSplit == 1))
        {
            vars.doSplit = true;
            vars.doMissionSplit = 0;
        }
    }
   
   // London 1969 splits

   if (settings["1969Chapter1Finish"])
   {
       if ((current.CurrentDistrict == "Intro London NEW") && (current.InCutscene == 1) && (current.InCutscene != old.InCutscene) && (current.InCutscene != 0))
       {
           vars.doSplit = true;
       }
   }

   if (settings["1969Chapter2Finish"])
   {
       if ((current.CurrentDistrict == "Easy London NEW") && (current.InCutscene == 1) && (current.InCutscene != old.InCutscene) && (current.InCutscene != 0))
       {
           vars.doSplit = true;
       }
   }

   if (settings["1969Chapter3Finish"])
   {
       if ((current.CurrentDistrict == "Medium London NEW") && (current.InCutscene == 1) && (current.InCutscene != old.InCutscene) && (current.InCutscene != 0))
       {
           vars.doSplit = true;
       }
   }

   if (settings["1969Chapter4Finish"])
   {
       if ((current.CurrentDistrict == "Hard London NEW") && (current.InCutscene == 1) && (current.InCutscene != old.InCutscene) && (current.InCutscene != 0))
       {
           vars.doSplit = true;
       }
   }

    if (settings["1969Chapter2Score"])
    {
        if ((!vars.L1969Chapter2ScoreMet) && (current.score >= current.RequiredScore) && (current.CurrentDistrict == "Easy London NEW"))
        {
            vars.doSplit = true;
            vars.L1969Chapter2ScoreMet = true;
        }
    }

    if (settings["1969Chapter3Score"])
    {
        if ((!vars.L1969Chapter3ScoreMet) && (current.score >= current.RequiredScore) && (current.CurrentDistrict == "Medium London NEW"))
        {
            vars.doSplit = true;
            vars.L1969Chapter3ScoreMet = true;
        }
    }
    
    if (settings["1969Chapter4Score"])
    {
        if ((!vars.L1969Chapter4ScoreMet) && (current.score >= current.RequiredScore) && (current.CurrentDistrict == "Hard London NEW"))
        {
            vars.doSplit = true;
            vars.L1969Chapter4ScoreMet = true;
        }
    }

    if (settings["1969Chapter1Mission"])
    {
        if ((current.CurrentDistrict == "Intro London NEW") && (vars.doMissionSplit == 1))
        {
            vars.doSplit = true;
            vars.doMissionSplit = 0;
        }
    }

    if (settings["1969Chapter2Mission"])
    {
        if ((current.CurrentDistrict == "Easy London NEW") && (vars.doMissionSplit == 1))
        {
            vars.doSplit = true;
            vars.doMissionSplit = 0;
        }
    }

    if (settings["1969Chapter3Mission"])
    {
        if ((current.CurrentDistrict == "Medium London NEW") && (vars.doMissionSplit == 1))
        {
            vars.doSplit = true;
            vars.doMissionSplit = 0;
        }
    }

    if (settings["1969Chapter4Mission"])
    {
        if ((current.CurrentDistrict == "Hard London NEW") && (vars.doMissionSplit == 1))
        {
            vars.doSplit = true;
            vars.doMissionSplit = 0;
        }
    }

    // London 1961 splits  
    if (settings["RequiredScoreMet1961"])
    {
        if ((current.CurrentDistrict == "Camp01 London2 NEW") && (current.score >= current.RequiredScore) && (!vars.L1961ScoreMet))
        {
            vars.doSplit = true;
            vars.L1961ScoreMet = true;
        }
    }

    if (settings["DistrictFinished1961"])
    {
        if ((current.CurrentDistrict == "Camp01 London2 NEW") && (current.InCutscene == 1) && (current.InCutscene != old.InCutscene) && (current.InCutscene != 0))
        {
            vars.doSplit = true;
        }
    }

    if (settings["MissionPass1961"])
    {
        if ((current.CurrentDistrict == "Camp01 London2 NEW") && (vars.doMissionSplit == 1))
        {
            vars.doSplit = true;
            vars.doMissionSplit = 0;
        }
    }
}

split
{
    return vars.doSplit;      
}

start
{
    return current.InGame == 1 &&
           current.multiplier == 1 &&
           current.score == 0; 
}

isLoading
{
    return current.InGame == 0 ||
           current.IsPaused == 1; 
}