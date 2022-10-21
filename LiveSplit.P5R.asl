state("P5R", "Steam")
{
    byte load: 0x2A1A058;
}

state("P5R", "Game Pass")
{
    byte load: 0x1EEE728;
}

init
{
	timer.IsGameTimePaused = false;

    switch (modules.First().ModuleMemorySize) {
        case 402014208:
            version = "Steam";
            break;
        case 381128704:
            version = "Game Pass";
            break;
    } 
}
exit
{
    timer.IsGameTimePaused = true;
}

isLoading
{
    return current.load == 1;
}