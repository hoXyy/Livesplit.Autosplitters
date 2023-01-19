state("P3P")
{
    short load: 0xA2FCC0;
}

state("p3p_sln_DT_m")
{
    short load: 0xEC1DA0;
}

init
{
    timer.IsGameTimePaused = false;
}

isLoading
{
    return current.load == 0;
}

exit
{
    timer.IsGameTimePaused = true;
}