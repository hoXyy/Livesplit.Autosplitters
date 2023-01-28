state("P3P")
{
    short load: 0x9CF134;
}

state("p3p_sln_DT_m")
{
    short load: 0x130AF74;
}

init
{
    timer.IsGameTimePaused = false;
}

isLoading
{
    return current.load == 4;
}

exit
{
    timer.IsGameTimePaused = true;
}