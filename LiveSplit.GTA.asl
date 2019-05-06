state("Grand Theft Auto")
{
    int score: 0x34F23C;
    int bigyellowtext: 0x384864;
    int multiplier: 0x34F240;
    int InGame: 0x38513C;
    int InCutscene: "mss32.dll", 0x22E90;
    int IsPaused: 0x3846B8;
}

startup
{
}

init
{

}

split
{
    return current.bigyellowtext == 1 &&
           current.multiplier == old.multiplier+1 ||
           current.InCutscene == 1 &&
           current.InCutscene != old.InCutscene; 
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