state("Grand Theft Auto")
{
    int score: 0x34F23C;
    int bigyellowtext: 0x384864;
    int multiplier: 0x34F240;
    int InGame: 0x38513C;
    int InCutscene: "mss32.dll", 0x22E90;
}

startup
{
}

init
{
    vars.split = new List<int>();
}

split
{
    vars.doSplit = false;
    
    if (current.bigyellowtext == 1 && !vars.split.Contains(current.multiplier) && current.multiplier == old.multiplier+1) {
        vars.split.Add(current.multiplier);
        vars.doSplit = true;
    }
    
    if (current.InCutscene != old.InCutscene) {
        vars.doSplit = true;
    }
    
    if (vars.doSplit)
        return true;
}

start
{
    return current.InGame == 1 &&
           current.multiplier == 1 &&
           current.score == 0; 
}

isLoading
{
    return current.InGame == 0;
}